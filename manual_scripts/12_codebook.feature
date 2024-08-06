Feature: Codebook: The system shall support the viewing of codebook.

As a REDCap end user
I want to see that Codebook is functioning as expected

Scenario: Uploading Project D.12.100 consisting Text Validation(Name, Email, Form status) and Data Types(Name, Textbox, Signature,multiple choice dropdown list (single answer), Radio Button Manual, File Upload (file_upload), Form status) as instruments through the Online Designer to view Codebook.

#SETUP
Given I login to REDCap with the user "Test_Admin"   
And I create a new project named "Project D.12.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing "Upload a RedCap project XML file (CDISC ODM format)", clicking "Choose File", selecting the "Project_CUH_v1381.xml" and clicking the "Create Project" button

##SETUP_VERIFICATION: Text Validation and  Data Types
When I click on the link labeled "Designer"
And I click on the instrument labeled "Text Validation"
Then I should see "Field name: Record ID " within the field with variable name "record_id"
And I should see "Field: Name " within the field with variable name "ptname_v2_v2"
And I should see "Field: Email " within the field with variable name "email_v2"
Then I click on the link labeled "Next Instrument"
And I should see "Data Types" instrument
And I should see "Field: Name" within the field with variable name "ptname" 
And I should see "Field: Text Box" within the field with variable name "textbox "
And I should see "Field: Multiple Choice Dropdown Manual" within the field with variable name "multiple_dropdown_manual"
And I should see "Field: Signature" within the field with variable name "signature"
And I should see "Field: File Upload" within the field with variable name "file_upload"
And I should see "Field: Radio Button Manual" within the field with variable name "radio_button_manual"

#FUNCTIONAL_REQUIREMENT
##VERIFY_Codebook 
When I click on the link labeled "Codebook"
And I should see a table row containing the following values in the data dictionary codebook table: 

| # | Variable/Field Name | Field Label    | Field Attributes(Field Type, Validation, Choices, Calculations, etc.) | 
| Instrument: Text Validation (text_validation |  |  |  |   
| 1 | [record_id]         |     Record ID  | 	             text                                               |  
| 2 | [ptname_v2_v2]      | 	Name       | 	             text                                               |  
| 3 | [email_v2]          |     Email      | 	             text(email)                                        |  
| 4 | [text_validation_complete] | Section Header: form status (Complete?) | 	dropdown(0 Incomplete, 1 Unverified, 2 Complete |  
| Instrument: Data Types (data_types |  |  |  |  
| 5 | [ptname]          |     Name          | 	             text                                    |  
| 6 | [textbox]         |     Text Box      | 	             text                                    |  
| 7 | [multiple_dropdown_manual] | Multiple Choice Dropdown Manual | 	dropdown(5 DDChoice5, 7 DDChoice6, 6 DDChoice7)    |   
| 8 | [signature]                | 	    Signature          | 	             file(signature)                               |
| 9 | [file_upload]              | 	    Field Upload       | 	             file                                          |  
| 10| [radio_button_manual]      | 	Radio Button Manual      | 	        radio(9.9 Choice99, 100 DDChoice100, 101 DDChoice101)       |   
| 11| [data_types_complete] | Section Header: form status (Complete?) | 	dropdown(0 Incomplete, 1 Unverified, 2 Complete |   

#ACTION: Check Edit and Delete fields in codebook
When I click on the link labeled "Designer"
And I click on the instrument labeled "Text Validation"
And  I click on the button labeled "edit icon" for the row labeled "Name"
And  I enter "4567" into the input field labeled "Name" in the action popup 
Then I click the button labeled "Save"
And  I click on the button labeled "delete icon" for the row labeled "Email"
And  I click the button labeled "Delete"
And I click on the link labeled "Codebook"
Then I should NOT see "Email"
And I should see "Field: Name4567" within the field with variable name "ptname" 
And I logout
    