Feature: Data Collection and Storage

As a REDCap end user
I want to see that Data Collection and Storage is functioning as expected

Scenario: Project Setup 1 - Create Project 16_DataImport_v1115
  Given I am an "admin" user who logs into REDCap
  And I create a project named "16_DataImport_v1115" with project purpose Practice / Just for fun via CDISC XML import from fixture location "cdisc_files/core/07_DesignForms_v1115.xml"
  When I click on the link labeled "User Rights"
  And I enter "test_user" into the field identified by "[id=new_username]"
  And I click on the button labeled "Add with custom rights"
  And I click on the checkbox identified by "[name=design]"
  And I click on the checkbox identified by "[name=data_import_tool]"
  And I select the User Right named "Lock/Unlock Records" and choose " Locking / Unlocking with E-signature authority"
  And I close popup
  And I click on the checkbox identified by "[name=lock_record_multiform]"
  And I click on the button labeled "Add user"

Scenario: Project Setup - 2   
  When I click on the link labeled "Project Setup"
  When I click on the link labeled "Other Functionality"
  And I click on the button labeled "Erase all data"
  And I click on the button labeled "Erase all data" in the dialog box 
  And I close popup

Scenario: Project Setup - 3
  And I click on the link labeled "Project Setup"
  And I disable surveys
  And I disable longitudinal mode
  And I click on the element identified by "[id=enableRepeatingFormsEventsBtn]"
  And I click on the checkbox identified by "[name=repeat_form-41-data_types]"
  And I click on the button labeled "Save" in the dialog box
  And I should see that repeatable instruments are disabled
  And I click on the link labeled "Dictionary"
  #Given I upload a data dictionary located at "core/16_DataImportDD.csv" to project ID 14
  Given I upload a "csv" format file located at "dictionaries/core/16_DataImportDD.csv", by clicking "input[name=uploadedfile]" to select the file, and clicking "button[id=submit]" to upload the file
  Then the form should have a redcap_csrf_token
  And I click on the button labeled "Commit Changes"
  Then I should see "Changes Made Successfully!"
 
    
Scenario: 1 - Login as Test User
  Given I am a "standard" user who logs into REDCap
  Given I click on the link labeled "My Projects"
  And I click on the link labeled "16_DataImport_v1115"
  And I click on the link labeled "Data Import Tool"
  And Iaa download a file "rows" by clicking on the link labeled "Download your Data Import Template"
  Then I should have a file named "Template_rows.csv"

Scenario: 2 - Upload modified Template_rows file 
  Given I upload a "csv" format file located at "import_files/Import1_Template_Rows_Data.csv", by clicking "input[name=uploadedfile]" to select the file, and clicking "button[id=submit]" to upload the file
  Then the form should have a redcap_csrf_token
  And I click on the button labeled "Import Data" 
  Then I should see "Import Successful!"

Scenario: 3 - Upload modified Template_rows file 
  Given I select "DD/MM/YYYY or YYYY-MM-DD" from the dropdown identified by "select[name=date_format]"
  And I upload a "csv" format file located at "import_files/Import1_Template_Rows_Data_modified.csv", by clicking "input[name=uploadedfile]" to select the file, and clicking "button[id=submit]" to upload the file
  Then the form should have a redcap_csrf_token
  Then Values "100,200,300" should contain "(existing record)"
  # And I click on the button labeled "Import Data" 
  # Then I should see "Import Successful!"