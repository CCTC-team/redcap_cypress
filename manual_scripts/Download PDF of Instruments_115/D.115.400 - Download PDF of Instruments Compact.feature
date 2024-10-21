Feature: D.115.400  Download PDF of Instruments

  As a REDCap end user
  I want to be able to download a PDF of instruments

  Scenario: The system shall support the ability to download the PDF of record data of all instruments/events in a compact mode (fields with data only)

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    And I select "Download PDF of record data for all instruments/events (compact)" on the dropdown field labeled "Choose action for record"
    When I should see a downloaded file named "D115100_YYYY-MM-DD_TTTT.pdf"
    Then I should see the following values in the downloaded PDF "D115100_YYYY-MM-DD_TTTT.pdf"
      | CRF Version 1                            Record ID 1 (Event 2)  |
      | Text Validation                                     D.115.100   |
      | Record ID                                              1        |
      | Name                                               Joe          |
      | Radio Button Auto                 Choice1 Choice2 Choice.3      |
      | File Upload                                  [FILE: file1.csv]  |
      | Section Break                                                   |
      | Descriptive Text                                                |
      | CRF Version 1                            Record ID 1 (Event 3)  |
      | Text Validation                                     D.115.100   |
      | Record ID                                              1        |
      | Name                                            John            |
      | Radio Button Auto                 Choice1 Choice2 Choice.3      |
      | File Upload                                  [FILE: file1.csv]  |
      | Section Break                                                   |
      | Descriptive Text                                                |

    #VERIFY_LOG
    Given I click on the link labeled "Logging"
    Then I should see a table header and rows containing the following values in the logging table:
      | Time / Date      | Username   | Action                        | List of Data Changes OR Fields Exported          |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data) |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data) |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Make project customizations                      |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data) |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data) |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Make project customizations                      |
      | mm/dd/yyyy hh:mm | test_user1 | PDF Export with data Record 1 | Download all data entry forms as PDF (with data) |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                 | Make project customizations                      |


