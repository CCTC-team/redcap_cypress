
// The below Step Definition is from Rapid Validation project
/**
 * @module DataImport
 * @author Adam De Fouw <aldefouw@medicine.wisc.edu>
 * @example I click the button labeled {string} to select and upload the following file(s) to the File Repository:
 * @param {string} button_label - the name on the button we click
 * @param {dataTable} - options - the filenames from the /fixtures/ directory that we want to upload
 * @description Imports file(s) to the File Repository.
 */
Given("I click the button labeled {string} to select and upload the following file(s) to the File Repository:", (button_label, dataTable) => {
    cy.file_repo_upload(dataTable['rawTable'])
    cy.get(`button:contains(${JSON.stringify(button_label)}):visible`).invoke('attr', 'onclick', "")
})


// The below Step Definition is from Rapid Validation project, modified by Mintoo
/**
 * @module Reporting
 * @author Tintin Nguyen <tin-tin.nguyen@nih.gov>
 * @example I click on the download icon(s) to receive the file(s) for the {string} format in the dialog box
 * @param {string} format the text format of the data export you are looking to receive
 * @description Interactions - Checks the hyperlinks and download formats for the data export
 */
Given("I click on the download icon(s) to receive the file(s) for the {string} format in the dialog box", (format) => {

    // file types
    const downloads = {
        csv: ["csv"],
        sps: ["sps", "csv", "bat"],
        sas: ["sas", "csv", "bat"],
        r: ["r", "csv"],
        do: ["do", "csv"],
        odm: ["xml"]
    }

    const actual_format = format
    const toDownload = downloads[actual_format]

    for(let i = 0; i < toDownload.length; i++){

        let content_type;
        let hyperlink;
        let ext = toDownload[i]

        switch (ext) {
            case "bat":
                if (format === sps) {
                    hyperlink = 'a:has(img[src*="spss"]:visible):visible'
                } else {
                    hyperlink = 'a:has(img[src*="pathway"]:visible):visible'
                }
                content_type = "application/bat"
                break;
            case "csv":
                content_type = "application/csv"
                hyperlink = 'a:has(img[src*="csv"]:visible):visible'
                break;
            default:
                content_type = "application/octet-stream"
                hyperlink = 'a:has(img[src*="Resources/images/download"]):visible'
        }

        if(ext === ".bat"){

            cy.get(hyperlink).then((anchor) => {
                const url = anchor.prop('href');

                cy.request(url).then(($response) => {

                    expect($response.status).to.equal(200)
                    expect($response.headers['content-disposition']).to.contain('.' + ext)
                    expect($response.headers['content-type']).to.equal(content_type)

                    cy.writeFile("cypress/downloads" + '/test_file.' + ext, $response.body)

                })
            })

        } else {
            cy.get(hyperlink).eq(i).then((anchor) => {
                const url = anchor.prop('href');

                cy.request(url).then(($response) => {

                    expect($response.status).to.equal(200)
                    expect($response.headers['content-disposition']).to.contain('.' + ext)
                    expect($response.headers['content-type']).to.equal(content_type)

                    cy.writeFile("cypress/downloads" + '/test_file.' + ext, $response.body)

                })
            })
        }
    }
})


/**
 * @module FileRepository
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the {optionlabel} image for {string} in File Repository
 * @param {optionlabel} option - option to click for the file in File Repository
 * @param {string} filename - name of the file for which the option is clicked
 * @description Clicks on a the given option for the file in File Repository
 */
Given('I click on the {optionlabel} image for {string} in File Repository', (option, filename) => {
    cy.get('td').contains(filename).parents('tr').find('td:nth-child(7)').find('a[title*="' + option + '"]').click()
})


/**
 * @module FileRepository
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I upload a {string} format file located at {string}, by clicking the button near {string} in User Rights to browse for the file, and clicking the button labeled {string} to upload the file
 * @param {string} format - the format of the file that is being uploaded (e.g. csv)
 * @param {string} file_location - the location of the file being uploaded (e.g. import_files/core/filename.csv)
 * @param {string} uplaod_label - text near the upload label
 * @param {string} button_label - text on the button you click to upload
 * @description Imports well-formed REDCap data import file (of specific type) to a specific project given a Project ID.
 */
Given("I upload a {string} format file located at {string}, by clicking the button near {string} in User Rights to browse for the file, and clicking the button labeled {string} to upload the file", (format, file_location, upload_text, button_label) => {
    cy.upload_file(file_location, format, '', button_label, upload_text).then(() => {
        cy.get(':button:visible').contains(new RegExp("^" + button_label + "$", "g")).click()
    })
})

/**
 * @module record_locking_e_sig
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I should see the instrument labeled {string} for the event {string} with icon {icon}
 * @param {string} text - Instrument name
 * @param {string} event - Event name
 * @param {string} icon - icon displayed
 * @description Visually verify the instrument has icon dispalyed
 *
 */
Given("I should see the instrument labeled {string} for the event {string} with icon {icon}", (text, event, icon) => {
    cy.get('table[id="event_grid_table"]').children('thead').find('th').contains(event).invoke('index').then((index) => {
        cy.get('table[id="event_grid_table"]').children('tbody').find('td').contains(text).parents('tr').find('td').eq(index+1).within(() =>
            cy.get('img[src*=' + icon + ']')
        )
    })
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


/**
 * @module FileRepository
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I download the data dictionary and save the file as {string}
 * @param {string} name - name to save the data dictionary file
 * @description Utility - Download and save the data dictionary file
 */
Given("I download a csv file by clicking on the link labeled {string}", (label) => {
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

    cy.wait("@download", 2000).then(() => {
        // let cd = xhr.response.headers['content-disposition']
        // let filename = cd.split('filename="')[1]
        // filename = filename.substring(0, filename.length - 1);
       
       
        cy.writeFile('cypress/downloads/' + label, 'utf8')
       
    })
})

