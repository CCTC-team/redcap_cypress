//Add any of your own step definitions here

const { Given } = require('@badeball/cypress-cucumber-preprocessor')

/**
 * @module e-consent
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select the radio option {string} for the e-consent Framework
 * @param {string} option - option to click for the e-consent Framework
 * @description Clicks on the given option for the e-consent Framework
 */
Given('I select the radio option {string} for the e-consent Framework', (option) => {
    let value = 0;

    if (option == 'Auto-Archiver enabled')
        value = 1
    else if (option == 'Auto-Archiver + e-Consent Framework')
        value = 2
    else
        value = 0;
    cy.get('input[type=radio][name=pdf_auto_archive][value='+ value + ']').click()
})


