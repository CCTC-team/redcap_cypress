Feature: D.113.200 - Additional Customizations

As a REDCap end user
I want to see that I have the ability to display the log of fields. i.e. Data History Pop-up 
Scenario: D.113.100 Enable Data History pop up

      #ACTION: Data History pop up SETUP
      Given I login to REDCap with the user "Test_Admin" 
      And I create a new project named "D.113.200" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

      #ACTION: Enable Data History Pop-up 
      Given I click on the link labeled "Project Setup"
      And I click on the button labeled "Additional customizations"
      And I check the checkbox labeled "history_widget_enabled"
      Then I click on the button labeled "Save"
      Then I should see "Sucess! Your changes have been saved!"

      #ACTION: Import data 
      Given I click on the link labeled "Data Import Tool"
      And  I upload a "csv" format file located at "redcap_val_fixtures\import_files\D.106.100_Data Import.csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
      And I should see "Your document was uploaded successfully and is ready for review."
      And I click on the button labeled "Import Data"
      Then I should see "Import Successful! 15 records were created or modified during the import."

      #ACTION: Add users 
      Given I click on the link labeled "User Rights"
      And I click on the button labeled "Upload or download users, roles, and assignments"
      And I click on the link labeled "Upload users (CSV)"
      And I upload a "csv" format file located at "redcap_val_fixtures\import_files\D.106.100_Users.csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload" to upload the file
      And I should see "Upload users (CSV) - Confirm"
      And I click on the button labeled "Upload" in the dialog box
      And I should see "5 users were added or updated"
      And I click on the button labeled "Close" in the dialog box

      #ACTION: Change field values
      Given I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      And I clear the field labeled "Name" 
      And I enter "John" into the data entry form field labeled "Name" 
      And  I clear the field labeled "email" 
      And I enter "John@email.com" into the data entry form field labeled "Email" 
      And I click on the button labeled "Save & Stay"
      And I logout

      #ACTION: Login as a Standard User
      Given I login to REDCap with the user "Test_User1" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.113.200"
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      And I clear the field labeled "Name"
      And I enter "Joe" into the data entry form field labeled "Name" 
      And I clear the field labeled "Email"
      And I enter "Joe@email.com" into the data entry form field labeled "Email" 
      And I click on the button labeled "Save & Stay"

      #ACTION: Verify History
      Given I click on the "History" icon for the field labeled "Name"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Data Changes Made  | 
            | mm/dd/yyyy hh:mm | test_admin | Tony Stone         |
            | mm/dd/yyyy hh:mm | test_admin | John               |
            | mm/dd/yyyy hh:mm | test_user1 | Joe                |
      Then I click on the button labeled "Close"
      Given I click on the "History" icon for the field labeled "Email"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Data Changes Made       | 
            | mm/dd/yyyy hh:mm | test_admin | tonystone@example.com   |
            | mm/dd/yyyy hh:mm | test_admin | John@email.com          |
            | mm/dd/yyyy hh:mm | test_user1 | Joe@email.com           |
      And I click on the button labeled "Close" in the dialog box
      And I logout


