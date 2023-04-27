Feature: Data Collection and Storage

As a REDCap end user
I want to see that Data Collection and Storage is functioning as expected

Scenario: Project Setup 1 - Create Project 16_DataImport_v1115
    Given I am an "admin" user who logs into REDCap
    And I create a project named "16_DataImport_v1115" with project purpose Practice / Just for fun via CDISC XML import from fixture location "cdisc_files/core/07_DesignForms_v1115.xml"
    When I click on the link labeled "User Rights"
    And I enter "test_user" into the field identified by "[id=new_username]"
    And I click on the button labeled "Add with custom rights"
    And I check the checkbox identified by "[name=design]"
    And I check the checkbox identified by "[name=data_import_tool]"
    And I select the User Right named "Lock/Unlock Records" and choose "Locking / Unlocking"
    #And I close the popup
    And I check the checkbox identified by "[name=lock_record_multiform]"
    And I click on the button labeled "Save Changes" in the dialog box

Scenario: Project Setup - 2   
    When I click on the link labeled "Project Setup"
    When I click on the link labeled "Other Functionality"
    And I click on the button labeled "Erase all data"
    And I click on the button labeled "Erase all data" in the dialog box 
    And I close the popup

Scenario: Project Setup - 3
    And I click on the link labeled "Project Setup"
    #And I disable surveys
    And I disable longitudinal mode
    And I open the dialog box for the Repeatable Instruments and Events module
    And I uncheck the checkbox labeled "Data Types"
    And I click on the button labeled "Save" in the dialog box
    And I should see that repeatable instruments are disabled
    And I click on the link labeled "Dictionary"
    Given I upload the data dictionary located at "core\16_DataImportDD.csv"
    #Given I upload a "csv" format file located at "dictionaries/core/16_DataImportDD.csv", by clicking the button near "input[name=uploadedfile]" to browse for the file, and clicking "button[id=submit]" to upload the file
    #Given I upload a "csv" format file located at "dictionaries/core/16_DataImportDD.csv", by clicking the button near "No file chosen" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    #Then the form should have a redcap_csrf_token
    #And I click on the button labeled "Commit Changes"
    Then I should see "Changes Made Successfully!"
 
    
Scenario: 1 - Login as Test User
    Given I am a "standard" user who logs into REDCap
    Given I click on the link labeled "My Projects"
    And I click on the link labeled "16_DataImport_v1115"
    And I click on the link labeled "Data Import Tool"
    And Iaa download a file "rows" by clicking on the link labeled "Download your Data Import Template"
    Then I should have a file named "Template_rows.csv"
    And Iaa download a file "columns" by clicking on the link labeled "Download your Data Import Template"
    Then I should have a file named "Template_columns.csv"

Scenario: 2 - Upload Template_rows file (data in rows)
    #Given I upload a "csv" format file located at "import_files/Import1_Template_Rows_Data.csv", by clicking "input[name=uploadedfile]" to select the file, and clicking "button[id=submit]" to upload the file
    Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data.csv", by clicking the button near "Upload your CSV file:" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    And I click on the button labeled "Import Data" 
    Then I should see "Import Successful!"
  

Scenario: 3 - Upload modified Template_rows file 
    Given I select "DD/MM/YYYY or YYYY-MM-DD" from the dropdown identified by "select[name=date_format]"
    #And I upload a "csv" format file located at "import_files/Import1_Template_Rows_Data_modified.csv", by clicking "input[name=uploadedfile]" to select the file, and clicking "button[id=submit]" to upload the file
    And I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_modified.csv", by clicking the button near "Upload your CSV file:" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    #Then the form should have a redcap_csrf_token
    Then Values "100,200,300" should contain "(existing record)"
    #And Iaaxx click on a bubble with instrument named "200" and event named "bdate" and "1943-01-28" and "(1943-02-25)"
    And I should see old value "(1943-02-25)" and new value "1943-01-28" for Record "200" and field named "bdate"
    And I click on the button labeled "Import Data" 
    Then I should see "Import Successful!"
  
Scenario: 4 - 
    Given I select "Columns" from the dropdown identified by "select[name=format]"
    Given I select "MM/DD/YYYY or YYYY-MM-DD" from the dropdown identified by "select[name=date_format]"
    Given I upload a "csv" format file located at "/import_files/Import1_Template_Columns_Data.csv", by clicking the button near "Upload your CSV file:" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    And I click on the button labeled "Import Data" 
    Then I should see "Import Successful!"
    Given I click on the link labeled "Record Status Dashboard"
    Then I see a "circle_yellow" bubble for Record "4000" and Instrument named "Text Validation"
    And I see a "circle_green" bubble for Record "4001" and Instrument named "Text Validation"
    And I see a "circle_red" bubble for Record "4001" and Instrument named "Data Types"

Scenario: 5 -
    Given I click on the link labeled "Data Import Tool"
    And I select "Columns" from the dropdown identified by "select[name=format]"
    Given I upload a "csv" format file located at "/import_files/Import1_Template_Columns_Data_modified.csv", by clicking the button near "Upload your CSV file:" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    Then I should see error "Invalid date format." corresponding to the field named "bdate" for record "4002"
    And I should see error "The value is not a valid category for multiple_dropdown_auto" corresponding to the field named "multiple_dropdown_auto" for record "4002"
    And I should see error "The value you provided could not be validated because it does not follow the expected format." corresponding to the field named "integer" for record "4002"

Scenario: 6 -
    When I click on the link labeled "Project Setup"
    And I enable longitudinal mode
    Then I should see that longitudinal mode is "enabled"
    And I open the dialog box for the Repeatable Instruments and Events module
    And I select "-- not repeating --" on the dropdown field labeled "Event 2 (Arm 1: Arm 1)"
    And I click on the button labeled "Save" on the dialog box for the Repeatable Instruments and Events module
    And I should see that repeatable instruments are disabled
    Given I click on the link labeled "Data Import Tool"
    Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_modified.csv", by clicking the button near "Upload your CSV file:" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    Then I should see "ERROR: The following values for 'redcap_event_name' are not valid unique event names for this project,"

Scenario: 7 -
    Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario6.csv", by clicking the button near "Upload your CSV file:" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    And I click on the button labeled "Import Data" 
    #I should see a dialog containing the following text:
    Then I should see "Import Successful!"
    And I click on the link labeled "Project Setup"
    And I open the dialog box for the Repeatable Instruments and Events module
    And I select "Repeat Entire Event (repeat all instruments together)" on the dropdown field labeled "Event 1 (Arm 1: Arm 1)"
    And I click on the button labeled "Save" on the dialog box for the Repeatable Instruments and Events module
    And I click on the button labeled "Close" in the dialog box
    And I should see that repeatable instruments are modifiable

Scenario: 8
    Given I click on the link labeled "Data Import Tool"
    Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario8.csv", by clicking the button near "Upload your CSV file:" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    And I click on the button labeled "Import Data"
    Then I should see "Import Successful!"
    Given I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5000" and click on the bubble
    Then I should see "(2)" instances in the instance table
    
    Given the AJAX "POST" request at "index.php?*" tagged by "update" is being monitored
    And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5001" and click on the bubble
    And the AJAX request tagged by "update" has completed
    Then I should see "(2)" instances in the instance table
    Given the AJAX "POST" request at "index.php?*" tagged by "update" is being monitored
    And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5002" and click on the bubble
    And the AJAX request tagged by "update" has completed
    Then I should see "(2)" instances in the instance table

Scenario: 9
    Given I click on the link labeled "Project Setup"
    And I should see that repeatable instruments are modifiable
    And I open the dialog box for the Repeatable Instruments and Events module
    And I select "Repeat Instruments (repeat independently of each other)" on the dropdown field labeled "Event 1 (Arm 1: Arm 1)"
    And I click on the button labeled "Save" on the dialog box for the Repeatable Instruments and Events module
    