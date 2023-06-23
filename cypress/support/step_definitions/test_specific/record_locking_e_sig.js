/**
 * @module record_locking_e_sig
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I cannot edit the field identified by {string}
 * @param {string} selector the selector of the field
 * @description Verify the field is disabled
 */
Given('I cannot edit the field identified by {string}', (selector) => {  
    cy.get(selector).should("be.disabled") 

})

/**
 * @module record_locking_e_sig
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see {icon} icon for the instrument labeled {string} for record ID {string}
 * @param {string} icon icon displayed
 * @param {string} text name of instrument
 * @param {string} id Record ID
 * @description Visually verify the instrument has the icon
 */
defineParameterType({
    name: 'icon',
    regexp: /(lock|tick_shield)/
})

Given('I should see {icon} icon for the instrument labeled {string} for record ID {string}', (icon, text, id) => {
    cy.get('table[id="esignLockList"]').children('tbody').find('td').contains(text).parent().contains(id).parent().within(() =>
        cy.get('img[src*=' + icon + ']')
    )
})
// Given('I should see {icon} icon for the instrument labeled {string} for record ID {string}', (icon, text, id) => {
//     cy.get('tbody td').contains(text).parent().contains(id).parent().get('img[src*=' + icon + ']')

// })
// Given('I should see {icon} icon for the instrument labeled {string} for record ID {string}', (icon, text, id) => {
//     cy.get('table[id="esignLockList"]').children('tbody').find('tr').each(() =>
        
//         cy.get('td').contains(text).parent().contains(id).parent().within(() => {
//             cy.get('img[src*=' + icon + ']')  
//         })
    
//     )
// })

// Given('I should see {icon} icon for the instrument labeled {string} for record ID {string}', (icon, text, id) => {
//     cy.get('tbody tr').each(($el) =>
//         cy.wrap($el).within(() => {
//             cy.get('td').should('contain.text', text)
//             // .parent().should('contain.text', id).parent().find('img[src*=' + icon + ']') 
//         }) 
//     )
// })

/**
 * @module record_locking_e_sig
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I check the checkbox to display E-signature option for the instrument labeled {string}
 * @param {string} text name of instrument
 * @description Check E-Signature option on instrument
 *
 */
Given("I check the checkbox to display E-signature option for the instrument labeled {string}", (text) => {
    cy.get('td').contains(text).next('td').find('input').check()
})

/**
 * @module record_locking_e_sig
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I save the option for the instrument labeled {string}
 * @param {string} text name of instrument
 * @description Save E-Signature option on instrument
 *
 */
Given("I save the option for the instrument labeled {string}", (text) => {
    cy.get('tr').contains(text).parent().within(() =>
        cy.get('input[type=button]').click()
    )   
})

/**
 * @module record_locking_e_sig
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see the instrument labeled {string} with icon {string}
 * @param {string} text - Instrument name
 * @param {string} icon - icon displayed
 * @description Visually verify the instrument has icon dispalyed
 *
 */
Given("I should see the instrument labeled {string} with icon {string}", (text, icon) => {
    cy.get('table[id="event_grid_table"]').children('tbody').find('td').contains(text).parent().within(() =>
        cy.get('img[src*=' + icon + ']')
    )
})

/**
 * @module record_locking_e_sig
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the {string} icon for the instrument labeled {string}
 * @param {string} text - Instrument name
 * @param {string} icon - icon to click
 * @description Click on the icon for the instrument
 *
 */
Given("I click on the {string} icon for the instrument labeled {string}", (icon, text) => {
    cy.get('table[id="part11_forms"]').children('tbody').find('td').contains(text).parent().within(() =>
        cy.get('img[src*=' + icon + ']').click()
    )
})

/**
 * @module record_locking_e_sig
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should not see {icon} icon for the instrument labeled {string} for record ID {string}
 * @param {string} icon icon displayed
 * @param {string} text name of instrument
 * @param {string} id Record ID
 * @description Visually verify the instrument does not have the icon
 */
Given('I should not see {icon} icon for the instrument labeled {string} for record ID {string}', (icon, text, id) => {
    cy.get('table[id="esignLockList"]').children('tbody').find('td').contains(text).parent().contains(id).parent().within(() =>
        cy.get('img[src*=' + icon + ']').should('not.exist')
    )
})

/**
 * @module record_locking_e_sig
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see today's date in the column labeled Locked
 * @description Visually verify today's date in the column labeled Locked
 */
Given("I should see today's date in the column labeled Locked", () => {
    let today = new Date()
    var dd = String(today.getDate()).padStart(2, '0')
    var mm = String(today.getMonth() + 1).padStart(2, '0')
    var yyyy = today.getFullYear()
    today = mm + '/' + dd + '/' + yyyy

    cy.get('table[id="esignLockList"]').children('tbody').find('td[class="data lock"]').contains(today)
})

/**
 * @module record_locking_e_sig
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see today's date in the column labeled E-signed
 * @description Visually verify today's date in the column labeled E-signed
 */
Given("I should see today's date in the column labeled E-signed", () => {
    let today = new Date()
    var dd = String(today.getDate()).padStart(2, '0')
    var mm = String(today.getMonth() + 1).padStart(2, '0')
    var yyyy = today.getFullYear()
    today = mm + '/' + dd + '/' + yyyy

    cy.get('table[id="esignLockList"]').children('tbody').find('td[class="data esign"]').contains(today)
})

/**
 * @module record_locking_e_sig
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should not see today's date in the column labeled Locked
 * @description Visually verify today's date is not visible in the column labeled Locked
 */
Given("I should not see today's date in the column labeled Locked", () => {
    let today = new Date()
    var dd = String(today.getDate()).padStart(2, '0')
    var mm = String(today.getMonth() + 1).padStart(2, '0')
    var yyyy = today.getFullYear()
    today = mm + '/' + dd + '/' + yyyy

    cy.get('table[id="esignLockList"]').children('tbody').find('td[class="data lock"]').contains(today).should('not.be.visible')
})

/**
 * @module record_locking_e_sig
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should not see today's date in the column labeled E-signed
 * @description Visually verify today's date is not visible in the column labeled E-signed
 */
Given("I should not see today's date in the column labeled E-signed", () => {
    let today = new Date()
    var dd = String(today.getDate()).padStart(2, '0')
    var mm = String(today.getMonth() + 1).padStart(2, '0')
    var yyyy = today.getFullYear()
    today = mm + '/' + dd + '/' + yyyy

    cy.get('table[id="esignLockList"]').children('tbody').find('td[class="data esign"]').contains(today).should('not.be.visible')
})

/**
 * @module my_projects
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see {int} row(s)
 * @param {int} count - the number of rows seen
 * @description Visibility - Verifies the correct number of rows are present
 */
Given('I should see {int} row(s) containing {icon} icon', (count, icon) => {

    cy.get('img[src*=' + icon + ']').as('iRow')
    cy.get('@iRow').then(iRow => {
        expect(iRow.length).to.equal(count)
    })
})
