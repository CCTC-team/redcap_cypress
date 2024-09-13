Feature: D.106.800 Data Resolution Workflow

As a REDCap end user
I want to see that I have the ability to add comments to fields. 
I want to see that I have the ability to filter comments based on records, events, fields, users and keywords.

Scenario: D.106.800 The system shall have the ability to add comments to fields.

#ACTION: Data Resolution Workflow SETUP
Given I login to REDCap with the user "Test_Admin" 
And I create a new project named "D.106.800" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

#ACTION: Enable Field Comment Log
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Additional customizations"
And I uncheck the checkbox labeled "Allow users to edit or delete Field Comments" in the dialog box 
Then I click on the button labeled "Save"
Then I should see "Success! Your changes have been saved"

#ACTION: Import data
And I click on the link labeled "Data Import Tool"
And  I upload a "csv" format file located at "cypress\fixtures\redcap_val_fixtures\D.106.100_Data_Import", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload file" to upload the file
And I should see "Your document was uploaded successfully and is ready for review."
And I click on the button labeled "Import Data"
Then I should see "Import Successful! 15 records were created or modified during the import."

#ACTION: Add users 
Given I click on the link labeled "User Rights"
And I click on the button labeled "Upload or download users, roles, and assignments"
And I click on the link labeled "Upload users (CSV)"
And I upload a "csv" format file located at "cypress\fixtures\redcap_val_fixtures\D.106.100_Users", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload" to upload the file
And I should see "Upload users (CSV) - Confirm"
And I click on the button labeled "Upload" in the dialog box
And I should see "5 users were added or updated"
And I click on the button labeled "Close" in the dialog box
And I logout


#ACTION: Add field comments

Given I login to REDCap with the user "Test_User1" 
Given I click on the link labeled "My Projects"
And I click on the link labeled "D.106.800"
And I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the "Field comments" icon for the field labeled "Name"
And I enter "Comment 1" into the input field labeled "dc-comment" 
And  I click on the button labeled "Comment"
And I click on the "Field comments" icon for the field labeled "Name"
And I enter "Comment 2" into the input field labeled "dc-comment" 
And  I click on the button labeled "Comment"
And I logout

Given I login to REDCap with the user "Test_User2" 
And I click on the link labeled "D.106.800"
And I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the "Field comments" icon for the field labeled "Name"
And I enter "Comment 3" into the input field labeled "dc-comment" 
And  I click on the button labeled "Comment"
And I click on the "Field comments" icon for the field labeled "Email"
And I enter "Comment 4" into the input field labeled "dc-comment" 
And I click on the button labeled "Comment"
And I click on the "Field comments" icon for the field labeled "Name"
Then I should see a table header and row containing the following values in a table:
      | Date / Time      | User       | Comments  | 
      | mm/dd/yyyy hh:mm | Test_User1 | Comment 1 |
      | mm/dd/yyyy hh:mm | Test_User1 | Comment 2 |
      | mm/dd/yyyy hh:mm | test_user2 | Comment 3 |
And I click on the button labeled "Cancel"
And I logout

#ACTION: Verify filtering
Given I login to REDCap with the user "Test_User1" 
And I click on the link labeled "D.106.800"
When I click on the link labeled "Field Comment Log"
When I select the "1" option from the Filters dropdown field identified by 'choose_record'
And I click on the button labeled "Apply filters"
Then I should see a table header and row containing the following values in a table:
      | Record  | Field        | Comments                                                               |
      | 1       | ptname_v2_v2 | Test_User1: "Comment 1" Test_User1: "Comment 2" Test_User2: "Comment 3"|
      | 1       | email_v2     | test_user2: "Comment 4"                                                |
When I select the "ptname_v2_v2 (Name)" option from the Filters dropdown field identified by 'choose_field'
And I click on the button labeled "Apply filters"
Then I should see a table header and row containing the following values in a table:
      | Record  | Field        | Comments                                                               |
      | 1       | ptname_v2_v2 | Test_User1: "Comment 1" Test_User1: "Comment 2" Test_User2: "Comment 3"|                              
When I select the "All records" option from the Filters dropdown field identified by 'choose_record'
And I select the "All fields" option from the Filters dropdown field identified by 'choose_field'
And I select the "Test_User1" option from the Filters dropdown field identified by 'choose_user'
And I click on the button labeled "Apply filters"
Then I should see a table header and row containing the following values in a table:
      | Record  | Field        | Comments                                                               |
      | 1       | ptname_v2_v2 | Test_User1: "Comment 1" Test_User1: "Comment 2" test_user2: "Comment 3"|  
Given I select the "All users" option from the Filters dropdown field identified by 'choose_user'
And I enter "Comment" into the input field labeled 'choose_keyword'
And I click on the button labeled "Apply filters"
Then I should see a table header and row containing the following values in a table:
      | Record  | Field        | Comments                                                               |
      | 1       | ptname_v2_v2 | Test_User1: "Comment 1" Test_User1: "Comment 2" test_user2: "Comment 3"|
      | 1       | email_v2     | test_user2: "Comment 4"                                                |
Given I enter "Comments" into the input field labeled 'choose_keyword'
And I click on the button labeled "Apply filters"
Then I should see "[Returned no results]"
And I logout

