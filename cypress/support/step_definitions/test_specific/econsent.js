/**
 * @module econsent
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the button labeled {string} on the survey
 * @param {string} label the label of the button
 * @description Clicks on the given button on survey
 */
Given('I click on the button labeled {string} on the survey', (label) => {
    cy.get('button').contains(label).click()   
})

const pdf_archive_mappings = {
    'Name' : 2,
    'Record' : 3,
    'Survey' : 4,
    'Survey Completion Time': 5,
    'Identifier (Name, DOB)': 6,
    'Version' : 8,
    'Type' : 9
}

/**
 * @module econsent
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see {string} in the column labeled {string} in PDF Survey Archive
 * @param {string} text the text to verify
 * @param {string} label the label of the column
 * @description Visually verify text is present in the column in PDF Survey Archive
 */
Given('I should see {string} in the column labeled {string} in PDF Survey Archive', (text, label) => {
    if(text == "today's date"){
        let today = new Date()
        var dd = String(today.getDate()).padStart(2, '0')
        var mm = String(today.getMonth() + 1).padStart(2, '0')
        var yyyy = today.getFullYear()

        today = mm + '/' + dd + '/' + yyyy
        text = today
    }

    cy.get('table[id=file-repository-table]').find('td:nth-child(' + pdf_archive_mappings[label] + ')').contains(text)
})


/**
 * @module econsent
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see {string} in the column labeled {string} in PDF Survey Archive
 * @param {string} text the text to verify
 * @param {string} label the label of the column
 * @description Visually verify text is present in the column in PDF Survey Archive
 */
Given('I should', (text, label) => {
    cy.readFile("cypress/downloads/sample.pdf").should('contain', 'This is a small demonstration')
})