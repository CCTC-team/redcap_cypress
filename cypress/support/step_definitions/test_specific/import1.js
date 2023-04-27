import {Given} from "cypress-cucumber-preprocessor/steps";

/**
 * @module Download
 * @author Coreen DSouza
 * @example I download a file by clicking on the link labeled {string}
 * @param {string} text - the text on the anchor element you want to click
 * @description Downloads a file from an anchor element with a specific text label.
 */
Given("Iaa download a file {string} by clicking on the link labeled {string}", (type, text) => {
    // We do not actually click on the link because new windows and Cypress do not work.
    // Instead, we sideload a request and save it where it would go
    cy.get('a[href*="downloadTemplate"]').each(($f, index) => {
        
        if(type == 'rows' && index == 0) {
        cy.request({
            url: $f[0]['href'],
            encoding: 'binary'
        }).then((response) => {
            expect(response.status).to.equal(200);           
            cy.writeFile('cypress/downloads/' + 'Template_rows.csv', response.body, 'binary')   
          }) }
          else { 
            if(type == 'columns')
            cy.request({
                url: $f[0]['href'],
                encoding: 'binary'
            }).then((response) => {
                expect(response.status).to.equal(200);
               //cy.writeFile('cypress/downloads/' + $f[0]['innerText'] + ' columns' + '.csv', response.body, 'binary')
               cy.writeFile('cypress/downloads/' + 'Template_columns.csv', response.body, 'binary')            
              })
          }      
        }
    )
})


Given("I should have a file named {string}", (fileName) => {
    cy.readFile('cypress/downloads/' + fileName)
})

Given("Values {string} should contain {string}", (record_Ids, text) => {
    cy.get('table[id=comptable]').find('tr').each(($tr, index, list) => {
        if (index > 1 && index < list.length-1){
            let recordNum = record_Ids.trim().split(',')
            {
                cy.get('th').contains(recordNum[index-2]).siblings('div.exist_impt_rec').should('have.text', text)
            }
        }
    })
})




Given("I should see old value {string} and new value {string} for Record {string} and field named {string}", (oldvalue, newValue1, recordNum, fieldName) => {
    cy.get('table[id=comptable] > tbody > :nth-child(2)').find('th').contains(fieldName).invoke('index').then((index) => {
        cy.get('table[id=comptable]')
            .children().contains('tr', recordNum)
            .find('td').eq(index-1).should('have.text', newValue1 + oldvalue )})
    })
  
/**
 * @module DataQuality
 * @author Coreen D'Souza <coreen.dsouza1@nhs.net>
 * @example I see a {string} bubble for instrument named {string} and event named {string}
 * @param {string} instrument - the name of the instrument you are adding to an event
 * @param {string} event - the name of the event you are adding an instrument to
 * @description Interacations - Checks a specfic checkbox for an  instrument and event name
 */
Given("I see a {string} bubble for Record {string} and Instrument named {string}", ( circle_colour , record, instrumentName) => {
    cy.get('table[id=record_status_table]').find('th').contains(instrumentName).parents('th').invoke('index').then((index) => {
        cy.get('table[id=record_status_table]')
                .children('tbody')
                .contains('tr', record).find('td')
                .eq(index).find('img[src*=' + circle_colour + ']')
    })
 })


 Given("I should see error {string} corresponding to the field named {string} for record {string}", ( errorName, fieldName, recordNum) => {
        cy.get('table[id=errortable]').find('td').contains(fieldName).parent().within(() => {
           cy.get('th').contains(recordNum).should('be.visible') && cy.get('td[class=comp_new]').last().contains(errorName).should('be.visible')
        })
    })
      
      
Given("I should see {string} instances in the instance table", (numOfInstances) => {
    cy.get('#instancesTablePopup').find('.repeat_event_count_menu').should('have.text', numOfInstances) 
    cy.get('a > img[src*="delete_box"]').click()
})
