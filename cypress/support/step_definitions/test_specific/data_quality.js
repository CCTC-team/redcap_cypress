import { Given } from "cypress-cucumber-preprocessor/steps";
///////////////
//Instruments//
///////////////

/**
 * @module DataQuality
 * @author Coreen D'Souza <coreen.dsouza1@nhs.net>
 * @example I click on a bubble with instrument named {string} and event named {string}
 * @param {string} instrument - the name of the instrument you are adding to an event
 * @param {string} event - the name of the event you are adding an instrument to
 * @description Interacations - Clicks on a bubble for an  instrument and event name
 */
 Given("I click on a bubble with instrument named {string} and event named {string}", (instrument, event) => {
    
    cy.get('table[id=event_grid_table]').find('th').contains(event).parents('th').invoke('index').then((index) => {
        cy.get('table[id=event_grid_table]')
                .children('tbody')
                .contains('tr', instrument)
                .find('img').eq(index-1).click()
    })
    
})


/**
 * @module DataQuality
 * @author Coreen D'Souza <coreen.dsouza1@nhs.net>
 * @example I see a {string} bubble for instrument named {string} and event named {string}
 * @param {string} instrument - the name of the instrument you are adding to an event
 * @param {string} event - the name of the event you are adding an instrument to
 * @description Interacations - Checks a specfic checkbox for an  instrument and event name
 */
Given("I see a {string} bubble for instrument named {string} and event named {string}", ( circle_colour , instrument, event) => {
    
    cy.get('table[id=event_grid_table]').find('th').contains(event).parents('th').invoke('index').then((index) => {
        cy.get('table[id=event_grid_table]')
                .children('tbody')
                .contains('tr', instrument)
                //.find('img').eq(index-1).should('have.attr', 'src', '/redcap_v12.4.14/Resources/images/circle_green.png')
                 .eq(index-1).find('img[src*=' + circle_colour + ']')
              
                })
    
})

/**
 * module DataQuality
 * @author Coreen D'Souza <coreen.dsouza1@nhs.net>
 * @example I close popup
 * @description Closes popup with button labeled "Close"
 */
Given("I click {string} on the popup", (text) => {
    cy.focused().should('have.text', text).click()
 })


 /**
 * module DataQuality
 * @author Coreen D'Souza <coreen.dsouza1@nhs.net>
 * @example I scroll the user rights page to the bottom
 * @description scroll user rights pop up page to the bottom
 */
 Given("I scroll the page to the field identified by {string}", (label) => {
    cy.get(label).scrollIntoView()
})


 Given ("I see the field identified by {string} turns red", (sel) => {
 cy.get(sel).should('have.css', 'background','/*rgb(255, 183, 190) none repeat scroll 0% 0% / auto padding-box border-box')
})
