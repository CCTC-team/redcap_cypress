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

   # below chunk is subject to change because the file names need updateing as per the comments at the bottom

    Given I click on the link labeled "Upload new version"
    And I upload a "csv" format file located at "redcap_val_fixtures\csv\file1.csv", by clicking the button near "File Upload" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    And I clear field and enter "1" into the data entry form field labeled "Required"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    When I download a file by clicking on the link labeled "file1.csv (0.01 MB)"
    Then I should see a downloaded file named "file1.csv (0.01 MB)"

    # need to upload another file for the chunk written above to verify that it is a different file in some way
    # pathway below
    # use a smaller file or make my own small one 
    #C:\Users\fayersl\source\repos\redcap_cypress\cypress\fixtures\import_files

    




