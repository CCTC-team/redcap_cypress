//Add any of your own step definitions here

const { Given } = require('@badeball/cypress-cucumber-preprocessor')

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


/**
 * @module DataQualityRule
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I {string} the radio option {string} for the user access {string} of report
 * @param {string} label - link
 * @param {string} name - Descripency name
 * @param {string} check - Descripency name
 * @description Click on the link for the Descripency field.
 */
Given("I {string} the radio option {string} for the user access {string} of report", (check, option, access) => {
    let sel = ''
    let fieldname = ''
    
    if (option == 'All users')
        sel = 'ALL'
    else
        sel ='SELECTED'

    if (access == 'View Access')
        fieldname = 'user_access_radio'
    else
        fieldname = 'user_edit_access_radio'

    cy.get('table[id=create_report_table]').find('td').contains(access).parent('td').within(() => {
        if (check = 'check')
        cy.get('input[name=' + fieldname + '][value=' + sel + ']').check()
        else
            cy.get('input[name=' + fieldname + '][value=' + sel + ']').uncheck()
        }
        
    )})                            

    
/**
 * @module DataQualityRule
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select the option {string} on field labeled {string} for the access {string} of report
 * @param {string} label - link
 * @param {string} name - Descripency name
 * @description Click on the link for the Descripency field.
 */
Given("I select the option {string} on field labeled {string} for the access {string} of report", (option, field, access) => {
    cy.get('table[id=create_report_table]').find('td').contains(access).parent('td').contains(field).within(() => {
        cy.get('select').then(($select) => {
            cy.wrap($select).scrollIntoView().
            should('be.visible').
            should('be.enabled').then(($t) => {
                cy.wait(500)
                cy.wrap($t).select(option)
                cy.wait(500)
            })
        })
    }
        
)})  


/**
 * @module RecordLocking&E-Signatures
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the link labeled {string} for the form labeled {string} for record {string}
 * @param {string} linklabel - link
 * @param {string} form - CRF name
 * @param {string} rec - record number
 * @description Click on the link for the form for record
 */
Given("I click on the link labeled {string} for the form labeled {string} for record {string}", (linklabel, form, rec) => {
    cy.get('table[id=esignLockList]').find('td').contains(rec).parent('tr').within(() => {
        cy.get('td').contains(form).parent('tr').find('a').contains(linklabel).then($el => {
            expect($el).to.have.attr('target','_blank')
            // update attr to open in same tab
            $el.attr('target', '_self')
         })
         .click()
    }
)})  


/**
 * @module RecordLocking&E-Signatures
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I verify the checkbox for the field labeled {string} is {check}
 * @param {string} field - name of checkbox
 * @param {check} check - check/uncheck
 * @description Click on the link for the Descripency field.
 */
Given("I verify the checkbox for the field labeled {string} is {string}", (field, check) => {
    cy.get('table[id=questiontable]').find('td').contains(field).parents('tr').within(() => {
        cy.get('input[type=checkbox]').should(check === "checked" ? "be.checked" : "not.be.checked")
    }
)})  


/**
 * @module LongitudinalProjectSetup
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click the X to delete the event named {string}
 * @param {string} label - name of event
 * @description Click on X to delete an event on the Define My Event page.
 */
Given("I should NOT see the Delete image for the event named {string}", (label) => {
    cy.get('table[id=event_table]').find('td').contains(label).parents('tr').within((tr) => {
        expect(tr).to.not.have.descendants('img[title*=Delete]')
    }
)})  


/**
 * @module e-consent
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select the radio option {string} for the e-consent Framework
 * @param {string} option - option to click for the e-consent Framework
 * @description Clicks on the given option for the e-consent Framework
 */
Given('I select the radio option {string} for the e-consent Framework', (option) => {
    let value = 0;

    if (option == 'Auto-Archiver enabled')
        value = 1
    else if (option == 'Auto-Archiver + e-Consent Framework')
        value = 2
    else
        value = 0;
    cy.get('input[type=radio][name=pdf_auto_archive][value='+ value + ']').click()
})


/**
 * @module Download
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should NOT see the following values in the downloaded PDF for Record {string} and Survey {string}
 * @param {string} record - the ID of the record the PDF is associated with
 * @param {string} survey - the Survey / Event of the record the PDF is associated with
 * @description Verifies the values within a PDF in the PDF Archive
 */
Given("I should NOT see the following values in the downloaded PDF for Record {string} and Survey {string}", (record, survey, dataTable) => {
    //Make sure DataTables has loaded before we do anything here
    cy.wait_for_datatables().assertWindowProperties()

    //Make sure the page is not loading
    if(Cypress.$('#file-repository-table_processing:visible').length){
        cy.get('#file-repository-table_processing').should('have.css', 'display', 'none')
    }

    const base_element = `${window.tableMappings['file repository']}:visible tr:has(td:nth-child(3):has(a:contains(${JSON.stringify(record)}))):has(:contains(${JSON.stringify(survey)}))`
    const element_selector = `td i.fa-file-pdf`
    let pdf_file = null

    function findDateFormat(str) {
        for (const format in window.dateFormats) {
            const regex = window.dateFormats[format]
            const match = str.includes(format)
            if (match) {
                expect(window.dateFormats).to.haveOwnProperty(format)
                return str.replace(format, '')
            }
        }
        return null
    }

    function waitForFile(filename, timeout = 30000) {
        const startTime = Date.now()

        const checkFile = (resolve, reject) => {
            cy.fileExists(pdf_file).then((file) => {
                if (file === undefined) {
                    cy.wait(500).then(() => checkFile(resolve, reject))
                } else if(file){
                    resolve(file)
                } else if (Date.now() - startTime > timeout) {
                    reject(new Error('File not found within timeout period'))
                } else {
                    cy.wait(500).then(() => checkFile(resolve, reject))
                }
            })
        }

        return new Cypress.Promise((resolve, reject) => {
            checkFile(resolve, reject)
        })
    }

    cy.top_layer(element_selector, base_element).within(() => {
        cy.get('td:has(i.fa-file-pdf) a').then(($a) => {

            pdf_file = `cypress/downloads/${$a.text()}`

            waitForFile(pdf_file).then((fileExists) => {
                if(fileExists){
                    cy.task('readPdf', { pdf_file: pdf_file }).then((pdf) => {
                        dataTable['rawTable'].forEach((row, row_index) => {
                            row.forEach((dataTableCell) => {
                                const result = findDateFormat(dataTableCell)
                                if (result === null) {
                                    expect(pdf.text).to.include(dataTableCell)
                                } else {
                                    result.split(' ').forEach((item) => {
                                        expect(pdf.text).to.not.include(item)
                                    })
                                }
                            })
                        })
                    })
                }
            })
        })
    })

})