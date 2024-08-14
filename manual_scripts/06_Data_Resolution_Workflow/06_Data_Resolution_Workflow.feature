Feature: D.106.100 Data Resolution Workflow 

As a REDCap end user
I want to see that I have the ability to open, close, read only, reopen and respond to queries based on user roles
I want to see that I have the ability to attach files to queries and make them available to download based on user roles. 

Scenario: D.106.100 Open, close, read only, reopen and respond to queries based on user roles

#Data Resolution Workflow SETUP
Given I login to REDCap with the user "test_admin" 
And I create a new project named "Project_redcap_val" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_CUH_v138.xml", and clicking the "Create Project" button
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
And I click on the link labeled "Project_CUH_v1381"
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
And I click on the link labeled "Project_CUH_v1381"
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

#ACTION: Assign Query and notify via Email and Messenger

Given I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
Given I click on the radio labeled "Open query" in the dialog box
And I select "test_user" on the dropdown field labeled "Assign query to a user (optional): "
And I select the checkbox option "Email" for the field labeled "Notify this user of their assignment using:" 
And I select the checkbox option "REDCap Messenger" for the field labeled "Notify this user of their assignment using:"
And I enter "Please check email" into the input field labeled "Comment:" 
And I click on the button labeled "Open query"
Then I should see a red exclamation icon for the input field labeled "Email"
#An email and a message on Messenger is sent to test_user
And I logout
 
#ACTION: Verify notification of assigned query in REDCap Messenger and ability to "Respond only" to queries as per User Rights + Ability to attach files to queries and make them available to download based on user roles. 

Given I login to REDCap with the user "test_user" 
And I click on the link labeled "Project_CUH_v1381"
And I click on the link labeled "REDCap Messenger"
Then I should see "Assigned to a data query" 
And I click on the link labeled "Assigned to a data query" 
Then I should see "You have been assigned to a data query that was just opened in the REDCap project "Project_CUH_v1381""
And I click near the link labeled "Open the data query assigned to you:"
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Data Quality rule and/or Field  | User Assigned  | First Update | 
      | 1 | email_v2 | test_user |  test_user2 "Please check email" | 
When I click on the button labeled "Click button to view data query" for the row labeled "email_v2" 
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Date / Time      | User   | Comments and Details   | 
      | mm/dd/yyyy hh:mm | test_user2 | Action: Opened query Comment:"Please check email" |
## A similar email is also received by the test_user
# And I click on the link labeled "My Projects"
# And I click on the link labeled "Project_CUH_v1381"
# And I click on the link labeled "Record Status Dashboard"
# And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
# And I click on the Data Resolution Workflow icon for the field labeled "Email"
And I select "Verified - Confirmed correct (no error)" on the dropdown field labeled "Reply with response"
Given I upload a "csv" format file located at "/import_files/file1.csv", by clicking the button near "Upload file (optional)" to browse for the file, and clicking the button labeled "Upload File" to upload the file
Then I should see "Document was successfully uploaded"
And I click on the button labeled "Close" in the dialog box
And I enter "The value is correct" into the input field labeled "Comment:" 
And I click on the button labeled "Respond to query"
Then I should see a blue exclamation icon for the input field labeled "Email"
And I click on the Data Resolution Workflow icon for the field labeled "Email"
Then I should see "Awaiting action by user with sufficient user privileges"
And I click on the button labeled "Close" in the dialog box

#ACTION: 
When I click on the link labeled "Resolve Issues"
And I select the "Open responded" option from the Filters dropdown field identified by 'choose_status_type'
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Data Quality rule and/or Field  | User Assigned  | Days Open | First Update | Last Update |
      | 1 | email_v2 |  |  | test_user2 "Please check email" | test_user "The value is correct" |
When I select the "All status types" option from the Filters dropdown field identified by 'choose_status_type'
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Data Quality rule and/or Field  | User Assigned  | Days Open | First Update | Last Update |
      | 1 | ptname_v2_v2 |  |  | test_user2 "" | test_user2 "Test de-verify data" |
      | 1 | email_v2 |  |  | test_user2 "Please check email" | test_user "The value is correct" |
And  I download a file by clicking on the link labeled "Export" 
#A csv file with both query information downloads 
When I select the "Data De-verified" option from the Filters dropdown field identified by 'choose_status_type'
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Data Quality rule and/or Field  | User Assigned  | Days Open | First Update | Last Update |
      | 1 | ptname_v2_v2 |  |  | test_user2 "" | test_user2 "Test de-verify data" |
When  I click on the button labeled "Click button to view data query" for the row labeled "ptname_v2_v2" 
Then I should see "Awaiting action by user with sufficient user privileges"
And I click on the button labeled "Close" in the dialog box

Step 13:
When I select the "All status types" option from the Filters dropdown field identified by 'choose_status_type'
And I select the "email_v2" option from the Filters dropdown field with identified by 'choose_field_rule'
And I select the "Event 1" option from the Filters dropdown field with identified by 'choose_event'
And I select the "test_user" option from the Filters dropdown field with identified by 'choose_assigned_user'
Then I should see "No results to display"
And I logout
 
Step 14:
Given I login to REDCap with the user "test_user2" 
And I click on the link labeled "Project_CUH_v1381"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see "Data De-verified"
Given  I select the radio option " Verified data value" in the dialog box
And  I click on the button labeled "Verified data value" 
Then I should see a green tick icon for the input field labeled "Name"

Step 15:
Given I click on the Data Resolution Workflow icon for the field labeled "Email"
And  I download a file by clicking on the link labeled "send-it.csv" 
# send-it.csv is downloaded
And I select the radio option "Send back for further attention" in the dialog box
And  I enter "Please clarify" into the field identified by "dc-comment" 
And  I click on the button labeled "Send back for further attention"
Then I should see a red exclamation icon for the input field labeled "Email"
And I logout

Step 16:
Given I login to REDCap with the user "test_user" 
And I click on the link labeled "Project_CUH_v1381"
When  I click on the link labeled "Resolve Issues"
And I select the "Open / unresolved issues" option from the Filters dropdown field identified by 'choose_status_type'

Step 17:
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Data Quality rule and/or Field  | User Assigned  | Days Open | First Update | Last Update |
      | 1 | email_v2 |  |  | test_user2 "Please check email" | test_user2 "Please clarify" |
When  I click on the button labeled "Click button to view data query" for the row labeled "email_v2" for Record "1"
And I select "Corrected – Typographical error" on the dropdown field labeled "Reply with response"
And  I enter "Corrected" into the field identified by "dc-comment" 
And  I click on the button labeled "Respond to query"
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Data Quality rule and/or Field  | User Assigned  | Days Open | First Update | Last Update |
      | 1 | email_v2 |  |  | test_user2 "Please check email" | test_user "Corrected" |
When  I click on the button labeled "Click button to view data query" for the row labeled "email_v2" for Record "1"

Step 18:
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I enter "Joe" into the input field labeled "Name" 
And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
Then I should see a red exclamation icon for the input field labeled "Name"
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Date / Time      | User   | Comments and Details   | 
      | mm/dd/yyyy hh:mm | test_user2 | Action:De-verified data value (automatically via data change) |
And I click on the button labeled "Close" in the dialog box
And I logout

Step 19:
Given I login to REDCap with the user "test_user2" 
And I click on the link labeled "Project_CUH_v1381"
When I click on the link labeled "Resolve Issues"
And I select the "Open responded" option from the Filters dropdown field identified by 'choose_status_type'
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Data Quality rule and/or Field  | User Assigned  | Days Open | First Update | Last Update |
      | 1 | email_v2 |  |  | test_user2 "Please check email" | test_user "Corrected" |

Step 20:
When  I click on the button labeled "Click button to view data query" for the row labeled "email_v2" for record "1"
And I click on the Data Resolution Workflow icon for the field labeled "Email"
Given  I select the radio option "Close the query" in the dialog box

Step 21:
And  I enter "Closed" into the field identified by "dc-comment" 
And  I click on the button labeled "Close the query" 
Then I should see a green tick icon for the input field labeled "Email"
And I logout

Step 22:
Given I login to REDCap with the user "test_user" 
And I click on the link labeled "Project_CUH_v1381"
When I click on the link labeled "Resolve Issues"
And I select the "Closed /resolved issues" option from the Filters dropdown field identified by 'choose_status_type'
Then I should see "No results to display"

Step 23:
Given I select the "Open / unresolved issues" option from the Filters dropdown field identified by 'choose_status_type'
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Data Quality rule and/or Field  | User Assigned  | Days Open | First Update | Last Update |
      | 1 | email_v2 |  |  | test_user2 "Please check email" | test_user2 "Closed" |

Step 24:
Given I login to REDCap with the user "test_admin" 
And I click on the link labeled "Project_CUH_v1381"
When I click on the link labeled "User Rights"
And I click "test_user"
And I click "Edit user privileges"
And  I select "No access" under "Data Resolution Workflow"
And I click "Save Changes"

Step 25:
And I click "test_user2"
And I click "Edit user privileges"
And  I select "View only" under "Data Resolution Workflow"
And I click "Save Changes"
And I logout

Step 26:
Given I login to REDCap with the user "test_user" 
And I click on the link labeled "Project_CUH_v1381"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
Then  I should NOT see Data Resolution Workflow icon
And I logout

Step 27:
Given I login to REDCap with the user "test_user2" 
And I click on the link labeled "Project_CUH_v1381"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then  I should NOT see "Open query" 
Then  I should NOT see "Close the query"
Then  I should NOT see "Respond to query"
Then I should see "Awaiting action by user with sufficient user privileges"
And I click on the button labeled "Close" in the dialog box
And I logout

Step 28:
Given I login to REDCap with the user "test_admin" 
And I click on the link labeled "Project_CUH_v1381"
When I click on the link labeled "User Rights"
And I click "test_user"
And I click "Edit user privileges"
And  I select "Open queries only" under "Data Resolution Workflow"
And I click "Save Changes"

Step 29:
And I click "test_user2"
And I click "Edit user privileges"
And  I select "Open and respond to queries" under "Data Resolution Workflow"
And I click "Save Changes"
And I logout

Step 30:
Given I login to REDCap with the user "test_user" 
And I click on the link labeled "Project_CUH_v1381"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
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

Step 31:
Given I login to REDCap with the user "test_user2" 
And I click on the link labeled "Project_CUH_v1381"
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
Step 31a: Check logging (Use download step definition above or)
Given I login to REDCap with the user "test_admin" 
And I click on the link labeled "Project_CUH_v1381"
When I click on the link labeled "Logging"
Then I should see recent changes under "test_user" loggged as "Open data query Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: Reopen the closed query"
Then I should see recent changes under "test_user2" logged as "Respond to data query Record: 251-1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: Response"

Step 32:
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Additional customizations"
And I select "Field comment log" in the field identified by "data_resolution_enabled"
Then I click on the button labeled "Save"
And I logout

Step 33:
Given I login to REDCap with the user "test_user" 
And I click on the link labeled "My Projects"
And I click on the link labeled "Project_CUH_v1381"
And I click on the link labeled "Record Status Dashboard"
And I click on the link labeled "Add new Record for this arm"
And I click the bubble to add a record for the "Text Validation" longitudinal instrument on event "Event 1"
And I enter "John" into the input field labeled "Name" 
And I enter "John@example.com" into the input field labeled "Email" 
And I select "Complete" on the dropdown field labeled "Complete?"
And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
Then I should see "Record ID 2 successfully added"

Step 34:
Given  I click on the bubble for the "Text Validation" data collection instrument for record ID "2"
And I click on the Field Comment Log icon for the input field labeled "Name"
And  I enter "Comment 1" into the field identified by "dc-comment" 
And  I click on the button labeled "Comment"
Then I should see a yellow icon for the input field labeled "Name"
Given I click on the Field Comment Log icon for the input field labeled "Email"
And  I enter "Comment 2" into the field identified by "dc-comment" 
And  I click on the button labeled "Comment"
Then I should see a yellow icon for the input field labeled "Email"
When  I click on the link labeled "Field Comment Log"
And  I download a file by clicking on the link labeled "Export entire log" 
#A csv file with the two entries is downloaded 
Given I select the "Record 1" option from the Filters dropdown field indentified by 'choose_record'
And  I click on the button labeled "Apply filters"
Then I should see "[Returned no results]"
Given I select the "Record 2" option from the Filters dropdown field indentified by 'choose_record'
And I select the "email_v2" option from the Filters dropdown field indentified by 'choose_field'
And  I click on the button labeled "Apply filters"
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Field  | Comments |
      | 2 | ptname_v2_v2 | test_user "Comment 1" |
      | 2 | email_v2 | test_user "Comment 2" |
And I logout

Step 35: 
Given I login to REDCap with the user "test_user2" 
And I click on the link labeled "My Projects"
And I click on the link labeled "Project_CUH_v1381"
And I click on the link labeled "Record Status Dashboard"
Given  I click on the bubble for the "Text Validation" data collection instrument for record ID "2"
And I click on the Field Comment Log icon for the input field labeled "Name"
And  I enter "Comment 3 test" into the field identified by "dc-comment" 
And  I click on the button labeled "Comment"
Then I should see a yellow icon for the input field labeled "Name"
When  I click on the link labeled "Field Comment Log"
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Field  | Comments |
      | 2 | ptname_v2_v2 | test_user "Comment 1" test_user2 "Comment 3 test" |
      | 2 | email_v2 | test_user "Comment 2" |
Given I select the "Event 1(Arm 1: Arm1)" option from the Filters dropdown field indentified by 'choose_event'
Given I select the "test" option from the Filters dropdown field indentified by 'choose_keyword'
And  I click on the button labeled "Apply filters"
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Field  | Comments |
      | 2 | ptname_v2_v2 | test_user2 "Comment 3 test" |
And I logout



