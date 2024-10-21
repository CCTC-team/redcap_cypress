    Feature: D.115.700  Download PDF of Instruments

  As a REDCap end user
  I want to be able to download a PDF of instruments

  Scenario: The system shall support the ability to download a PDF of data collection instruments containing saved data
    
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the tab labeled "Other Export Options"
    And I click on the compact download PDF image for "PDF of data collection instruments containing saved data (all records)"
    Then I should see the following values in the downloaded PDF "D115100_YYYY-MM-DD_TTTT.pdf"
      | CRF Version 1                            Record ID 1 (Event 2)  |
      | Text Validation                                     D.115.100   |
      | Record ID                                               1       |
      | Name                                               Dave         |
      | CRF Version 1                            Record ID 1 (Event 2)  |
      | Data Types                                                      |
      | Name                                               Joe          |
      | Radio Button Auto                 Choice1 Choice2 Choice.3      |
      | File Upload                                  [FILE: file1.csv]  |
      | CRF Version 1                        Record ID 1 (Event three)  |
      | Text Validation                                     D.115.100   |
      | Record ID                                               1       |
      | CRF Version 1                        Record ID 1 (Event three)  |
      | Data Types                                                      |
      | Name                                            John            |
      | Radio Button Auto                 Choice1 Choice2 Choice.3      |
      | File Upload                                  [FILE: file1.csv]  |

      | CRF Version 1                            Record ID 2 (Event 1)  |
      | Text Validation                                     D.115.100   |
      | Record ID                                               2       |
      | CRF Version 1                            Record ID 2 (Event 1)  |
      | Data Types                                                      |
      | CRF Version 1                            Record ID 2 (Event 2)  |
      | Text Validation                                     D.115.100   |
      | Record ID                                               2       |
      | CRF Version 1                            Record ID 2 (Event 2)  |
      | Data Types                                                      |
      | Name                                              Paul          |

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