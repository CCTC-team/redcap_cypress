//Add any of your own step definitions here

const { Given } = require('@badeball/cypress-cucumber-preprocessor')

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
 * @description Verifies the values within a PDF
 */
Given("I should see the following values in the PDF at the local storage", (dataTable) => {
    // Write the function fetchLatestLocalStorage similar to fetchLatestDownload changing the location to ../www/redcap/edocs/
    cy.task('fetchLatestLocalStorage', ({fileExtension: 'pdf'})).then((pdf_file) => {

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
    //Run through the steps to import the project via CDISC ODM
    cy.get('a:visible:contains("New Project")').click()
    cy.get('input#app_title').type(project_name)
    cy.get('select#purpose').select(project_type)
    cy.get('input#project_template_radio0').click()
    cy.get('button').contains(button_label).click().then(() => {
        let pid = null;
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
Given('I create an empty project named {string} by clicking on "New Project" in the menu bar, selecting "{projectType}" from the dropdown, and clicking the "{projectRequestLabel}" button', (project_name, project_type, cdisc_file, button_label) => {
    cy.create_empty_project(project_name, project_type, cdisc_file, button_label)
})