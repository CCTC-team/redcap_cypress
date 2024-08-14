Feature: D.106.600 Data Resolution Workflow

As a REDCap end user
I want to see that I have the ability to verify and de-verify data value based on user rights
I want to see that I have the ability to automatically de-verify data that has been verified and subsequently changed 

Scenario: D.106.600  The system shall have the ability to verify and de-verify data value based on user rights.

#ACTION: Data Resolution Workflow SETUP
Given I login to REDCap with the user "test_admin" 
And I create a new project named "D.106.600" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
#Enable the Data Resolution Workflow (Data Queries)
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Additional customizations"
And I select "Data Resolution Workflow" in the labeled "data_resolution_enabled"
Then I click on the button labeled "Save"
And I click on the button labeled "Close" in the dialog box
And I click on the link labeled "Data Import Tool"
And  I upload a "csv" format file located at "cypress\fixtures\redcap_val_fixtures\Data import_D.106", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload file" to upload the file
And I click on the button labeled "Import Data"
Given I click on the link labeled "User Rights"
And I click on the button labeled "Upload or download users, roles, and assignments"
And I click on the link labeled "Upload users (CSV)"
And I upload a "csv" format file located at "cypress\fixtures\redcap_val_fixtures\Users_D.106", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload" to upload the file
And I click on the button labeled "Upload" in the dialog box
And I click on the button labeled "Close" in the dialog box
And I logout


#ACTION: Verify and de-verify data

Given I login to REDCap with the user "test_user1" 
And I click on the link labeled "My Projects"
And I click on the link labeled "D.106.600"
And I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Date / Time      | User       | Comments and Details   | 
      | mm/dd/yyyy hh:mm | test_admin | Data Changes Made: ptname_v2_v2 = 'Tony Stone' |
Given I click on the radio labeled "Verified data value"
And I click on the button labeled "Verified data value" 
#Then I should see a green tick icon for the input field labeled "Name"
Given I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Date / Time      | User       | Comments and Details   | 
      | mm/dd/yyyy hh:mm | test_admin | Data Changes Made: ptname_v2_v2 = 'Tony Stone'' |
      | mm/dd/yyyy hh:mm | test_user1 | Action:Verified data value |
Given I click on the radio labeled "De-verify data value"
And I click on the button labeled "De-verify data value"
Then I should see a dialog containing the following text: "A comment is required. Please enter a comment." 
And I click on the button labeled "Close" in the dialog box
And I enter "Test de-verify data" into the input field labeled "Comment:"
And I click on the button labeled "De-verify data value"
#Then I should see a red exclamation icon for the input field labeled "Name"

Given I click on the link labeled "Resolve Issues"
And I select the "All status type" option from the Filters dropdown field indentified by 'choose_status_type'
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Record    | Data Quality rule and/or Field | First Update  | Last Update |
      | 1         | ptname_v2_v2                   | test_user1 "" | test_user1 "Test de-verify data" |
And I logout

#ACTION: Verify user privilages to verify/deverify data

Given I login to REDCap with the user "test_user2" 
And I click on the link labeled "D.106.600"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see "Awaiting action by user with sufficient user privileges"
And I should NOT see "Verified data value"
And I logout

#ACTION: Verify automatic De-verified status due to data change

Given I login to REDCap with the user "test_user1" 
And I click on the link labeled "D.106.600"
And I click on the link labeled "Record Status Dashboard"
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see "Data De-verified"
Given I select the radio labeled "Verified data value" in the dialog box
And I click on the button labeled "Verified data value" 
#Then I should see a green tick icon for the input field labeled "Name"
Given I enter "John" into the input field labeled "Name" 
And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
And  I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
#Then I should see a red exclamation icon for the input field labeled "Name"
And I click on the Data Resolution Workflow icon for the field labeled "Name"
Then I should see a table header and row containing the following values in the Data Resolution Workflow table:
      | Date / Time      | User       | Comments and Details   | 
      | mm/dd/yyyy hh:mm | test_user1 | Action:De-verified data value (automatically via data change) |
And I click on the button labeled "Close" in the dialog box
And I logout


