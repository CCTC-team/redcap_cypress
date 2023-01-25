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

