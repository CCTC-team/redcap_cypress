//Add any of your own step definitions here

// defineParameterType({
//     name: 'optionlabel',
//     regexp: /(Restore deleted file?|Permanently delete file? (admins only))/
// })

/**
 * @module FileRepository
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the image {string} for the file {string} in File Repository
 * @param {string} option - option to click for the file in File Repository
 * @param {string} filename - name of the file for which the option is clicked
 * @description Clicks on a the given option for the file in File Repository
 */
Given('I click on the image {string} for the file {string} in File Repository', (option, filename) => {
    cy.get('td').contains(filename).parents('tr').find('td:nth-child(7)').find('a[title*="' + option + '"]').click()
})