//Add any of your own step definitions here

// //file_repository
// defineParameterType({
//     name: 'optionlabel',
//     regexp: /(Restore deleted file|Permanently delete file|Delete folder)/
// })

/**
 * @module FileRepository
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the {string} image for the file {string} in File Repository
 * @param {string} option - option to click for the file in File Repository
 * @param {string} filename - name of the file for which the option is clicked
 * @description Clicks on a the given option for the file in File Repository
 */
Given('I click on the {string} image for the file {string} in File Repository', (option, filename) => {
    cy.get('td').contains(filename).parents('tr').find('td:nth-child(7)').find('a[title*="' + option + '"]').click()
})

/**
 * @module FileRepository
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I upload the file {string} to the drag and drop area in File Repository
 * @param {string} filename - name of the file
 * @description Upload file using drag and drop area in File Repository.
 */
Given("I upload the file {string} to the drag and drop area in File Repository", (filename) => {
    let file_location = 'cypress/fixtures/' + filename
    cy.get('input[id=file-repository-file-input]').click().selectFile(file_location)
})

/**
 * @module DataQualityRule
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the link labeled {string} for Rule {string}
 * @param {string} label - link
 * @param {string} rule - Rule name
 * @description Click on the link for the rule.
 */
Given("I click on the link labeled {string} for Rule {string}", (label, rule) => {
    cy.get('table[id=table-rules]').find('td:nth-child(2)').contains(rule).parents('tr').find('td:nth-child(6)').contains(label).click()
})

/**
 * @module DataQualityRule
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the link labeled {string} for the discrepant field labeled {string}
 * @param {string} label - link
 * @param {string} name - Descripency name
 * @description Click on the link for the Descripency field.
 */
Given("I click on the link labeled {string} for the discrepant field labeled {string}", (label, name) => {
    cy.get('table[id*=table-results_table_pd-9]').find('td:nth-child(2)>div').children().contains(name).parents('tr').find('td:nth-child(4)').contains(label).click()
})                     

