//Add any of your own step definitions here

const { Given, defineParameterType } = require('@badeball/cypress-cucumber-preprocessor')

import 'cypress-file-upload'
// import 'cypress-mailhog'

// To make sure emails are deleted only once per Test Script
let hasRunBeforeEach = false

// delete all the messages from MailHog
beforeEach(() => {
    if (!hasRunBeforeEach) {
        // Your setup code here
        hasRunBeforeEach = true
        cy.deleteAllEmails()
      }
})

Cypress.Commands.add('deleteAllEmails', () => {
    cy.request({
        method: 'DELETE',
        url: 'http://localhost:8025/api/v1/messages',
        failOnStatusCode: false // Ignore potential errors due to no emails
      })
})


defineParameterType({
    name: 'addcustomization',
    regexp: /Enable the Data History popup for all data collection instruments|Enable the File Version History for 'File Upload' fields/
})

defineParameterType({
    name: 'namestat',
    regexp: /name|status/
})


defineParameterType({
    name: 'alert',
    regexp: /How will this alert be triggered|When to send the alert|Send it how many times|Alert Type/
})

defineParameterType({
    name: 'savecan',
    regexp: /save|cancel/
})
/**
 * @module e-consent
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select the radio option {string} for the e-consent Framework
 * @param {string} option - option to click for the e-consent Framework
 * @description Clicks on the given option for the e-consent Framework
 */
Given('I select the radio option {string} for the e-consent Framework', (option) => {
    let value = 0

    if (option == 'Auto-Archiver enabled')
        value = 1
    else if (option == 'Auto-Archiver + e-Consent Framework')
        value = 2
    else
        value = 0
    cy.get('input[type=radio][name=pdf_auto_archive][value='+ value + ']').click()
})


/**
 * @module Download
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should NOT see the following values in the downloaded PDF for Record {string} and Survey {string}
 * @param {string} record - the ID of the record the PDF is associated with
 * @param {string} survey - the Survey / Event of the record the PDF is associated with
 * @description Verifies the values are not present within a PDF in the PDF Archive
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
                                    expect(pdf.text).to.not.include(dataTableCell)
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


/**
 * @module Download
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see the following values in the downloaded PDF
 * @description Verifies the values within a PDF
 */
Given("I should see the following values in the downloaded PDF", (dataTable) => {
    cy.wait(500)
    cy.task('fetchLatestDownload', ({fileExtension: 'pdf'})).then((pdf_file) => {

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
                                    expect(pdf.text).to.include(item)
                                })
                            }
                        })
                    })
                })
            }
        })
    })
})


/**
 * @module Download
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should NOT see the following values in the downloaded PDF
 * @description Verifies the values are not present within a PDF
 */
Given("I should NOT see the following values in the downloaded PDF", (dataTable) => {
    cy.task('fetchLatestDownload', ({fileExtension: 'pdf'})).then((pdf_file) => {
      
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

        waitForFile(pdf_file).then((fileExists) => {
            if(fileExists){
                cy.task('readPdf', { pdf_file: pdf_file }).then((pdf) => {
                    dataTable['rawTable'].forEach((row, row_index) => {
                        row.forEach((dataTableCell) => {
                            const result = findDateFormat(dataTableCell)
                            if (result === null) {
                                expect(pdf.text).to.not.include(dataTableCell)
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


Cypress.Commands.add('fetchLatestDownloadLocal', (fileExtension) => {
    // Change to redcap_source if required
    // const downloadsDir = shell.pwd() + '../redcap_source/edocs/'
    const downloadsDir = shell.pwd() + '../www/edocs/'

    // Read the files in the downloads directory
    const files = fs.readdirSync(downloadsDir)

    // Filter files by extensionß
    const filteredFiles = files.filter(file => path.extname(file) === `.${fileExtension}`)

    //If no filtered files are found ...
    if (filteredFiles.length === 0) {
        return ''
    } else {
        // Sort files by modification time to get the latest one
        const latestFile = filteredFiles
            .map(file => ({ file, mtime: fs.statSync(path.join(downloadsDir, file)).mtime }))
            .sort((a, b) => b.mtime - a.mtime)[0].file
        return `${downloadsDir}${latestFile}`
    }
})


// Not working. Have to fix this
/**
 * @module Download
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see the following values in the PDF at the local storage
 * @description Verifies the values within a PDF at the local storage
 */
Given("I should see the following values in the PDF at the local storage", (dataTable) => {
    cy.task('fetchLatestDownloadLocal', ({fileExtension: 'pdf'})).then((pdf_file) => {

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
                                    expect(pdf.text).to.include(item)
                                })
                            }
                        })
                    })
                })
            }
        })
    })
})

Cypress.Commands.add('create_empty_project', (project_name, project_type, button_label = 'Create Project') => {
    cy.get('a:visible:contains("New Project")').click()
    cy.get('input#app_title').type(project_name)
    cy.get('select#purpose').select(project_type)
    cy.get('input#project_template_radio0').click()
    cy.get('button').contains(button_label).click().then(() => {
        let pid = null
        cy.url().should((url) => {
            return url
        })
    })
})


/**
 * @module DataImport
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I create an empty project named {string} by clicking on "New Project" in the menu bar, selecting "{projectType}" from the dropdown, and clicking the "{projectRequestLabel}" button
 * @param {string} project_name - the desired name for the project
 * @param {string} projectType - available options: 'Practice / Just for fun', 'Operational Support', 'Research', 'Quality Improvement', 'Other'
 * @param {string} projectRequestLabel - available options: 'Create Project', 'Send Request'
 * @description Creates an empty REDCap project of a specific project type.
 */
Given('I create an empty project named {string} by clicking on "New Project" in the menu bar, selecting "{projectType}" from the dropdown, and clicking the "{projectRequestLabel}" button', (project_name, project_type, button_label) => {
    cy.create_empty_project(project_name, project_type, button_label)
})


/**
 * @module RecordHomePage
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I cannot click the bubble for the {string} longitudinal instrument which is disabled
 * @param {string} instrument - the name of the instrument
 * @description Cannot click on the instrument as it is disabled
 */
Given('I cannot click the bubble for the {string} longitudinal instrument which is disabled', (instrument) => {
    cy.get('table#event_grid_table').find('td').contains(instrument).parent('td').next().within(() => {
            cy.get('a').should('have.css', 'pointer-events', "none") 
    })
})   


/**
 * @module Visibility
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I (should )see a checkbox labeled {addcustomization} that is {check} in additional customizations
 * @param {string} addcustomization - available options: "Enable the Data History popup for all data collection instruments", "Enable the File Version History for 'File Upload' fields"
 * @param {string} check - available options: 'checked', 'unchecked'
 * @description Verifies if a checkbox field is checked/unchecked
 */
Given("I (should )see a checkbox labeled {addcustomization} that is {check} in additional customizations", (label, check) => {
    cy.get('td').contains(label).parents('tr').within(() => {
        cy.get('input[type=checkbox]').scrollIntoView().should(check === "checked" ? "be.checked" : "not.be.checked")
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the textarea labeled {string}
 * @param {string} label - the label associated with the textarea field
 * @description Clicks on the textarea field with given label
 */
Given("I click on the textarea labeled {string}", (label) => {
    cy.contains(label).then(($label) => {
        cy.wrap($label).parent().find('textarea').click()
    })
})


/**
 * @module DataImport
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I upload a file located at {string} by clicking on the button labeled {string}
 * @param {string} file_location - the location of the file being uploaded (e.g. import_files/core/filename.csv)
 * @param {string} button_label - text on the button you click to upload
 * @description attaches a file
 */
Given("I upload a file located at {string} by clicking on the button labeled {string}", (file_location, button_label) => {
  cy.get('input[type="file"]').attachFile(file_location)
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select the radio option {string}
 * @param {string} option - option to select
 * @description selects the radio option
 */
Given("I select the radio option {string}", (option) => {
    cy.get('label').contains(option).within(() => {
        cy.get('input[type=radio]').click()
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the icon {string} to download {string}
 * @param {string} icon - icon to click
 * @param {string} label - option to select on Other Export Options page
 * @description download PDF from Other Export options page
 */
Given("I click on the icon {string} to download {string}", (icon, label) => {
    cy.get('td').contains(label).parents('tr').within(() => {
        let src = null
        if(icon == "PDF")
            src = "download_pdf"
        else if(icon == "Compact PDF")
            src = "download_pdf_compact"
        else if(icon == "REDCap XML")
            src = "download_xml_project"
        else if(icon == "ZIP")
            src = "download_zip"

        if(icon == "PDF")
            cy.get("img[src*=" + src + "]").first().click()
        else
        cy.get("img[src*=" + src + "]").click()
        
    })
})


/**
 * @module MailHog
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I open the Email
 * @description Open MailHog
 */
Given('I open Email', () => {
    cy.visit("http://localhost:8025")
})


Cypress.Commands.add('findEmailBySubjectAndRecipient', (subject, recipient) => {
    cy.request('GET', 'http://localhost:8025/api/v2/messages').then((response) => {
      expect(response.status).to.eq(200) // Ensure the request was successful
      
      // Get all messages from MailHog
      const messages = response.body.items

      const matchedEmail = messages.find((message) => {
        const emailSubject = message.Content.Headers.Subject[0]
        const emailTo = message.Content.Headers.To[0]
        
        return emailSubject === subject && emailTo.includes(recipient)
      })
  
      // Ensure an email was found, otherwise throw an error
      if (matchedEmail) {
        return cy.wrap(matchedEmail) // Wrap the matched email to use in tests
      } else {
        throw new Error(`No email found with subject "${subject}" for recipient "${recipient}".`)
    }
    })
  })


/**
 * @module MailHog
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see an email for user {string} with subject {string}
 * @param {string} recipient - email id of recipient
 * @param {string} subject - subject of the email
 * @description verifies an email is available for a given user with a given subject
 */
Given("I should see an email for user {string} with subject {string}", (recipient, subject) => {
    cy.findEmailBySubjectAndRecipient(subject, recipient).then((email) => {
        // Assertions on the email content
        expect(email.Content.Headers.Subject[0]).to.eq(subject) // Check subject
        expect(email.Content.Headers.To[0]).to.include(recipient) // Check recipient
    })
})


//Copy Password is not working.. Needs fixing
/**
 * @module MailHog
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see an email for user {string} with subject {string}
 * @param {string} recipient - email id of recipient
 * @param {string} subject - subject of the email
 * @description verifies an email is available for a given user with a given subject
 */
Given("I copy the password from the email for user {string} with subject {string}", (recipient, subject) => {
    cy.findEmailBySubjectAndRecipient(subject, recipient).then((email) => {
        // Assertions on the email content
        expect(email.Content.Headers.Subject[0]).to.eq(subject) // Check subject
        expect(email.Content.Headers.To[0]).to.include(recipient) // Check recipient
        
        const passwordPattern = "[A-Z0-9]{8}"
        const emailContent = email.Content.Body
        cy.log(emailContent)

        const match = emailContent.match('passwordPattern')
        // const match = expect(emailContent).to.match(/[A-Z0-9]{8}/)
        cy.log(match)

        // if (match && match[1]) { 
        //     password = match[1] // Capture the password 
        //     cy.log('Password extracted: ' + password) // Log the password (optional) 
            
        // } else { 
        //     throw new Error('Password not found in email content') 
        // }
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select {string} on the dropdown field for alert form {namestat}
 * @param {string} option - option to select
 * @param {string} name_status - available options: 'name', 'status'
 * @description selects the dropdown option for alert form name/status
 */
Given("I select {string} on the dropdown field for alert form {namestat}", (option, name_status) => {
    if(name_status == "name")
        name_status = "form-name"
    else
        name_status = "email-incomplete"

    cy.get('select[name="' + name_status + '"]').select(option)
})


/**
 * @module Visibility
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see the dropdown field for alert form status with the option {string} selected
 * @param {string} option - option selected
 * @description verifies the option selected for alert form status
 */
Given("I should see the dropdown field for alert form status with the option {string} selected", (option) => {
    cy.get('select[name="email-incomplete"]').find(':selected').should('have.text', option)
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select the radio option {string} for {alert}
 * @param {string} option - option to select
 * @param {string} alert - available options: 'How will this alert be triggered', 'When to send the alert', 'Send it how many times', 'Alert Type'
 * @description selects the radio option for alert option
 */
Given("I select the radio option {string} for {alert}", (option, alert) => {
    cy.get('td').contains(alert).parents('tr').within(() => {
        cy.get('label').contains(option).parent().find('input').click()
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example Given("I should see the radio option {string} for {alert} selected", (option, alert) => {
 * @param {string} option - option selected
 * @param {string} alert - available options: 'How will this alert be triggered', 'When to send the alert', 'Send it how many times', 'Alert Type'
 * @description verifies the radio option is selected for alert option
 */
Given("I should see the radio option {string} for {alert} selected", (option, alert) => {
    cy.get('td').contains(alert).parents('tr').within(() => {
        cy.get('label').contains(option).parent().find('input').should('be.checked')
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I enter {string} into the alert message
 * @param {string} msg - message to enter
 * @description enters message into the message body of the alert
 */
Given("I enter {string} into the alert message", (msg) => {
    cy.get('.tox-edit-area iframe').then($iframe => {
        const $body = $iframe.contents().find('body')
        cy.wrap($body).clear().type(msg)
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I {savecan} the alert
 * @param {string} savecan - available options: 'Save', 'Cancel'
 * @description save/cancel the alert
 */
Given("I {savecan} the alert", (msg) => {
    if(msg== "save")
        msg = "Save"
    else
        msg = "Cancel"
    cy.get('button').contains(msg).scrollIntoView().click()
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the mail icon for record {string}
 * @param {string} recordID - record ID
 * @description clicks on the mail icon for record ID
 */
Given("I click on the mail icon for record {string}", (recordID) => {
    cy.get('td:nth-child(4)').contains(recordID).parents('tr').within(() => {
        cy.get('img[src*=mail]').click()
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the button labeled {string} for alert {string}
 * @param {string} label - label on the button of the alert
 * @param {string} num - alert number
 * @description click on the button on the alert
 */
Given("I click on the button labeled {string} for alert {string}", (label, num) => {
    cy.get('table#customizedAlertsPreview').find('td').contains('Alert #' + num).parents('tr').within(() => {
        cy.get('button').contains(label).click()
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the textarea labeled while the following logic is true for the alert
 * @description click on the textarea labeled while the following logic is true for the alert
 */
Given("I click on the textarea labeled while the following logic is true for the alert", () => {
    cy.get('textarea#alert-condition').click()
})