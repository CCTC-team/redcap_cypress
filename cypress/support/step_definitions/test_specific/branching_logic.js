import {Given} from "cypress-cucumber-preprocessor/steps";

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I click on the branching logic icon for the field with name {string}
 * @param {string} field_name - the name of the field
 * @description Clicks on the branching logic icon for a field with a specific name.
 */
Given('I click on the branching logic icon for the field with name {string}', (field_name) => {
    cy.find_online_designer_field(field_name).parent().parentsUntil('tr').find('img[title="Branching Logic"]').click()
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I select the Drag-N-Drop Logic Builder
 * @description Selects the Drag-N-Drop Logic Builder.
 */
Given('I select the Drag-N-Drop Logic Builder', () => {
    cy.get('#logic_builder').find('tr:nth-child(4)').find('td > input').first().click()
})

/**
 * @module TestSpecific/BranchingLogic
 * @author David Phillips <david.phillips22@nhs.net>
 * @example I drag a field from {string} to {string}
 * @param {string} source - the name of the source item
 * @param {string} target - the name of the target item
 * @description Drags and drops an element from source to target.
 */
Given('I drag a field from {string} to {string}', (source, target) => {
    cy.get(`[val="[${source}] = ${target}"]`).drag('#dropZone1').then((success) => {
        assert.isTrue(success)
      })
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