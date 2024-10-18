Feature: D.115.200  Download PDF of Instruments

  As a REDCap end user
  I want to be able to download a PDF of instruments

  Scenario: The system shall support additional customization of PDF of instruments
  Given I click on the link labeled "Project Setup"
   And I click on the button labeled "Additional Customizations"
   When I check the checkbox labeled "PDF Customizations"
   And I enter "CRF Version 1" into the input field labeled "1)"
   And I select the radio option "Hide REDCap logo/URL and instead display the following text:  Powered by REDCap" for the field labeled "2)"
   And I select "Keep it displayed" on the dropdown field labeled "3)"
   Then I click on the button labeled "Save"

   Given I click on the link labeled "Record Status Dashboard"
   And I click on the link labeled "1"
   When I select "Download PDF of record data for all instruments/events" on the dropdown field labeled "Choose action for record"
   Then I should see the following values in the downloaded PDF "D.115.100"
      | Text Validation                               D.115.100         |
      | Record ID                             Record ID 1 (Event 1)     |
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
      | Identifier                                                      |
      | Identifier                                                      |
      | Edit Field                                                      |
      | Section Break                                                   |
      | Descriptive Text                            Powered by REDCap   |

    Given I click on the link labeled "Project Setup"
    And I click on the button labeled "Additional Customizations"
    When I check the checkbox labeled "PDF Customizations"
    And I enter "CRF Version 1" into the input field labeled "1)"
    And I select "Hide it" on the dropdown field labeled "3)"
    Then I click on the button labeled "Save"

   Given I click on the link labeled "Record Status Dashboard"
   And I click on the link labeled "1"
   When I select "Download PDF of record data for all instruments/events" on the dropdown field labeled "Choose action for record"
   Then I should see the following values in the downloaded PDF "D.115.100"
      | Text Validation                               D.115.100         |
      | Record ID                             Record ID 1 (Event 1)     |
      | Record ID                                                       |
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

   #VERIFY_LOG
    Given I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Time / Date      | Username   | Action                        | List of Data Changes OR Fields Exported |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Make project customizations             |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF    |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF    |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Make project customizations             |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF    |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Make project customizations             |


