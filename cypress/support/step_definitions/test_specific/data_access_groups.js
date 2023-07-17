const data_access_groups_mappings = {
    'Data Access Groups' : 0,
    'Users in group' : 1,
}
/**
 * @module data_access_groups
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see {string} in the column named {string}
 * @param {string} text the text to verify
 * @param {string} column the column name of the DAG table
 * @description visually verify the column contains the text
 */
// Given('I should see {string} in the column name {string}', (text, column) => {
//     cy.get('table[id=table-dags_table]').find('tr').each(() => {
//         cy.get('td').eq(data_access_groups_mappings[column]).contains(text)
//     })
// }) 
Given('I should see {string} in the column named {string}', (text, column) => {
    let found = 0
    cy.wrap(found).as('found')
    cy.get('table[id=table-dags_table]').find('tr').each((tr) => {
        cy.wrap(tr).within(() => {
            cy.get('td').eq(data_access_groups_mappings[column]).invoke('text').as('name')
            cy.get('@name').then((name) => {
                cy.log(name)
                cy.log(text)
                if(name.trim() == text){
                    // cy.log('true')
                    cy.get('@found').then(found => {
                        found = 1
                        cy.wrap(found).as('found')
                    })
                }     
            })
        })
    })
    cy.get('@found').then(found => {
        expect(found).to.equal(1)
    })  
})
/**
 * @module data_access_groups
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see the user {string} in the DAG named {string}
 * @param {string} user the name of the user
 * @param {string} dag the DAG name
 * @description visually verify the user is associated to the DAG
 */
Given('I should see the user {string} in the DAG named {string}', (user, dag) => {
    let found = 0
    cy.wrap(found).as('found')
    cy.get('table[id=table-dags_table]').find('tr').each((tr) => {
        cy.wrap(tr).within(() => {
            cy.get('td').eq(0).invoke('text').as('col1')
            cy.get('td').eq(1).invoke('text').as('col2')
            cy.get('@col1').then((col1) => {
                // cy.log(name)
                // cy.log(text)
                if(col1.trim() == dag){
                    // cy.log('true')
                    cy.get('@col2').then((col2) => {
                        if(col2.trim() == user)
                        cy.get('@found').then(found => {
                            found = 1
                            cy.wrap(found).as('found')
                        })
                    })
                }     
            })
        })
    })
    cy.get('@found').then(found => {
        expect(found).to.equal(1)
    })  
    
    // cy.get('table[id=table-dags_table]').within(() => {
    //     cy.get('td').eq(0).contains(dag).parents('td').siblings().contains(user)
    // })
}) 
