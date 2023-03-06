/**
 * @module export_data
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I enable the survey labeled {string}
 * @param {string} label the name of the survey
 * @description Enable the survey
 */
Given('I enable the Data Collection Instrument labeled {string} as survey', (label) => {
    cy.get('table[id=table-forms_surveys]').contains('td', label).parents('tr').find('button').contains('Enable').click().then(() => {
        cy.get('button').contains('Save Changes').click()
    })  
})

/**
 * @module export_data
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I open the survey from Survey options and submit it
 * @param {string} label the name of the survey
 * @description Oen the survey from Survey Options and submit it
 */
Given('I open the survey from Survey options and submit it', () => {
    let newurl = ""
    cy.wrap(newurl).as('newurl')
    cy.window().then((win) => {     
        cy.stub(win,'surveyOpen').callsFake((url) => {
            newurl = url
            //return win.open.wrappedMethod.call(win, url, '_self')
            cy.visit(newurl)
        //    cy.wrap(newurl).as("newurl")
            
        }).as('surveyOpen')
      })
    cy.get('a').contains('Open survey').click()
    cy.get('@surveyOpen').should('be.called')
    // cy.get("@newurl").then(newurl => {
    //    cy.visit(newurl)
    // })
    cy.get('button').contains('Submit').click()
    cy.get('button').contains('Close survey').click()
    cy.visit_version({page: '/DataEntry/record_status_dashboard.php', params: 'pid=14'})
})

/**
 * @module export_data
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should have a {string} file that contains the data {string} for record ID {string} and fieldname {string}
 * @param {string} format the text format of the data export you are looking to receive
 * @param {string} data the data to verify
 * @param {string} recordId The Record ID of the record
 * @param {string} fieldName the fieldname that contains data
 * @description Interactions - Verifies the data present in a field for a record
 */
Given("I should have a {string} file that contains the data {string} for record ID {string} and fieldname {string}", (format, data, recordId, fieldName) => {

    cy.readFile("cypress/downloads" + '/test_file.' + format).then( ($text) => {
        let lines = $text.trim().split('\n')
        let columnNum = -1
        let excelData = ""
        let columns = lines[0].trim().split(',')
        for(let i = 0; i < columns.length; i++) {
            if(columns[i].localeCompare(fieldName) == 0)
                columnNum = i
        }
        // cy.log(columnNum)
        for(let i = 1; i < lines.length; i++){
            let columns = lines[i].trim().split(',')
            if(columns[0].localeCompare(recordId) == 0) {
                // cy.log(columns[0])
                if(columns[columnNum].localeCompare(data) == 0) {
                    // cy.log(columns[columnNum])
                    excelData = columns[columnNum]
                    break
                    //cy.log(excelData)
                }
            }       
        }
        expect(excelData).to.equal(data)
    })
})

/**
 * @module export_data
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should have a {string} file that contains record ID {string} on {int} rows
 * @param {string} format the text format of the data export you are looking to receive
 * @param {string} recordId The Record ID of the record
 * @param {string} num the number of rows that contain the record ID
 * @description Interactions - Verifies the record ID is listed in the given number of rows
 */
Given("I should have a {string} file that contains record ID {string} listed on {int} rows", (format, recordId, num) => {

    cy.readFile("cypress/downloads" + '/test_file.' + format).then( ($text) => {
        let lines = $text.trim().split('\n')
        let recCount = 0
        for(let i = 1; i < lines.length; i++){
            let columns = lines[i].trim().split(',')
            if(columns[0].localeCompare(recordId) == 0) {
                recCount++
            }       
        }
        expect(recCount).to.equal(num)
    })
})

/**
 * @module export_data
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should have a {string} file that contains {int} repeating instances of the event {string} for record ID {string}
 * @param {string} format the text format of the data export you are looking to receive
 * @param {string} num the number of repeating instances of the event
 * @param {string} eventName the event name that repeats
 * @param {string} recordId The Record ID of the record
 * @description Interactions - Verifies the event repeats a given number of times in a record
 */
Given("I should have a {string} file that contains {int} repeating instances of the event {string} for record ID {string}", (format, num, eventName, recordId) => {

    cy.readFile("cypress/downloads" + '/test_file.' + format).then( ($text) => {
        let lines = $text.trim().split('\n')
        let recCount = 0
        for(let i = 1; i < lines.length; i++){
            let columns = lines[i].trim().split(',')
            if(columns[0].localeCompare(recordId) == 0 && columns[1].localeCompare(eventName) == 0) {
                recCount++
            }       
        }
        expect(recCount).to.equal(num)
    })  
})
