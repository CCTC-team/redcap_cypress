Feature: Export Data

  As a REDCap end user
  I want to see that Export Data is functioning as expected

  Scenario: Project Setup 1 - Create Project 21_ExportDataExtraction_v1115
    Given I am a "standard" user who logs into REDCap
    And I create a project named "21_ExportDataExtraction_v1115" with project purpose Practice / Just for fun via CDISC XML import from fixture location "cdisc_files/core/07_DesignForms_v1115.xml"
    
  Scenario: Project setup 2 - Upload Data Dictionary
    # Remove PID
    Given I upload a data dictionary located at "core/21_ExportDataExtractionDD_v1115.csv" to project ID 14

  Scenario: Project setup 3 
    Given I click on the link labeled "Project Setup"
    And I click on the link labeled "Other Functionality"
    And I click on the button labeled "Erase all data"
    And I click on the button labeled "Erase all data" in the dialog box
    Then I should see "All data has now been deleted from the project!"
    When I close popup
    And I click on the link labeled "Project Setup"
    # Remove PID
    And I enable surveys for Project ID 14
    And I enable longitudinal mode
    # And the AJAX "GET" request at "Design/online_designer.php*" tagged by "render" is being monitored
    And I click on the link labeled "Designer"
    And I click on the link labeled "Designer"
    And I enable the Data Collection Instrument labeled "Survey" as survey
    Then I should see "Your survey settings were successfully saved!"
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Define My Events"
    And I click on the link labeled "Arm 2:"
    And I click on the link labeled "Delete Arm 2"
    And I click on the link labeled "Arm 1:"
    # Then I should see "DELETE ARM 2? Deleting Arm 2 will also delete ALL events associated with Arm 2. Are you sure you wish to do this?"
    # And I click on the button labeled "Ok" in the dialog box
    And I delete the Event Name of "Event Three"
    Then I click on the link labeled "Designate Instruments for My Events"
    And I enable the Data Collection Instrument named "Export" for the Event named "Event 1"
    And I enable the Data Collection Instrument named "Survey" for the Event named "Event 1"
    And I enable the Data Collection Instrument named "Survey" for the Event named "Event 2"
    Then I click on the link labeled "Project Setup"
    And I should see that repeatable instruments are modifiable
    And I open the dialog box for the Repeatable Instruments and Events module
    And I select "Repeat Entire Event (repeat all instruments together)" on the dropdown table field labeled "Event 1"
    And I select "Repeat Instruments (repeat independently of each other)" on the dropdown table field labeled "Event 2"
    And I check the checkbox labeled "Survey"
    And I click on the button labeled "Save"
    And I should see that auto-numbering is "enabled"
    And I should see that the scheduling module is "disabled"
    And I should see that the randomization module is "disabled"
    And I should see that the designate an email field for communications setting is "disabled"

  Scenario: Project Setup 4 - Import Data File
    Given I upload import data from the data import file located at "core/21_ExportDataExtractionIMP_v1115.csv" to project ID 14
    And I click on the link labeled "My Projects"
    And I click on the link labeled "21_ExportDataExtraction_v1115"
    And I click on the link labeled "Record Status Dashboard"
    # # Getting the Event wrong
    # And I locate the bubble for the "Survey" instrument on event "Event 1" for record ID "1" and click the repeating instrument bubble for the first instance
    # And I click on the button labeled "Survey options"
    # # And I click on the survey option label containing "Open survey" label and want to track the response with a tag of "Open_Survey"
    # # And I click on the button labeled "Submit"
    # # And I click on the button labeled "Close survey"
    # And I open the survey from Survey options and submit it
    # And I locate the bubble for the "Survey" instrument on event "Event 1" for record ID "2" and click the repeating instrument bubble for the first instance
    # And I wait for 0.5 seconds
    # And I click on the button labeled "Survey options"
    # And I open the survey from Survey options and submit it
        
  Scenario: 1 - Login
    Given I am a "standard" user who logs into REDCap
    Then I should see "My Projects"

  Scenario: 2 - Open project
    Given I click on the link labeled "My Projects"
    And I click on the link labeled "21_ExportDataExtraction_v1115"
    Then I should see "21_ExportDataExtraction_v1115"
    And I should see "Record Status Dashboard"
    # Manual script - Verify the project complies with all project setup steps in the Test Requirements section of this script.
    # DO I need to check this

  Scenario: 3 - Mark First name and Last name as identifier
    Then I click on the link labeled "Project Setup"
    And I click on the button labeled "Online Designer"
    And I click on the table cell containing a link labeled "Export"
    And I edit the Data Collection Instrument field labeled "Last name"
    And I click on the element identified by "input[id=field_phi1]"
    Then I click on the button labeled "Save"
    And I edit the Data Collection Instrument field labeled "First name"
    And I click on the element identified by "input[id=field_phi1]"
    Then I click on the button labeled "Save"
    
  Scenario: 4 - Move to production
    Given I am an "admin" user who logs into REDCap
    And  I click on the link labeled "Control Center"
    And  I click on the link labeled "Browse Projects"
    And I enter "21_ExportDataExtraction_v1115" into the field identified by "input[id=project_search]"
    And I click on the button labeled "Search project title"
    Then I click on the link labeled "21_ExportDataExtraction_v1115"
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far." in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box
    Then I should see "Success! The project is now in production."

  Scenario: 5a - Verify export option - CSV / Microsoft Excel (raw data)
    Given I am a "standard" user who logs into REDCap
    And I click on the link labeled "My Projects"
    And I click on the link labeled "21_ExportDataExtraction_v1115"
    When I click on the link labeled "Data Exports, Reports, and Stats"
    Then I should see "View Report"
    And I should see "Export Data"
    And I should see "Stats & Charts"
    And I click on the button labeled "Export Data"
    Then I should see "Exporting \"All data (all records and fields)\""
    And I click on the radio labeled "CSV / Microsoft Excel (raw data)" in the dialog box
    Then I should see "Remove all tagged Identifier fields"
    And I should see "Hash the Record ID field"
    And I should see "Remove unvalidated Text fields"
    And I should see "Remove Notes/Essay box fields"
    And I should see "Remove all date and datetime fields"
    And I should see "Shift all dates by value between 0 and 364 days"
    And I should see "Also shift all survey completion timestamps by value between 0 and 364 days"
    Then I click on the button labeled "Cancel" in the dialog box
    Then I should see "My Reports & Exports"

  # Scenario: 5b - Verify export option - CSV / Microsoft Excel (labels)
  #   Given I click on the button labeled "Export Data"
  #   Then I should see "Exporting \"All data (all records and fields)\""
  #   And I click on the radio labeled "CSV / Microsoft Excel (labels)" in the dialog box
  #   Then I should see "Remove all tagged Identifier fields"
  #   And I should see "Hash the Record ID field"
  #   And I should see "Remove unvalidated Text fields"
  #   And I should see "Remove Notes/Essay box fields"
  #   And I should see "Remove all date and datetime fields"
  #   And I should see "Shift all dates by value between 0 and 364 days"
  #   And I should see "Also shift all survey completion timestamps by value between 0 and 364 days"
  #   Then I click on the button labeled "Cancel" in the dialog box
  #   Then I should see "My Reports & Exports"

  # Scenario: 5c - Verify export option - SPSS Statistical Software
  #   Given I click on the button labeled "Export Data"
  #   Then I should see "Exporting \"All data (all records and fields)\""
  #   And I click on the radio labeled "SPSS Statistical Software" in the dialog box
  #   Then I should see "Remove all tagged Identifier fields"
  #   And I should see "Hash the Record ID field"
  #   And I should see "Remove unvalidated Text fields"
  #   And I should see "Remove Notes/Essay box fields"
  #   And I should see "Remove all date and datetime fields"
  #   And I should see "Shift all dates by value between 0 and 364 days"
  #   And I should see "Also shift all survey completion timestamps by value between 0 and 364 days"
  #   Then I click on the button labeled "Cancel" in the dialog box
  #   Then I should see "My Reports & Exports"

  # Scenario: 5d - Verify export option - SAS Statistical Software
  #   Given I click on the button labeled "Export Data"
  #   Then I should see "Exporting \"All data (all records and fields)\""
  #   And I click on the radio labeled "SAS Statistical Software" in the dialog box
  #   Then I should see "Remove all tagged Identifier fields"
  #   And I should see "Hash the Record ID field"
  #   And I should see "Remove unvalidated Text fields"
  #   And I should see "Remove Notes/Essay box fields"
  #   And I should see "Remove all date and datetime fields"
  #   And I should see "Shift all dates by value between 0 and 364 days"
  #   And I should see "Also shift all survey completion timestamps by value between 0 and 364 days"
  #   Then I click on the button labeled "Cancel" in the dialog box
  #   Then I should see "My Reports & Exports"

  # Scenario: 5e - Verify export option - R Statistical Software
  #   Given I click on the button labeled "Export Data"
  #   Then I should see "Exporting \"All data (all records and fields)\""
  #   And I click on the radio labeled "R Statistical Software" in the dialog box
  #   Then I should see "Remove all tagged Identifier fields"
  #   And I should see "Hash the Record ID field"
  #   And I should see "Remove unvalidated Text fields"
  #   And I should see "Remove Notes/Essay box fields"
  #   And I should see "Remove all date and datetime fields"
  #   And I should see "Shift all dates by value between 0 and 364 days"
  #   And I should see "Also shift all survey completion timestamps by value between 0 and 364 days"
  #   Then I click on the button labeled "Cancel" in the dialog box
  #   Then I should see "My Reports & Exports"

  # Scenario: 5f - Verify export option - Stata Statistical Software
  #   Given I click on the button labeled "Export Data"
  #   Then I should see "Exporting \"All data (all records and fields)\""
  #   And I click on the radio labeled "Stata Statistical Software" in the dialog box
  #   Then I should see "Remove all tagged Identifier fields"
  #   And I should see "Hash the Record ID field"
  #   And I should see "Remove unvalidated Text fields"
  #   And I should see "Remove Notes/Essay box fields"
  #   And I should see "Remove all date and datetime fields"
  #   And I should see "Shift all dates by value between 0 and 364 days"
  #   And I should see "Also shift all survey completion timestamps by value between 0 and 364 days"
  #   Then I click on the button labeled "Cancel" in the dialog box
  #   Then I should see "My Reports & Exports"

  # Scenario: 5g - Verify export option - CDISC ODM (XML)
  #   Given I click on the button labeled "Export Data"
  #   Then I should see "Exporting \"All data (all records and fields)\""
  #   And I click on the radio labeled "CDISC ODM (XML)" in the dialog box
  #   Then I should see "Remove all tagged Identifier fields"
  #   And I should see "Hash the Record ID field"
  #   And I should see "Remove unvalidated Text fields"
  #   And I should see "Remove Notes/Essay box fields"
  #   And I should see "Remove all date and datetime fields"
  #   And I should see "Shift all dates by value between 0 and 364 days"
  #   And I should see "Also shift all survey completion timestamps by value between 0 and 364 days"
  #   Then I click on the button labeled "Cancel" in the dialog box
  #   Then I should see "My Reports & Exports"

  Scenario: 6 - Export Data in csvlabels format and verify the exported data
    When I export data for the report named "All data" in "csvlabels" format
    Then I should see "Data export was successful!"
    Then I should receive a download to a "csv" file
    Then I should have a "csv" file that contains the headings below
    # | record_id | redcap_event_name | redcap_repeat_instrument | redcap_repeat_instance | redcap_survey_identifier | lname | fname | dob | reminder | export_complete | survey_timestamp | description | survey_complete |
    | "Record ID" | "Event Name" | "Repeat Instrument" | "Repeat Instance" | "Survey Identifier" | "Last name" | "First name" | DOB | Reminder | Complete? | "Survey Timestamp" | Description | Complete? |
    Then I should have a "csv" file that contains the data '"Event 1"' for record ID "1" and fieldname '"Event Name"'
    Then I should have a "csv" file that contains 8 distinct records
    Then I should have a "csv" file that contains 20 rows
    Then I should have a "csv" file that contains 11 repeating instrument rows
    Then I should have a "csv" file that contains the data "2019-06-17" for record ID "1" and fieldname "DOB"
    Then I should have a "csv" file that contains record ID "1" listed on 4 rows
    Then I should have a "csv" file that contains 2 repeating instances of the event '"Event 1"' for record ID "1"
    Then I should have a "csv" file that contains 2 repeating instances of the event '"Event 2"' for record ID "1"
    Then I should have a "csv" file that contains record ID "2" listed on 3 rows
    Then I should have a "csv" file that contains 1 repeating instances of the event '"Event 1"' for record ID "2"
    Then I should have a "csv" file that contains 2 repeating instances of the event '"Event 2"' for record ID "2"


# | record_id | redcap_event_name | redcap_repeat_instrument | redcap_repeat_instance | redcap_survey_identifier | lname | fname | dob | reminder | export_complete | survey_timestamp | description | survey_complete |
   