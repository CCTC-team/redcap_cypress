
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


defineParameterType({
    name: 'optionlabel',
    regexp: /(Restore deleted file\?|Permanently delete file\? \(admins only\))/
})

/**
 * @module FileRepository
 * @author Mintoo Xavier <min2xavier@gmail.com>
 * @example I click on the image {optionlabel} for the file {string} in File Repository
 * @param {optionlabel} option - option to click for the file in File Repository
 * @param {string} filename - name of the file for which the option is clicked
 * @description Clicks on a the given option for the file in File Repository
 */
Given('I click on the image {optionlabel} for the file {string} in File Repository', (option, filename) => {
    cy.get('td').contains(filename).parents('tr').find('td:nth-child(7)').find('a[title="' + option + '"]').click()
})