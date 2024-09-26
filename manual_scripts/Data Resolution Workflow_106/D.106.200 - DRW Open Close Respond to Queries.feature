Feature: D.106.200 Data Resolution Workflow

As a REDCap end user
I want to see that I have the ability to open, close, reopen and respond to queries.
I want to see that I have the ability to filter issues based on records, fields, events and users.
I want to see that I have the ability to upload files to queries. 
I want to see that I have the ability to email and send messages via REDCap messenger with a link to issues.

Scenario: D.106.200 Open, close, read only, reopen and respond to queries based on user roles

      #ACTION: Data Resolution Workflow SETUP
      Given I login to REDCap with the user "Test_Admin" 
      And I create a new project named "D.106.200" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

      #Enable the Data Resolution Workflow (Data Queries)
      Given I click on the link labeled "Project Setup"
      And I click on the button labeled "Additional customizations"
      And I select "Data Resolution Workflow" in the dropdown field labeled "Enable:"
      Then I click on the button labeled "Save"
      Then I should see "The Data Resolution Workflow has now been enabled!"
      And I click on the button labeled "Close" in the dialog box

      #ACTION: Import data
      Given I click on the link labeled "Data Import Tool"
      And  I upload a "csv" format file located at "redcap_val_fixtures\import_files\D.106.100_Data Import.csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload file" to upload the file
      And I should see "Your document was uploaded successfully and is ready for review."
      And I click on the button labeled "Import Data"
      Then I should see "Import Successful! 15 records were created or modified during the import."

      #ACTION: Add users 
      Given I click on the link labeled "User Rights"
      And I click on the button labeled "Upload or download users, roles, and assignments"
      And I click on the link labeled "Upload users (CSV)"
      And I upload a "csv" format file located at "redcap_val_fixtures\D.106.100_Users.csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload" to upload the file
      And I should see "Upload users (CSV) - Confirm"
      And I click on the button labeled "Upload" in the dialog box
      And I should see "5 users were added or updated"
      And I click on the button labeled "Close" in the dialog box
      And I logout

      #ACTION: Open a new query and 'Assign Query' and notify via Email and Messenger
      Given I login to REDCap with the user "Test_User1" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      Given I click on the Data Resolution Workflow icon for the field labeled "Email"
      Given I click on the radio labeled "Open query" in the dialog box
      And I select "Test_User2" on the dropdown field labeled "Assign query to a user (optional): "
      And I select the checkbox option "Email" for the field labeled "Notify this user of their assignment using:" 
      And I select the checkbox option "REDCap Messenger" for the field labeled "Notify this user of their assignment using:"
      And I enter "Please check email" into the input field labeled "Comment:" 
      And I click on the button labeled "Open query"
      Then I should see a "red" exclamation icon for the input field labeled "Email"

      #VERIFY:
      #An email and a message on Messenger is sent to Test_User2
      And I logout

      #ACTION: Verify notification on Messenger and respond to query by uploading a file
      Given I login to REDCap with the user "Test_User2" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      And I click on the link labeled "REDCap Messenger"
      Then I should see "Assigned to a data query" 
      And I click on the link labeled "Assigned to a data query" 
      Then I should see a dialog containing the following text: "You have been assigned to a data query that was just opened in the REDCap project D.106.200." 
      And I click on the link labeled "Open the data query assigned to you:"
      # Then I should see a table header and row containing the following values in a table:
      #       | Record  | Data Quality rule and/or Field  | User Assigned     | First Update                     | 
      #       | 1       | email_v2                        | test_user2        |  test_user1 "Please check email" | 
      # When I click on the button labeled "Click button to view data query" for the row labeled "email_v2" 
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                              | 
            | mm/dd/yyyy hh:mm | test_user1 | Action: Opened query Comment:"Please check email" |
      And I select "Verified - Confirmed correct (no error)" on the dropdown field labeled "Reply with response"
      Given I upload a "csv" format file located at "/import_files/file1.csv", by clicking the button near "Upload file (optional)" to browse for the file, and clicking the button labeled "Upload File" to upload the file
      Then I should see "Document was successfully uploaded!"
      And I click on the button labeled "Close" in the dialog box
      And I enter "The value is correct - file1.csv uploaded" into the input field labeled "Comment:" 
      And I click on the button labeled "Respond to query"
      When I click on the button under "Click button to view data query" for the row labeled "email_v2" for record "1"
      Then I should see "Awaiting action by user with sufficient user privileges"
      And I click on the button labeled "Close" in the dialog box
      #There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match

      #ACTION: Verify Respond only to open queries
      Given I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      And I click on the Data Resolution Workflow icon for the field labeled "Name"
      Then I should NOT see "Open query" 
      Then I should see "Awaiting action by user with sufficient user privileges"
      And I click on the button labeled "Close" in the dialog box
      #There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match
      And I logout

      #ACTION: Download file attached to query and 'Send back for further attention'
      Given I login to REDCap with the user "Test_User1" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      And I click on the Data Resolution Workflow icon for the field labeled "Email"
      And  I download a file by clicking on the link labeled "file1.csv" 
      # file1.csv is downloaded
      And I click on the radio labeled "Send back for further attention" in the dialog box
      And I enter "Please clarify" into the input field labeled "Comment:" 
      And  I click on the button labeled "Send back for further attention"
      Then I should see a "red" exclamation icon for the input field labeled "Email"
      And I logout

      #ACTION: Verify User right 'Open queries only'
      Given I login to REDCap with the user "Test_User3" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      And I click on the Data Resolution Workflow icon for the field labeled "Email"
      Then I should NOT see "Close the query"
      And I should NOT see "Respond to query"
      And I should see "Awaiting action by user with sufficient user privileges"
      And I click on the button labeled "Close" in the dialog box
      #There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match

      #ACTION: Open a query
      Given I click on the Data Resolution Workflow icon for the field labeled "Name"
      And I select the radio labeled "Open query" in the dialog box
      And I enter "New query" into the input field labeled "Comment:" 
      And I click on the button labeled "Open query"
      Then I should see a "red" exclamation icon for the input field labeled "Name"
      Given I click on the Data Resolution Workflow icon for the field labeled "Name"
      Then  I should NOT see "Close the query"
      And I should NOT see "Respond to query"
      Then I should see "Awaiting action by user with sufficient user privileges"
      And I click on the button labeled "Close" in the dialog box
      #There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match
      And I logout

      #ACTION:Verify User right 'Open and respond to queries'
      Given I login to REDCap with the user "Test_User4" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      And I click on the Data Resolution Workflow icon for the field labeled "Email"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User   | Comments and Details                                         | 
            | mm/dd/yyyy hh:mm | test_user1 | Action: Sent back for further attention:"Please clarify" |
      Then I should NOT see "Close the query"
      And I should see "Reply with response: "
      And I select "Corrected – Typographical error" on the dropdown field labeled "Reply with response"
      And I enter "Corrected" into the input field labeled "Comment:" 
      And I click on the button labeled "Respond to query"
      Then I should see a "blue" exclamation icon for the input field labeled "Email"
      Given I click on the Data Resolution Workflow icon for the field labeled "Email"
      Then I should NOT see "Close the query"
      Then I should see "Awaiting action by user with sufficient user privileges"
      And I click on the button labeled "Close" in the dialog box
      #There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match
      And I logout

      #ACTION:Verify User right 'Open close and respond to queries'
      Given I login to REDCap with the user "Test_User1" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      And I click on the Data Resolution Workflow icon for the field labeled "Email"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments and Details                                         | 
            | mm/dd/yyyy hh:mm | test_user4 | Response:Corrected - Typographical error Comment:“Corrected” |
      And I click on the radio labeled "Close the query" in the dialog box
      And I enter "Closed" into the input field labeled "Comment:" 
      And  I click on the button labeled "Close the query"
      Then I should see a "green" exclamation icon for the input field labeled "Email"
      And I logout

      #ACTION: Verify User right 'Open and respond to queries' (Open query)
      Given I login to REDCap with the user "Test_User4" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      And I click on the Data Resolution Workflow icon for the field labeled "Email"
      Then I should see "Reopen the closed query"
      Given I check the checkbox labeled "Reopen the closed query" 
      And I enter "Reopen the closed query" into the input field labeled "Comment:"
      And I click on the button labeled "Reopen query"
      Then I should see a "red" exclamation icon for the input field labeled "Email"
      Given I click on the Data Resolution Workflow icon for the field labeled "Email"
      Then I should NOT see "Close the query"
      And I click on the button labeled "Close" in the dialog box
      And I logout

      #ACTION: Assign user rights
      Given I login to REDCap with the user "Test_Admin" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      When I click on the link labeled "User Rights"
      And I click on the link "Test_User3"
      And I click on the button labeled "Edit user privileges"
      And I click on the radio labeled "No access" in the dialog box
      And I click on the button labeled "Save Changes"
      And I click on the link "Test_User4"
      And I click on the button labeled "Edit user privileges"
      And  I click on the radio labeled "View only" in the dialog box
      And I click on the button labeled "Save Changes"
      And I logout

      #ACTION: Verify 'No access' user rights
      Given I login to REDCap with the user "Test_User3" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      And I click on the link labeled "Record Status Dashboard"
      And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
      Then I should NOT see Data Resolution Workflow icon
      And I logout

      #ACTION: Verify 'View only' user rights
      Given I login to REDCap with the user "Test_User4" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      And I click on the link labeled "Record Status Dashboard"
      And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
      And I click on the Data Resolution Workflow icon for the field labeled "Name"
      Then I should see "Awaiting action by user with sufficient user privileges"
      And I click on the button labeled "Close" in the dialog box
      #There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match
      And I logout

      #VERIFY:
      # I export all logging from the project and verify the result against expected logging results for this version of REDCap

      #ACTION: Check logging (Use download step definition above or)
      Given I login to REDCap with the user "Test_Admin" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      When I click on the link labeled "Logging"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | Username   | Action       | List of Data Changes OR Fields Exported                                                                 |
            | mm/dd/yyyy hh:mm | test_user1 | Manage/Design| Close data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: "Closed")         |
            | mm/dd/yyyy hh:mm | test_user4 | Manage/Design| Respond to data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: "Corrected") |
            | mm/dd/yyyy hh:mm | test_user3 | Manage/Design| Open data query (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: "New query")       |
      Then I logout

      #VERIFY:
      # I export all logging from the project and verify the result against expected logging results for this version of REDCap

      #ACTION: Verify filtering
      Given I login to REDCap with the user "Test_User1" 
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.200"
      When I click on the link labeled "Resolve Issues"
      When I select the "All status types(2)" option from the Filters dropdown field identified by 'choose_status_type'
      Then I should see a table header and row containing the following values in a table:
            | Record    | Data Quality rule and/or Field  | User Assigned  | First Update                    | Last Update                             |
            | 1         | ptname_v2_v2                    |                | test_user3 "New query"          | [same as first update]                  |
            | 1         | email_v2                        | test_user2     | test_user1 "Please check email" | test_user4 "Reopen the closed query"    |
      And  I download a file by clicking on the link labeled "Export" 
      #VERIFY:
      #A csv file with both query information downloads 
      And I select the "Open unresponded(2)" option from the Filters dropdown field identified by 'choose_status_type'
      Then I should see a table header and row containing the following values in a table:
            | Record    | Data Quality rule and/or Field  | User Assigned  | First Update                    | Last Update                             |
            | 1         | ptname_v2_v2                    |                | test_user3 "New query"          | [same as first update]                  |
            | 1         | email_v2                        | test_user2     | test_user1 "Please check email" | test_user4 "Reopen the closed query"    |
      And I select the "All status types(2)" option from the Filters dropdown field identified by 'choose_status_type'
      Given I select the "email_v2(1)" option from the Filters dropdown field with identified by 'choose_field_rule'
      Then I should see a table header and row containing the following values in a table:
            | Record   | Data Quality rule and/or Field  | User Assigned  | First Update                    | Last Update                          |
            | 1        | email_v2                        | test_user2     | test_user1 "Please check email" | test_user4 "Reopen the closed query" |

      When I select the "Event 1 (Arm 1: Arm 1)" option from the Filters dropdown field with identified by 'choose_event'
      Then I should see a table header and row containing the following values in a table:
            | Record    | Data Quality rule and/or Field  | User Assigned  | First Update                    | Last Update                          |
            | 1         | email_v2                        | test_user2     | test_user1 "Please check email" | test_user4 "Reopen the closed query" |
      Given I select the "Test_User3" option from the Filters dropdown field with identified by 'choose_assigned_user'
      Then I should see "No results to display"
      And I logout



