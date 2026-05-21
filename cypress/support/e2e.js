// Use the REDCap Cypress Test Framework configuration that is right for you!

// ==== START: BASIC CONFIGURATION OPTION ===== //
// If you decide not to use this option, comment out the line below before using a different configuration
//import 'rctf'
// ==== END: BASIC CONFIGURATION OPTION ===== //

// ==== START: ADDITIONAL CONTROL OPTION ===== //
// Uncomment this section if you want to create your own before() block for some reason
// import { rctf_initialize } from 'rctf'
//
// before(() => {
//     //Do whatever you want before and after the basic initialization below
//     rctf_initialize()
// })
// ==== END: ADDITIONAL CONTROL OPTION ===== //

// ==== START: FULL CONTROL OPTION ===== //
// Uncomment this section if you want to manage ALL the methods yourself
// import  {
//     load_core_commands,
//     preserve_cookies,
//     intercept_vanderbilt_requests,
//     set_user_info,
//     reset_database,
//     set_timezone,
//     load_support_files
// } from 'rctf'
//
// before(() => {
    //Do whatever you want you in addition to the basic RCTF framework methods below
    // load_core_commands()
    // preserve_cookies()
    // intercept_vanderbilt_requests()
    // set_user_info()
    // reset_database()
    // set_timezone()
    // load_support_files()
// })
// ==== END: FULL CONTROL OPTION ===== //


// ==== START: BEFORE EACH SCENARIO BLOCK ===== //
// Uncomment if you want to perform any steps before EVERY scenario
// beforeEach(() => {
//     //Do whatever you want you in addition to the basic RCTF framework here
// })
// ==== END: BEFORE EACH SCENARIO BLOCK ===== //

require('./commands')

// rctf reseeds redcap_config.edoc_path='' from install_data.sql on every
// feature-file bootstrap. Must use beforeEach (not before): our support file
// loads before step definitions, so our before() would register BEFORE rctf's
// and get wiped by rctf's reset. beforeEach always fires after all before()s.
beforeEach(() => {
    const mysql = Cypress.env('mysql')
    const edocPath = Cypress.env('file_repository')
    cy.exec(
        `${mysql.path} -u${mysql.db_user} -p${mysql.db_pass} ${mysql.db_name} -e "UPDATE redcap_config SET value='${edocPath}/' WHERE field_name='edoc_path';"`
    )
})

// REDCap detaches logic-suggest popups (#LSC_id_*) to <body> and positions them
// absolutely with `collision: "fit"`. With testIsolation:false, a stale popup
// from a prior scenario can land over the PDF Snapshot "Save to File Repository"
// checkbox in CI rendering, breaking cy.check() actionability. Hide any visible
// LSC popups before each check to keep the click target clear.
Cypress.Commands.overwrite('check', (originalFn, subject, ...args) => {
    Cypress.$('[id^="LSC_id_"]').hide()
    return originalFn(subject, ...args)
})