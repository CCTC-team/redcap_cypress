Feature: D.106.100_A Data Resolution Workflow

As a REDCap end user
I want to see that I have the ability to open, close, read only, reopen and respond to queries based on user roles
I want to see that I have the ability to attach files to queries and make them available to download based on user roles. 

Scenario: D.106.100_A Open, close, read only, reopen and respond to queries based on user roles

#Data Resolution Workflow SETUP
Given I login to REDCap with the user "test_admin" 
And I create a new project named "D.106.100_A" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
#Enable the Data Resolution Workflow (Data Queries)
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Additional customizations"
And I select "Data Resolution Workflow" in the field identified by "data_resolution_enabled"
Then I click on the button labeled "Save"

When I click on the link labeled "User Rights"
And I enter "test_user" into the field identified by "new_username"
And I click on the button labeled "Add with custom rights"
And I click "Edit user privileges"
And I check the checkbox labeled "record_create"
And I select "Respond only to opened queries" under "Data Resolution Workflow"
And I click "Save Changes"
Given I enter "test_user2" into the field identified by "new_username"
And I click on the button labeled "Add with custom rights"
And I click "Edit user privileges"
And I select "Open, close, and respond to queries" under "Data Resolution Workflow"
And I click on the button labeled "Save Changes"
And I logout

#ACTION: Create record

Given I login to REDCap with the user "test_user" 
And I click on the link labeled "My Projects"
And I click on the link labeled "D.106.100_A"
And I click on the link labeled "Record Status Dashboard"
And I click on the link labeled "Add new Record for this arm"
And I click the bubble to add a record for the "Text Validation" longitudinal instrument on event "Event 1"
And I enter "John" into the input field labeled "Name" 
And I enter "John@example.com" into the input field labeled "Email" 
And I select "Complete" on the dropdown field labeled "Complete?"
And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
Then I should see "Record ID 1 successfully added"
And I logout

#ACTION: Verify and de-verify data

Given I login to REDCap with the user "test_user2" 
And I click on the link labeled "My Projects"
And I click on the link labeled "D.106.100_A"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Date / Time      | User   | Comments and Details   | 
      | mm/dd/yyyy hh:mm | test_user | Data Changes Made: ptname_v2_v2 = 'John' |
Given I click on the radio labeled "Verified data value"
And I click on the button labeled "Verified data value" 
Then I should see a green tick icon for the input field labeled "Name"
Given I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Date / Time      | User   | Comments and Details   | 
      | mm/dd/yyyy hh:mm | test_user | Data Changes Made: ptname_v2_v2 = 'John' |
      | mm/dd/yyyy hh:mm | test_user2 | Action:Verified data value |
Given I click on the radio labeled "De-verify data value"
And I click on the button labeled "De-verify data value"
Then I should see a dialog containing the following text: "A comment is required. Please enter a comment." 
And I click on the button labeled "Close" in the dialog box
And I enter "Test de-verify data" into the input field labeled "Comment:"
And I click on the button labeled "De-verify data value"
Then I should see a red exclamation icon for the input field labeled "Name"

Given I click on the link labeled "Resolve Issues"
And I select the "All status type" option from the Filters dropdown field indentified by 'choose_status_type'
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Data Quality rule and/or Field | First Update | Last Update |
      | 1 | ptname_v2_v2 | test_user2 "" | test_user2 "Test de-verify data" |
And I click on the button labeled "Close" in the dialog box
And I logout

#ACTION: Verify user privilages to verify/deverify data

Given I login to REDCap with the user "test_user" 
And I click on the link labeled "D.106.100_A"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see "Awaiting action by user with sufficient user privileges"
And I should not see "Verified data value"
And I logout

#ACTION: Verify automatic De-verified status due to data change

Given I login to REDCap with the user "test_user2" 
And I click on the link labeled "D.106.100_A"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see "Data De-verified"
Given  I select the radio option " Verified data value" in the dialog box
And  I click on the button labeled "Verified data value" 
Then I should see a green tick icon for the input field labeled "Name"
Given I enter "Joe" into the input field labeled "Name" 
And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
Then I should see a red exclamation icon for the input field labeled "Name"
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Date / Time      | User   | Comments and Details   | 
      | mm/dd/yyyy hh:mm | test_user2 | Action:De-verified data value (automatically via data change) |
And I click on the button labeled "Close" in the dialog box

#ACTION: Open a new query and 'Assign Query' and notify via Email and Messenger

Given I click on the Data Resolution Workflow icon for the field labeled "Email"
Given I click on the radio labeled "Open query" in the dialog box
And I select "test_user" on the dropdown field labeled "Assign query to a user (optional): "
And I select the checkbox option "Email" for the field labeled "Notify this user of their assignment using:" 
And I select the checkbox option "REDCap Messenger" for the field labeled "Notify this user of their assignment using:"
And I enter "Please check email" into the input field labeled "Comment:" 
And I click on the button labeled "Open query"
Then I should see a red exclamation icon for the input field labeled "Email"
#An email and a message on Messenger is sent to test_user
And I logout

#ACTION: Verify notification on Messenger and respond to query by uploading a file

Given I login to REDCap with the user "test_user" 
And I click on the link labeled "D.106.100_A"
And I click on the link labeled "REDCap Messenger"
Then I should see "Assigned to a data query" 
And I click on the link labeled "Assigned to a data query" 
Then I should see "You have been assigned to a data query that was just opened in the REDCap project "D.106.100_A""
And I click near the link labeled "Open the data query assigned to you:"
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Data Quality rule and/or Field  | User Assigned  | First Update | 
      | 1 | email_v2 | test_user |  test_user2 "Please check email" | 
When I click on the button labeled "Click button to view data query" for the row labeled "email_v2" 
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Date / Time      | User   | Comments and Details   | 
      | mm/dd/yyyy hh:mm | test_user2 | Action: Opened query Comment:"Please check email" |
And I select "Verified - Confirmed correct (no error)" on the dropdown field labeled "Reply with response"
Given I upload a "csv" format file located at "/import_files/file1.csv", by clicking the button near "Upload file (optional)" to browse for the file, and clicking the button labeled "Upload File" to upload the file
Then I should see "Document was successfully uploaded"
And I click on the button labeled "Close" in the dialog box
And I enter "The value is correct" into the input field labeled "Comment:" 
And I click on the button labeled "Respond to query"
When  I click on the button labeled "Click button to view data query" for the row labeled "email_v2" for record "1"
Then I should see "Awaiting action by user with sufficient user privileges"
And I click on the button labeled "Close" in the dialog box
And I logout

#ACTION: Download file attached to query and 'Send back for further attention'

Given I login to REDCap with the user "test_user2" 
And I click on the link labeled "D.106.100_A"
And I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
And  I download a file by clicking on the link labeled "file1.csv" 
# file1.csv is downloaded
And I select the radio option "Send back for further attention" in the dialog box
And  I enter "Please clarify" into the field identified by "dc-comment" 
And  I click on the button labeled "Send back for further attention"
Then I should see a red exclamation icon for the input field labeled "Email"
And I logout

#ACTION: Verify User right 'Respond only to open queries'

Given I login to REDCap with the user "test_user" 
And I click on the link labeled "D.106.100_A"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
And I select "Corrected – Typographical error" on the dropdown field labeled "Reply with response"
And  I enter "Corrected" into the field identified by "dc-comment" 
And  I click on the button labeled "Respond to query"
Then I should see a blue exclamation icon for the input field labeled "Email"
Given I click on the Data Resolution Workflow icon for the field labeled "Email"
Then  I should NOT see "Close the query"
Then I should see "Awaiting action by user with sufficient user privileges"
And I click on the button labeled "Close" in the dialog box
And I logout

Given I login to REDCap with the user "test_user2" 
And I click on the link labeled "D.106.100_A"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
When  I click on the button labeled "Click button to view data query" for the row labeled "email_v2" for record "1"
And I click on the Data Resolution Workflow icon for the field labeled "Email"
Given I select the radio option "Close the query" in the dialog box
And  I enter "Closed" into the field identified by "dc-comment" 
And  I click on the button labeled "Close the query" 
Then I should see a green tick icon for the input field labeled "Email"
And I logout

#ACTION: Change user rights

Given I login to REDCap with the user "test_admin" 
And I click on the link labeled "D.106.100_A"
When I click on the link labeled "User Rights"
And I click "test_user"
And I click "Edit user privileges"
And  I select "No access" under "Data Resolution Workflow"
And I click "Save Changes"
And I click "test_user2"
And I click "Edit user privileges"
And  I select "View only" under "Data Resolution Workflow"
And I click "Save Changes"
And I logout

#ACTION: Verify 'No access' and 'View only' user rights

Given I login to REDCap with the user "test_user" 
And I click on the link labeled "D.106.100_A"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
Then  I should NOT see Data Resolution Workflow icon
And I logout
Given I login to REDCap with the user "test_user2" 
And I click on the link labeled "D.106.100_A"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should NOT see "Open query" 
Then I should NOT see "Close the query"
Then I should NOT see "Respond to query"
And I click on the button labeled "Close" in the dialog box
And I logout

#ACTION: Change user rights

Given I login to REDCap with the user "test_admin" 
And I click on the link labeled "D.106.100_A"
When I click on the link labeled "User Rights"
And I click "test_user"
And I click "Edit user privileges"
And  I select "Open queries only" under "Data Resolution Workflow"
And I click "Save Changes"
And I click "test_user2"
And I click "Edit user privileges"
And  I select "Open and respond to queries" under "Data Resolution Workflow"
And I click "Save Changes"
And I logout

#ACTION: Verify 'Open queries only' user rights

Given I login to REDCap with the user "test_user" 
And I click on the link labeled "D.106.100_A"
And I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
And I click on the Data Resolution Workflow icon for the field labeled "Email"
Given I check the checkbox labeled "Reopen the closed query" 
And  I enter "Reopen the closed query" into the field identified by "dc-comment"
And  I click on the button labeled "Reopen query"
Then I should see a red exclamation icon for the input field labeled "Email"
Given I click on the Data Resolution Workflow icon for the field labeled "Email"
Then  I should NOT see "Close the query"
Then  I should NOT see "Respond to query"
Then I should see "Awaiting action by user with sufficient user privileges"
And I click on the button labeled "Close" in the dialog box
And I logout

#ACTION: Verify 'Open and respond to queries' user rights

Given I login to REDCap with the user "test_user2" 
And I click on the link labeled "D.106.100_A"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Given  I select the radio option "Open query" in the dialog box
And  I enter "New query" into the field identified by "dc-comment" 
And  I click on the button labeled "Open query"
Then I should see a red exclamation icon for the input field labeled "Name"
Given I click on the Data Resolution Workflow icon for the field labeled "Email"
And I select "Corrected - Data missing" on the dropdown field labeled "Reply with response"
And  I enter "Response" into the field identified by "dc-comment" 
And  I click on the button labeled "Respond to query"
Then I should see a blue exclamation icon for the input field labeled "Email"
Given I click on the Data Resolution Workflow icon for the field labeled "Email"
Then  I should NOT see "Close the query"
Then I should see "Awaiting action by user with sufficient user privileges"
And I click on the button labeled "Close" in the dialog box
And I logout

# I export all logging from the project and verify the result against expected logging results for this version of REDCap
#ACTION: Check logging (Use download step definition above or)

Given I login to REDCap with the user "test_admin" 
And I click on the link labeled "D.106.100_A"
When I click on the link labeled "Logging"
Then I should see recent changes under "test_user" loggged as "Open data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: "Reopen the closed query")"
Then I should see recent changes under "test_user2" logged as "Respond to data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: "Response")"
Then I should see recent changes under "test_user2" logged as "Open data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: ptname_v2_v2, Comment: "New Query")"
Then I logout


