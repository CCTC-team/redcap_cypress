Feature: Export Data

  As a REDCap end user
  I want to see that Export Data is functioning as expected

  Scenario: Project Setup 4 - Import Data File

    Given I am a "standard" user who logs into REDCap
    And I create a project named "21_ExportDataExtraction_v1115" with project purpose Practice / Just for fun via CDISC XML import from fixture location "cdisc_files/core/21ExportDataExtracti_temp.xml"
    And I click on the link labeled "Record Status Dashboard"
    # Getting the Event wrong
    And I locate the bubble for the "Survey" instrument on event "Event 1" for record ID "1" and click the repeating instrument bubble for the first instance
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Open survey" label
    And I click on the button labeled "Submit"
    And I click on the button labeled "Close survey"
    And I logout
    # This is for Event 2 for Record ID 2
    Given I am a "standard" user who logs into REDCap
    Then I should see "New Project"
    Then I click on the link labeled "My Projects"
    Then I should see "Project Title"
    And I click on the link labeled "21_ExportDataExtraction_v1115"
    Then I should see "Record Status Dashboard"
    And I click on the link labeled "Record Status Dashboard"
    # Getting the Event wrong. Need to locate Event 2 but have to give Event 1 in the step definition below
    And I locate the bubble for the "Survey" instrument on event "Event 1" for record ID "2" and click the repeating instrument bubble for the first instance
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Open survey" label
    And I click on the button labeled "Submit"
    And I click on the button labeled "Close survey"
    And I logout
        
  Scenario: 1 - Login
    Given I am a "standard" user who logs into REDCap
    Then I should see "New Project"
   

  Scenario: 2 - Open project
    # And I wait for 2 seconds
    Given I click on the link labeled "My Projects"
    Then I should see "Project Title"
    And I click on the link labeled "21_ExportDataExtraction_v1115"
    Then I should see "21_ExportDataExtraction_v1115"
    Then I should see "Data Exports, Reports, and Stats"

  
  Scenario: 5a - Verify export option - CSV / Microsoft Excel (raw data)
    Given I am a "standard" user who logs into REDCap
    Then I should see "New Project"
    And I click on the link labeled "My Projects"
    Then I should see "21_ExportDataExtraction_v1115"
    And I click on the link labeled "21_ExportDataExtraction_v1115"
    Then I should see "Data Exports, Reports, and Stats"
    When I click on the link labeled "Data Exports, Reports, and Stats"
    Then I should see "View Report"
    And I should see "Export Data"
  
  Scenario: 6 - Export Data in csvlabels format and verify the exported data
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    Then I should see "Export Data"
    When I export data for the report named "All data" in "csvlabels" format
    # Then I should see "Exporting data"
    And I wait for 5 seconds
    Then I should see "Data export was successful!"
    Then I should receive a download to a "csv" file
    Then I should have a "csv" file that contains the headings below
    | "Record ID" | "Event Name" | "Repeat Instrument" | "Repeat Instance" | "Survey Identifier" | "Last name" | "First name" | DOB | Reminder | Complete? | "Survey Timestamp" | Description | Complete? |
    Then I should have a "csv" file that contains the data "Survey" for record ID "1" and fieldname '"Repeat Instrument"'
    Then I should have a "csv" file that contains 8 distinct records
    Then I should have a "csv" file that contains 20 rows
    Then I should have a "csv" file that contains 11 repeating instrument rows
    # 11 rows show the Repeat Instrument name “Survey” - do I need to verify this? 
    # I am verifying 11 repeating instruments in the above step; 
    # and also verifying Repeat instrument has Survey as name for Record ID 1
    Then I should have a "csv" file that contains data in field '"Survey Timestamp"' listed on 2 rows
    Then I should have a "csv" file that contains the data "2019-06-17" for record ID "1" and fieldname "DOB"
    Then I should have a "csv" file that contains today's date for the fieldname '"Survey Timestamp"' for record ID "1" 
    Then I should have a "csv" file that contains record ID "1" listed on 4 rows
    Then I should have a "csv" file that contains 2 repeating instances of the event '"Event 1"' for record ID "1"
    Then I should have a "csv" file that contains 2 repeating instances of the event '"Event 2"' for record ID "1"
    Then I should have a "csv" file that contains record ID "2" listed on 3 rows
    Then I should have a "csv" file that contains 1 repeating instances of the event '"Event 1"' for record ID "2"
    Then I should have a "csv" file that contains 2 repeating instances of the event '"Event 2"' for record ID "2"
    # Dialog box closes on its own
    And I click on the button labeled "Close" in the dialog box
    Then I should see "My Reports & Exports"
