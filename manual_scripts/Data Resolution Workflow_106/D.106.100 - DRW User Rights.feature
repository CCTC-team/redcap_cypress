Feature: D.106.100 Data Resolution Workflow

As a REDCap end user
I want to see that I have the ability to allow Data Resolution Workflow rights to be (No Access, View only, Open queries only, Respond only to opened queries, Open and respond to queries; Open, close, and respond to queries).


Scenario: D.106.100 Allow Data Resolution Workflow rights to be (No Access, View only, Open queries only, Respond only to opened queries, Open and respond to queries; Open, close, and respond to queries).

#ACTION: Data Resolution Workflow SETUP
Given I login to REDCap with the user "Test_Admin" 
And I create a new project named "D.106.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

#ACTION: Enable the Data Resolution Workflow (Data Queries)
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Additional customizations"
And I select "Data Resolution Workflow" on the dropdown field labeled "Enable:"
Then I click on the button labeled "Save"
Then I should see "The Data Resolution Workflow has now been enabled!"
And I click on the button labeled "Close" in the dialog box

#ACTION: Import data 
Given I click on the link labeled "Data Import Tool"
And  I upload a "csv" format file located at "cypress\fixtures\redcap_val_fixtures\import_files\D.106.100_Data_Import", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
And I should see "Your document was uploaded successfully and is ready for review."
And I click on the button labeled "Import Data"
Then I should see "Import Successful! 15 records were created or modified during the import."

#ACTION: Add users 
Given I click on the link labeled "User Rights"
And I click on the button labeled "Upload or download users, roles, and assignments"
And I click on the link labeled "Upload users (CSV)"
And I upload a "csv" format file located at "cypress\fixtures\redcap_val_fixtures\import_files\D.106.100_Users", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload" to upload the file
And I should see "Upload users (CSV) - Confirm"
And I click on the button labeled "Upload" in the dialog box
And I should see "5 users were added or updated"
And I click on the button labeled "Close" in the dialog box

#ACTION: Open a query
Given I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
And I click on the radio labeled "Open query" in the dialog box
And I enter "Query 1" into the input field labeled "Comment:" 
And I click on the button labeled "Open query"
Then I should see a red exclamation icon for the input field labeled "Email"
And I logout

#ACTION: Verify access right 'Open close and respond to queries'
Given I login to REDCap with the user "Test_User1" 
And I click on the link labeled "My Projects"
And I click on the link labeled "D.106.100"
And I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
Then I should see a table header and row containing the following values in a table:
      | Date / Time      | User       | Comments and Details                   | 
      | mm/dd/yyyy hh:mm | Test_Admin | Action: Opened query Comment:"Query 1" |
Then I should see "Reply with response"
Then I should see "Close the query"
And I click on the button labeled "Cancel"

Given I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see "Open query"
And I click on the button labeled "Cancel"
And I logout

#ACTION: Verify access right 'Verify Respond only to open queries'
Given I login to REDCap with the user "Test_User2" 
And I click on the link labeled "My Projects"
And I click on the link labeled "D.106.100"
And I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
Then I should see a table header and row containing the following values in a table:
      | Date / Time      | User       | Comments and Details                   | 
      | mm/dd/yyyy hh:mm | Test_Admin | Action: Opened query Comment:"Query 1" |
Then I should see "Reply with response"
Then I should NOT see "Close the query"
And I click on the button labeled "Cancel"
Given I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should NOT see "Open query"
And I should see "Awaiting action by user with sufficient user privileges."
And I click on the button labeled "Close" in the dialog box
#There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match
And I logout

#ACTION: Verify User right 'Open queries only'
Given I login to REDCap with the user "Test_User3" 
And I click on the link labeled "My Projects"
And I click on the link labeled "D.106.100"
And I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
Then I should see a table header and row containing the following values in a table:
      | Date / Time      | User       | Comments and Details                   | 
      | mm/dd/yyyy hh:mm | Test_Admin | Action: Opened query Comment:"Query 1" |
Then I should NOT see "Close the query"
And I should NOT see "Respond to query"
And I should see "Awaiting action by user with sufficient user privileges"
And I click on the button labeled "Close" in the dialog box
#There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see "Open query"
And I click on the button labeled "Cancel" in the dialog box
And I logout

#ACTION:Verify User right 'Open and respond to queries'
Given I login to REDCap with the user "Test_User4" 
And I click on the link labeled "My Projects"
And I click on the link labeled "D.106.100"
And I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
Then I should see a table header and row containing the following values in a table:
      | Date / Time      | User       | Comments and Details                   | 
      | mm/dd/yyyy hh:mm | Test_Admin | Action: Opened query Comment:"Query 1" |
Then I should NOT see "Close the query"
And I should see "Reply with response: "
And I click on the button labeled "Cancel" in the dialog box
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see "Open query"
And I click on the button labeled "Cancel" in the dialog box
And I logout


#ACTION: Assign user rights
Given I login to REDCap with the user "Test_Admin" 
And I click on the link labeled "My Projects"
And I click on the link labeled "D.106.100"
When I click on the link labeled "User Rights"
And I click on the link "Test_User3"
And I click on the button labeled "Edit user privileges"
And I click on the radio labeled "No Access" in the dialog box
And I click on the button labeled "Save Changes"
And I click on the link "Test_User4"
And I click on the button labeled "Edit user privileges"
And  I click on the radio labeled "View only" in the dialog box
And I click on the button labeled "Save Changes"
And I logout

#ACTION: Verify 'No Access' user rights
Given I login to REDCap with the user "Test_User3" 
And I click on the link labeled "My Projects"
And I click on the link labeled "D.106.100"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
Then I should NOT see "Data Resolution Workflow" icon for the field labeled "Name"
And I should NOT see "Data Resolution Workflow" icon for the field labeled "Name" 
And I logout

#ACTION: Verify 'View only' user rights
Given I login to REDCap with the user "Test_User4" 
And I click on the link labeled "My Projects"
And I click on the link labeled "D.106.100"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
#The below step shows a new query cannot be opened
Then I should NOT see "Data Resolution Workflow" icon for the field labeled "Name" 
Given I click on the Data Resolution Workflow icon for the field labeled "Email"
Then I should see a table header and row containing the following values in a table:
      | Date / Time      | User       | Comments and Details                   | 
      | mm/dd/yyyy hh:mm | Test_Admin | Action: Opened query Comment:"Query 1" |
Then I should NOT see "Close the query"
Then I should NOT see "Respond to query"
And I click on the button labeled "Close" in the dialog box
#There is no 'Close' button, but an 'x' icon and its label is 'Close'. There is no other step to match
And I logout

