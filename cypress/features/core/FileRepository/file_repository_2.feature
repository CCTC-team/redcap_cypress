Feature: File Repository

  As a REDCap end user, I want to see that:
  The below user requirements are met
  #-------------------------------------------------------------------------------------
  # C.3.26.300 User Interface: The system shall support the storage, organization, and sharing of project files for permanent folders: (Data Export | e-Consent PDFs | Recycle Bin | Custom Create folder / Sub-folder)
  #-------------------------------------------------------------------------------------

  Scenario: C.3.26.300.100 Automatic uploading of data export logs into the data export folder

    #SETUP 
    Given I am an "admin" user who logs into REDCap
    And I create a project named "C.3.26.300.100" with project purpose Operational Support via CDISC XML import from fixture location "cdisc_files/core/Project_1.xml"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "C.3.26.300.100"  

    #SETUP Export data automatically placed in file repo
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Export Data" for the report named "All data (all records and fields)" 
    And I click on the radio labeled "CSV / Microsoft Excel (raw data)" in the dialog box
    And I click on the button labeled "Export Data" in the dialog box
    Then I should see a dialog containing the following text: "Data export was successful!"

    Given I click on the download icons to receive the files for the "csv" format in the dialog box
    Then I should have a "csv" file that contains the headings below
      | record_id | redcap_event_name | redcap_repeat_instrument | redcap_repeat_instance | redcap_data_access_group | redcap_survey_identifier | name | email | text_validation_complete | ptname | text2 | textbox | notesbox | calculated_field | multiple_dropdown_auto | multiple_dropdown_manual | multiple_radio_auto | radio_button_manual | checkbox___1 | checkbox___2 | checkbox___3 | signature | file_upload | required | identifier | identifier_2 | edit_field | date_ymd | time_hhmmss | datetime_ymd_hmss | data_types_complete | survey_timestamp | name_survey | email_survey | survey_complete | consent_timestamp | name_consent | email_consent | dob | signature_consent | consent_complete |
    
    And I click on the button labeled "Close" in the dialog box

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Export data automatically placed in file repo
    When I click on the link labeled "File Repository"
    And I wait for 2 seconds
    Then I should see "Data Export Files"
    And I click on the link labeled "Data Export Files"

    # Then I verify I see the csv file 
    And I should see "Data export file created by test_admin on"

  Scenario: C.3.26.300.200 Automatic uploading of e-Consent Framework PDFs
    # REDUNDANT

  Scenario: C.3.26.300.300 Recycle bin function - permanently force delete 

    #SETUP 
    Given I am an "admin" user who logs into REDCap
    And I create a project named "C.3.26.300.300" with project purpose Operational Support via CDISC XML import from fixture location "cdisc_files/core/Project_1.xml"
    And I click on the link labeled "My Projects"
    And I click on the link labeled "C.3.26.300.300"  

    
    ##ACTION Upload to top tier file repo 
    When I click on the link labeled "File Repository"    
    And I wait for 2 seconds
    And I click the button labeled "Select files to upload" to select and upload the following file to the File Repository:
      |import_files/testusers_bulkupload.csv|

    ##VERIFY_FiRe file uploaded in folder
    Then I should see "100% uploaded"
    Then I should see "testusers_bulkupload.csv"
    And I wait for 2 seconds

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Delete file
    When I check the checkbox labeled "testusers_bulkupload.csv"
    And I click on the button labeled "Delete"
    Then I should see a dialog containing the following text: "Are you sure you wish to delete all the files currently selected on the page? Total files to be deleted: 1."
    And I click on the button labeled "Delete" in the dialog box

    ##VERIFY file deleted in folder
    Then I should see a dialog containing the following text: "SUCCESS!"
    And I close the popup
    When I click on the link labeled "File Repository"    
    And I wait for 2 seconds
    Then I should NOT see "testusers_bulkupload.csv"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Cancel Restore deleted file
    When I click on the link labeled "Recycle Bin"
    And I wait for 5 seconds
    Then I should see "testusers_bulkupload.csv"

    When I click on the Restore deleted file image for "testusers_bulkupload.csv" in File Repository
    Then I should see a dialog containing the following text: "File: testusers_bulkupload.csv"
    When I click on the button labeled "Cancel" in the dialog box
    ##VERIFY file still in recycle folder
    Then I should see "testusers_bulkupload.csv"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Restore deleted file
    When I click on the Restore deleted file image for "testusers_bulkupload.csv" in File Repository
    Then I should see a dialog containing the following text: "File: testusers_bulkupload.csv"
    When I click on the button labeled "Restore" in the dialog box
    Then I should see a dialog containing the following text: "SUCCESS!"
    And I close the popup
    ##VERIFY file in File Repository
    When I click on the link labeled "File Repository"
    And I wait for 2 seconds
    Then I should see "testusers_bulkupload.csv"
    ##VERIFY file not in recycle folder
    When I click on the link labeled "Recycle Bin"
    And I wait for 5 seconds
    Then I should NOT see "testusers_bulkupload.csv"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Delete file
    When I click on the link labeled "File Repository"
    And I wait for 2 seconds
    When I check the checkbox labeled "testusers_bulkupload.csv"
    And I click on the button labeled "Delete"
    Then I should see a dialog containing the following text: "Are you sure you wish to delete all the files currently selected on the page? Total files to be deleted: 1."
    And I click on the button labeled "Delete" in the dialog box
    ##VERIFY file deleted in folder
    Then I should see a dialog containing the following text: "SUCCESS!"
    And I close the popup
    When I click on the link labeled "File Repository"    
    And I wait for 2 seconds
    Then I should NOT see "testusers_bulkupload.csv"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Cancel Permanently deleted file
    When I click on the link labeled "Recycle Bin"
    Then I should see "testusers_bulkupload.csv"
    When I click on the Permanently delete file image for "testusers_bulkupload.csv" in File Repository
    Then I should see a dialog containing the following text: "File: testusers_bulkupload.csv"
    When I click on the button labeled "Cancel" in the dialog box
    ##VERIFY file still in recycle folder
    Then I should see "testusers_bulkupload.csv"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Permanently deleted file
    When I click on the Permanently delete file image for "testusers_bulkupload.csv" in File Repository
    Then I should see a dialog containing the following text: "File: testusers_bulkupload.csv"
    When I click on the button labeled "Delete" in the dialog box
    ##VERIFY file deleted in recycle folder
    Then I should see a dialog containing the following text: "File was successfully deleted!"
    And I click on the button labeled "OK"
    When I click on the link labeled "File Repository"
    And I wait for 2 seconds
    Then I should NOT see "testusers_bulkupload.csv"
    ##VERIFY file deleted in recycle folder
    When I click on the link labeled "Recycle Bin"
    And I wait for 5 seconds
    Then I should NOT see "testusers_bulkupload.csv"


  Scenario: C.3.26.300.400 Custom folder / sub-folder
    # REDUNDANT with C.3.26.200
