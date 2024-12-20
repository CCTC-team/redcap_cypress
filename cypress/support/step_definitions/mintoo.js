//Add any of your own step definitions here
const { Given, defineParameterType } = require('@badeball/cypress-cucumber-preprocessor')
   
// const timeAdjust = Cypress.env('serverTimeAdjust')
// const { exec } = require('child_process')

import 'cypress-file-upload'
// import 'cypress-mailhog'

// To make sure emails are deleted only once per Test Script
let hasRunBeforeEach = false

let Password = null

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
    regexp: /Enable the Data History popup for all data collection instruments|Enable the File Version History for 'File Upload' fields|Prevent branching logic from hiding fields that have values|Require a 'reason' when making changes to existing records/
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

defineParameterType({
    name: 'buttonLink',
    regexp: /button|link/
})

defineParameterType({
    name: 'fieldIcons',
    regexp: /History|Missing Code|Comment|Show Field|Exclamation|Tick|Small Tick|Small Exclamation/
})

defineParameterType({
    name: 'drwOptions',
    regexp: /Verified data value|De-verify data value|Open query|Close the query|Reply with response|Send back for further attention|Email|REDCap Messenger|/
})

defineParameterType({
    name: 'drwRights',
    regexp: /No Access|View only|Open queries only|Respond only to opened queries|Open and respond to queries|Open, close, and respond to queries|/
})

defineParameterType({
    name: 'resolveType',
    regexp: /Status|Field Rule|Event|DAG|Assigned User|Record|Field|User/
})

defineParameterType({
    name: 'commentDrw',
    regexp: /Data Resolution Workflow|Field Comment Log|Data Resolution Dashboard|/
})

defineParameterType({
    name: 'otherExportOption',
    regexp: /Export entire project as REDCap XML file|ZIP file of uploaded files|PDF of data collection instruments containing saved data|REDCap Project \(XML\)/
})

defineParameterType({
    name: 'passwordVercode',
    regexp: /password|verification code/
})

defineParameterType({
    name: 'occurTime',
    regexp: /occurence|time lag/
})

defineParameterType({
    name: 'sendInvReminder',
    regexp: /When to send invitations AFTER conditions are met|Enable reminders/
})

defineParameterType({
    name: 'instrumentRights',
    regexp: /No Access|Read Only|View & Edit|De-Identified|Remove All Identifier Fields|Full Data Set/
})

defineParameterType({
    name: 'instrumentPrivilege',
    regexp: /Data Viewing Rights|Data Export Rights/
})

defineParameterType({
    name: 'downloadIcon',
    regexp: /PDF|Compact PDF|REDCap XML|ZIP/
})

defineParameterType({
    name: 'reportFilterOption',
    regexp: /field label|operator value/
})

defineParameterType({
    name: 'operatorValue',
    regexp: /operator|operator value/
})

defineParameterType({
    name: 'eventOptions',
    regexp: /Min Offset Range|Max Offset Range|Custom Event Label|Time|Date|Notes/
})

defineParameterType({
    name: 'eventSchedule',
    regexp: /Event|Schedule/
})

eventSchedule = {
    'Event' : `#event_table`,
    'Schedule' : `#edit_sched_table`
}

eventOptions = {
    'Min Offset Range' : `input#offset_min_edit`,
    'Max Offset Range' : `input#offset_max_edit`,
    'Custom Event Label' : `input#custom_event_label_edit`,
    'Time' : `input[id^=time]`,
    'Date' : `input[id^=date]`,
    'Notes' : `textarea[id^=notes]`
}

operatorValue = {
    'operator' : `select[name='limiter_operator[]']`,
    'operator value' : `select[name='limiter_value[]']`
}

reportFilterOption = {
    'field label' : `input[placeholder='Type variable name or field label']`,
    'operator value' : `input[name='limiter_value[]']`
}

downloadIcon = {
    'PDF' : `img[src*=download_pdf]`,
    'Compact PDF' : `img[src*=download_pdf_compact]`,
    'REDCap XML' : `img[src*=download_xml_project]`,
    'ZIP' : `img[src*=download_zip]`
}

instrumentPrivilege = {
    'Data Viewing Rights' : `[name^=form-]`,
    'Data Export Rights' : `[name^=export-form]`
}

instrumentRights = {
    'No Access' : `input[type=radio][value=0]`,
    'Read Only' : `input[type=radio][value=2]`,
    'View & Edit' : `input[type=radio][value=1]`,
    'De-Identified' : `input[type=radio][value=2]`,
    'Remove All Identifier Fields' : `input[type=radio][value=3]`,
    'Full Data Set' : `input[type=radio][value=1]`
}

sendInvReminder = {
    'When to send invitations AFTER conditions are met' : `input[type=text][id^=sscond-timelag`,
    'Enable reminders' : `input[type=text][name^=reminder_timelag_`
}

occurTime = {
    'occurence' : `input[type=radio][name=reminder_type][value=NEXT_OCCURRENCE]`,
    'time lag' : `input[type=radio][name=reminder_type][value=TIME_LAG]`
}

resolveType = {
    'Status' : `select[id=choose_status_type]`,
    'Field Rule' : `select[id=choose_field_rule`,
    'Event' : `select[id=choose_event]`,
    'DAG' : `select[id=choose_dag]`,
    'Assigned User' : `select[id=choose_assigned_user]`,
    'Record' : `select[id=choose_record]`,
    'Field' : `select[id=choose_field]`,
    'User' : `select[id=choose_user]`
}

fieldIcons = {
    'History' : `img[src*=history]`,
    'Missing Code': `img[src*=missing]`,
    'Comment': `img[src*=balloon]`,
    'Show Field' : `i[id*=showfield]`,
    'Exclamation': `img[src*=exclamation_red]`,
    'Tick': `img[src*=tick_circle]`,
    'Small Tick': `img[src*=balloon_tick]`,
    'Small Exclamation': `img[src*=balloon_exclamation]`
}

drwOptions = {
    'Verified data value' : `input[value=VERIFIED]`,
    'De-verify data value' : `input[value=DEVERIFIED]`,
    'Open query' : `input[value=OPEN]`,
    'Close the query' : `input[value=CLOSED]`,
    'Reply with response' : `input[value=OPEN]`,
    'Send back for further attention' : `input[value=OPEN]`,
    'Email' : `input[id=assigned_user_id_notify_email]`,
    'REDCap Messenger' : `input[id=assigned_user_id_notify_messenger]`
}

savecan = {
    'save' : `Save`,
    'cancel' : `Cancel`
}

namestat = {
    'name' : `select[name=form-name]`,
    'status' : `select[name=email-incomplete]`
}

drwRights = {
    'No Access' : '0',
    'View only' : '1',
    'Open queries only' : '4',
    'Respond only to opened queries' : '2',
    'Open and respond to queries' : '5',
    'Open, close, and respond to queries' : '3'
}


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


/**
 * @module Download
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see the following values in the PDF at the local storage
 * @description Verifies the values within a PDF at the local storage
 */
Given("I should see the following values in the PDF at the local storage", (dataTable) => {
    cy.task('fetchLatestDownloadLocal',{fileExtension: 'pdf'}).then((pdf_file) => {
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
 * @param {string} addcustomization - available options: "Enable the Data History popup for all data collection instruments", "Enable the File Version History for 'File Upload' fields", "Prevent branching logic from hiding fields that have values"
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
 * @example I {clickType} the checkbox labeled {addcustomization} in additional customizations
 * @param {string} addcustomization - available options: "Enable the Data History popup for all data collection instruments", "Enable the File Version History for 'File Upload' fields", "Prevent branching logic from hiding fields that have values"
 * @param {string} clickType - available options: 'click on', 'check', 'uncheck'
 * @description checks/unchecks the checkbox field
 */
Given("I {clickType} the checkbox labeled {addcustomization} in additional customizations", (checktype, label) => {
    cy.get('td').contains(label).parents('tr').within(() => {
        if (checktype === "check")
            cy.get('input[type=checkbox]').scrollIntoView().check()
        else
            cy.get('input[type=checkbox]').scrollIntoView().uncheck()
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
Given("I click on the icon {downloadIcon} to download {otherExportOption}", (icon, label) => {
    if(label == "REDCap Project (XML)")
        cy.get('div[role="dialog"]:visible').find (downloadIcon[icon]).click()

    else {
        cy.get('td').contains(label).parents('tr').within(() => {

        if(icon == "PDF")
            cy.get(downloadIcon[icon]).first().click()
        else
            cy.get(downloadIcon[icon]).last().click()
        
        })
    }
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

  Cypress.Commands.add('findEmailsByRecipient', (recipient) => {
    cy.request('GET', 'http://localhost:8025/api/v2/messages').then((response) => {
        expect(response.status).to.eq(200) // Ensure the request was successful
      
        // Filter emails for the specific recipient
        const emails = response.body.items.filter((email) => {
            return email.To.some((to) => `${to.Mailbox}@${to.Domain}` === recipient)
        })
        // cy.log(emails.length)
        return emails
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



/**
 * @module MailHog
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see {int} email(s) for user {string}
 * @param {string} recipient - email id of recipient
 * @param {int} num - number of the email
 * @description verifies the user has the given number of email(s)
 */
Given("I should see {int} email(s) for user {string}", (num, recipient) => {
    cy.findEmailsByRecipient(recipient).then((emails) => {
        expect(emails.length).to.eq(num) 
    })
})

// /**
//  * @module MailHog
//  * @author Mintoo Xavier <min2xavier@gmail.com>
//  * @example I copy and paste the password for user {string} from the email with subject {string} to the link in the email with subject {string}
//  * @param {string} recipient - email id of recipient
//  * @param {string} subject1 - subject of the first email
//  * @param {string} subject2 - subject of the second email
//  * @description copy and paste the password for user from first email into the link in the second email
//  */
// Given("I copy and paste the password for user {string} from the email with subject {string} to the link in the email with subject {string}", (recipient, subject1, subject2) => {
//     let password = null
//     cy.findEmailBySubjectAndRecipient(subject1, recipient).then((email) => {
           
//         const emailContent1 = email.Content.Body
//         // Define the search phrase
//         const searchPhrase = "previous email."
//         cy.log("emailContent:" + emailContent1)

//         // Find the index of the search phrase in the input string
//         const index = emailContent1.indexOf(searchPhrase)

//         if (index !== -1) {
//         // Calculate the starting index for the 8-letter substring. Have to add +6 (maybe because of <br> or something)
//         let startIndex = index + searchPhrase.length + 6      

//         // Extract the 8-letter substring
//         let endIndex = startIndex + 8
//         password = emailContent1.substring(startIndex, endIndex).trim()
//         cy.log("Password:" + password)
//         } else {
//             // If the search phrase is not found, return a default message
//             return null // Or handle as needed
//         }
//     })

//     cy.findEmailBySubjectAndRecipient(subject2, recipient).then((email) => {
//         const emailBody = email.Content.Body

//       // Use a regex to find the first link in the email body
//       const linkMatch = emailBody.match(/https?:\/\/[^\s]+/)
//       if (linkMatch) {
//         const link = linkMatch[0]
//         cy.log(`Found link: ${link}`)

//         // Visit the link
//         cy.visit(link)

//         // Paste the password into the input field
//         cy.get('input[type="password"]').type(password)
//       } else {
//         throw new Error('Link not found in the email body.')
//       }
//     })
// })


/**
 * @module MailHog
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I paste the {passwordVercode} into the input field
 * @param {string} passwordVercode - available options: 'password', 'verification code'
 * @description pastes the password/verification code into the input field
 */
Given("I paste the {passwordVercode} into the input field", (passcode) => {
    if (passcode == "password")
        cy.get('input[type="password"]').type(password)
    else
        cy.get('input[type="text"]').type(password)

})

/**
 * @module MailHog
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I copy the {passwordVercode} for user {string} from the email with subject {string}
 * @param {string} passwordVercode - available options: 'password', 'verification code'
 * @param {string} recipient - email id of recipient
 * @param {string} subject - subject of the  email
 * @description copy the password for user from email with the given subject
 */
Given("I copy the {passwordVercode} for user {string} from the email with subject {string}", (passcode, recipient, subject) => {
    password = null
    let searchPhrase = null
    let startIndex = null
    let endIndex = null
    cy.findEmailBySubjectAndRecipient(subject, recipient).then((email) => {
           
        const emailContent1 = email.Content.Body
        // Define the search phrase
       
        if (passcode == "password")
            searchPhrase = "previous email."
        else
            searchPhrase = "verification code is "

        cy.log("emailContent:" + emailContent1)

        // Find the index of the search phrase in the input string
        let index = emailContent1.indexOf(searchPhrase)

        if (index !== -1) {
            if (passcode == "password") {
                // Calculate the starting index of password. Have to add +6 (maybe because of <br> or something)
                startIndex = index + searchPhrase.length + 6      

                // Extract the 8-letter password
                endIndex = startIndex + 8
            } else {
                // Calculate the starting index of verification code
                startIndex = index + searchPhrase.length     

                // Extract the 8-letter verification code
                endIndex = startIndex + 6

            }
       
        password = emailContent1.substring(startIndex, endIndex).trim()
        cy.log(passcode + ': ' + password)
        } else {
           
            throw new Error(passcode + ' not found in the email body.')
        }
    })
})


/**
 * @module MailHog
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the link in the email for user {string} with subject {string}
 * @param {string} recipient - email id of recipient
 * @param {string} subject - subject of the first email
 * @description copy and paste the password for user from first email into the link in the second email
 */
Given("I click on the link in the email for user {string} with subject {string}", (recipient, subject) => {
    cy.findEmailBySubjectAndRecipient(subject, recipient).then((email) => {
        const emailBody = email.Content.Body
        const linkMatch = emailBody.match(/(https?:\/\/[^\s)]+)/g) // Regex to match URLs, excluding trailing ')'

        if (linkMatch) {
          const link = linkMatch[0]
          cy.log(`Found link: ${link}`)
          cy.visit(link)
        }
    
    })
})


Cypress.Commands.add('adjustDockerTime', (containerName, time) => {
  return new Cypress.Promise((resolve, reject) => {
    exec(
      `docker exec ${containerName} date --set="${time}"`,
      (error, stdout, stderr) => {
        if (error) {
          console.error(`Error adjusting time: ${stderr}`)
          reject(error)
        } else {
          console.log(`Time adjusted: ${stdout}`)
          resolve(stdout)
        }
      }
    )
  })
})

/**
 * @module MailHog
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I verify the link in the email with subject {string} for user {string} expires after {int} day(s)
 * @param {string} recipient - email id of recipient
 * @param {string} subject1 - subject of the first email
 * @param {string} subject2 - subject of the second email
 * @description copy and paste the password for user from first email into the link in the second email
 */
Given("I click on link in the email with subject {string} for user {string} after {int} day(s)", (subject, recipient, numDays) => {
        cy.findEmailBySubjectAndRecipient(subject, recipient).then((email) => {
        const emailBody = email.Content.Body

      // Use a regex to find the first link in the email body
      const linkMatch = emailBody.match(/https?:\/\/[^\s]+/)
      if (linkMatch) {
        const link = linkMatch[0]
        cy.log(`Found link: ${link}`)

        const expDay = 24 * 60 * 60 * 1000 * numDays
        const d = new Date()
        cy.log(`Current date:` + d)        // Initialize the clock to the current time
        cy.clock(Date.now(), ['Date'])

        // Advance the clock by numDays
        cy.tick(expDay)
            // Make an API call to set server time
                // Adjust server time
        cy.adjustDockerTime('debian', '4 days ahead')

                // // Log the updated date to confirm the time manipulation
        // cy.window()
        // .its('Date')
        // .then((MockedDate) => {
        //     const mockedDate = new MockedDate()
        //     cy.log(`Current date after ticking: ${mockedDate}`)
            
        // })

        cy.visit(link, { failOnStatusCode: false }) // Fail-safe if link is already expired
        
        // Assert that the page displays the expiration message
        cy.contains('This link has expired').should('be.visible')

        // // Log the updated date to confirm the time manipulation
        // cy.window()
        // .its('Date')
        // .then((MockedDate) => {
        //     const mockedDate = new MockedDate()
        //     cy.log(`Current date after ticking: ${mockedDate}`)
        //     cy.visit(link).contains('The file has expired.') // Ensure fail-safe for expired links
            
        //     cy.log(`Current date after ticking: ${mockedDate}`)
        // })

        // Visit the link
       
 
       
        // // Check if the link has expired (simulate 4 days later)
        // const numDaysLater = new Date()
        // numDaysLater.setDate(numDaysLater.getDate() + num)

        // // cy.log(`Current date:` + numDaysLater)
        // cy.clock(Date.now()).then(clock => {
        //     clock.tick(5 * 24 * 60 * 60 * 1000)
        // })      // Verify the mocked clock is set correctly
        // // Verify the mocked clock is set correctly
        // // cy.wrap(new Date().getTime()).should('eq', numDaysLater.getTime())
        // // cy.clock(new Date().setDate(new Date().getDate() + num))
        // // Get the current date
        // cy.window().its('Date').invoke('now').then((newTime) => {
        //     const expectedTime = Date.now() + (5 * 24 * 60 * 60 * 1000)
        //     expect(newTime).to.be.closeTo(expectedTime, 100)
        //     const d = new Date()
        //     cy.log(`Current date:` + d)
        //     // Visit the link
            
        //     cy.visit(link, { failOnStatusCode: false }) // Fail-safe if link is already expired
            
        // })
        
        // const d = new Date()
        // cy.log(`Current date:` + d)
        // // Visit the link
        
       

      } else {
        throw new Error('Link not found in the email body.')
      }
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
    cy.get(namestat[name_status]).select(option)
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
 * @module Visibility
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
    cy.get('button').contains(savecan[msg]).scrollIntoView().click()
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the mail icon for record {string}
 * @param {int} recordID - record ID
 * @description clicks on the mail icon for record ID
 */
Given("I click on the mail icon for record {int}", (recordID) => {
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


/**
 * @module Visibility
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see a {fieldIcons} icon for the field labeled {string}
 * @param {string} icon - icon to verify - available options: 'History', 'Missing Code', 'Comment', 'Show Field'
 * @param {string} label - field label
 * @description verifies the field contains the icon
 */
Given("I should see a(n) {fieldIcons} icon for the field labeled {string}", (icon,label) => {
    cy.get('td').contains(label).parents('tr').within(() => {
        cy.get(fieldIcons[icon])
    })
})


/**
 * @module Visibility
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should NOT see a(n) {fieldIcons} icon for the field labeled {string}
 * @param {string} icon - icon to verify - available options: 'History', 'Missing Code', 'Comment', 'Show Field'
 * @param {string} label - field label
 * @description verifies the field does not contains the icon
 */
Given("I should NOT see a(n) {fieldIcons} icon for the field labeled {string}", (icon,label) => {
    cy.get('td').contains(label).parents('tr').within(() => {
        cy.get(fieldIcons[icon]).should('not.exist')
    })    
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the {fieldIcons} icon for the field labeled {string}
 * @param {string} icon - icon to click - available options: 'History', 'Missing Code', 'Comment', 'Show Field'
 * @param {string} label - field label
 * @description clicks on the icon for the field
 */
Given("I click on the {fieldIcons} icon for the field labeled {string}", (icon,label) => {
    cy.get('td').contains(label).parents('tr').within(() => {
        cy.get(fieldIcons[icon]).click()
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I enter reason for change as {string} for row {string}
 * @param {string} text - reason to enter
 * @param {int} num - row number
 * @description clicks on the icon for the field
 */
Given("I enter reason for change as {string} for row {int}", (text, num) => {
    num += 2
    cy.get('table#comptable').find('tr:nth-child(' + num + ')').within(() => {
        cy.get('textarea').type(text)
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I scroll to the field labeled {string}
 * @param {string} text - field label
 * @description croll to the field
 */
Given("I scroll to the field labeled {string}", (text) => {
    cy.get('td').contains(text).scrollIntoView()
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I scroll to the field labeled {string}
 * @param {string} text - field label
 * @description scroll to the field
 */
Given("I add the missing code {string}", (text) => {
    cy.get('.set_btn').contains(text).click()
})



/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select the {dropdownType} option {drwOptions} in Data Resolution Workflow
 * @param {string} dropdownType - available options: 'dropdown', 'multiselect', 'checkboxes', 'radio'
 * @param {string} drwOptions - option to select - available options: 'Verified data value', 'De-verify data value', 'Open query', 'Close the query', 'Reply with response', 'Email', 'REDCap Messenger'
 * @description Selects a specific item in Data Resolution Workflow
 */
Given("I select the {dropdownType} option {drwOptions} in Data Resolution Workflow", (type, option) => {
    cy.get(drwOptions[option]).click()
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I {enterType} {string} in the comment box in {commentDrw}
 * @param {string} text - text to enter/verify
 * @description enter/verify comment in the comment box in Data Resolution Workflow/Field Comment Log
 */
Given("I {enterType} {string} in the comment box in {commentDrw}", (enter_type, text, comdrw) => {
    if(enter_type === "enter"){
        cy.get('textarea#dc-comment').type(text)
    } else if (enter_type === "clear field and enter") {
        cy.get('textarea#dc-comment').clear().type(text)
    } else if (enter_type === "verify"){
        cy.get('textarea#dc-comment').invoke('val').should('include', text)
    }
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select the User Right named Data Resolution Workflow and choose {drwRights}
 * @param {string} drwRights - option to select - available options: 'No Access', 'View only', 'Open queries only', 'Respond only to opened queries', 'Open and respond to queries', 'Open, close, and respond to queries'
 * @description selects the User Right option for Data Resolution Workflow
 */
Given("I select the User Right named Data Resolution Workflow and choose {drwRights}", (option) => {
    cy.get('div[role="dialog"]:visible').find('input[name=data_quality_resolution][value=' + drwRights[option] + ']').click()  
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select the dropdown option {string} in Data Resolution Workflow
 * @param {string} option - option to select
 * @description selects the dropdown option in Data Resolution Workflow
 */
Given("I select the dropdown option {string} in Data Resolution Workflow", (option) => {
    cy.get('table#newDCHistory').find('select').select(option)  
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select the option {string} from the dropdown field for {resolveType} in {commentDrw}
 * @param {string} resolveType - type of filter
 * @param {string} option - option to select - available options: 'Status', 'Field Rule', 'Event', 'DAG', 'Assigned User'
 * @param {string} commentDrw - available options: 'Data Resolution Dashboard', 'Field Comment Log'
 * @description selects the dropdown option in Data Resolution Dashboard/Field Comment Log
 */
Given("I select the option {string} from the dropdown field for {resolveType} in {commentDrw}", (option, type, comdrw) => {
    cy.get('.ftitle').find(resolveType[type]).select(option)  
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the {onlineDesignerFieldIcons} icon for the Comment {string}
 * @param {string} icon - icon to click
 * @param {string} comment - comment
 * @description clicks on the icon of the comment
 */
Given("I click on the {onlineDesignerFieldIcons} icon for the Comment {string}", (icon, comment) => {
    cy.get('td').contains(comment).parents('tr').within(() => {
        cy.get(onlineDesignerFieldIcons[icon]).click()  
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should NOT see {onlineDesignerFieldIcons} icon for the Comment {string}
 * @param {string} icon - icon to verify
 * @param {string} comment - comment
 * @description verifies the icon of the comment
 */
Given("I should NOT see {onlineDesignerFieldIcons} icon for the Comment {string}", (icon, comment) => {
    cy.get('td').contains(comment).parents('tr').within(() => {
        cy.get(onlineDesignerFieldIcons[icon]).should('not.exist')
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I {enterType} {string} in the comment box for the editted comment {string} in {commentDrw}
 * @param {string} text - text to enter
 * @param {string} comment - text to edit
 * @param {string} commentDrw - available options: 'Data Resolution Dashboard', 'Field Comment Log'
 * @description enter/verify comment in the comment box in Data Resolution Workflow/Field Comment Log
 */
Given("I {enterType} {string} in the comment box for the editted comment {string} in {commentDrw}", (enter_type, text, comment,comdrw) => {
    cy.get('td').contains(comment).parents('tr').within(() => {
        if(enter_type === "enter"){
            cy.get('textarea[id*=dc-comment-edit]').type(text)
        } else if (enter_type === "clear field and enter") {
            cy.get('textarea[id*=dc-comment-edit]').clear().type(text)
        }
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I {enterType} {string} in the comment box for the editted comment {string} in {commentDrw}
 * @param {string} text - text to enter
 * @param {string} comment - text to edit
 * @param {string} commentDrw - available options: 'Data Resolution Dashboard', 'Field Comment Log'
 * @description enter/verify comment in the comment box in Data Resolution Workflow/Field Comment Log
 */
Given("I click on the {buttonLink} labeled {string} for row {int}", (type, text, num) => {
    cy.get('table[id*=dh_table]').find('tr:nth-child(' + num + ')').within(() => {
        if(type === "button"){
            cy.get('button').contains(text).click()
        } else 
            cy.get('a').contains(text).click()
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I unzip the latest downloaded zip file
 * @description Unzips the latest downloaded zip file
 */
Given("I unzip the latest downloaded zip file", () => {
    cy.task('fetchLatestDownload', ({fileExtension: 'zip'})).then((latest_file) => {
        const filepath = latest_file
        cy.task('unzipFile', { filepath }).then((result) => {
            if (result.success) {
                cy.log(`File unzipped successfully`)
            } else {
                cy.log(result.message)
                throw new Error(result.message)
            }
        })
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the button containing {string}
 * @param {string} text - text in button
 * @description clicks on the button containing text
 */
Given("I click on the button containing {string}", (text) => {
    cy.get('td').contains(text).within(() => {
        cy.get('i').click()
   })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see a bar chart for {string} with bar of width {int}
 * @param {string} fieldName - Field name to check the bar chart
 * @param {int} num - width of bar in the bar chart
 * @description verifies bar chart contains bar of given width
 */
Given("I should see a bar chart for {string} with bar of width {int}", (fieldName, num) => {
    cy.get('.dc_header').contains(fieldName).scrollIntoView().parent('p').nextAll('div').eq(1).within (() => {
        cy.get('iframe').then($iframe => {
            const $g = $iframe.contents().find('body').find('svg#chart')
            cy.wrap($g).find('rect[fill="#3366cc"][width=' + num + ']').should('be.visible')
        })
   })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see a pie chart for {string} with text {string}
 * @param {string} fieldName - Field name to check the pie chart
 * @param {string} text - text within the pie chart
 * @description verifies pie chart contains the text
 */
Given("I should see a pie chart for {string} with text {string}", (fieldName, text) => {
    cy.get('.dc_header').contains(fieldName).scrollIntoView().parent('p').nextAll('div').eq(1).within (() => {
        cy.get('iframe').then($iframe => {
            const $g = $iframe.contents().find('body').find('svg#chart')
            cy.wrap($g).find('text').contains(text).should('be.visible')
        })
   })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should NOT see a pie chart for {string} with text {string}
 * @param {string} fieldName - Field name to check the pie chart
 * @param {string} text - text within the pie chart
 * @description verifies pie chart contains the text is not visible
 */
Given("I should NOT see a pie chart for {string} with text {string}", (fieldName, text) => {
    cy.get('.dc_header').contains(fieldName).scrollIntoView().parent('p').nextAll('div').eq(1).within (() => {
        cy.get('iframe').then($iframe => {
            const $g = $iframe.contents().find('body').find('svg#chart')
            cy.wrap($g).find('text').contains(text).should('not.be.visible')
        })
   })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the radio labeled Send every for {occurTime}
 * @param {string} occurTime - available options: 'occurence', 'time lag'
 * @description selects the radio option Send every for ASI option
 */
Given("I click on the radio labeled Send every for {occurTime}", (option) => {
    cy.get(occurTime[option]).click()
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I enter {int} day(s) {int} hour(s) and {int} minute(s) for {sendInvReminder}
 * @param {int} days -  number of days
 * @param {int} hrs -  number of hours
 * @param {int} mins -  number of minutes
 * @param {string} sendInvReminder - available options: 'When to send invitations AFTER conditions are met', 'Enable reminders'
 * @description enter days, hours and minutes for ASI option
 */
Given("I enter {int} day(s) {int} hour(s) and {int} minute(s) for {sendInvReminder}", (days, hrs, mins, option) => {
    cy.get(sendInvReminder[option] + 'days]').type(days)
    cy.get(sendInvReminder[option] + 'hours]').type(hrs)
    cy.get(sendInvReminder[option] + 'minutes]').type(mins)
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select {string} from the dropdown option for When the following survey is completed
 * @param {string} text - option to select
 * @description selects the dropdown option for When the following survey is completed
 */
Given("I select {string} from the dropdown option for When the following survey is completed", (text) => {
    cy.get('.select2-selection__rendered').click()
    cy.get('li.select2-results__option').contains(text).should('be.visible').click()
})


/**
 * @module DataImport
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I create a new project named {string} by clicking on "New Project" in the menu bar, selecting "{projectType}" from the dropdown, choosing the latest downloaded CDISC file, and clicking the "{projectRequestLabel}" button
 * @param {string} project_name - the desired name for the project
 * @param {string} projectType - available options: 'Practice / Just for fun', 'Operational Support', 'Research', 'Quality Improvement', 'Other'
 * @param {string} projectRequestLabel - available options: 'Create Project', 'Send Request'
 * @description Creates a new REDCap project of a specific project type using latest downloaded CDISC XML file.
 */
Given('I create a new project named {string} by clicking on "New Project" in the menu bar, selecting "{projectType}" from the dropdown, choosing the latest downloaded CDISC file, and clicking the "{projectRequestLabel}" button', (project_name, project_type, button_label) => {
    cy.wait(500)
    cy.task('fetchLatestDownload', ({fileExtension: 'xml'})).then((xml) => {
        // Extract relative path starting from 'downloads'
        let basePath = '/Users/min2suz/redcap_cypress_docker/redcap_cypress/cypress/';
        let filePath = xml.replace(basePath, '../../');
        cy.log(filePath)
        cy.create_cdisc_project(project_name, project_type, filePath, button_label)
    })
})




/**
 * @module Visibility
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I (should )see a checkbox labeled {addcustomization} that is {check} in additional customizations
 * @param {string} addcustomization - available options: "Enable the Data History popup for all data collection instruments", "Enable the File Version History for 'File Upload' fields", "Prevent branching logic from hiding fields that have values"
 * @param {string} check - available options: 'checked', 'unchecked'
 * @description Verifies if a checkbox field is checked/unchecked
 */
Given("I (should )see the {instrumentPrivilege} of the instrument {string} with option {instrumentRights} {select}", (priv, label, option, selected) => {
    cy.get('td').contains(label).parent('tr').within(() => {
        cy.get(instrumentRights[option] + instrumentPrivilege[priv]).should(selected === 'selected' ? "be.checked" : "not.be.checked")
    })
})


/**
 * @module DataImport
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I upload a {string} format file located at {string}, by clicking the button {string}
 * @param {string} format - the format of the file that is being uploaded (e.g. csv)
 * @param {string} file_location - the location of the file being uploaded (e.g. import_files/core/filename.csv)
 * @param {string} button_label - text on the button you click to upload
 * @description Imports well-formed REDCap data import file (of specific type) to a specific project given a Project ID.
 */
Given("I upload a {string} format file located at {string}, by clicking the button {string}", (format, file_location, button_label) => {
    // cy.get('div[role="dialog"]:visible').within(() => {
        cy.upload_file(file_location, format, '')
    // })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the list item {string}
 * @param {string} text - list item to click
 * @description clicks on the list item
 */
Given("I click on the list item {string}", (text) => {
    cy.get('li').contains(text).click()
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select the operator {string} for Filter {int}
 * @param {string} oper - operator to select
 * @param {int} num - Filter number
 * @description Selects the operator for the Filter
 */
Given("I enter {string} into the {reportFilterOption} for Filter {int}", (text, option, num) => {
    cy.get('.limiter_num').contains(num).parents('tr').within(() => {
        cy.get(reportFilterOption[option]).type(text)
    })
})

/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I select the operator {string} for Filter {int}
 * @param {string} oper - operator to select
 * @param {int} num - Filter number
 * @description Selects the operator for the Filter
 */
Given("I select the {operatorValue} {string} for Filter {int}", (option, text, num) => {
    cy.get('#create_report_table').find('td').contains('Filter ' + num).parents('tr').within(() => {
        cy.get(operatorValue[option]).select(text)
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should have the latest downloaded {string} file with SHA256 hash value {string}
 * @param {string} fileType - file format
 * @param {string} hashValue - hash value
 * @description verifies the hash value of the file
 */
Given("I should have the latest downloaded {string} file with SHA256 hash value {string}", (fileType, hashValue) => {
    cy.task('fetchLatestDownload', ({fileExtension: fileType})).then((latest_file) => {
        let basePath = '/Users/min2suz/redcap_cypress_docker/redcap_cypress/';
        let filePath = latest_file.replace(basePath, '');
        let delLines = 0

        // sas, sps, r files contain the corresponding csv file names within the files 
        // csv filename is of the format filename_yyyy-mm-dd_hhmm.csv
        // This causes the hash value to differ each time hence removing the csv file name from the file
        if (fileType == "sas")
            delLines = 2
        else if (fileType == "sps")
            delLines = 1
        else if (fileType == "r")
            delLines = 7
        else if (fileType == "do")
            delLines = 6
        else if (fileType == "xml")
            delLines = 3

        if (fileType != 'csv')
            cy.task('modifyFile', { filePath, delLines }).then(result => {
                cy.log(result)
            })
        
        cy.task('calculateFileHash', { filePath, fileType }).then(hash => {
            expect(hash).to.equal(hashValue);
          })
    })
})


/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I enter {string} into the {eventOptions} for the event named {string} in the {eventSchedule} table
 * @param {string} text - text to enter
 * @param {string} eventOptions - available options - Min Offset Range, Max Offset Range, Custom Event Label
 * @param {string} eventName - event name
 * @param {string} eventSchedule - available options - Event, Schedule
 * @description enter text into the option for the given event in the Event/SChedule table 
 */
Given("I enter {string} into the {eventOptions} for the event named {string} in the {eventSchedule} table", (text, option, eventName, tableName) => {
    let object = 'input[value="' + eventName + '"]'
    if (tableName == "Schedule")
        object = 'td:contains("' + eventName + '")'
    
    cy.get(eventSchedule[tableName]).find(object).parents('tr').within(() => {
        cy.get(eventOptions[option]).clear({force: true}).type(text, {force: true})
    })
})

/**
 * @module Interactions
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I enter {string} into the {eventOptions} for the event named {string} in the {eventSchedule} table
 * @param {string} text - text to enter
 * @param {string} eventOptions - available options - Min Offset Range, Max Offset Range, Custom Event Label
 * @param {string} eventName - event name
 * @param {string} eventSchedule - available options - Event, Schedule
 * @description enter text into the option for the given event in the Event/SChedule table 
 */
Given("I click on the button labeled {string} to add an Ad Hoc Event", (text) => {
    cy.window().then((win) => {
        cy.stub(win, 'open').callsFake((url) => {
          // You can test the URL that would have been opened in the popup
        //   expect(url).to.include('Calendar/calendar_popup.php');  // Check the URL
        //   expect(url).to.include('cal_id=123');  // Check the calendar ID
        //   expect(url).to.include('width=500');  // Check the width
        //   // You can add further checks here based on your requirements
  
        //   // Use `cy.visit()` to open the URL in the same window
          cy.visit(url);
        });
      });
  
      // Simulate clicking the button that opens the calendar popup
      cy.get('button#btn_newCalEv').click({force: true}); 
      cy.url().should('include', 'calendar_popup.php');
})


// /**
//  * @module Interactions
//  * @author Mintoo Xavier <min2xavier@gmail.com>
//  * @example I select {string} from the dropdown option for When the following survey is completed
//  * @param {string} text - option to select
//  * @description selects the dropdown option for When the following survey is completed
//  */
// Given("I click on the button labeled Print page", () => {
//     cy.window().then((win) => {     
//         cy.stub(win,'print').callsFake(url => {
//             return window.print('_self')
//         }).as('print')
//       })

//     cy.get('button').contains('Print page').click()
//     cy.get('@print').should('be.called')

// })



// cy.upload_file("cdisc_files/" + cdisc_file, 'xml', 'input[name="AutomatedSurveyInvitation-import"]')

// /**
//  * @module Interactions
//  * @author Mintoo Xavier <min2xavier@gmail.com>
//  * @example I select {string} from the dropdown option for When the following survey is completed
//  * @param {string} text - option to select
//  * @description selects the dropdown option for When the following survey is completed
//  */
// Given("I select the option for ASI reminder to send every {string} at time {string}", (text, time) => {
//     cy.get('select[name=reminder_nextday_type]').select(text)
//     cy.get('input[name=reminder_nexttime]').type(time)
// })
