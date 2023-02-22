/**
 * @module export_data
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I enable the survey labeled {string}
 * @param {string} label the name of the survey
 * @description Enable the survey
 */
Given('I enable the Data Collection Instrument labeled {string} as survey', (label) => {
    cy.get('table[id=table-forms_surveys]').contains('td', label).parents('tr').find('button').contains('Enable').click().then(() => {
        cy.get('button').contains('Save Changes').click()
    })  
})

/**
 * @module export_data
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I enable the survey labeled {string}
 * @param {string} label the name of the survey
 * @description I open the survey from Survey Options
 */
Given('I open the survey from Survey Options and submit it', () => {
    cy.window().then((win) => {     
        cy.stub(win,'surveyOpen').as('surveyOpen').callsFake((url) => {
           // win.open.wrappedMethod.call(win, url, '_self')
            cy.visit(url)
        })
      })
    cy.get('a').contains('Open survey').click()
    cy.get('@surveyOpen').should('be.called')
    cy.get('button').contains('Submit').click()
    cy.get('button').contains('Close survey').click()
    cy.visit_version({page: '/DataEntry/record_status_dashboard.php', params: 'pid=14'})
})

