Feature: D.117.100  File Version History for File Upload fields

  As a REDCap end user
  I want to see that File Version History for File Upload fields is functioning as expected

  Scenario: 
    Given I login to REDCap with the user "Test_User"
    And I create a new project named "D.117.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
    And I click on the button labeled "Additional Customizations"
    And I should see a checkbox labeled "Enable the Data History popup for all data collection instruments?" that is checked
    And I should see a checkbox labeled "Enable the File Version History for 'File Upload' fields?" that is checked
    When I click on the button labeled "Save"
    Then I should see "Success! Your changes have been saved."

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the button labeled "Add new record for this arm"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    And I click on the link labeled "Upload file"
    And I upload a "csv" format file located at "redcap_val_fixtures\csv\file1.csv", by clicking the button near "File Upload" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    And I clear field and enter "1" into the data entry form field labeled "Required"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    When I download a file by clicking on the link labeled "file1.csv (0.01 MB)"
    Then I should see a downloaded file named "file1.csv (0.01 MB)"

    Given I click on the data History icon for the field labeled "File Upload"
    And I should see "Data History for variable "file_upload" for record "2""
    When I should see a table header and rows containing the following values in a table:
      | Date/Time of Upload   | User      | File Uploaded             | File Version   | Information / Action      |
      | dd/mm/yyyy hh:mm:ss   | Test_User | Upload File - "file1.csv" | V1             | [Download button] Delete  |
    Then I click on the button labeled "Add new record for this arm"

    Given I click on the link labeled "Upload new version"
    And I upload a "csv" format file located at "redcap_cypress\cypress\fixtures\import_files\B316200100_ImportTemplate_ImportRecord.csv", by clicking the button near "File Upload" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    And I clear field and enter "1" into the data entry form field labeled "Required"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    When I download a file by clicking on the link labeled "B316200100_ImportTemplate_ImportRecord.csv (0.01 MB)"
    Then I should see a downloaded file named "B316200100_ImportTemplate_ImportRecord.csv (0.01 MB)"

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "2"
    And I click on the span element labeled "Choose action for record"
    And I select "Download ZIP file of all uploaded documents" on the dropdown field labeled "Choose action for record"
    Then I should see a downloaded file named "Files_D117100_2024-09-06_1202.zip"
    # open the csv via a file path of clicking on a couple of consecutive folders and maybe unzipping the zip file. 
    Then I should see the latest downloaded "csv" file containing the headings below
      | record_id | redcap_repeat_instrument | redcap_repeat_instance | redcap_data_access_group | redcap_survey_identifier | data_types_timestamp | ptname | textbox | radio | notesbox | identifier | identifier_2 | date_ymd | datetime_ymd_hmss | data_types_complete |
    #unfinished, need to ammend the above to match the correct csv file's columns. need a further step here, in row '6' in word doc. 
    # 

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the button labeled "Add new record for this arm"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    And I click on the link labeled "Upload file"
    And I upload a "csv" format file located at "redcap_val_fixtures\csv\file1.csv", by clicking the button near "File Upload" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    And I clear field and enter "1" into the data entry form field labeled "Required"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    When I download a file by clicking on the link labeled "file1.csv (0.01 MB)"
    Then I should see a downloaded file named "file1.csv (0.01 MB)"
    And I click on the data History icon for the field labeled "File Upload"
    When I should see "Data History for variable "file_upload" for record "3""
    Then I should see a table header and rows containing the following values in a table:
      | Date/Time of Upload   | User      | File Uploaded             | File Version   | Information / Action      |
      | dd/mm/yyyy hh:mm:ss   | Test_User | Upload File - "file1.csv" | V1             | [Download button] Delete  |
    And I click on the button labeled "Close" in the dialog box

    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the tab labeled "Other Export Options"
    And I click on the Download image for the field named "ZIP file of uploaded files (all records)" 
    # another new step required to check for the following: 'Open ZIP file and access the document folder and open file for all records e.g ID 2 and ID 3'
    # could be challenging. 

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "2"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    And I click on the data History icon for the field labeled "File Upload"
    When I should see "Data History for variable "file_upload" for record "3""
    Then I should see a table header and rows containing the following values in a table:
      | Date/Time of Upload   | User      | File Uploaded                                                        | File Version | Information / Action      |
      | dd/mm/yyyy hh:mm:ss   | Test_User | Upload File - "file1.csv"                                            | V1           | [Download button] Delete  |
      | dd/mm/yyyy hh:mm:ss   | Test_User | Upload File - "B316200100_ImportTemplate_ImportRecord.csv (0.01 MB)" | V2           | [Download button] Delete  |
    And I click on the first button labeled "Download"
    And I should see a downloaded file named "file1.csv (0.01 MB)"
    And I click on the last button labeled "Download"
    And I should see a downloaded file named "B316200100_ImportTemplate_ImportRecord.csv (0.01 MB)"
    And I click on the first link labeled "Delete"
    # this needs to be new im afraid! 
    When I click on the button labeled "Yes, delete it"
    Then I should see the link labeled "Delete"
    And I should see the button labeled "Download"
    And I click on the button labeled "Close" in the dialog box
    When I click on the link labeled "Remove file"
    Then I click on the button labeled "Yes, delete it"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    When I should see "Data History for variable "file_upload" for record "2""
    # need to read two bits of text on the screen, both saying deleted and then a date time but unsure how to read both accurately (start it with 'Then')
    And I click on the button labeled "Close" in the dialog box 

    Given I click on the link labeled "Project Setup"
    When I click on the button labeled "Additional customizations"
    Then I uncheck the checkbox labeled "Enable the File Version History for 'File Upload' fields?"
    And I click on the button labeled "Save"

    #finished 14 with the exeption of the above comments, about to start 15. Will need to actually create 
    #record 3 before creating record 4 in this step as i did it in theory previously i believe


