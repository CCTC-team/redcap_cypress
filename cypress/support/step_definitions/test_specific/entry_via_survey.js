/**
 * @module entry_via_survey
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see the instrument labeled {string} is not a survey
 * @param {string} label the name of the instrument
 * @description Visually verify the instrument is not a survey
 */
Given('I should see the instrument labeled {string} is not a survey', (label) => {
    cy.get('a').contains(label).parents('tr').find(':nth-child(5)').contains("Enable")

})

/**
 * @module entry_via_survey
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see the instrument labeled {string} is a survey
 * @param {string} label the name of the instrument
 * @description Visually verify the instrument is a survey
 */
Given('I should see the instrument labeled {string} is a survey', (label) => {
    cy.get('a').contains(label).parents('tr').find(':nth-child(5)').within(() =>
        cy.get('img[src*=tick_shield_small]')
    )
})

/**
 * @module entry_via_survey
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see {int} participant(s) are listed in the Participant List
 * @param {int} count - the number of participants seen
 * @description Visibility - Verifies the correct number of participants are present
 */
Given('I should see {int} participant(s) are listed in the Participant List', (count) => {

    cy.get('table[id="table-participant_table"]').children('tbody').find('tr').as('iRow')
    cy.get('@iRow').then(iRow => {
        expect(iRow.length).to.equal(count)
    })
})
