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
 * @description Clicks on the given popup button
 */
Given("I click {string} in the popup", (text) => {
    cy.focused().should('have.text', text).click()
 })


 /**
 * module DataQuality
 * @author Coreen D'Souza <coreen.dsouza1@nhs.net>
 * @example I scroll the page to the field identified by {string}
 * @description scroll the page till given field is in view
 */
 Given("I scroll the page to the field identified by {string}", (label) => {
    cy.get(label).scrollIntoView()
})

/**
 * module DataQuality
 * @author Coreen D'Souza <coreen.dsouza1@nhs.net>
 * @example I scroll page to the given field
 * @description scroll user rights pop up page to the bottom
 */
 Given ("I see the field identified by {string} turns red", (sel) => {
 cy.get(sel).should('have.css', 'background','rgb(255, 183, 190) none repeat scroll 0% 0% / auto padding-box border-box')
})



// /**
//  * @module Interactions
//  * @author Adam De Fouw <aldefouw@medicine.wisc.edu>
//  * @example I click on the table cell containing a link labeled {string}
//  * @param {string} text - the text in the table cell
//  * @description Clicks on a table cell that is identified by a particular text string specified.
//  */
// Given('I click on the table cell containing a link labeled exactly {string}', (text) => {
//     cy.get('td').contains(new RegExp("^" + text + "$", "g")).parent().find('a').click()
// })

/**
 * @module Interactions
 * @author Adam De Fouw <aldefouw@medicine.wisc.edu>
 * @example I click on the link labeled {string}
 * @param {string} text - the text on the anchor element you want to click
 * @description Clicks on an anchor element with a specific text label.
 */
Given("I click on the link labeled exactly {string}", (text) => {
    cy.get('a').contains(new RegExp("^" + text + "$", "g")).click()
})