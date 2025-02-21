//Add any of your own step definitions here
const { Given, defineParameterType } = require('@badeball/cypress-cucumber-preprocessor')


defineParameterType({
    name: 'externalOption',
    regexp: /Enable|Delete Version|Request Activation/
})

  /**
   * @module ControlCenter
   * @author Mintoo Xavier <min2xavier@gmail.com>
   * @example I {externalOption} the external module named {string}
   * @param {string} externalOption - available options - 'Enable', 'Delete Version'
   * @param {string} label - name of external module
   * @description Enable/Disable external module
   */
  Given("I click on the button labeled {externalOption} for the external module named {string}", (option, label) => {
    cy.get('#external-modules-disabled-table').find('td').contains(label).parents('tr').within(() => {
        cy.get('button').contains(option).click()
    })
  })

  

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


  /**
   * @module Visibility
   * @author Mintoo Xavier <min2xavier@gmail.com>
   * @example I should see the field labeled {string} disabled
   * @param {string} field_name - name of field
   * @description Verify field is disabled
   */
  Given("I should see the field labeled {string} disabled", (field_name) => {
    let contains = ''
    let last_label = field_name
    field_name.split(' ').forEach((val) => {
        contains += `:has(:contains(${JSON.stringify(val)}))`
        last_label = val
    })
    let outer_element = `tr${contains}:has(input[type=text]):visible:first`

    cy.get(outer_element).within(() => {
        cy.get(`label:contains(${JSON.stringify(last_label)})`)
            .invoke('attr', 'id')
            .then(($id) => {
                let elm = cy.get('[name="' + $id.split('label-')[1] + '"]')
                elm.should('have.attr', 'disabled');
            })
    })
  })


  /**e
   * @module EmbellishFields
   * @author Mintoo Xavier <min2xavier@gmail.com>
   * @example I should see {string} within the data entry field labeled {string}
   * @param {string} fieldOptions - field options visible
   * @param {string} label - Field Label
   * @description Enable/Disable external module
   */
  Given("I should see {string} within the data entry field labeled {string}", (fieldOptions, label) => {
    cy.get('#questiontable').find('td').contains(label).parents('tr').within(() => {
        cy.get('small').should('contain', fieldOptions)
    })
  })


/**
 * @module HightlightDQR
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I (should )see {string} in the Data quality errors table
 * @param {string} text - text to view 
 * @description verify text is visible in the Data quality errors table
 */
Given('I (should )see {string} in the Data quality errors table', (text) => {
    cy.get('#form-instance-rule-errors').contains(text)
})

/**
 * @module HightlightDQR
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I (should )see the field labeled {string} highlighed in red
 * @param {string} label - field label
 * @description verify field is highlighted in red
 */
Given('I (should )see the field labeled {string} highlighed in red', (label) => {
    cy.get('#questiontable').find('tr').contains(label).parents('tr').should('have.attr', 'style')
        .and('include', 'border-width: 2px')
        .and('include', 'border-color: rgb(255, 33, 0)')
})


/**
 * @module HightlightDQR
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should NOT see the field labeled {string} highlighed in red
 * @param {string} label - field label
 * @description verify field is not highlighted in red
 */
Given('I should NOT see the field labeled {string} highlighed in red', (label) => {
    cy.get('#questiontable').find('tr').contains(label).parents('tr').should('not.have.attr', 'style', 'border-width: 2px; border-color: rgb(255, 33, 0);')
})


/**
 * @module DataEntryLog
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see {int} row(s) in the data entry log table
 * @param {int} num - number of row(s)
 * @description verifies data entry log table contains the specified number of row(s)
 */
Given('I should see {int} row(s) in the data entry log table', (num) => {
    cy.get('#log-data-entry-event tbody tr').its('length').then ((rowCount) => {
        // Subtracting 1 for header
        expect(rowCount-1).to.be.equal(num)
    })
})


  /**e
   * @module ExternalModule
   * @author Mintoo Xavier <min2xavier@gmail.com>
   * @example I click on the button labeled {string} for the field labeled {string} in the external module configuration
   * @param {string} buttonLabel - Label on button
   * @param {string} field - Field Label
   * @description Clicks on the button for the field in the external module configuration
   */
  Given("I click on the button labeled {string} for the field labeled {string} in the external module configuration", (buttonLabel, field) => {
    cy.get('.table-no-top-row-border').find('td').contains(field).parents('tr').within(() => {
        cy.get('button').contains(buttonLabel).click()
    })
  })


  /**e
   * @module ExternalModule
   * @author Mintoo Xavier <min2xavier@gmail.com>
   * @example I close the dialog box for the external module {string}
   * @param {string} name - Name of external module
   * @description Close the dialog box for the external module
   */
  Given("I close the dialog box for the external module {string}", (name) => {
    cy.get('.modal-dialog').contains(name).parents('div[class="modal-header"]').within(() => {
        cy.get('button[class=close]').click()
    })
})


/**
 * @module HightlightDQR
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see the field labeled {string} with a {int}px {string} right border in {string} color
 * @param {string} label - field label
 * @param {int} num - right border style in px
 * @param {string} lineType - right border style - solid/dashed
 * @param {string} color - color of right border
 * @description verify field has a right border of specified style
 */
Given('I should see the field labeled {string} with a {int}px {string} right border in {string} color', (label, num, lineType, color) => {
    cy.get('#questiontable').find('tr').contains(label).parents('tr').should('have.attr', 'style')
        .and('include', 'border-right: ' + num + 'px ' + lineType + ' ' + color)
})


/**
 * @module EnhaceReasonForChange
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should NOT see the field labeled {string} with a colored right border
 * @param {string} label - field label
 * @description verify field does not have a right border
 */
Given('I should NOT see the field labeled {string} with a colored right border', (label) => {
    cy.get('#questiontable').find('tr').contains(label).parents('tr').should('not.have.attr', 'style', 'border-right')
})