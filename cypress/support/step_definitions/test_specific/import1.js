import {Given} from "cypress-cucumber-preprocessor/steps";

/**
 * @module Download
 * @author Adam De Fouw <aldefouw@medicine.wisc.edu>
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
            if(type == 'collumns')
            cy.request({
                url: $f[0]['href'],
                encoding: 'binary'
            }).then((response) => {
                expect(response.status).to.equal(200);
               cy.writeFile('cypress/downloads/' + $f[0]['innerText'] + ' collumns' + '.csv', response.body, 'binary')
                           
              })
          }      
        }
    )
})


Given("I should have a file named {string}", fileName => {
    cy.readFile('cypress/downloads/' + 'Template_rows.csv')
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