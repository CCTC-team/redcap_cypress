Feature: Codebook: The system shall support the viewing of codebook.

As a REDCap end user
I want to see that Codebook is functioning as expected

Scenario: Uploading Project D.6.100 consisting Text Validation(Name, Email, Form status) and Data Types(Name, Textbox, Checkbox,multiple choice dropdown list (single answer), Radio Button Manual, File Upload (file_upload), Form status) as instruments through the Online Designer to view stats and charts.

#SETUP
Given I login to REDCap with the user "Test_Admin"   
And I create a new project named "Project D.6.200" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing "Upload a RedCap project XML file (CDISC ODM format)", clicking "Choose File", selecting the "Project_CUH_v1381.xml" and clicking the "Create Project" button

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



   
    