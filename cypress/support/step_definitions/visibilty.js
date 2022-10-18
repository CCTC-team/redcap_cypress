import { Given } from "cypress-cucumber-preprocessor/steps";

defineParameterType({
    name: 'see',
    regexp: /should see|see/
})

/**
 * @module Visibility
 * @author Adam De Fouw <aldefouw@medicine.wisc.edu>
 * @example I (should) see {string}
 * @param {string} text the text visually seen on screen
 * @description Visually verifies that text exists within the HTML object. NOTE: "should" is optional for readability.
 */
Given("I {see} {string}", (see, text) => {
    cy.get('html').should(($html) => { expect($html).to.contain(text) })
})

/**
 * @module Visibility
 * @author Adam De Fouw <aldefouw@medicine.wisc.edu>
 * @example I should NOT see {string}
 * @param {string} text the text visually seen on screen
 * @description Visually verifies that text does NOT exist within the HTML object.
 */
Given("I should NOT see {string}", (text) => {
    cy.get('html').then(($html) => { expect($html).to.not.contain(text) })
})

/**
 * @module Visibility
 * @author Adam De Fouw <aldefouw@medicine.wisc.edu>
 * @example I should see {string} in the title
 * @param {string} title the HTML page title
 * @description Visually verifies that text does exist in the HTML page title.
 */
Given("I should see {string} in the title", (title) => {
    cy.title().should('include', title)
})

/**
 * @module Visibility
 * @author Adam De Fouw <aldefouw@medicine.wisc.edu>
 * @example I should see a link labeled {string}
 * @param {string} label the label on an anchor tag
 * @description Visually verifies that there is a link with a specific label.
 */
Given("I should see a link labeled {string}", (label) => {
    cy.get('a').contains(label)
})

/**
 * @module Visibility
 * @author Tintin Nguyen <tin-tin.nguyen@nih.gov>
 * @example I should see a new dialog box named {string}
 * @param {string} text the id of the new dialog box
 * @description Visually verifies that there is a new dialog box with the id text
 */
Given("I should see a new dialog box named {string}", (text) => {
    // Need to make this more specific for dialog boxes dialog, simpleDialog, etc
    cy.get('div[id="' + text + '"]', { timeout: 10000 }).should('be.visible')
})

/**
 * @module Visibility
 * @author Tintin Nguyen <tin-tin.nguyen@nih.gov>
 * @example I should see the checkbox identified by {string}, {check}
 * @param {string} selector - the selector that identifies a checkbox
 * @param {string} check - valid choices are 'checked' OR 'unchecked'
 * @description Visually verifies that a specified checkbox is checked or uncheck
 */
defineParameterType({
    name: 'check',
    regexp: /checked|unchecked/
})
Given("I should see the checkbox identified by {string}, {check}", (sel, check) => {
    //Really only added this to delay cypress cause sometimes it was moving forward without being checked
    //ATTN: Function no longer needed, can probably delete if no one needs it
    check == 'checked' ? cy.get(sel).should('be.checked') : cy.get(sel).should('not.be.checked')
})

/**
 * @module Visibility
 * @author Tintin Nguyen <tin-tin.nguyen@nih.gov>
 * @example I should see the input field identified by {string} with the value {string}
 * @param {string} selector the selector that identifies an input field
 * @param {string} text the text that the input field should be set to
 * @description Visually verifies that a specified input field is set to text
 */

Given("I should see the input field identified by {string} with the value {string}", (selector, text) => {
    cy.get(selector).should("have.value", text)
})

/**
 * @module Reporting
 * @author Tintin Nguyen <tin-tin.nguyen@nih.gov>
 * @example I should see the dropdown identified by {string} with the option {string} selected
 * @param {string} selector the selector that identifies a checkbox
 * @param {string} option the option that should be selected
 * @description Visibility - Visually verifies that a specified dropdown has the option selected
 */
 Given("I should see the dropdown identified by {string} with the option {string} selected", (selector, option) => {
    //cy.get(selector).invoke('val').should('eq', option)
    cy.get(selector).find(':selected').should('have.text', option)
})