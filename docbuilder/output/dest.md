<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<style>

    * {
        font-family: monospace, Courier;
    }

    table {
        border-collapse: collapse;
    }

    th, td {
        /* border: dashed grey 1px; */
        padding: 0.5rem 1rem;
    }

    .feature-body > *, .js-file-line {
        font-size: 12px;
    }

    .spec-script > * {
        font-size: 14px;        
        font-family: Arial, Helvetica, sans-serif;
    }

    .comments {
        font-size: 12px;
    }

    .comment {
        padding-bottom: 0.2rem;
    }

    .comment-edit {
        font-size: 11px;        
    }

    .timeline {
        font-size: 11px;
    }

    .index-good {
        font-size: 12px;
    }

    .index-errors {
        font-size: 11px;
    }

    .sub-header {
        font-size: 10px;
    }

</style>

## REDCap validation for v13.8.1

<div class="sub-header">
Generated on 29/04/2024 13:18:40
</div>

<div class="sub-header">
</div>

### Index

<div class="index-good">
<a id=index-redcap_cypress-12 href=#redcap_cypress-12>redcap_cypress-12 | 17. Data Comparison Tool / DDE Module</a>

<a id=index-redcap_cypress-15 href=#redcap_cypress-15>redcap_cypress-15 | 16. Data Import - Data Collection and Storage</a>
</div>


<div class="index-errors">
#### The following features cannot be retrieved (uid | title -> error)


</div>

<br/>

### Features


***

<div id="redcap_cypress-12">**Feature:** 17. Data Comparison Tool / DDE Module</div>

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**Id:** I_kwDOIaOBn86F-kpI                                                                                              **Uid:** redcap_cypress-12                                                     
                                                                                                                                                                                                        
**Author:** MintooXavier                                                                                                **Created:** 17/04/2024 09:05:46                                               
                                                                                                                                                                                                        
**Assignees:** MintooXavier                                                                                             **Resource path:** <a href=https://github.com//CCTC-team/redcap_cypress/issues/12 target=_blank>/CCTC-team/redcap_cypress/issues/12</a>
                                                                                                                                                                                                        
**Milestone:** |none|                                                                                                   **Labels:** Core feature || Gherkin || Automated                               
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**State:** OPEN                                                                                                         **State reason**: REOPENED                                                     
                                                                                                                                                                                                        
**Includes created edit:** true                                                                                         
                                                                                                                                                                                                        
**Closed:** false                                                                                                       **Closed on:** |none|                                                          
                                                                                                                                                                                                        
**Editor:** rmh54                                                                                                       **Updated on:** 29/04/2024 11:18:45                                            
                                                                                                                                                                                                        
**Locked:** false                                                                                                       **Participants:** MintooXavier || rmh54                                        
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

**Project item body:** \
<div class="feature-body">
<p dir="auto">Feature link:<br>
<a href="https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/cypress/features/core/data/import.feature">https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/cypress/features/core/data/import.feature</a></p>
<p dir="auto">Brief description:<br>
This feature is used to compared two records within a project.</p>
<p dir="auto">Pre review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox"> The script targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The user requirements are met</li>
</ul>
<p dir="auto">Post review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The script targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The script matches the source manual script</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The script appropriately tests the feature</li>
</ul>
</div>

***

**User specification:** \

<div class="spec-script">
|     # User Interface  
|     # 16.1 The system shall support the ability to download two versions of a data import template formatted as a CSV file, one to accommodate records in rows and one to accommodate records in columns. 
|     # 16.2 The system shall allow data to be uploaded with the csv template to create and modify records. 
|     # 16.3 The system shall highlight data modifications for user confirmation. 
|     # 16.4 The system shall import only valid formats for text fields with validation. 
|     # 16.5 The system shall import only valid choice codes for radio buttons, dropdowns, and checkboxes. 
|     # 16.6 The system shall ignore survey identifier and timestamp fields on all data import spreadsheets and allow all other data to be imported. 
|     # 16.7 The system shall require the event name in the csv file when importing data to a longitudinal study. 
|     # 16.8 The system shall require the repeating instrument and instance number in the csv file when importing data to a repeating event project. 
|     # 16.9 The system shall not allow data to be changed on locked data entry forms. 
|     # 16.10 The system shall not allow a new record to be imported if user does not have Create Records access. 
|     # 16.11 The system shall allow data to be changed only by a user who has “edit” access to the data entry form. 
|     # 16.12 The system shall provide the option to allow blank values to overwrite existing saved values. 
|     # 16.13 The system shall provide the ability to assign data instruments to a data access group with the Data Import Tool. 
|     
</div>

**Test script:** \

<div class="spec-script">
| Feature: Data Import - Data Collection and Storage
| 
| As a REDCap end user, I want to see that:
|     The below user requirements are met
| 
| Scenario: Project Setup 1 - Create Project 16_DataImport_v1115
|         Given I am an "admin" user who logs into REDCap
|         And I create a project named "16_DataImport_v1115" with project purpose Practice / Just for fun via CDISC XML import from fixture location "cdisc_files/core/07_DesignForms_v1115.xml"
|         When I click on the link labeled "User Rights"
|         And I enter "test_user" into the field identified by "[id=new_username]"
|         And I click on the button labeled "Add with custom rights"
|         And I check the checkbox identified by "[name=design]"
|         And I check the checkbox identified by "[name=data_import_tool]"
|         And I select the User Right named "Lock/Unlock Records" and choose "Locking / Unlocking"
|         And I check the checkbox identified by "[name=lock_record_multiform]"
|         And I click on the button labeled "Add user" in the dialog box
| 
| Scenario: Project Setup - 2   
|         When I click on the link labeled "Project Setup"
|         When I click on the link labeled "Other Functionality"
|         And I click on the button labeled "Erase all data"
|         And I click on the button labeled "Erase all data" in the dialog box 
|         And I close the popup
| 
| Scenario: Project Setup - 3
|         And I click on the link labeled "Project Setup"
|         And I disable longitudinal mode
|         And I open the dialog box for the Repeatable Instruments and Events module
|         And I uncheck the checkbox labeled "Data Types"
|         And I click on the button labeled "Save" in the dialog box
|         And I should see that repeatable instruments are disabled
|         And I click on the link labeled "Dictionary"
|         Given I upload the data dictionary located at "core\16_DataImportDD.csv"
|         Then I should see "Changes Made Successfully!"
| 
| Scenario: 1 - Login as Test User and download Templates for both Rows and Columns
|         Given I am a "standard" user who logs into REDCap
|         Given I click on the link labeled "My Projects"
|         And I click on the link labeled "16_DataImport_v1115"
|         And I click on the link labeled "Data Import Tool"
|         And I download a Data Import Template file "rows" by clicking on the link labeled "Download your Data Import Template"
|         Then I should have a file named "Template_rows.csv"
|         And I download a Data Import Template file "columns" by clicking on the link labeled "Download your Data Import Template"
|         Then I should have a file named "Template_columns.csv"
| 
| Scenario: 2 - Upload Template_rows file (data in rows) - Test import rows
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data" 
|         Then I should see "Import Successful!"
| 
| Scenario: 3 - Upload modified Template_rows file - Testing formatting date
|         Given I select "DD/MM/YYYY or YYYY-MM-DD" from the dropdown identified by "select[name=date_format]"
|         And I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_modified.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then Records "100,200,300" should contain text "(existing record)" in brackets
|         And I should see old value "(1943-02-25)" and new value "1943-01-28" for Record "200" and field named "bdate" in the Data Display Table
|         And I click on the button labeled "Import Data" 
|         Then I should see "Import Successful!"
| 
| Scenario: 4 - Test import Columns
|         Given I select "Columns" from the dropdown identified by "select[name=format]"
|         Given I select "MM/DD/YYYY or YYYY-MM-DD" from the dropdown identified by "select[name=date_format]"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Columns_Data.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data" 
|         Then I should see "Import Successful!"
|         Given I click on the link labeled "Record Status Dashboard"
|         Then I see a "circle_yellow" bubble for Record "4000" and Instrument named "Text Validation"
|         And I see a "circle_green" bubble for Record "4001" and Instrument named "Text Validation"
|         And I see a "circle_red" bubble for Record "4001" and Instrument named "Data Types"
| 
| Scenario: 5 - Testing improper data format
|         Given I click on the link labeled "Data Import Tool"
|         And I select "Columns" from the dropdown identified by "select[name=format]"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Columns_Data_modified.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then I should see error "Invalid date format." corresponding to the field named "bdate" for record "4002" in Error Display Table
|         And I should see error "The value is not a valid category for multiple_dropdown_auto" corresponding to the field named "multiple_dropdown_auto" for record "4002" in Error Display Table
|         And I should see error "The value you provided could not be validated because it does not follow the expected format." corresponding to the field named "integer" for record "4002" in Error Display Table
| 
| Scenario: 6 - Testing Repeating Events and Instruments 
|         When I click on the link labeled "Project Setup"
|         And I enable longitudinal mode
|         Then I should see that longitudinal mode is "enabled"
|         And I open the dialog box for the Repeatable Instruments and Events module
|         And I select "-- not repeating --" on the dropdown field labeled "Event 2 (Arm 1: Arm 1)"
|         And I click on the button labeled "Save" on the dialog box for the Repeatable Instruments and Events module
|         And I should see that repeatable instruments are disabled
|         Given I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_modified.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then I should see "ERROR: The following values for 'redcap_event_name' are not valid unique event names for this project,"
| 
| Scenario: 7 - Testing Repeatable Events and Instruments
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario7.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data" 
|         Then I should see "Import Successful!"
|         And I click on the link labeled "Project Setup"
|         And I open the dialog box for the Repeatable Instruments and Events module
|         And I select "Repeat Entire Event (repeat all instruments together)" on the dropdown field labeled "Event 1 (Arm 1: Arm 1)"
|         And I click on the button labeled "Save" on the dialog box for the Repeatable Instruments and Events module
|         And I close the popup
|         And I should see that repeatable instruments are modifiable
| 
| Scenario: 8 - Testing Repeatable Instance
|         Given I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario8.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data"
|         Then I should see "Import Successful!"
|         Given I click on the link labeled "Record Status Dashboard"
|         And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5000" and click on the bubble
|         Then I should see "(2)" instances in the instance table
|         Given the AJAX "POST" request at "index.php?*" tagged by "update" is being monitored
|         And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5001" and click on the bubble
|         And the AJAX request tagged by "update" has completed
|         Then I should see "(2)" instances in the instance table
|         Given the AJAX "POST" request at "index.php?*" tagged by "update" is being monitored
|         And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5002" and click on the bubble
|         And the AJAX request tagged by "update" has completed
|         Then I should see "(2)" instances in the instance table
| 
| Scenario: 9 - Testing Repeatable Instance
|         Given I click on the link labeled "Project Setup"
|         And I should see that repeatable instruments are modifiable
|         And I open the dialog box for the Repeatable Instruments and Events module
|         And I select "Repeat Instruments (repeat independently of each other)" on the dropdown field labeled "Event 1 (Arm 1: Arm 1)"
|         And I click on the button labeled "Save" on the dialog box for the Repeatable Instruments and Events module
|         And I close the popup
|         Given I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Repeat.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data"
|         Then I should see "Import Successful!"
|         Given I click on the link labeled "Record Status Dashboard"
|         Given the AJAX "POST" request at "index.php?*" tagged by "update1" is being monitored
|         And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5000" and click on the bubble
|         And the AJAX request tagged by "update1" has completed
|         Then I should see "(3)" instances in the instance table
|         Given the AJAX "POST" request at "index.php?*" tagged by "update2" is being monitored
|         And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5001" and click on the bubble
|         And the AJAX request tagged by "update2" has completed
|         Then I should see "(3)" instances in the instance table
|         Given the AJAX "POST" request at "index.php?*" tagged by "update3" is being monitored
|         And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5002" and click on the bubble
|         And the AJAX request tagged by "update3" has completed
|         Then I should see "(3)" instances in the instance table
| 
| Given I click on the link labeled "Project Setup"
|         And I open the dialog box for the Repeatable Instruments and Events module
|         And I select "-- not repeating --" on the dropdown field labeled "Event 1 (Arm 1: Arm 1)"
|         And I click on the button labeled "Save" on the dialog box for the Repeatable Instruments and Events module
|         And I close the popup
|         And I should see that repeatable instruments are disabled
| 
| Scenario: 10 - Testing Locking
|         Given I click on the link labeled "Record Status Dashboard"
|         And I click on the link labeled "5002"
|         And I click on the button labeled "Choose action for record"
|         And I select the option labeled " Lock entire record"
|         And I should see a dialog containing the following text: "Do you wish to LOCK record \"5002\"?"
|         And I click on the button labeled "Lock entire record" in the dialog box
|         Then I should see a dialog containing the following text: "Record \"5002\" is now LOCKED"
|         And I click on the button labeled "OK" in the dialog box
|         #Wait added due to element detached from the DOM error
|         And I wait for 3 seconds
|         Given I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario10.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then I should see "Errors were detected in the import file that prevented it from being loaded."
|         And I should see error "This record has been locked at the record level. No value within this record can be modified." corresponding to the field named "data_types_complete" for record "5002" in Error Display Table
|         Given I click on the link labeled "Record Status Dashboard"
|         And I click on the link labeled "5002"
|         And I click on the button labeled "Choose action for record"
|         And I select the option labeled "Unlock entire record"
|         And I should see a dialog containing the following text: "Do you wish to UNLOCK record \"5002\"?"
|         And I click on the button labeled "Unlock entire record" in the dialog box
|         Then I should see a dialog containing the following text: "Record \"5002\" is now UNLOCKED"
|         And I click on the button labeled "OK" in the dialog box
|         Then I logout
| 
| Scenario: 11 - Testing user privileges
|         Given I am an "admin" user who logs into REDCap
|         And I click on the link labeled " My Projects"
|         And I click on the link labeled "16_DataImport_v1115"
|         And I click on the link labeled "User Rights"
|         And I click on the link labeled "test_user"
|         And I click on the button labeled "Edit user privileges"
|         And I uncheck the User Right named "Create Records"
|         And I save changes within the context of User Rights
|         Then I logout
| 
| Given I am a "standard" user who logs into REDCap
|         Given I click on the link labeled "My Projects"
|         And I click on the link labeled "16_DataImport_v1115"
|         And I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario11.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then I should see "Your user privileges do NOT allow you to create new records."
| 
| Scenario: 12 - Testing formatting date and Blank Record
|         Given I click on the link labeled "Data Import Tool"
|         And I select "Yes, blank values in the file will overwrite existing values" from the dropdown identified by "select[name=overwriteBehavior]"
|         Then I should see a dialog containing the following text: "Are you sure you wish to REPLACE EXISTING SAVED VALUES WITH BLANK VALUES"
|         And I click on the button labeled "Yes, I understand" in the dialog box
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario12.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I should see new value "(1940-07-07)" for Record "5002" and field named "bdate" in the Data Display Table
|         And I should see new value "(Ringo)" for Record "5002" and field named "name" in the Data Display Table
|         And I should see new value "(drummer)" for Record "5002" and field named "instrument" in the Data Display Table
|         And I click on the button labeled "Import Data"
|         Then I should see "Import Successful!"
|         Given I click on the link labeled "Record Status Dashboard"
|         And I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "5002" and click on the bubble
|         # Additional step definition for the below three steps had to be written for an exact match
|         Then I should see that the field named exactly " Name " contains the value of ""
|         Then I should see that the field named exactly " Text " contains the value of ""
|         Then I should see that the field named exactly " Text Box " contains the value of ""
|         Then I logout
| 
| Scenario: 13 - Testing DAGs
|         Given I am an "admin" user who logs into REDCap
|         And I click on the link labeled " My Projects"
|         And I click on the link labeled "16_DataImport_v1115"
|         And I click on the link labeled "DAGs"
|         And the AJAX "GET" request at "index.php?route=DataAccessGroupsController:getDagSwitcherTable&tablerowsonly*" tagged by "dataAccess" is being monitored
|         And I enter "Beatles" into the field identified by "[id=new_group]"
|         And the AJAX request tagged by "dataAccess" has completed
|         And the AJAX "POST" request at "index.php?route=DataAccessGroupsController:ajax&pid*" tagged by "dataAccess1" is being monitored
|         And I click on the button labeled " Add Group"
|         And the AJAX request tagged by "dataAccess1" has completed
|         And the AJAX "GET" request at "index.php?route=DataAccessGroupsController:ajax&pid*" tagged by "dataAccessUser" is being monitored
|         And I select "test_user (Test User)" from the dropdown identified by "select[id=group_users]"
|         And the AJAX request tagged by "dataAccessUser" has completed
|         And I select "Beatles" from the dropdown identified by "select[id=groups]"
|         And the AJAX "POST" request at "index.php?route=DataAccessGroupsController:ajax&pid*" tagged by "dataAccessAddUser" is being monitored
|         And I click on the button labeled "Assign"
|         And the AJAX request tagged by "dataAccessAddUser" has completed
|         Then I logout
|         Given I am a "standard" user who logs into REDCap
|         Given I click on the link labeled "My Projects"
|         And I click on the link labeled "16_DataImport_v1115"
|         And I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_rows_dag.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then I should see "ERROR: Illegal use of 'redcap_data_access_group' field!"
|         Then I logout
| 
| Scenario: 14 - Testing DAGs
|         Given I am an "admin" user who logs into REDCap
|         And I click on the link labeled " My Projects"
|         And I click on the link labeled "16_DataImport_v1115"
|         And I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_rows_dag.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data"
|         Then I should see "Import Successful!"
| 
| Scenario: 15 - Testing Survey IdentifierAndTimestamp
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario15.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I should see old value "(George)" and new value "George Harrison" for Record "5001" and field named "name" in the Data Display Table
|         And I should see new value "04/05/2023" for Record "5000" and field named "redcap_survey_identifier" in the Data Display Table
|         And I click on the button labeled "Import Data"
|         Then I should see "Import Successful!"
| 
| Scenario: 16 - Testing import of time with missing minutes or seconds
|         And I click on the link labeled "Dictionary"
|         # 16_DataImportv1115_DD_Date_Tests.csv is not available to download, hence 16_DataImportv1005_DD_Date_Tests.csv is used
|         Given I upload the data dictionary located at "core\16_DataImportv1005_DD_Date_Tests.csv"
|         Then I should see "Changes Made Successfully!"
|         Given I click on the link labeled "Record Status Dashboard"
|         And I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "5002" and click on the bubble
|         And I should see "Record ID"
|         And I should see "Date value - first two digits of the year component are missing"
|         And I should see "Datetime value - first two digits of the year component are missing"
|         And I should see "Datetime value - missing a minutes component"
|         And I should see "Datetime_seconds value - missing a seconds component"
| 
| Scenario: 17 - Testing import of time with missing minutes or seconds
|         Given I click on the link labeled "Project Setup"
|         And I disable longitudinal mode
|         And I click on the link labeled "Data Import Tool"
|         And I upload a "csv" format file located at "/import_files/16_DataImportv1005_DateTests.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then I should see "Errors were detected in the import file that prevented it from being loaded."
|         Then I should see error "Invalid date format. (NOTE: Dates must be imported here only in M/D/Y format or Y-M-D format, regardless of the specific date format designated for this field.)" corresponding to the field named "date_missing_century" for record "5002" in Error Display Table
|         Then I should see error "Invalid date format. (NOTE: Dates must be imported here only in M/D/Y H:M[:S] format, regardless of the specific date format designated for this field.)" corresponding to the field named "datetime_missing_century" for record "5002" in Error Display Table
|         Then I should see error "Invalid date format. (NOTE: Dates must be imported here only in M/D/Y H:M[:S] format, regardless of the specific date format designated for this field.)" corresponding to the field named "datetime_missing_mins" for record "5002" in Error Display Table
|         Then I should see error "Invalid date format. (NOTE: Dates must be imported here only in M/D/Y H:M[:S] format, regardless of the specific date format designated for this field.)" corresponding to the field named "datetime_secs_missing_secs" for record "5002" in Error Display Table
| 
| Scenario: 18 - Testing import of time with missing minutes or seconds- Missing “seconds” and missing “minutes” are appended as “00”
|         Given I select "DD/MM/YYYY or YYYY-MM-DD" from the dropdown identified by "select[name=date_format]"
|         And I upload a "csv" format file located at "/import_files/16_DataImportv1005_DateTests.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data"
|         Then I should see "Import Successful!"
|         Given I click on the link labeled "Data Exports, Reports, and Stats"
|         And I click on the button labeled "View Report" for the report named "All data"
|         Then I should see corrected value "04-14-2021 13:00" for Record "5002" and field named "Datetime value - missing a minutes component" in the Report Table
|         And I should see corrected value "04-14-2021 13:55:00" for Record "5002" and field named "Datetime_seconds value - missing a seconds component" in the Report Table
| 
| Scenario: 19 - Logout
|         Then I logout
</div>

***

**Comments:** \

<div class="comments">
<div class="comment">
**Comment:**

*Author:* MintooXavier *Updated on:* 17/04/2024 09:21:40

*Comment body:* <p dir="auto">Rewrite SCenario 14 <a class="user-mention notranslate" data-hovercard-type="user" data-hovercard-url="/users/rmh54/hovercard" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="https://github.com/rmh54">@rmh54</a></p>

*Comment edits:* 

<div class="comment-edit">
*Created:* 17/04/2024 09:21:40 *Edited on:* 17/04/2024 09:21:40 *Edited by:* MintooXavier *Deleted on:* |none| *Deleted by:* |none|

*Diff:*

Rewrite SCenario 14 @rmh54 
</div>
<div class="comment-edit">
*Created:* 17/04/2024 09:21:40 *Edited on:* 17/04/2024 09:21:06 *Edited by:* MintooXavier *Deleted on:* |none| *Deleted by:* |none|

*Diff:*

Rewrite SCenario 14
</div>
</div>

<div class="comment">
**Comment:**

*Author:* MintooXavier *Updated on:* 17/04/2024 09:22:40

*Comment body:* <p dir="auto">Completed rewriting Scenario 14</p>


</div>
</div>

***

**Timeline events:** \

<div class="timeline">
<div class="timeline">
LABELLED | *User:* MintooXavier *Created on:* 17/04/2024 09:05:46 *Label name:* Automated *Label description:* 

ASSIGNED | *User:* MintooXavier *Created on:* 17/04/2024 09:20:28 *Assignee:* MintooXavier

ISSUE COMMENT | *User:* MintooXavier *Created on:* 17/04/2024 09:21:06 *Issue comment body:* <p dir="auto">Rewrite SCenario 14 <a class="user-mention notranslate" data-hovercard-type="user" data-hovercard-url="/users/rmh54/hovercard" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="https://github.com/rmh54">@rmh54</a></p>

MENTIONED | *User:* rmh54 *Created on:* 17/04/2024 09:21:41

SUBSCRIBED | *User:* rmh54 *Created on:* 17/04/2024 09:21:41

ISSUE COMMENT | *User:* MintooXavier *Created on:* 17/04/2024 09:22:40 *Issue comment body:* <p dir="auto">Completed rewriting Scenario 14</p>

MILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 09:39:30 *Milestone:* v.13.8.1

LABELLED | *User:* MintooXavier *Created on:* 17/04/2024 09:40:41 *Label name:* Core feature *Label description:* Part of the RSVC core feature set

CLOSED | *User:* MintooXavier *Created on:* 17/04/2024 10:16:23 *Closed reason:* COMPLETED

DEMILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 10:22:53  *Milestone:* v.13.8.1

MILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 10:22:53 *Milestone:* v.14

REOPENED | *User:* MintooXavier *Created on:* 17/04/2024 10:54:49 *Reason:* REOPENED

DEMILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 12:20:48  *Milestone:* v.14

MILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 12:20:48 *Milestone:* v.13.8.1

CLOSED | *User:* rmh54 *Created on:* 18/04/2024 09:50:06 *Closed reason:* COMPLETED

REOPENED | *User:* rmh54 *Created on:* 18/04/2024 09:50:18 *Reason:* REOPENED

DEMILESTONED | *User:* rmh54 *Created on:* 19/04/2024 08:41:29  *Milestone:* v.13.8.1

UNLABELLED | *User:* MintooXavier *Created on:* 22/04/2024 09:22:09 *Label name:* Core feature *Label description:* Part of the RSVC core feature set

LABELLED | *User:* MintooXavier *Created on:* 22/04/2024 09:24:36 *Label name:* Gherkin *Label description:* Uses a Gherkin syntax

LABELLED | *User:* MintooXavier *Created on:* 22/04/2024 09:24:42 *Label name:* Core feature *Label description:* Part of the RSVC core feature set
</div>
</div>


<br/>

--------------- feature ends ---------------

<br/>

***

<div id="redcap_cypress-15">**Feature:** 16. Data Import - Data Collection and Storage</div>

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**Id:** I_kwDOIaOBn86F-sWg                                                                                              **Uid:** redcap_cypress-15                                                     
                                                                                                                                                                                                        
**Author:** MintooXavier                                                                                                **Created:** 17/04/2024 09:19:15                                               
                                                                                                                                                                                                        
**Assignees:** CoreenDsouza                                                                                             **Resource path:** <a href=https://github.com//CCTC-team/redcap_cypress/issues/15 target=_blank>/CCTC-team/redcap_cypress/issues/15</a>
                                                                                                                                                                                                        
**Milestone:** |none|                                                                                                   **Labels:** Core feature || Gherkin || Automated                               
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**State:** OPEN                                                                                                         **State reason**: REOPENED                                                     
                                                                                                                                                                                                        
**Includes created edit:** true                                                                                         
                                                                                                                                                                                                        
**Closed:** false                                                                                                       **Closed on:** |none|                                                          
                                                                                                                                                                                                        
**Editor:** rmh54                                                                                                       **Updated on:** 29/04/2024 11:56:03                                            
                                                                                                                                                                                                        
**Locked:** false                                                                                                       **Participants:** MintooXavier || rmh54 || CoreenDsouza                        
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

**Project item body:** \
<div class="feature-body">
<p dir="auto">Feature link:<br>
<a href="https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/cypress/features/core/data/import.feature">https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/cypress/features/core/data/import.feature</a></p>
<p dir="auto">Brief description:<br>
This feature is used to test the data import feature in REDCap.</p>
<p dir="auto">Pre review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The script targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox"> The user requirements are met</li>
</ul>
<p dir="auto">Post review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox"> The script targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The script matches the source manual script</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The script appropriately tests the feature</li>
</ul>
</div>

***

**User specification:** \

<div class="spec-script">
|     # User Interface  
|     # 16.1 The system shall support the ability to download two versions of a data import template formatted as a CSV file, one to accommodate records in rows and one to accommodate records in columns. 
|     # 16.2 The system shall allow data to be uploaded with the csv template to create and modify records. 
|     # 16.3 The system shall highlight data modifications for user confirmation. 
|     # 16.4 The system shall import only valid formats for text fields with validation. 
|     # 16.5 The system shall import only valid choice codes for radio buttons, dropdowns, and checkboxes. 
|     # 16.6 The system shall ignore survey identifier and timestamp fields on all data import spreadsheets and allow all other data to be imported. 
|     # 16.7 The system shall require the event name in the csv file when importing data to a longitudinal study. 
|     # 16.8 The system shall require the repeating instrument and instance number in the csv file when importing data to a repeating event project. 
|     # 16.9 The system shall not allow data to be changed on locked data entry forms. 
|     # 16.10 The system shall not allow a new record to be imported if user does not have Create Records access. 
|     # 16.11 The system shall allow data to be changed only by a user who has “edit” access to the data entry form. 
|     # 16.12 The system shall provide the option to allow blank values to overwrite existing saved values. 
|     # 16.13 The system shall provide the ability to assign data instruments to a data access group with the Data Import Tool. 
|     
</div>

**Test script:** \

<div class="spec-script">
| Feature: Data Import - Data Collection and Storage
| 
| As a REDCap end user, I want to see that:
|     The below user requirements are met
| 
| Scenario: Project Setup 1 - Create Project 16_DataImport_v1115
|         Given I am an "admin" user who logs into REDCap
|         And I create a project named "16_DataImport_v1115" with project purpose Practice / Just for fun via CDISC XML import from fixture location "cdisc_files/core/07_DesignForms_v1115.xml"
|         When I click on the link labeled "User Rights"
|         And I enter "test_user" into the field identified by "[id=new_username]"
|         And I click on the button labeled "Add with custom rights"
|         And I check the checkbox identified by "[name=design]"
|         And I check the checkbox identified by "[name=data_import_tool]"
|         And I select the User Right named "Lock/Unlock Records" and choose "Locking / Unlocking"
|         And I check the checkbox identified by "[name=lock_record_multiform]"
|         And I click on the button labeled "Add user" in the dialog box
| 
| Scenario: Project Setup - 2   
|         When I click on the link labeled "Project Setup"
|         When I click on the link labeled "Other Functionality"
|         And I click on the button labeled "Erase all data"
|         And I click on the button labeled "Erase all data" in the dialog box 
|         And I close the popup
| 
| Scenario: Project Setup - 3
|         And I click on the link labeled "Project Setup"
|         And I disable longitudinal mode
|         And I open the dialog box for the Repeatable Instruments and Events module
|         And I uncheck the checkbox labeled "Data Types"
|         And I click on the button labeled "Save" in the dialog box
|         And I should see that repeatable instruments are disabled
|         And I click on the link labeled "Dictionary"
|         Given I upload the data dictionary located at "core\16_DataImportDD.csv"
|         Then I should see "Changes Made Successfully!"
| 
| Scenario: 1 - Login as Test User and download Templates for both Rows and Columns
|         Given I am a "standard" user who logs into REDCap
|         Given I click on the link labeled "My Projects"
|         And I click on the link labeled "16_DataImport_v1115"
|         And I click on the link labeled "Data Import Tool"
|         And I download a Data Import Template file "rows" by clicking on the link labeled "Download your Data Import Template"
|         Then I should have a file named "Template_rows.csv"
|         And I download a Data Import Template file "columns" by clicking on the link labeled "Download your Data Import Template"
|         Then I should have a file named "Template_columns.csv"
| 
| Scenario: 2 - Upload Template_rows file (data in rows) - Test import rows
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data" 
|         Then I should see "Import Successful!"
| 
| Scenario: 3 - Upload modified Template_rows file - Testing formatting date
|         Given I select "DD/MM/YYYY or YYYY-MM-DD" from the dropdown identified by "select[name=date_format]"
|         And I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_modified.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then Records "100,200,300" should contain text "(existing record)" in brackets
|         And I should see old value "(1943-02-25)" and new value "1943-01-28" for Record "200" and field named "bdate" in the Data Display Table
|         And I click on the button labeled "Import Data" 
|         Then I should see "Import Successful!"
| 
| Scenario: 4 - Test import Columns
|         Given I select "Columns" from the dropdown identified by "select[name=format]"
|         Given I select "MM/DD/YYYY or YYYY-MM-DD" from the dropdown identified by "select[name=date_format]"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Columns_Data.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data" 
|         Then I should see "Import Successful!"
|         Given I click on the link labeled "Record Status Dashboard"
|         Then I see a "circle_yellow" bubble for Record "4000" and Instrument named "Text Validation"
|         And I see a "circle_green" bubble for Record "4001" and Instrument named "Text Validation"
|         And I see a "circle_red" bubble for Record "4001" and Instrument named "Data Types"
| 
| Scenario: 5 - Testing improper data format
|         Given I click on the link labeled "Data Import Tool"
|         And I select "Columns" from the dropdown identified by "select[name=format]"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Columns_Data_modified.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then I should see error "Invalid date format." corresponding to the field named "bdate" for record "4002" in Error Display Table
|         And I should see error "The value is not a valid category for multiple_dropdown_auto" corresponding to the field named "multiple_dropdown_auto" for record "4002" in Error Display Table
|         And I should see error "The value you provided could not be validated because it does not follow the expected format." corresponding to the field named "integer" for record "4002" in Error Display Table
| 
| Scenario: 6 - Testing Repeating Events and Instruments 
|         When I click on the link labeled "Project Setup"
|         And I enable longitudinal mode
|         Then I should see that longitudinal mode is "enabled"
|         And I open the dialog box for the Repeatable Instruments and Events module
|         And I select "-- not repeating --" on the dropdown field labeled "Event 2 (Arm 1: Arm 1)"
|         And I click on the button labeled "Save" on the dialog box for the Repeatable Instruments and Events module
|         And I should see that repeatable instruments are disabled
|         Given I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_modified.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then I should see "ERROR: The following values for 'redcap_event_name' are not valid unique event names for this project,"
| 
| Scenario: 7 - Testing Repeatable Events and Instruments
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario7.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data" 
|         Then I should see "Import Successful!"
|         And I click on the link labeled "Project Setup"
|         And I open the dialog box for the Repeatable Instruments and Events module
|         And I select "Repeat Entire Event (repeat all instruments together)" on the dropdown field labeled "Event 1 (Arm 1: Arm 1)"
|         And I click on the button labeled "Save" on the dialog box for the Repeatable Instruments and Events module
|         And I close the popup
|         And I should see that repeatable instruments are modifiable
| 
| Scenario: 8 - Testing Repeatable Instance
|         Given I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario8.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data"
|         Then I should see "Import Successful!"
|         Given I click on the link labeled "Record Status Dashboard"
|         And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5000" and click on the bubble
|         Then I should see "(2)" instances in the instance table
|         Given the AJAX "POST" request at "index.php?*" tagged by "update" is being monitored
|         And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5001" and click on the bubble
|         And the AJAX request tagged by "update" has completed
|         Then I should see "(2)" instances in the instance table
|         Given the AJAX "POST" request at "index.php?*" tagged by "update" is being monitored
|         And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5002" and click on the bubble
|         And the AJAX request tagged by "update" has completed
|         Then I should see "(2)" instances in the instance table
| 
| Scenario: 9 - Testing Repeatable Instance
|         Given I click on the link labeled "Project Setup"
|         And I should see that repeatable instruments are modifiable
|         And I open the dialog box for the Repeatable Instruments and Events module
|         And I select "Repeat Instruments (repeat independently of each other)" on the dropdown field labeled "Event 1 (Arm 1: Arm 1)"
|         And I click on the button labeled "Save" on the dialog box for the Repeatable Instruments and Events module
|         And I close the popup
|         Given I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Repeat.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data"
|         Then I should see "Import Successful!"
|         Given I click on the link labeled "Record Status Dashboard"
|         Given the AJAX "POST" request at "index.php?*" tagged by "update1" is being monitored
|         And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5000" and click on the bubble
|         And the AJAX request tagged by "update1" has completed
|         Then I should see "(3)" instances in the instance table
|         Given the AJAX "POST" request at "index.php?*" tagged by "update2" is being monitored
|         And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5001" and click on the bubble
|         And the AJAX request tagged by "update2" has completed
|         Then I should see "(3)" instances in the instance table
|         Given the AJAX "POST" request at "index.php?*" tagged by "update3" is being monitored
|         And I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "5002" and click on the bubble
|         And the AJAX request tagged by "update3" has completed
|         Then I should see "(3)" instances in the instance table
| 
| Given I click on the link labeled "Project Setup"
|         And I open the dialog box for the Repeatable Instruments and Events module
|         And I select "-- not repeating --" on the dropdown field labeled "Event 1 (Arm 1: Arm 1)"
|         And I click on the button labeled "Save" on the dialog box for the Repeatable Instruments and Events module
|         And I close the popup
|         And I should see that repeatable instruments are disabled
| 
| Scenario: 10 - Testing Locking
|         Given I click on the link labeled "Record Status Dashboard"
|         And I click on the link labeled "5002"
|         And I click on the button labeled "Choose action for record"
|         And I select the option labeled " Lock entire record"
|         And I should see a dialog containing the following text: "Do you wish to LOCK record \"5002\"?"
|         And I click on the button labeled "Lock entire record" in the dialog box
|         Then I should see a dialog containing the following text: "Record \"5002\" is now LOCKED"
|         And I click on the button labeled "OK" in the dialog box
|         #Wait added due to element detached from the DOM error
|         And I wait for 3 seconds
|         Given I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario10.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then I should see "Errors were detected in the import file that prevented it from being loaded."
|         And I should see error "This record has been locked at the record level. No value within this record can be modified." corresponding to the field named "data_types_complete" for record "5002" in Error Display Table
|         Given I click on the link labeled "Record Status Dashboard"
|         And I click on the link labeled "5002"
|         And I click on the button labeled "Choose action for record"
|         And I select the option labeled "Unlock entire record"
|         And I should see a dialog containing the following text: "Do you wish to UNLOCK record \"5002\"?"
|         And I click on the button labeled "Unlock entire record" in the dialog box
|         Then I should see a dialog containing the following text: "Record \"5002\" is now UNLOCKED"
|         And I click on the button labeled "OK" in the dialog box
|         Then I logout
| 
| Scenario: 11 - Testing user privileges
|         Given I am an "admin" user who logs into REDCap
|         And I click on the link labeled " My Projects"
|         And I click on the link labeled "16_DataImport_v1115"
|         And I click on the link labeled "User Rights"
|         And I click on the link labeled "test_user"
|         And I click on the button labeled "Edit user privileges"
|         And I uncheck the User Right named "Create Records"
|         And I save changes within the context of User Rights
|         Then I logout
| 
| Given I am a "standard" user who logs into REDCap
|         Given I click on the link labeled "My Projects"
|         And I click on the link labeled "16_DataImport_v1115"
|         And I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario11.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then I should see "Your user privileges do NOT allow you to create new records."
| 
| Scenario: 12 - Testing formatting date and Blank Record
|         Given I click on the link labeled "Data Import Tool"
|         And I select "Yes, blank values in the file will overwrite existing values" from the dropdown identified by "select[name=overwriteBehavior]"
|         Then I should see a dialog containing the following text: "Are you sure you wish to REPLACE EXISTING SAVED VALUES WITH BLANK VALUES"
|         And I click on the button labeled "Yes, I understand" in the dialog box
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario12.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I should see new value "(1940-07-07)" for Record "5002" and field named "bdate" in the Data Display Table
|         And I should see new value "(Ringo)" for Record "5002" and field named "name" in the Data Display Table
|         And I should see new value "(drummer)" for Record "5002" and field named "instrument" in the Data Display Table
|         And I click on the button labeled "Import Data"
|         Then I should see "Import Successful!"
|         Given I click on the link labeled "Record Status Dashboard"
|         And I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "5002" and click on the bubble
|         # Additional step definition for the below three steps had to be written for an exact match
|         Then I should see that the field named exactly " Name " contains the value of ""
|         Then I should see that the field named exactly " Text " contains the value of ""
|         Then I should see that the field named exactly " Text Box " contains the value of ""
|         Then I logout
| 
| Scenario: 13 - Testing DAGs
|         Given I am an "admin" user who logs into REDCap
|         And I click on the link labeled " My Projects"
|         And I click on the link labeled "16_DataImport_v1115"
|         And I click on the link labeled "DAGs"
|         And the AJAX "GET" request at "index.php?route=DataAccessGroupsController:getDagSwitcherTable&tablerowsonly*" tagged by "dataAccess" is being monitored
|         And I enter "Beatles" into the field identified by "[id=new_group]"
|         And the AJAX request tagged by "dataAccess" has completed
|         And the AJAX "POST" request at "index.php?route=DataAccessGroupsController:ajax&pid*" tagged by "dataAccess1" is being monitored
|         And I click on the button labeled " Add Group"
|         And the AJAX request tagged by "dataAccess1" has completed
|         And the AJAX "GET" request at "index.php?route=DataAccessGroupsController:ajax&pid*" tagged by "dataAccessUser" is being monitored
|         And I select "test_user (Test User)" from the dropdown identified by "select[id=group_users]"
|         And the AJAX request tagged by "dataAccessUser" has completed
|         And I select "Beatles" from the dropdown identified by "select[id=groups]"
|         And the AJAX "POST" request at "index.php?route=DataAccessGroupsController:ajax&pid*" tagged by "dataAccessAddUser" is being monitored
|         And I click on the button labeled "Assign"
|         And the AJAX request tagged by "dataAccessAddUser" has completed
|         Then I logout
|         Given I am a "standard" user who logs into REDCap
|         Given I click on the link labeled "My Projects"
|         And I click on the link labeled "16_DataImport_v1115"
|         And I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_rows_dag.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then I should see "ERROR: Illegal use of 'redcap_data_access_group' field!"
|         Then I logout
| 
| Scenario: 14 - Testing DAGs
|         Given I am an "admin" user who logs into REDCap
|         And I click on the link labeled " My Projects"
|         And I click on the link labeled "16_DataImport_v1115"
|         And I click on the link labeled "Data Import Tool"
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_rows_dag.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data"
|         Then I should see "Import Successful!"
| 
| Scenario: 15 - Testing Survey IdentifierAndTimestamp
|         Given I upload a "csv" format file located at "/import_files/Import1_Template_Rows_Data_Scenario15.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I should see old value "(George)" and new value "George Harrison" for Record "5001" and field named "name" in the Data Display Table
|         And I should see new value "04/05/2023" for Record "5000" and field named "redcap_survey_identifier" in the Data Display Table
|         And I click on the button labeled "Import Data"
|         Then I should see "Import Successful!"
| 
| Scenario: 16 - Testing import of time with missing minutes or seconds
|         And I click on the link labeled "Dictionary"
|         # 16_DataImportv1115_DD_Date_Tests.csv is not available to download, hence 16_DataImportv1005_DD_Date_Tests.csv is used
|         Given I upload the data dictionary located at "core\16_DataImportv1005_DD_Date_Tests.csv"
|         Then I should see "Changes Made Successfully!"
|         Given I click on the link labeled "Record Status Dashboard"
|         And I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "5002" and click on the bubble
|         And I should see "Record ID"
|         And I should see "Date value - first two digits of the year component are missing"
|         And I should see "Datetime value - first two digits of the year component are missing"
|         And I should see "Datetime value - missing a minutes component"
|         And I should see "Datetime_seconds value - missing a seconds component"
| 
| Scenario: 17 - Testing import of time with missing minutes or seconds
|         Given I click on the link labeled "Project Setup"
|         And I disable longitudinal mode
|         And I click on the link labeled "Data Import Tool"
|         And I upload a "csv" format file located at "/import_files/16_DataImportv1005_DateTests.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         Then I should see "Errors were detected in the import file that prevented it from being loaded."
|         Then I should see error "Invalid date format. (NOTE: Dates must be imported here only in M/D/Y format or Y-M-D format, regardless of the specific date format designated for this field.)" corresponding to the field named "date_missing_century" for record "5002" in Error Display Table
|         Then I should see error "Invalid date format. (NOTE: Dates must be imported here only in M/D/Y H:M[:S] format, regardless of the specific date format designated for this field.)" corresponding to the field named "datetime_missing_century" for record "5002" in Error Display Table
|         Then I should see error "Invalid date format. (NOTE: Dates must be imported here only in M/D/Y H:M[:S] format, regardless of the specific date format designated for this field.)" corresponding to the field named "datetime_missing_mins" for record "5002" in Error Display Table
|         Then I should see error "Invalid date format. (NOTE: Dates must be imported here only in M/D/Y H:M[:S] format, regardless of the specific date format designated for this field.)" corresponding to the field named "datetime_secs_missing_secs" for record "5002" in Error Display Table
| 
| Scenario: 18 - Testing import of time with missing minutes or seconds- Missing “seconds” and missing “minutes” are appended as “00”
|         Given I select "DD/MM/YYYY or YYYY-MM-DD" from the dropdown identified by "select[name=date_format]"
|         And I upload a "csv" format file located at "/import_files/16_DataImportv1005_DateTests.csv", by clicking the button near "Select your CSV data file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|         And I click on the button labeled "Import Data"
|         Then I should see "Import Successful!"
|         Given I click on the link labeled "Data Exports, Reports, and Stats"
|         And I click on the button labeled "View Report" for the report named "All data"
|         Then I should see corrected value "04-14-2021 13:00" for Record "5002" and field named "Datetime value - missing a minutes component" in the Report Table
|         And I should see corrected value "04-14-2021 13:55:00" for Record "5002" and field named "Datetime_seconds value - missing a seconds component" in the Report Table
| 
| Scenario: 19 - Logout
|         Then I logout
</div>

***

**Comments:** \

<div class="comments">

</div>

***

**Timeline events:** \

<div class="timeline">
<div class="timeline">
LABELLED | *User:* MintooXavier *Created on:* 17/04/2024 09:19:15 *Label name:* Automated *Label description:* 

ASSIGNED | *User:* MintooXavier *Created on:* 17/04/2024 09:38:46 *Assignee:* CoreenDsouza

MILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 09:39:47 *Milestone:* v.13.8.1

LABELLED | *User:* MintooXavier *Created on:* 17/04/2024 09:40:25 *Label name:* Core feature *Label description:* Part of the RSVC core feature set

CLOSED | *User:* MintooXavier *Created on:* 17/04/2024 10:17:16 *Closed reason:* COMPLETED

DEMILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 10:23:13  *Milestone:* v.13.8.1

MILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 10:23:13 *Milestone:* v.14

REOPENED | *User:* MintooXavier *Created on:* 17/04/2024 10:55:59 *Reason:* REOPENED

DEMILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 12:20:50  *Milestone:* v.14

MILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 12:20:50 *Milestone:* v.13.8.1

DEMILESTONED | *User:* rmh54 *Created on:* 19/04/2024 08:40:06  *Milestone:* v.13.8.1

LABELLED | *User:* MintooXavier *Created on:* 22/04/2024 09:24:53 *Label name:* Gherkin *Label description:* Uses a Gherkin syntax
</div>
</div>


<br/>

--------------- feature ends ---------------

<br/>



</body>
</html>