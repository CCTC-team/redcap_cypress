Feature: Stats and Charts: The system shall support the viewing of stats and charts.

As a REDCap end user
I want to see that Stats and Charts is functioning as expected

Scenario: Uploading Project D.5.100 consisting Text Validation(Name, Email, Form status) and Data Types(Name, Textbox, Checkbox,multiple choice dropdown list (single answer), Radio Button Manual, File Upload (file_upload), Form status) as instruments through the Online Designer to view stats and charts.

#SETUP
Given I login to REDCap with the user "Test_Admin"   
And I create a new project named "Project D.5.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing "Upload a RedCap project XML file (CDISC ODM format)", clicking "Choose File", selecting the "ProjectCUHV1381xml_2024-5-12_1714.REDCap" and clicking the "Create Project" button

##SETUP_VERIFICATION: Text Validation and  Data Types
When I click on the link labeled "Designer"
And I click on the instrument labeled "Text Validation"
Then I verify I see "Variable: record_id" on the field labeled "Record ID"
And I verify I see "Variable: ptname_v2_v2" on the field labeled "Name"
And I verify I see "Variable: email_v2" on the field labeled "Email"
Then I click on the link labeled "Next Instrument"
And I verify I see "Data Types" instrument
And I verify I see "Variable: ptname " on the field labeled "Name"
And I verify I see "Variable: textbox " on the field labeled "Text Box"
And I verify I see "Variable: multiple_dropdown_manual " on the field labeled "Multiple Choice Dropdown Manual"
And I verify I see "Variable: checkbox " on the field labeled "Checkbox"
And I verify I see "Variable: file_upload " on the field labeled "File Upload"
And I verify I see "Variable: radio_button_manual " on the field labeled "Radio Button Manual"

#FUNCTIONAL_REQUIREMENT
##ACTION: Data Entry Mode
When I click the link labeled "Add/Edit Records"
And I click the button labeled "Add new record for the arm selected above"
And I click the bubble for the instrument labeled "Text Validation" for event "Event 1"
And I enter "Tony" into the data entry form field labeled "Name" 
And I enter "tony@example.com" into the data entry form field labeled "Email" 
Then I select "Complete" on the dropdown field labeled "Complete?" in the role selector dropdown
And I click the button labeled "Save and Exit Form"
Then I should see "Record ID 1 successfully added"
And I click on the radio labeled "Data Types" within the data collection instrument list
And I enter "Lily" into the data entry form field labeled "Name" 
Then I enter "She is a teacher" into the data entry form field labeled "Text Box"
And I select the dropdown option labeled "DDChoice5" on the dropdown field labeled "Multiple Choice Dropdown Manual"
And I select the option labeled "Checkbox2" for the multiselect field labeled "Checkbox"
And I select "Incomplete" on the dropdown field labeled "Complete?" in the role selector dropdown
And I click the button labeled "Save and Exit Form"
Then I should see "Record ID 1 successfully added"

##VERIFY_DE
When I click on the link labeled "Data Exports, Reports, and Stats"
Then I should see a table row containing the following values in the reports table:  
| A | All data (all records and fields) |  
  
When I click on the button labeled "Stats & Charts" 
Then I should see a table header and rows including the following values in the report data table:   
| Display Options                 | 
Select a data Collection instrument to view
And I select the dropdown option labeled "Text Validation" on the dropdown field labeled "Select a data Collection instrument to view"
Then I should see a table header and rows including the following values in the report data table: 

Name (ptname_v2_v2)
| Total Count(N) | Missing |
      1            0(0.0%)

Email (email_v2)
| Total Count(N) | Missing |
      1            0(0.0%)
    
Complete? (text_validation_complete)
| Total Count(N) | Missing | Unique |
      1            0(0.0%)     1

Then I select the dropdown option labeled "View as Pie Chart"
And I should see a Pie Chart showing "Complete 1(100%)"
And I should see "Counts/frequency: Incomplete (0, 0.0%), Unverified (0, 0.0%), Complete (1, 100.0%)" in the title

Then I select the dropdown option labeled "Data Types" on the dropdown field labeled "Select a data Collection instrument to view"
And I should see a table header and rows including the following values in the report data table: 

Name (ptname)
| Total Count(N) | Missing |
      1            0(0.0%)

Text Box (textbox)
| Total Count(N) | Missing |
      1            0(0.0%)

Multiple Choice Dropdown Manual (multiple_dropdown_manual)
| Total Count(N) | Missing | Unique |
      1            0(0.0%)     1
Counts/frequency: DDChoice5 (1, 100.0%), DDChoice6 (0, 0.0%), DDChoice7 (0, 0.0%)

Then I select the dropdown option labeled "View as Pie Chart"
And I should see a Pie Chart showing 100% "DDChoice5 1(100%)"

Checkbox (checkbox)
| Total Count(N) | Missing | Unique |
      1            0(0.0%)     1
Counts/frequency: Checkbox (0, 0.0%), Checkbox2 (0, 0.0%), Checkbox3 (1, 100.0%)

And I should see a Bar Chart showing "Checkbox3 Count: 1"
Then I should NOT see "File Upload" 

Radio Button Manual (radio_button_manual)
| Total Count(N) | Missing |
      0            1(0.0%)


Complete? (text_validation_complete)
| Total Count(N) | Missing | Unique |
      1            0(0.0%)     1
Then I select the dropdown option labeled "View as Pie Chart"
And I should see a Pie Chart showing "Incomplete 1(100%)"
And I should see "Counts/frequency: Incomplete (1, 0.0%), Unverified (0, 0.0%), Complete (0, 100.0%)" in the title