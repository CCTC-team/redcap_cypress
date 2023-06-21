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
 * @example I should see the instrument labeled {string} locked
 * @param {string} text name of instrument
 * @description Visually verify the instrument is locked
 */
Given('I should see the instrument labeled {string} locked', (text) => {  
    cy.get('table[id="esignLockList"]').children('tbody').find('td').contains(text).parent().within(() =>
        cy.get('img[src*=lock]')
    )
})


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