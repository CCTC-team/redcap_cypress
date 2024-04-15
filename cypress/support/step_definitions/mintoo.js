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
 * @param {string} format - the format of the file that is being uploaded (e.g. csv)
 * @param {string} file_location - the location of the file being uploaded (e.g. import_files/core/filename.csv)
 * @param {string} uplaod_label - text near the upload label
 * @param {string} button_label - text on the button you click to upload
 * @description Imports well-formed REDCap data import file (of specific type) to a specific project given a Project ID.
 */
Given("I upload the file {string} to the drag and drop area in File Repository", (filename) => {
    let file_location = 'cypress/fixtures/' + filename
    cy.get('input[id=file-repository-file-input]').click().selectFile(file_location)
})
