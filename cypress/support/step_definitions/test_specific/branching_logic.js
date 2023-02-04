import {Given} from "cypress-cucumber-preprocessor/steps";

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I click on the branching logic icon for the field with name {string}
 * @param {string} field_name - the name of the field
 * @description Clicks on the branching logic icon for a field with a specific name.
 */
Given('I click on the branching logic icon for the field with name {string}', (field_name) => {
    
    cy.intercept({
        method: 'POST',
        url: '/redcap_v' + Cypress.env('redcap_version') + "/Design/branching_logic_builder.php?*"
    }).as('builder')
    
    cy.click_on_design_field_function("Branching Logic", field_name)
    cy.wait('@builder')
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I select the Drag-N-Drop Logic Builder
 * @description Selects the Drag-N-Drop Logic Builder.
 */
Given('I select the Drag-N-Drop Logic Builder', () => {

    cy.intercept({
        method: 'POST',
        url: '/redcap_v' + Cypress.env('redcap_version') + "/Design/branching_logic_builder.php?*"
    }).as('builder')

    cy.get('#logic_builder').should('be.visible')
    cy.get('#logic_builder').find('tr:nth-child(4)').find('td > input').first().click()
    cy.wait('@builder')
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
    
    cy.get(`[val="[${variableName}] = ${criteria}"].ui-draggable-disabled`).should('not.exist')
    cy.get(`[val="[${variableName}] = ${criteria}"]`).drag('#dropZone1').then((success) => {
        assert.isTrue(success)
    })
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I click on the branching logic save button
 * @description Clicks the branching logic save button.
 */
Given("I click on the branching logic save button", () => {

    cy.intercept({
        method: 'POST',
        url: '/redcap_v' + Cypress.env('redcap_version') + "/Design/branching_logic_builder.php?*"
    }).as('builder')

    cy.get('button').contains('Save').click()
    cy.wait('@builder')
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
    cy.get(selector).select(option)
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
    cy.get(selector).type(text)
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example Every field contains the branching logic {string} except the Record ID field and the field with the label {string}
 * @param {string} expectedBranchingLogic - the branching logic to check
 * @param {string} excludedFieldLabel - the name of the field to exclude from the check
 * @description Verifies that every field contains the same specified branching logic except the Record ID and the field with the specified name
 */
Given('Every field contains the branching logic {string} except the Record ID field and the field with the label {string}', (expectedBranchingLogic, excludedFieldLabel) => {
    assertOnBranchingLogic(expectedBranchingLogic, excludedFieldLabel)
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I can successfully apply the same branching logic {string} to all fields containing the same original branching logic except the Record ID field and the field with the label {string}
 * @param {string} branchingLogic - the branching logic to apply and check
 * @param {string} excludedFieldLabel - the name of the field to exclude from the check
 * @description Applies the same branching logic to all fields containing the same original branching logic except the Record ID and the field with the specified name. Also verifies that the action was successful
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
            actualFields.push(cleanText($field.text(), "\n"))
        }
        else if ($field.text().includes("*")) {
            actualFields.push(cleanText($field.text(), "*"))
        }
        else {
            actualFields.push($field.text().trim())
        }
    })
    .then(() => {
        expect(actualFields).to.include.members(expectedFields)
    })

    cy.get(selector).should('have.length', expectedFields.length)
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
    const selector = "td.labelrc tr > td:first-child, td.label-rc.col-12"
    cy.get(selector).each(($field) => {
        actualFields.push($field.text().trim())
    })
    .then(() => {
        expect(actualFields).to.include.members(expectedFields)
    })

    //TODO: change to use expectedFields.length
    cy.get(selector).should('have.length', 17)
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

function assertOnBranchingLogic(branchingLogic, excludedFieldLabel) {
    cy.get('.ui-dialog').should('not.be.visible')

    //functioning in v11.1.5 - replace with commented out code (below) when we move to version 12.4.14
    let recordIdSelector = 'td:contains("Record ID")'
    let exclusionSelector = `td:contains("${excludedFieldLabel}")`
    let branchingLogicSelector = `span[id^="bl-label_"]:contains("${branchingLogic}")`
    cy.get('td.labelrc').not(recordIdSelector).not(exclusionSelector).its('length').then((numFields) => {       
        cy.get('span[id^="bl-label_"]').filter(branchingLogicSelector).its('length').then((numFieldsWithExpBranchingLogic) => {
            expect(numFields).equal(numFieldsWithExpBranchingLogic)
        })
    })

    //functioning in v12.4.14. These data-kind attributes are not present in v11.1.5
    //let recordIdSelector = 'div:contains("Record ID")'
    //let exclusionSelector = `div:contains("${excludedFieldLabel}")`
    //let branchingLogicSelector = `span[data-kind="branching-logic"]:contains("${branchingLogic}")`
    // cy.get('div[data-kind="field-label"]').not(recordIdSelector).not(exclusionSelector).its('length').then((numFields) => {
    //     cy.get('span[data-kind="branching-logic"]').filter(branchingLogicSelector).its('length').then((numFieldsWithExpBranchingLogic) => {
    //         expect(numFields).equal(numFieldsWithExpBranchingLogic)
    //     })
    // })
}

function cleanText(text, separator) {
    let split = text.split(separator)
    return split[0].trim()
}


