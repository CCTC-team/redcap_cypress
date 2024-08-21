//Add any of your own step definitions here

const { Given } = require('@badeball/cypress-cucumber-preprocessor')

/**
 * @module MailHog
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I open the Email
 * @description Open email
 */
Given('I open the Email', () => {
    cy.visit("http://localhost:8025")
})