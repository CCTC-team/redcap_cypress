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
 * @example I click on the button labeled {string} on the survey
 * @param {string} label the label of the button
 * @description Clicks on the given button on survey
 */
Given('I click on the button labeled {string} on the survey', (label) => {
    cy.get('button').contains(label).click()   
})


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
 * @example I download the file by clicking the link starting with {string} and save the file as {string}
 * @param {string} label starting name of PDF file
 * @param {string} newFilename name of new PDF file to create
 * @description Verify text is present in the PDF
 */
Given("I download the file by clicking the link starting with {string} and save the file as {string}", (label, newFilename) => {
    cy.intercept({
        method: 'GET',
        url: '/redcap_v' + Cypress.env('redcap_version') + '/' + '/index.php?*'
    }).as("download")

    cy.get('a').contains(label).then(($lnk) => {

        let onclick = $lnk.attr("onclick")
        let func = "; setTimeout(function(){ location.reload() }, 2000);"
        $lnk.attr("onclick", onclick + func)
        $lnk.click()
    })

    cy.wait("@download", 2000).then((xhr) => {
        let cd = xhr.response.headers['content-disposition']
        let filename = cd.split('filename="')[1]
        filename = filename.substring(0, filename.length - 1);
       
        cy.readFile('cypress/downloads/' + filename, 'base64').then((obj) => {
            cy.writeFile('cypress/downloads/' + newFilename + '.pdf', obj, 'base64')
        })
    })
})


/**
 * @module econsent
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should have a pdf file {string} that contains the data {string}
 * @param {string} filename name of PDF file
 * @param {string} text text to verify
 * @description Verify text is present in the PDF file
 */
Given('I should have a pdf file {string} that contains the data {string}', (filename, text) => {
    cy.task('getPdfContent', filename + '.pdf').then(obj => {
        let pdfText = obj.text
        let result = pdfText.search(text)
        expect(result).to.not.equal(-1)
    })
})
