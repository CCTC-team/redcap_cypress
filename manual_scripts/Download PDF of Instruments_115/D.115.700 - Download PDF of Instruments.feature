Feature: D.115.700  Download PDF of Instruments

  As a REDCap end user
  I want to be able to download a PDF of instruments

  Scenario: The system shall support the ability to download ZIP file of all uploaded documents
    Given I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    And I select "Download ZIP file of all uploaded documents" on the dropdown field labeled "Choose action for record"
    And I should see a downloaded file named "Files_D115100_2024-10-11_1226.zip"
    When I unzip the file "Files_D115100_2024-10-11_1226.zip"
    # and I open the csv via a file path of clicking on a couple of consecutive folders and maybe unzipping the zip file. 
    Then I should see a downloaded file "/Files_D117100_yyyy-mm-dd_hhmm/Files_D117100_yyyy-mm-dd_hhmm/documents/2_event_1_arm_1_data_types_1_file_upload.csv" containing the headings below
      | record_id | redcap_event_name | redcap_survey_identifier | name | email | survey_timestamp | reminder | description | survey_complete |
    #as per word doc 'The document folder contains 2 files for record ID 1 (arm 1) - event 2 and event three'
    # we areo nly checking 1 here and the other isnt an excel so i dont know how   
  
    Given I click on the link labeled "Record Status Dashboard"
    When I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "1" and click on the bubble
    And I enter "Dave" into the input field labeled "Name"
    Then I enter "dave@abc.com" into the input field labeled "email"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the button labeled "Add new record for this arm"
    When I locate the bubble for the "Data Types" instrument on event "Event 2" for record ID "2" and click on the bubble
    Then I enter "Paul" into the input field labeled "Name"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the tab labeled "Other Export Options"
    And I click on the download PDF image for "PDF of data collection instruments containing saved data (all records)"
    Then I should see the following values in the downloaded PDF "D115100_YYYY-MM-DD_TTTT.pdf"
      | CRF Version 1                            Record ID 1 (Event 2)  |
      | Text Validation                                     D.115.100   |
      | Record ID                                                       |
      | Name                                              Dave          |
      | Email                                                           |
      | Data Types                                                      |
      | Name                                               Joe          |
      | Text2                                                           |
      | Text Box                                                        |
      | Notes Box                                                       |
      | Calculated Field                                                |
      | Multiple Choice Dropdown Auto     DDChoice1 DDChoice2 DDChoice3 |
      | Multiple Choice Dropdown Manual   DDChoice5 DDChoice6 DDChoice7 |
      | Radio Button Auto                 Choice1 Choice2 Choice.3      |
      | Radio Button Manual               Choice99 Choice100 Choice101  |
      | Checkbox                          Checkbox Checkbox2 Checkbox3  |
      | Signature                                                       |
      | File Upload                                  [FILE: file1.csv]  |
      | Descriptive Text with File                                      |
      | [Attachment: "7_image_v913.jpg"]                                |
      | Required                                                        |
      | Identifier                                                      |
      | Identifier                                                      |
      | Edit Field                                                      |
      | Section Break                                                   |
      | Descriptive Text                                                |
      | CRF Version 1                            Record ID 1 (Event 3)  |
      | Text Validation                                     D.115.100   |
      | Record ID                                                       |
      | Name                                            John            |
      | Email                                                           |
      | Data Types                                                      |
      | Name                                                            |
      | Text2                                                           |
      | Text Box                                                        |
      | Notes Box                                                       |
      | Calculated Field                                                |
      | Multiple Choice Dropdown Auto     DDChoice1 DDChoice2 DDChoice3 |
      | Multiple Choice Dropdown Manual   DDChoice5 DDChoice6 DDChoice7 |
      | Radio Button Auto                 Choice1 Choice2 Choice.3      |
      | Radio Button Manual               Choice99 Choice100 Choice101  |
      | Checkbox                          Checkbox Checkbox2 Checkbox3  |
      | Signature                                                       |
      | File Upload                                  [FILE: file1.csv]  |
      | Descriptive Text with File                                      |
      | [Attachment: "7_image_v913.jpg"]                                |
      | Required                                                        |
      | Identifier                                                      |
      | Identifier                                                      |
      | Edit Field                                                      |
      | Section Break                                                   |
      | Descriptive Text                                                |

      | CRF Version 1                            Record ID 2 (Event 2)  |
      | Text Validation                                     D.115.100   |
      | Record ID                                               1       |
      | Name                                                            |
      | Email                                                           |
      | Data Types                                                      |
      | Name                                                            |
      | Text2                                                           |
      | Text Box                                                        |
      | Notes Box                                                       |
      | Calculated Field                                                |
      | Multiple Choice Dropdown Auto     DDChoice1 DDChoice2 DDChoice3 |
      | Multiple Choice Dropdown Manual   DDChoice5 DDChoice6 DDChoice7 |
      | Radio Button Auto                 Choice1 Choice2 Choice.3      |
      | Radio Button Manual               Choice99 Choice100 Choice101  |
      | Checkbox                          Checkbox Checkbox2 Checkbox3  |
      | Signature                                                       |
      | File Upload                                                     |
      | Descriptive Text with File                                      |
      | [Attachment: "7_image_v913.jpg"]                                |
      | Required                                                        |
      | Identifier                                                      |
      | Identifier                                                      |
      | Edit Field                                                      |
      | Section Break                                                   |
      | Descriptive Text                                                |
      | CRF Version 1                            Record ID 2 (Event 3)  |
      | Text Validation                                     D.115.100   |
      | Record ID                                          2            |
      | Name                                              Paul          |
      | Email                                                           |
      | Data Types                                                      |
      | Name                                                            |
      | Text2                                                           |
      | Text Box                                                        |
      | Notes Box                                                       |
      | Calculated Field                                                |
      | Multiple Choice Dropdown Auto     DDChoice1 DDChoice2 DDChoice3 |
      | Multiple Choice Dropdown Manual   DDChoice5 DDChoice6 DDChoice7 |
      | Radio Button Auto                 Choice1 Choice2 Choice.3      |
      | Radio Button Manual               Choice99 Choice100 Choice101  |
      | Checkbox                          Checkbox Checkbox2 Checkbox3  |
      | Signature                                                       |
      | File Upload                                                     |
      | Descriptive Text with File                                      |
      | [Attachment: "7_image_v913.jpg"]                                |
      | Required                                                        |
      | Identifier                                                      |
      | Identifier                                                      |
      | Edit Field                                                      |
      | Section Break                                                   |
      | Descriptive Text                                                |

    Given I click on the link labeled "My Projects"
    Then I should see a table header and rows containing the following values in a table:
      | | | | |
      | | | | |
      | | | | |
      | | | | |

      #VERIFY_LOG
    Given I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Time / Date      | Username   | Action                        | List of Data Changes OR Fields Exported            |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Download all data entry forms as PDF (all records) |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Download ZIP of uploaded files (single record)     |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Download all data entry forms as PDF (all records) |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Download data entry form as PDF                    |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data)   |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data)   |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Make project customizations                        |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data)   |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data)   |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Make project customizations                        |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data)   |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Make project customizations                        |