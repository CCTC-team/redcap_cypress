const { Given } = require('@badeball/cypress-cucumber-preprocessor')

// To-Do List steps shared by every CCTC External Module's tests. Steps used by
// only some modules are copied into each of those modules'
// automated_tests/step_definitions/ (loaded only for that module's features).


/**
 * @module ControlCenter
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the {toDoTableIcons} icon for the {string} request created for the project named {string} within the {toDoTableTypes} table
 * @param {string} toDoTableIcons - available options: 'process request', 'get more information', 'add or edit a comment', 'Move to low priority section', 'archive request notification'
 * @param {string} request_name - Name of request
 * @param {string} project_name - the text value of project name you want to target
 * @param {string} toDoTableTypes - available options: 'Pending Requests', 'Low Priority Pending Requests', 'Completed & Archived Requests'
 * @description Clicks on an icon within the To-Do-List page based upon Icon, Request Name, Project Name, and Table Name specified.
 */
Given('I click on the {toDoTableIcons} icon for the {string} request created for the project named {string} within the {toDoTableTypes} table', (icon, request_name, project_name, table_name) => {
    cy.get(`.${window.toDoListTables[table_name]}`).within(() => {
        cy.get(`.request-container:contains("${project_name}"):has(.type:contains("${request_name}"))`).within(() => {
            cy.get(`button[data-tooltip="${icon}"]`).click()
        })
    })
})


/**
 * @module ControlCenter
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I (should )see the {string} request created for the project named {string} within the {toDoTableTypes} table
 * @param {string} request_name - Name of request
 * @param {string} project_name - the text value of project name you want to target
 * @param {string} toDoTableTypes - available options: 'Pending Requests', 'Low Priority Pending Requests', 'Completed & Archived Requests'
 * @description Identifies Request Name within the To-Do-List page based upon Project Name, and Table Name specified.
 */
Given('I (should )see the {string} request created for the project named {string} within the {toDoTableTypes} table', (request_name, project_name, table_name) => {
    cy.get(`.${window.toDoListTables[table_name]}`).within(() => {
        cy.get(`.request-container:contains("${project_name}"):has(.type:contains("${request_name}"))`)
    })
})
