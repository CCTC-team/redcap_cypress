const { Given, defineParameterType } = require('@badeball/cypress-cucumber-preprocessor')
   
/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select the survey {string} on the dropdown field to enable it as e-Consent
 * @param {string} option - survey to select
 * @description selects the survey on the dropdown field to enable it as e-Consent
 */
Given("I select the survey {string} on the dropdown field to enable it as e-Consent", (option) => {
    cy.get('select#enable_for_survey').select(option)  
})
