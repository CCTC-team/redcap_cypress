Feature: D.115.500  Download PDF of Instruments

  As a REDCap end user
  I want to be able to download a PDF of instruments

  Scenario: The system shall support the ability to download the data entry form from within an instrument (instrument contains Record ID)
   
  Given I click on the link labeled "Record Status Dashboard"
  When I locate the bubble for the "Data Types" instrument on event "Event 2" for record ID "1" and click on the bubble
  And I select "This data entry form (blank)" on the dropdown field labeled "Download PDF of instrument(s)"
  And I should see a downloaded file named "DataTypes_D115100.pdf"
  Then I should see the following values in the downloaded PDF "DataTypes_D115100.pdf"
      | CRF Version 1                            Record ID 1 (Event 2)  |
      | Data Types                                       D.115.100      |
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

    #VERIFY_LOG
    Given I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Time / Date      | Username   | Action                        | List of Data Changes OR Fields Exported          |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Download data entry form as PDF                  |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data) |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data) |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Make project customizations                      |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data) |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data) |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Make project customizations                      |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data) |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Make project customizations                      |