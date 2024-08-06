Feature: Stats and Charts: The system shall support the viewing of stats and charts.

As a REDCap end user
I want to see that Stats and Charts is functioning as expected

Scenario: Uploading Project D.19.100 consisting Text Validation(Name, Email, Form status) and Data Types(Name, Textbox, Checkbox,multiple choice dropdown list (single answer), Radio Button Manual, File Upload (file_upload), Form status) as instruments through the Online Designer to view stats and charts.

#SETUP
Given I login to REDCap with the user "Test_Admin"   
And I create a new project named "D.19.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_CUH_v1381.xml" and clicking the "Create Project" button

##SETUP_VERIFICATION: Text Validation and  Data Types
When I click on the link labeled "Designer"
And I click on the instrument labeled "Text Validation"
Then  I should see "Field name: Record ID " within the field with variable name "record_id"
And I should see "Field: Name " within the field with variable name "ptname_v2_v2"
And I should see "Field: Email " within the field with variable name "email_v2"
Then I click on the link labeled "Next Instrument"
And I should see "Data Types" instrument
And I should see "Field name: Name" within the field with variable name "ptname" 
And I should see "Field: Text Box " within the field with variable name "textbox "
And I should see "Field: Multiple Choice Dropdown Manual" within the field with variable name "multiple_dropdown_manual"
And I should see "Field: Checkbox" within the field with variable name " checkbox "
And I should see "Field: File Upload " within the field with variable name "file_upload"
And I should see "Field: Radio Button Manual " within the field with variable name "radio_button_manual"

#FUNCTIONAL_REQUIREMENT
##ACTION: Data Entry For Text Validation
When I click the link labeled "Add/Edit Records"
Then I click the button labeled "Add new record for the arm selected above"
And I click the bubble for the "Text Validation" data collection instrument for event "Event 1"
And I enter "Tony" into the data entry form field labeled "Name" 
And I enter "tony@example.com" into the data entry form field labeled "Email" 
Then I select the dropdown option labeled "Unverified" on the dropdown field labeled "Complete?"
And I click the button labeled "Save and Exit Form"
Then I should see "Record ID 1 successfully added"
And I click the link labeled "Select other record"
Then I click the button labeled "Add new record for the arm selected above"
And I click the bubble for the "Text Validation" data collection instrument for event "Event 1"
And I enter "John Doe" into the data entry form field labeled "Name"
And I enter "johndoe@example.com" into the data entry form field labeled "Email" 
Then I select the dropdown option labeled "Complete" on the dropdown field labeled "Complete?"
And I click the button labeled "Save and Exit Form"
Then I should see "Record ID 2 successfully added"


#FUNCTIONAL_REQUIREMENT
##ACTION: Data Entry For Data Types
Given I am still on the "Record Home Page"
And I click the link labeled "Select other record"
And I select the dropdown option labeled "1" on the dropdown field labeled "Choose an existing Record ID"
And I click the bubble for the "Data Types" data collection instrument for event "Event 1"
And I enter "Lily" into the data entry form field labeled "Name" 
Then I enter "She is a teacher" into the data entry form field labeled "Text Box"
And I select the dropdown option labeled "DDChoice5" on the dropdown field labeled "Multiple Choice Dropdown Manual"
And  I select the checkbox option "Checkbox2" for the field labeled "Checkbox" 
And I select the dropdown option labeled "Incomplete" on the dropdown field labeled "Complete?"
And I click the button labeled "Save and Exit Form"
Then I should see "Record ID 1 successfully added"
And I click the link labeled "Select other record"
And I select the dropdown option labeled "2" on the dropdown field labeled "Choose an existing Record ID"
And I click the bubble for the "Data Types" data collection instrument for event "Event 1"
And I enter "Thomas Stone" into the data entry form field labeled "Name"
Then I enter "He is a musician" into the data entry form field labeled "Text Box"
And I select the dropdown option labeled "DDChoice6" on the dropdown field labeled "Multiple Choice Dropdown Manual"
And  I select the checkbox option "Checkbox3" for the field labeled "Checkbox" 
And I select the dropdown option labeled "Unverified" on the dropdown field labeled "Complete?"
And I click the button labeled "Save and Exit Form"
Then I should see "Record ID 2 successfully added"

##VERIFY_DE
When I click on the link labeled "Data Exports, Reports, and Stats"
Then I should see a table row containing the following values in the reports table:  

| A | All data (all records and fields) |  
  
When I click on the button labeled "Stats & Charts" 
Then I should see a table header and rows including the following values in the report data table:   

| Display Options        | 
| Select a data Collection instrument to view| 

And I select the dropdown option labeled "Text Validation" on the dropdown field labeled "Select a data Collection instrument to view"
Then I should see a table header and rows including the following values in the report data table: 

| Name (ptname_v2_v2)|

| Total Count(N) | Missing  |  
|      2         |   0(0.0%)|

|Email (email_v2)|
| Total Count(N) | Missing  |
|      2         |   0(0.0%)|
    
|Complete? (text_validation_complete)|
| Total Count(N) | Missing  | Unique |
|     2         |   0(0.0%)|     2  |


Then I select the dropdown option labeled "View as Pie Chart"
And I should see a Pie Chart showing "Complete 1(50%), Unverified 1(50%)"
And I should see "Counts/frequency: Incomplete (0, 0.0%), Unverified (1,50.0%), Complete (1, 50.0%)" in the title

Then I select the dropdown option labeled "Data Types" on the dropdown field labeled "Select a data Collection instrument to view"
And I should see a table header and rows including the following values in the report data table:

|Name (ptname)|

| Total Count(N) | Missing |
|      2         | 0(0.0%)|

|Text Box (textbox)|
| Total Count(N) | Missing  |
|      2          |  0(0.0%)|

|Multiple Choice Dropdown Manual (multiple_dropdown_manual)|
| Total Count(N) | Missing  | Unique |
|     2          |  0(0.0%) |   1    |
|Counts/frequency: DDChoice5 (1, 0.0%), DDChoice6 (1, 50.0%), DDChoice7 (0, 0.0%)|

Then I select the dropdown option labeled "View as Pie Chart"
And I should see a Pie Chart showing "DDChoice5 1(50%), DDChoice6 1(50%)"
Then I should see a table header and rows including the following values in the report data table:

|Checkbox (checkbox)|
| Total Count(N) | Missing | Unique |
|      2         |   0(0.0%)|     1  |
|Counts/frequency: Checkbox (0, 0.0%), Checkbox2 (1, 50.0%), Checkbox3 (1, 50.0%)|

And I should see a Bar Chart showing "Checkbox3 Count: 1"
Then I should NOT see "File Upload" 
Then I should see a table header and rows including the following values in the report data table:

|Radio Button Manual (radio_button_manual)|
| Total Count(N)| Missing |
|     0         | 2(100.0%) |

|Complete? (text_validation_complete)|
| Total Count(N) | Missing | Unique |
|      2         |   0(0.0%)|     2  |
Then I select the dropdown option labeled "View as Pie Chart"
And I should see a Pie Chart showing "Incomplete 1(100%)"
And I should see "Counts/frequency: Incomplete (1, 50.0%), Unverified (1, 50.0%), Complete (0, 100.0%)" in the title
And I logout