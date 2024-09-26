Feature: D.113.300 - Additional Customizations

As a REDCap end user
I want to see that I have the ability to prevent branching logic from hiding fields that have values 
Scenario: D.113.300 Assign missing codes to blank fields 

#ACTION: SETUP
Given I login to REDCap with the user "Test_Admin" 
And I create a new project named "D.113.300" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

#ACTION: Enable ability to prevent branching logic from hiding fields that have values 
Given I click on the link labeled "Project Setup"
And I click on the button labeled "Additional customizations"
And I check the checkbox labeled "bypass_branching_erase_field_prompt"
Then I click on the button labeled "Save"
Then I should see "Sucess! Your changes have been saved!"

# #ACTION: Import data 
# Given I click on the link labeled "Data Import Tool"
# And  I upload a "csv" format file located at "redcap_val_fixtures\import_files\D.106.100_Data Import.csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
# And I should see "Your document was uploaded successfully and is ready for review."
# And I click on the button labeled "Import Data"
# Then I should see "Import Successful! 15 records were created or modified during the import."

#ACTION: Add branching logic
When I click on the link labeled "Designer"
And I click on the instrument labeled "Text Validation"
And I click on the Branching Logic icon for the variable "Email"
And I click on "" in the textarea field labeled "Advanced Branching Logic Syntax" in the dialog box
And I enter "[ptname_v2_v2]=''" in the textarea field labeled "Logic Editor" in the dialog box
And I click on the button labeled "Update & Close Editor" in the dialog box
And I click on the button labeled "Save" in the dialog box
Then I should see "Branching logic:[ptname_v2_v2]=''" within the field with variable name "email_v2"

#ACTION: Create a record
Given I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
And I should see a field labeled "Email"
And I enter "John@email.com" into the data entry form field labeled "Email"
And I enter "John" into the data entry form field labeled "Name"
And I click on the button labeled "Save & Exit Form"

#ACTION: Verify the field that should be hidden by branching logic is shown
Given I click on the link labeled "Record Status Dashboard"
And I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
Then I should see "John@email.com" within the field with variable name "email_v2" 
Then I should see an icon titled "Field should be hidden by branching logic but is shown because it has a value" next to field labled "Email"
And I logout