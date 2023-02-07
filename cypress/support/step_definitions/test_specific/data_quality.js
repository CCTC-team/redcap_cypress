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
    cy.focused().should('have.text', text).click({force: true})
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




Given ("I click button named Execute for Rule {string}", (Rulename) => {
    cy.get('table[id=table-rules]')
    .contains(new RegExp("^" + Rulename + "$", "g")).parents('tr').within(() => cy.get('button').contains('Execute').click() )
})

Given ("Should have the ability to execute all data quality rules at the same time", () => {
    cy.intercept({  method: 'POST',
        url: '/redcap_v' + Cypress.env('redcap_version') + '/DataQuality/execute_ajax.php?pid=14'
    }).as('execute_rule')

    //Execute all of the rules
    cy.get('button').contains('All').click()

    //Cycle through number of rows
    cy.get('table#table-rules').find('tr').each(($tr, index, $list) => {

        cy.wrap($tr).within((tr) => {

            if(index < ($list.length - 1)) {
                //Check that the AJAX request is done on every single instance of execution
                cy.wait('@execute_rule')

                //Make sure the execute button goes away and is replaced by the number of detected quality issues
                cy.get('div.exebtn').should(($d) => {
                    expect($d).not.to.contain('Execute')
                    //expect($d).to.contain('0')
                })
            }

        })
    })

})

/**
 * @module DataQuality
 * @author Coreen D'Souza <coreen.dsouza1@nhs.net>
 * @example I see a {string} bubble for instrument named {string} and event named {string}
 * @param {string} num - the name of the instrument you are adding to an event
 * @param {string} Rulename - the name of the event you are adding an instrument to
 * @description Interacations - Checks a specfic checkbox for an  instrument and event name
 */
Given("I see {string} Total Discrepancies under Rule {string}", ( num , Rulename) => {
   
    cy.get('table[id=table-rules]')
       
         .contains(new RegExp("^" + Rulename + "$", "g")).parents('tr').within(() => cy.get('div.exebtn')
         .should(($d) => {expect($d).to.contain(num)} )  )         
})



Given("I click {string} Total Discrepancies under Rule {string}", ( item , Rulename) => {
   
    cy.get('table[id=table-rules]')
       
         .contains(new RegExp("^" + Rulename + "$", "g")).parents('tr').within(() => cy.get('div.exebtn')
         .children().contains(item).should('be.visible').click())
         //.should(($d) => {expect($d).to.contain(num)} ))
         
         //cy.get('a').contains('view').should('be.visible').click()      
})



                
Given("I click on {string} for the top {string} rows", (record, num) => {

    cy.get('table[id="table-results_table_pd-3"]').find('tr').each(($tr, index , $list) => {
        cy.wrap($tr).within((tr) => {
            if(index < (num))     
                cy.get('div.fc').children().contains(record).click()})}
            )})


            /**
 * @module Interactions
 * @author Adam De Fouw <aldefouw@medicine.wisc.edu>
 * @example I click on the button labeled {string}
 * @param {string} text - the text on the button element you want to click
 * @description Clicks on a button element with a specific text label.
 */
Given("Iaa click on the button labeled {string}", (text) => {
   
   // cy.get('button').contains(text).invoke('show').should('be.visible').click({force: true})
   cy.get('.ui-dialog-buttonset').contains(text).should('exist').click({force: true})
  
  // cy.get('button').contains(text).invoke('show').should('be.visible').click()
   
})

