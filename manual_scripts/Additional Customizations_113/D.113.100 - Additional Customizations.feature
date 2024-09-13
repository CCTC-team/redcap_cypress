Feature: D.113.100 - Additional Customizations

As a REDCap end user
I want to see that I have the ability to assign missing codes to blank fields 


Scenario: D.113.100 Assign missing codes to blank fields 

#ACTION: Assign missing codes SETUP
Given I login to REDCap with the user "Test_Admin" 
And I create a new project named "D.113.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

#ACTION: Enable Missing Data Codes
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Additional customizations"
And I click on the button labeled "ADD" for the row labeled "INV" 
And  I click on the button labeled "ADD" for the row labeled "UNK" 
Then I click on the button labeled "Save"
Then I should see "Sucess! Your changes have been saved!"


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

#ACTION: Add missing codes
Given I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I click on the "Missing codes" icon for the field labeled "Name"
And I click on the button labeled "Unknown (UNK)"
And I click on the "Missing codes" icon for the field labeled "Email"
And I click on the button labeled "Invalid (INV)"
And I click on the button labeled "Save & Exit Form"


#ACTION: Verify access codes on report
Given I click on the link labeled "Data Exports, Reports, and Stats"
Then I should see "All data (all records and fields)"
When I click on the button labeled "View Report" for the report named "All data (all records and fields)"
Then I should see a table header and row containing the following values in a table:
      | Record ID | Event Name             | Name          | Email         |
      | 1         | Event 1 (Arm 1: Arm 1) | Unknown (UNK) | Invalid (INV) |

#ACTION: Download CSV
Given I click on the button labeled "Export Data"
And I click on the radio labeled "CSV / Microsoft Excel (raw data)" in the dialog box
And I click on the button labeled "Export Data"
And I click on the download icon to receive the file for the "csv" format in the dialog box
And I click on the button labeled "Close"
# Verify the downloded csv has the correct missing codes for 'Name' and 'Email' fields
Then the downloaded CSV with filename "D.113.100_DATA_yyyy-mm-dd_hhmm" should have a value "UNK" for column "ptname_v2_v2" 
And the downloaded CSV with filename "D.113.100_DATA_yyyy-mm-dd_hhmm" should have a value "INV" for column "email_v2" 
And I logout

