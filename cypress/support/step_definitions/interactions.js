import { Given } from "cypress-cucumber-preprocessor/steps";

/**
 * @module Interactions
 * @example I click on the button labeled {string}
 * @param {string} text - the text on the button element you want to click
 * @description Click on a button element with a specific text label.
 */
Given("I click on the button labeled {string}", (text) => {
    cy.get('button').contains(text).click()
})

/**
 * @module Interactions
 * @example I click on the link labeled {string}
 * @param {string} text - the text on the anchor element you want to click
 * @description Click on an anchor element with a specific text label.
 */
Given("I click on the link labeled {string}", (text) => {
    cy.get('a').contains(text).click()
})

/**
 * @module Interactions
 * @example I click on the input button labeled {string}
 * @param {string} text - the text value of the input element you want to click
 * @description Click on an input element with a specific text label.
 */
Given("I click on the input button labeled {string}", (text) => {
    cy.get('input[value="' + text + '"]').click()
})

Given("I click on the bubble for the {string} data collection instrument instrument for record ID {string}", (text, record_id) => {
    let link_location = null

    cy.get('table#record_status_table').within(() => {
        cy.get('th').then(($th) => {
            Cypress.$.each($th, (index, th) => {
                if(th.innerText === text){
                    cy.get('tr').then(($tr) => {
                        Cypress.$.each($tr, (tri, tr) => {
                            if(tri > 0) {
                                cy.wrap(tr).within(() => {
                                    cy.get('td').then((td) => {
                                        if(td[0].innerText === record_id){
                                            Cypress.$.each(td, (tdi, $td) => {
                                                if(tdi === index){
                                                    cy.wrap($td).within(() => {
                                                        cy.get('a').then(($a) => {
                                                           link_location = $a
                                                        })
                                                    })
                                                }
                                            })
                                        }
                                    })
                                })
                            }
                        })
                    })
                }
            })
        })
    }).then(() => {
       cy.wrap(link_location).click()
    })
})

/**
 * @module Interactions
 * @example I edit the field labeled {string}
 * @param {string} text - the text value of the label associated with a specific field
 * @description Edit a field in the Online Designer by its specified field label.
 */
Given("I edit the field labeled {string}", (text) => {
    cy.edit_field_by_label(text)
})

/**
 * @module Interactions
 * @example I mark the field required
 * @description Mark a field as required within the Online Designer.
 */
Given("I mark the field required", () => {
    cy.get('input#field_req1').click()
})

/**
 * @module Interactions
 * @example I save the field
 * @description Save a Field within the Online Designer.
 */
Given("I save the field", () => {
    cy.save_field()
})

/**
 * @module Interactions
 * @example I want to pause
 * @description Pauses the Cypress session. NOTE: Should only be used during development of tests.
 */
Given("I want to pause", () => {
    cy.pause()
})

/**
 * @module Interactions
 * @example I should be able to locate and visit the Control Center link labeled "" and see the title ""
 * @param {string} link_label - the name of the link label in the Control Center panel
 * @param {string} title - the title of the page visited (optional)
 * @description Verifies a Control Center link is visible and visitable.
 */
Given(/^I should be able to locate and visit the Control Center link labeled "(.*)"(?: and see the title "(.*)")?$/, (link_label, title) => {
    if(title !== undefined){
        cy.contains_cc_link(link_label, title)
    } else {
        cy.contains_cc_link(link_label)
    }
})

/**
 * @module Interactions
 * @example I enter {string} into the field labeled {string}
 * @param {string} text - the text to enter into the field
 * @param {string} label - the label of the field
 * @description Enter a specific text string into a field identified by a label.  (NOTE: The field is not automatically cleared.)
 */
Given('I enter {string} into the field labeled {string}', (text, label) => {
    //We locate the label element first.  This isn't always a label which is unfortunate, but this approach seems to work so far.
    cy.contains(label).then(($label) => {
        //We are finding the parent of the label element and then looking for nearest input
        cy.wrap($label).parent().find('input').type(text)
    })
})

/**
 * @module Interactions
 * @example I click on the table cell containing a link labeled {string}
 * @param {string} text - the text in the table cell
 * @description Click on a table cell that is identified by a particular text string specified.
 */
Given('I click on the table cell containing a link labeled {string}', (text) => {
    cy.get('td').contains(text).parent().find('a').click()
})

/**
 * @module Interactions
 * @example I select {string} from the dropdown identified by {string}
 * @param {string} value - the option to select from the dropdown
 * @param {string} label - the label of the dropdown to choose an option from
 * @description Select a dropdown by its label and the option via a specific string.
 */
Given('I select {string} from the dropdown identified by {string}', (value,label) => {
    cy.get(label).select(value, { force: true })
})