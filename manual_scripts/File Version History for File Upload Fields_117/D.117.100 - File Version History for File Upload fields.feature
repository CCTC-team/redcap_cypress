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
    And I click on the link labeled "file1.csv (0.01 MB)"
    



