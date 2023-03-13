import {Given} from "cypress-cucumber-preprocessor/steps";

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I set the branching logic of every field to record_id = {string} except the Record ID field and the field with the label {string}
 * @param {string} branchingLogicValue - the branching logic value
 * @param {string} excludedFieldLabel - the label of the field to exclude
 * @description Sets the branching logic of every field except the Record ID and the field with the specified label.
 */
Given('I set the branching logic of every field to record_id = {string} except the Record ID field and the field with the label {string}', (branchingLogicValue, excludedFieldLabel) => {  
    getAllFieldsExcept("Record ID", excludedFieldLabel).parentsUntil('table').find('.designVarName')
    .each(($field, index) => {
        let variableName = cleanTextAfter($field.html().split("<span")[0], "</i>")
        if (!fieldHasBranchingLogic(variableName)) {
            clickOnBranchingLogicIcon(variableName)
            selectDragNDropLogicBuilder()
            dragNDrop("record_id", "(define criteria)")
            selectOption("=", ".brDrag > select")
            typeInput(branchingLogicValue, ".brDrag > input")
            saveBranchingLogic()
    
            if (index == 0) {
                cy.focused().should('have.text', 'Close').click()
            }
        }
    })
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I click on the branching logic icon for the field with label {string}
 * @param {string} field_name - the field label
 * @description Clicks on the branching logic icon for a field with a specific label.
 */
Given('I click on the branching logic icon for the field with label {string}', (fieldLabel) => {
    cy.intercept({
        method: 'POST',
        url: '/redcap_v' + Cypress.env('redcap_version') + "/Design/branching_logic_builder.php?*"
    }).as('builder')
    
    cy.click_on_design_field_function("Branching Logic", fieldLabel)
    cy.wait('@builder')
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I select the Drag-N-Drop Logic Builder
 * @description Selects the Drag-N-Drop Logic Builder.
 */
Given('I select the Drag-N-Drop Logic Builder', () => {
    selectDragNDropLogicBuilder()    
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I drag a field choice with variable name {string} and criteria {string}
 * @param {string} variableName - the variable name
 * @param {string} criteria - the criteria
 * @description Drags and drops a field choice with a specific variable name and criteria in the Drag-N-Drop Logic Builder
 */
Given('I drag a field choice with variable name {string} and criteria {string}', (variableName, criteria) => {
    dragNDrop(variableName, criteria)
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I click on the branching logic save button
 * @description Clicks the branching logic save button.
 */
Given("I click on the branching logic save button", () => {
    saveBranchingLogic()
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I select {string} from the dropdown identified by {string}
 * @param {string} option - the option text
 * @param {string} selector - the selector
 * @description Selects an option from a dropdown with a specific identifier.
 */
Given('I select {string} from the dropdown identified by {string}', (option, selector) => {
    selectOption(option, selector)
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I enter {string} into the input identified by {string}
 * @param {string} text - the text to enter
 * @param {string} selector - the selector
 * @description Enters text into a input element with a specific identifier.
 */
Given('I enter {string} into the input identified by {string}', (text, selector) => {
    typeInput(text, selector)
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example Every field contains the branching logic {string} except the Record ID field and the field with the label {string}
 * @param {string} expectedBranchingLogic - the branching logic to check
 * @param {string} excludedFieldLabel - the label of the field to exclude from the check
 * @description Verifies that every field contains the same specified branching logic except the Record ID and the field with the specified label
 */
Given('Every field contains the branching logic {string} except the Record ID field and the field with the label {string}', (expectedBranchingLogic, excludedFieldLabel) => {
    assertOnBranchingLogic(expectedBranchingLogic, excludedFieldLabel)
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I can successfully apply the same branching logic {string} to all fields containing the same original branching logic except the Record ID field and the field with the label {string}
 * @param {string} branchingLogic - the branching logic to apply and check
 * @param {string} excludedFieldLabel - the label of the field to exclude from the check
 * @description Applies the same branching logic to all fields containing the same original branching logic except the Record ID and the field with the specified label. Also verifies that the action was successful
 */
Given('I can successfully apply the same branching logic {string} to all fields containing the same original branching logic except the Record ID field and the field with the label {string}', (branchingLogic, excludedFieldLabel) => {
    
    cy.intercept({
        method: 'POST',
        url: '/redcap_v' + Cypress.env('redcap_version') + "/Design/branching_logic_builder.php?*"
    }).as('builder')

    cy.intercept({
        method: 'GET',
        url: '/redcap_v' + Cypress.env('redcap_version') + "/Design/online_designer_render_fields.php?*"
    }).as('render_fields')

    cy.get('button').contains('Yes').click()
    cy.wait('@builder')
    cy.wait('@render_fields')

    assertOnBranchingLogic(branchingLogic, excludedFieldLabel)
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I open the public survey
 * @description Opens the public survey in the main tab.
 */
Given('I open the public survey', () => {
    cy.window().then((win) => {
        cy.stub(win, 'open').as('open')
    })

    cy.contains('Open public survey').click()
    cy.get('@open').should('have.been.calledOnce')
    cy.get('#longurl').then(($url) => {
        cy.visit($url.val())
    })
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example The fields shown on the public survey are {string}
 * @param {string} expectedFieldNames - the expected field names (pipe separated e.g. fieldName1|fieldName2|fieldName3)
 * @description Verifies that only the specified fields are shown on the public survey.
 */
Given('The fields shown on the public survey are {string}', (expectedFieldNames) => {
    const expectedFields = expectedFieldNames.split("|")
    const actualFields = []
    //field selector may be easier in v12 if data attributes are available
    const selector = "td.labelrc > label, td.labelrc.col-11"

    //fields restricted with branching logic are hidden using css but are present in the DOM
    cy.get('#questiontable tr').not(function() {
        return Cypress.$(this).css("display") == "none"
    })
    .find(selector)
    .each(($field) => {
        if ($field.text().includes("\n")) {
            actualFields.push(cleanTextBefore($field.text(), "\n"))
        }
        else if ($field.text().includes("*")) {
            actualFields.push(cleanTextBefore($field.text(), "*"))
        }
        else {
            actualFields.push($field.text().trim())
        }
    })
    .should('have.length', expectedFields.length)
    .then(() => {
        expect(actualFields).to.include.members(expectedFields)
    })
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example The fields shown on the instrument are {string}
 * @param {string} expectedFieldNames - the expected field names (pipe separated e.g. fieldName1|fieldName2|fieldName3)
 * @description Verifies that only the specified fields are shown on the instrument.
 */
Given('The fields shown on the instrument are {string}', (expectedFieldNames) => {
    const expectedFields = expectedFieldNames.split("|")
    const actualFields = []
    //field selector may be easier in v12 if data attributes are available
    const selector = "td.labelrc tr > td:first-child, td.labelrc.col-12"

    //fields restricted with branching logic are hidden using css but are present in the DOM
    cy.get('#questiontable tr').not(function() {
        return Cypress.$(this).css("display") == "none" ||
            cleanTextBefore(Cypress.$(this).text(), "?") == "Complete"
    })
    .find(selector)
    .each(($field) => {
        if ($field.text().includes("*")) {
            actualFields.push(cleanTextBefore($field.text(), "*"))
        }
        else if ($field.text().startsWith("\n")) {
            actualFields.push($field.text().trim())
        }
        else {
            actualFields.push(cleanTextBefore($field.text(), "\n"))
        }
    })
    .should('have.length', expectedFields.length)
    .then(() => {
        expect(actualFields).to.include.members(expectedFields)
    })
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I close the public survey
 * @description Closes the public survey.
 */
Given('I close the public survey', () => {
    cy.window().then((win) => {
        cy.stub(win, 'close').as('close')
        win.close()
    })
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example The survey closes
 * @description Verifies that the survey was closed and navigates back to the Survey Distribution Tools page.
 */
Given('The survey closes', () => {
    cy.get('@close').should('have.been.calledOnce')
    cy.visit('/redcap_v' + Cypress.env('redcap_version') + "/Surveys/invite_participants.php?pid=14")
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I check the "Do not show this message again." checkbox
 * @description Checks the "Do not show this message again." checkbox
 */
Given('I check the "Do not show this message again." checkbox', () => {
    cy.get('#branching_update_chk').check()
})

function fieldHasBranchingLogic(variableName) {
    cy.get(`span[id="bl-label_${variableName}"]`).then(function(ele) {
        return Cypress.$(ele).css("visibility") != "hidden"
    })
}

function clickOnBranchingLogicIcon(variableName) {
    cy.intercept({
        method: 'POST',
        url: '/redcap_v' + Cypress.env('redcap_version') + "/Design/branching_logic_builder.php?*"
    }).as('builder')
    
    cy.get(`.designVarName:contains(${variableName})`)
    .parent()
    .find('img[title="Branching Logic"]')
    .first()
    .click()

    cy.wait('@builder')
}

function selectDragNDropLogicBuilder() {
    cy.intercept({
        method: 'POST',
        url: '/redcap_v' + Cypress.env('redcap_version') + "/Design/branching_logic_builder.php?*"
    }).as('builder')

    cy.get('#logic_builder').should('be.visible')
    cy.get('#logic_builder').find('tr:nth-child(4)').find('td > input').first().click()
    cy.wait('@builder')
}

function dragNDrop(variableName, criteria) {
    cy.get(`[val="[${variableName}] = ${criteria}"].ui-draggable-disabled`).should('not.exist')
    cy.get('.ui-droppable').should('exist')
    cy.get(`[val="[${variableName}] = ${criteria}"]`).drag('#dropZone1').then((success) => {
        if (!success) {
            //may need to try the drop again
            cy.get('div#dropZone1.listBox.ui-droppable').trigger('drop')
            .trigger('mouseup').trigger('pointerup')
        }
    })
}
function selectOption(option, selector) {
    cy.get(selector).select(option)
}

function typeInput(text, selector) {
    cy.get(selector).type(text)
}

function saveBranchingLogic() {
    cy.intercept({
        method: 'POST',
        url: '/redcap_v' + Cypress.env('redcap_version') + "/Design/branching_logic_builder.php?*"
    }).as('builder')

    cy.get('button').contains('Save').click()
    cy.wait('@builder')
}

function getAllFieldsExcept(firstExcludedFieldLabel, secondExcludedFieldLabel) {
    //v11.1.5
    let firstExcludedFieldSelector = `td:contains(${firstExcludedFieldLabel})`
    let secondExcludedFieldSelector = `td:contains(${secondExcludedFieldLabel})`
    return cy.get('td.labelrc').not(firstExcludedFieldSelector).not(secondExcludedFieldSelector)

    //v12.4.14
    // let firstExcludedFieldSelector = `div:contains(${firstExcludedFieldLabel})`
    // let secondExcludedFieldSelector = `div:contains(${secondExcludedFieldLabel})`
    // return cy.get('div[data-kind="field-label"]').not(firstExcludedFieldSelector).not(secondExcludedFieldSelector)
}

function assertOnBranchingLogic(branchingLogic, excludedFieldLabel) {
    cy.get('.ui-dialog').should('not.be.visible')

    //v11.1.5
    let branchingLogicSelector = `span[id^="bl-label_"]:contains(${branchingLogic})`
    getAllFieldsExcept("Record ID", excludedFieldLabel).its('length').then((numFields) => {       
        cy.get('span[id^="bl-label_"]').filter(branchingLogicSelector).its('length').then((numFieldsWithExpBranchingLogic) => {
            expect(numFields).equal(numFieldsWithExpBranchingLogic)
        })
    })

    //v12.4.14
    //let branchingLogicSelector = `span[data-kind="branching-logic"]:contains(${branchingLogic})`
    // getAllFieldsExcept("Record ID", excludedFieldLabel).its('length').then((numFields) => {
    //     cy.get('span[data-kind="branching-logic"]').filter(branchingLogicSelector).its('length').then((numFieldsWithExpBranchingLogic) => {
    //         expect(numFields).equal(numFieldsWithExpBranchingLogic)
    //     })
    // })
}

function cleanTextBefore(text, separator) {
    let split = text.split(separator)
    return split[0].trim()
}

function cleanTextAfter(text, separator) {
    let split = text.split(separator)
    return split[1].trim()
}



