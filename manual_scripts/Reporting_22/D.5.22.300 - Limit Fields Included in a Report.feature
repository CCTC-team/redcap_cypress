Feature: D.5.22.300 - The system shall support the ability to limit fields included in a report.

  As a REDCap end user
  I want to be able to limit fields included in a report. 

  Scenario: D.5.22.300 - Limit Fields in a Report
    Given I login to REDCap with the user "Test_User1"
    Then I create a new project named "D.5.22.300" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.REDCap.xml", and clicking the "Create Project" button

    Given I click on the link labeled "Data Import Tool"
    When I upload a "csv" format file located at "import_files/Redcap_Val_Data_Import.csv", by clicking the button near "Choose File" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    Then I should see "Your document was uploaded successfully and is ready for review"
    And I click on the button labeled "Import Data"

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Create New Report"
    And I enter 'Test Report 1' into the input field labeled "Name of Report:" 
    And I enter 'calculated_field "Calculated Field"' into the input field labeled "Field 2" 
    And I enter 'ptname "Name"' into the input field labeled "Field 3" 
    And I enter 'radio_button_manual "Radio Button Manual"' into the input field labeled "Field 4" 
    And I enter 'email_v2 "Email"' into the input field labeled "Field 5" 
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        |
    | 2         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | dannysmith@example.com |
    | 2         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Fred Gatefield | Choice101 (101)     |                        |
    | 3         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     |                        |
    | 3         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Thomas Pipe    | Choice100 (100)     |                        |
    | 4         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | johndoe@example.com    |
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Shy Green      | Choice99 (9..9)     |                        |
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | paulmoore@example.com  |
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Yash Tank      | Choice100 (100)     |                        |
    
    Given I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Data Types" instrument on event "Event 2" for record ID "1" and click on the bubble
    When I enter "50" into the input field labeled "Required"
    Then I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'required "Required"' on the dropdown field labeled "Filter 1"
    And I select the operator "=" for filter "1"
    And I enter the value "50" for filter "1"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        |
   
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'record_id "Record ID"' on the dropdown field labeled "Filter 1"
    And I select the operator "not =" for filter "1"
    And I enter the value "3" for filter "1"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        |
    | 2         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | dannysmith@example.com |
    | 2         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Fred Gatefield | Choice101 (101)     |                        |
    | 4         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | johndoe@example.com    |
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Shy Green      | Choice99 (9..9)     |                        |
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | paulmoore@example.com  |
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Yash Tank      | Choice100 (100)     |                        |
    
    this is where i found the bug. In reality this is not what shows because there are also empty rows for 'Event three' 

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'record_id "Record ID"' on the dropdown field labeled "Filter 1"
    And I select the operator "not =" for filter "1"
    And I enter the value "3" for filter "1"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        |
    | 2         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | dannysmith@example.com |
    | 2         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Fred Gatefield | Choice101 (101)     |                        |
    | 4         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | johndoe@example.com    |
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Shy Green      | Choice99 (9..9)     |                        |
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | paulmoore@example.com  |
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Yash Tank      | Choice100 (100)     |                        |
    
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'radio_button_manual "Radio Button Manual"' on the dropdown field labeled "Filter 1"
    And I select the operator "=" for filter "2"
    And I enter the value "100" for filter "2"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Yash Tank      | Choice100 (100)     |                        |
    
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'calculated_field "Calculated Field"' on the dropdown field labeled "Filter 1"
    And I select the operator "<" for filter "2"
    And I enter the value "4" for filter "2"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Lily Brown     | Choice99 (9..9)     |                        |
    | 2         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Fred Gatefield | Choice101 (101)     |                        |
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Shy Green      | Choice99 (9..9)     |                        |
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | 6                | Yash Tank      | Choice100 (100)     |                        |

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'calculated_field "Calculated Field"' on the dropdown field labeled "Filter 1"
    And I select the operator "<" for filter "2"
    And I enter the value "4" for filter "2"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |
    | 2         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | dannysmith@example.com |
    | 4         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | johndoe@example.com    |
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | paulmoore@example.com  |

    Many of these actually continue to be incorrect technically because of the empty 'event three' rows. 

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'calculated_field "Calculated Field"' on the dropdown field labeled "Filter 1"
    And I select the operator "contains" for filter "3"
    And I enter the value "o" for filter "3"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Calculated Field | Name           | Radio Button Manual | Email                  |
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | tonystone@example.com  |
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                  |                |                     | paulmoore@example.com  |

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Edit"
    And I select 'calculated_field "Calculated Field"' on the dropdown field labeled "Filter 1"
    And I select the operator "ends with" for filter "3"
    And I enter the value "zxz" for filter "3"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see "No results were returned"