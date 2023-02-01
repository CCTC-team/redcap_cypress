/**
 * @module Compare
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the checkbox labeled {string} for repeating instrument setup
 * @param {string} label the label of the repeating instrument
 * @description Clicks on the checkbox for repeating instrument setup
 */
Given('I click on the checkbox labeled {string} for repeating instrument setup', (label) => {
    cy.get('table[id=table-repeat_setup]').contains('td', label).parents('tr').find('input[type=checkbox]').click()   
})

/**
 * @module Compare
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I print the page
 * @description Prints the page
 */
Given('I print the page', (label) => {
    cy.window().then((win) => {
      cy.stub(win, 'print').as('print')
    })
    cy.contains('button', 'Print page').click()
    cy.get('@print').should('have.been.calledOnce')
})

/**
 * @module Compare
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @exampleI I click on the text {string} of Record ID {string}
 * @param {int} id the ID of the record
 * @param {string} text the text which is diplayed
 * @description Clicks on the text of the record
 */
Given('I click on the text {string} of Record ID {string}', (text, id) => {
    cy.get('.compare').contains(text).parents('tr').find('td:nth-child(2)').invoke('text').as('page')
    cy.window().then((win) => {     
      cy.stub(win,'open').as('windowOpen')
    })
    cy.get('.compare').contains(text).click()
    cy.get('@windowOpen').should('be.called')
    cy.get('@page').then(page => {
      // cy.log(page.trim())
      if (page.trim().localeCompare("Data Types") == 0)
        page = "data_types"
      else
        page = "text_validation"
      // cy.log(page)
      // cy.log(page.trim().localeCompare("Data Types"))
      cy.visit_version({page: 'DataEntry/index.php', params: 'pid=14&id=' + id + '&page=' + page})
    })
})
  
// /**
//  * @module Compare
//  * @author Mintoo Xavier <min2xavier@gmail.com>
//  * @example I scroll the page to the field identified by {string}
//  * @param {string} selector the selector of the field to select
//  * @description Scroll the page to the field
//  */
// Given('I scroll the page to the field identified by {string}', (selector) => {
//   cy.get(selector).scrollIntoView()
// })
