Feature: D.106.100 Data Resolution Workflow

As a REDCap end user
I want to see that I have the ability to allow Data Resolution Workflow rights to be (No Access, View only, Open queries only, Respond only to opened queries, Open and respond to queries; Open, close, and respond to queries).


Scenario: D.106.100 Allow Data Resolution Workflow rights to be (No Access, View only, Open queries only, Respond only to opened queries, Open and respond to queries; Open, close, and respond to queries).

#ACTION: Data Resolution Workflow SETUP
Given I login to REDCap with the user "test_admin" 
And I create a new project named "D.106.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
#Enable the Data Resolution Workflow (Data Queries)
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Additional customizations"
And I select "Data Resolution Workflow" on the dropdown field labeled "Enable:"
Then I click on the button labeled "Save"
And I click on the button labeled "Close" in the dialog box
And I click on the link labeled "Data Import Tool"
And  I upload a "csv" format file located at "cypress\fixtures\redcap_val_fixtures\Data import csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload file" to upload the file
And I click on the button labeled "Import Data"
Given I click on the link labeled "User Rights"
And I click on the button labeled "Upload or download users, roles, and assignments"
And I click on the link labeled "Upload users (CSV)"
And I upload a "csv" format file located at "cypress\fixtures\redcap_val_fixtures\Users csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload" to upload the file
And I click on the button labeled "Upload" in the dialog box
And I click on the button labeled "Close" in the dialog box

#ACTION: Open a query

Given I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
And I click on the radio labeled "Open query" in the dialog box
And I enter "Query 1" into the input field labeled "Comment:" 
And I click on the button labeled "Open query"
#Then I should see a red exclamation icon for the input field labeled "Email"
And I logout

#ACTION: Verify access right 'Open close and respond to queries'

Given I login to REDCap with the user "test_user1" 
And I click on the link labeled "D.106.100"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
Then I should see "Reply with response"
Then I should see "Close the query"
And I click on the button labeled "Cancel"

Given I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see "Open query"
And I logout

#ACTION: Verify access right 'Verify Respond only to open queries'

Given I login to REDCap with the user "test_user2" 
And I click on the link labeled "D.106.100"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
Then I should see "Reply with response"
Then I should NOT see "Close the query"
And I click on the button labeled "Cancel"
Given I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should NOT see "Open query"
And I should see "Awaiting action by user with sufficient user privileges."
And I click on the button labeled "Close" in the dialog box
And I logout

#ACTION: Verify User right 'Open queries only'

Given I login to REDCap with the user "test_user3" 
And I click on the link labeled "D.106.100"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
Then I should NOT see "Close the query"
And I should NOT see "Respond to query"
And I should see "Awaiting action by user with sufficient user privileges"
And I click on the button labeled "Close" in the dialog box
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see "Open query"
And I click on the button labeled "Cancel" in the dialog box
And I logout

#ACTION:Verify User right 'Open and respond to queries'

Given I login to REDCap with the user "test_user4" 
And I click on the link labeled "D.106.100"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Email"
Then I should NOT see "Close the query"
And I should see "Reply with response: "
And I click on the button labeled "Cancel" in the dialog box
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see "Open query"
And I click on the button labeled "Cancel" in the dialog box
And I logout


#ACTION: Change user rights

Given I login to REDCap with the user "test_admin" 
And I click on the link labeled "D.106.100"
When I click on the link labeled "User Rights"
And I click on the link "test_user3"
And I click on the button labeled "Edit user privileges"
And I click on the radio labeled "No access" in the dialog box
And I click on the button labeled "Save Changes"
And I click on the link "test_user4"
And I click on the button labeled "Edit user privileges"
And  I click on the radio labeled "View only" in the dialog box
And I click on the button labeled "Save Changes"
And I logout

#ACTION: Verify 'No access' user rights

Given I login to REDCap with the user "test_user3" 
And I click on the link labeled "D.106.100"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
Then I should NOT see "Data Resolution Workflow icon"
And I logout

#ACTION: Verify 'View only' user rights

Given I login to REDCap with the user "test_user4" 
And I click on the link labeled "D.106.100"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should NOT see "Open query" 
And I click on the button labeled "Close" in the dialog box
Given I click on the Data Resolution Workflow icon for the field labeled "Email"
Then I should NOT see "Close the query"
Then I should NOT see "Respond to query"
And I click on the button labeled "Close" in the dialog box
And I logout

