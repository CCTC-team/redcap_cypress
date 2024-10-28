Feature: D.5.22.300 - The system shall support the ability for reports to link with the following features: Stats & Charts

  As a REDCap end user
  I want to be able to link reports with stats and Charts

  Scenario: D.5.22.500 - link reports with stats and charts
    Given I login to REDCap with the user "Test_User1"
    Then I create a new project named "D.5.22.300" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.REDCap.xml", and clicking the "Create Project" button

    Given I click on the link labeled "Data Import Tool"
    When I upload a "csv" format file located at "import_files/Redcap_Val_Data_Import.csv", by clicking the button near "Choose File" to browse for the file, and clicking the button labeled "Upload File" to upload the file
    Then I should see "Your document was uploaded successfully and is ready for review"
    And I click on the button labeled "Import Data"

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the button labeled "Create New Report"
    And I enter 'Test Report 1' into the input field labeled "Name of Report:" 
    And I enter 'radio_button_manual "Radio Button Manual"' into the input field labeled "Field 2" 
    And I select 'radio_button_manual "Radio Button Manual"' on the dropdown field labeled "First by"
    When I click on the button labeled "Save Report"
    And I click on the button labeled "View report" in the dialog box
    Then I should see a table header and rows containing the following values in the browse users table:
    | Record ID | Event Name             | Repeat Instrument | Repeat Instance | Radio Button Manual | 
    | 1         | Event 1 (Arm 1: Arm 1) |                   |                 |                     | 
    | 2         | Event 1 (Arm 1: Arm 1) |                   |                 |                     | 
    | 3         | Event 1 (Arm 1: Arm 1) |                   |                 |                     | 
    | 4         | Event 1 (Arm 1: Arm 1) |                   |                 |                     | 
    | 5         | Event 1 (Arm 1: Arm 1) |                   |                 |                     | 
    | 3         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | Choice100 (100)     | 
    | 5         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | Choice100 (100)     | 
    | 2         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | Choice101 (101)     | 
    | 1         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | Choice99 (9..9)     | 
    | 4         | Event 1 (Arm 1: Arm 1) | Data Types        | 1               | Choice99 (9..9)     |

    #above table/ general report set up will probably be wrong, just set up the start. Need to link it with stats and charts. 