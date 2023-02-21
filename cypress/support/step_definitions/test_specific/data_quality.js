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





Given("I click on the link labeled exactly {string}", (text) => {
    cy.get('a').contains(new RegExp("^" + text + "$", "g")).click()
})




Given ("I click button named Execute for Rule {string}", (Rulename) => {
    cy.get('table[id=table-rules]')
    .contains(new RegExp("^" + Rulename + "$", "g")).parents('tr').within(() => cy.get('button').contains('Execute').click() )
})

Given ("All data quality rules are executed at the same time", () => {
    cy.intercept({  method: 'POST',
        url: '/redcap_v' + Cypress.env('redcap_version') + '/DataQuality/execute_ajax.php?pid=14'
    }).as('execute_rule')

       cy.get('table#table-rules').find('tr').each(($tr, index, $list) => {

        cy.wrap($tr).within((tr) => {

            if(index < ($list.length - 2)) {
                cy.wait('@execute_rule')

                cy.get('div.exebtn').should(($d) => {
                    expect($d).not.to.contain('Execute')
                    
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
   // cy.wait(3000)
    cy.get('table[id=table-rules]')
       
         .contains(new RegExp("^" + Rulename + "$", "g")).parents('tr').within(() => cy.get('div.exebtn')
         .children().contains(item).should('be.visible').click())
         
})



                
Given("I click on {string} for the top {string} rows of descrepancies table", (record, num) => {
    cy.wait(3000)
    cy.get('table[id="table-results_table_pd-3"]').find('tr').each(($tr, index , $list) => {
        cy.wrap($tr).within((tr) => {
            if(index < (num))     
                cy.get('div.fc').children().contains(record).click()
               })}

            )})


Given("I should see {string} in the top {string} rows of descrepancies table", (record, num) => {
  
    cy.get('table[id="table-results_table_pd-3"]').find('tr').each(($tr, index , $list) => {
        
        cy.wrap($tr).within(() => {
             
            if(index < (num))       
            cy.get('div.fc').should(($d) => {
            expect($d).to.contain(record)})
            })}
              
            )})

            

Given("I click on the button labeled {string} in discrepancies window", (text) => {
   
  cy.get('.ui-dialog-buttonset').each(($e1, index, $list) => {
    
          $e1.find('button').click(); })
  
})

Given ("All rules are reset and I see Execute button available", () => {
   
    cy.get('table#table-rules').find('tr').each(($tr, index, $list) => {
        cy.wrap($tr).within((tr) => {
            if(index < ($list.length - 2)) {
                
                cy.get('div.exebtn').should(($d) => {
                    expect($d).to.contain('Execute')
                    
                })
            }

        })
    })

})


Given("Iaa should see {string} in the top {string} rows of table identified by {string}", (record, num, tablename) => {
  
    cy.get(tablename).find('tr').each(($tr, index ) => {
        
        cy.wrap($tr).within(() => {
             
            if(index < (num))       
            cy.get('div.fc').should(($d) => {
            expect($d).to.contain(record)})
            })}
              
            )})

            Given("Iaa select dropdown value {string} from list with value {string}", (item, num) =>{
              
              cy.wait(3000)
              
             cy.get('select[id="dqRuleRecord"]').select("2")

            })

            Given("I click {string} Total Discrepancies under new rule named {string}", ( item , Rulename) => {
               //cy.wait(10000)
                 cy.get('table[id=table-rules]')
                    
                      .contains(Rulename).parents('tr').within(() => cy.get('div.exebtn')
                      .children().contains(item).should('be.visible').click())
                      
             })
                       

        Given("hover element {string}", (item) => {
            cy.get('div[id="rulelogic_1"]')
            .trigger('mouseover').should('have.attr', 'title', "Click to enable editing").click()
        //.invoke('show').click()
        }       
        )

        Given("I clear text in field identified by {string}", (item) =>{
            cy.get(item).invoke('show').should('be.visible').type('{selectall}{backspace}{selectall}{backspace}')
          
        })

        Given("I click X under new rule named {string} to delete it", ( Rulename) => {
            //cy.wait(10000)
              cy.get('table[id=table-rules]')
                 
                   .contains(Rulename).parents('tr').within(() => cy.get('div.fc')
                   .find('img').should('be.visible').click())
                   
          })