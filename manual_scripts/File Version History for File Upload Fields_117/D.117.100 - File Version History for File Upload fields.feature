Feature: D.117.100  File Version History for File Upload fields

  As a REDCap end user
  I want to see that File Version History for File Upload fields is functioning as expected

  Scenario: 
    Given I login to REDCap with the user "Test_User1"
    And I create a new project named "D.117.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "redcap_val_fixtures/cdisc_files/Project_redcap_val.xml", and clicking the "Create Project" button
    And I click on the button labeled "Additional Customizations"
    And I should see a checkbox labeled "Enable the Data History popup for all data collection instruments?" that is checked
    And I should see a checkbox labeled "Enable the File Version History for 'File Upload' fields?" that is checked
    When I click on the button labeled "Cancel"

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the button labeled "Add new record for this arm"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    And I click on the link labeled "Upload file"
    And I upload a "csv" format file located at "/redcap_val_fixtures/csv/file1.csv", by clicking the button near "File Upload" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    Then I should see a link labeled "file1.csv (0.01 MB)"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    When I download a file by clicking on the link labeled "file1.csv (0.01 MB)"
    Then I should see a downloaded file named "file1.csv"

    Given I click on the Data History icon for the field labeled "File Upload"
    Then I should see 'Data History for variable "file_upload" for record "2"'
    And I should see a table header and rows containing the following values in a table:
      | Date/Time of Upload   | User       | File Uploaded             | File Version   | Information / Action      |
      | dd/mm/yyyy hh:mm:ss   | test_user1 | Upload File - "file1.csv" | V1             | [Download button] Delete  |
    
    And I click on the button labeled "Close" in the dialog box
    
    # upload new version of file
    Given I click on the link labeled "Upload new version"
    And I upload a "csv" format file located at "import_files/B3161200100_ACCURATE.csv", by clicking the button near "File Upload" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    Then I should see a link labeled "B3161200100_ACCURATE.csv (0.01 MB)"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    When I download a file by clicking on the link labeled "B3161200100_ACCURATE.csv (0.01 MB)"
    Then I should see a downloaded file named "B3161200100_ACCURATE.csv"

    Given I click on the Data History icon for the field labeled "File Upload"
    Then I should see 'Data History for variable "file_upload" for record "2"'
    And I should see a table header and rows containing the following values in a table:
      | Date/Time of Upload   | User       | File Uploaded                            | File Version   | Information / Action      |
      | dd/mm/yyyy hh:mm:ss   | test_user1 | Upload File - "file1.csv"                | V1             | [Download button] Delete  |
      | dd/mm/yyyy hh:mm:ss   | test_user1 | Upload File - "B3161200100_ACCURATE.csv" | V2             | [Download button] Delete  |
    
    And I click on the first button labeled "Download"
    And I should see a downloaded file named "file1 (1).csv"
    And I click on the last button labeled "Download"
    And I should see a downloaded file named "B3161200100_ACCURATE (1).csv"
    And I click on the button labeled "Close" in the dialog box

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled exactly "2"
    And I click on the button labeled "Choose action for record"
    And I click on the link labeled "Download ZIP file of all uploaded documents"
    Then I should see a downloaded file named "Files_D117100_yyyy-mm-dd_hhmm.zip"
    # and I open the csv via a file path of clicking on a couple of consecutive folders and maybe unzipping the zip file. 
    When I unzip the file "Files_D117100_yyyy-mm-dd_hhmm.zip"
    Then I should see a downloaded file "/Files_D117100_yyyy-mm-dd_hhmm/Files_D117100_yyyy-mm-dd_hhmm/documents/2_event_1_arm_1_data_types_1_file_upload.csv" containing the headings below
      | record_id | redcap_event_name | redcap_repeat_instrument | redcap_repeat_instance | redcap_data_access_group | redcap_survey_identifier | name | email | text_validation_complete |
    # and I should not see any other files  

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the button labeled "Add new record for this arm"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    And I click on the link labeled "Upload file"
    And I upload a "csv" format file located at "redcap_val_fixtures/csv/file1.csv", by clicking the button near "File Upload" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    Then I should see a link labeled "file1.csv (0.01 MB)"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    When I download a file by clicking on the link labeled "file1.csv (0.01 MB)"
    Then I should see a downloaded file named "file1 (2).csv"

    When I click on the Data History icon for the field labeled "File Upload"
    Then I should see 'Data History for variable "file_upload" for record "3"'
    And I should see a table header and rows containing the following values in a table:
      | Date/Time of Upload   | User       | File Uploaded             | File Version   | Information / Action      |
      | dd/mm/yyyy hh:mm:ss   | test_user1 | Upload File - "file1.csv" | V1             | [Download button] Delete  |
   
    And I click on the button labeled "Close" in the dialog box

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the tab labeled "Other Export Options"
    And I click on the Download image for "ZIP file of uploaded files (all records)"  
    Then I should see a downloaded file named "Files_D117100_yyyy-mm-dd_hhmm.zip"
    # and I open the csv via a file path of clicking on a couple of consecutive folders and maybe unzipping the zip file. 
    When I unzip the file "Files_D117100_yyyy-mm-dd_hhmm.zip"
    Then I should see a downloaded file named "/Files_D117100_yyyy-mm-dd_hhmm/Files_D117100_yyyy-mm-dd_hhmm/documents/2_event_1_arm_1_data_types_1_file_upload.csv" containing the headings below
      | record_id | redcap_event_name | redcap_repeat_instrument | redcap_repeat_instance | redcap_data_access_group | redcap_survey_identifier | name | email | text_validation_complete |
    
    And I should see a downloaded file named "/Files_D117100_yyyy-mm-dd_hhmm/Files_D117100_yyyy-mm-dd_hhmm/documents/3_event_1_arm_1_data_types_1_file_upload.csv" containing the headings below
      | record_id | redcap_event_name | redcap_survey_identifier | lname | fname | email | demographics |survey_timestamp | reminder | description | survey_complete |

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled exactly "2"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    And I click on the Data History icon for the field labeled "File Upload"
    Then I should see 'Data History for variable "file_upload" for record "2"'
    And I click on the link labeled "Delete" for the row labeled "V1" 
    When I click on the button labeled "Yes, delete it"
    Then I should see a table header and rows containing the following values in a table:
      | Date/Time of Upload   | User       | File Uploaded                            | File Version   | Information / Action        |
      | dd/mm/yyyy hh:mm:ss   | test_user1 | Upload File - "file1.csv"                | V1             | Deleted on dd/mm/yyyy hh:mm |
      | dd/mm/yyyy hh:mm:ss   | test_user1 | Upload File - "B3161200100_ACCURATE.csv" | V2             | [Download button] Delete    |
    
    And I click on the button labeled "Close" in the dialog box
    When I click on the link labeled "Remove file"
    Then I click on the button labeled "Yes, delete it"
    Then I should see a link labeled "Upload file"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    When I click on the Data History icon for the field labeled "File Upload"
    Then I should see 'Data History for variable "file_upload" for record "2"'
    Then I should see a table header and rows containing the following values in a table:
      | Date/Time of Upload   | User       | File Uploaded                            | File Version   | Information / Action        |
      | dd/mm/yyyy hh:mm:ss   | test_user1 | Upload File - "file1.csv"                | V1             | Deleted on dd/mm/yyyy hh:mm |
      | dd/mm/yyyy hh:mm:ss   | test_user1 | Upload File - "B3161200100_ACCURATE.csv" | V2             | Deleted on dd/mm/yyyy hh:mm |
    
    And I click on the button labeled "Close" in the dialog box

    Given I click on the link labeled "Project Setup"
    When I click on the button labeled "Additional customizations"
    Then I uncheck the checkbox labeled "Enable the File Version History for 'File Upload' fields?"
    And I click on the button labeled "Save"

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the button labeled "Add new record for this arm"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    And I click on the link labeled "Upload file"
    And I upload a "csv" format file located at "redcap_val_fixtures/csv/file1.csv", by clicking the button near "File Upload" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    Then I should see a link labeled "file1.csv (0.01 MB)"
    
    When I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    Then I should NOT see a link labeled "Upload new version"
    And I click on the link labeled "Remove file"
    And I click on the button labeled "Yes, delete it"
    Then I should see a link labeled "Upload file"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    When I click on the link labeled "Upload file"
    And I upload a "csv" format file located at "redcap_val_fixtures/csv/file1.csv", by clicking the button near "File Upload" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    Then I should see a link labeled "file1.csv (0.01 MB)"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument

    Given I click on the Data History icon for the field labeled "File Upload"
    When I should see 'Data History for variable "file_upload" for record "4"'
    Then I should see a table header and rows containing the following values in a table:
      | Date/Time of Change   | User       | Data Changes Made         |
      | dd/mm/yyyy hh:mm:ss   | test_user1 | Upload File - "file1.csv" | 
      | dd/mm/yyyy hh:mm:ss   | test_user1 | Delete File               |
      | dd/mm/yyyy hh:mm:ss   | test_user1 | Upload File - "file1.csv" | 

    And I click on the button labeled "Close" in the dialog box

    #VERIFY_LOG
    Given I click on the link labeled "Logging"
    # Files uploaded are shown as File Upload = 'num' where num is random number.
    # Files deleted are shown as File Upload = ''.
    # Previous versions of files deleted are recorded properly as Deleted including version number e.g. Deleted Document file_upload (V1).
    # The file upload number is different each time in 'List of Data Changes OR Fields Exported' column. Have to check if it works without the number
    Then I should see a table header and rows containing the following values in the logging table:
      | Time / Date      | Username   | Action                                                    | List of Data Changes OR Fields Exported                                           |
      | mm/dd/yyyy hh:mm | test_user1 | Update record 4 (Event 1 (Arm 1: Arm 1))                  | file_upload =                                                                     |
      | mm/dd/yyyy hh:mm | test_user1 | Update record 4 (Event 1 (Arm 1: Arm 1))                  | file_upload = ''                                                                  |
      | mm/dd/yyyy hh:mm | test_user1 | Create record 4 (Event 1 (Arm 1: Arm 1))                  | calculated_field = '6', file_upload =  data_types_complete = '0', record_id = '4' |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                                             | Make project customizations                                                       |
      | mm/dd/yyyy hh:mm | test_user1 | Update record 2 (Event 1 (Arm 1: Arm 1))                  | file_upload = ''                                                                  |
      | mm/dd/yyyy hh:mm | test_user1 | Deleted Document Update record 2 (Event 1 (Arm 1: Arm 1)) | file_upload (V1)                                                                  |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                                             | Download ZIP of uploaded files (all records)                                      |
      | mm/dd/yyyy hh:mm | test_user1 | Download uploaded document Record 3                       | file_upload                                                                       |
      | mm/dd/yyyy hh:mm | test_user1 | Create record 3 (Event 1 (Arm 1: Arm 1))                  | calculated_field = '6', file_upload =  data_types_complete = '0', record_id = '3' |
      | mm/dd/yyyy hh:mm | test_user1 | Manage/Design                                             | Download ZIP of uploaded files (single record)                                    |
      | mm/dd/yyyy hh:mm | test_user1 | Download uploaded document Record 2                       | file_upload (V2)                                                                  |
      | mm/dd/yyyy hh:mm | test_user1 | Download uploaded document Record 2                       | file_upload (V1)                                                                  |
      | mm/dd/yyyy hh:mm | test_user1 | Download uploaded document Record 2                       | file_upload                                                                       |
      | mm/dd/yyyy hh:mm | test_user1 | Update record 2 (Event 1 (Arm 1: Arm 1))                  | file_upload =                                                                     |
      | mm/dd/yyyy hh:mm | test_user1 | Download uploaded document Record 2                       | file_upload                                                                       |
      | mm/dd/yyyy hh:mm | test_user1 | Create record 2 (Event 1 (Arm 1: Arm 1))                  | calculated_field = '6', file_upload =  data_types_complete = '0', record_id = '2' |