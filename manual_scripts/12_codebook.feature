Feature: Codebook: The system shall support the viewing of codebook.

As a REDCap end user
I want to see that Codebook is functioning as expected

Scenario: Uploading Project D.111.100 consisting Text Validation(Name, Email, Form status) and Data Types(Name, Textbox, Signature,multiple choice dropdown list (single answer), Radio Button Manual, File Upload (file_upload), Form status) as instruments through the Online Designer to view Codebook.

#SETUP
Given I login to REDCap with the user "Test_Admin"   
And I create a new project named "Project D.111.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing "Empty project", and clicking the "Create Project" button

##VERIFY_Codebook 
When I click on the link labeled "Codebook"
And I should see a table row containing the following values in the data dictionary codebook table: 

| # | Variable/Field Name        |    Field Label                         | Field Attributes(Field Type, Validation, Choices, Calculations, etc.)| 
|   | Instrument: Form 1 (form_1)| |                                                                                                           |   
| 1 | [record_id]                |     Record ID                          | 	             text                                                |  
| 2 | [form_1_complete] | Section Header: form status (Complete?)| 	dropdown(0 Incomplete, 1 Unverified, 2 Complete                              |

##ACTION: Rename instrument and instrument variable name
When I click on the button labeled "Online Designer"
And I select the dropdown option labeled "Rename" from the dropdown labeled "Choose action" for the instrument labeled "Text Validation"
And I rename the data instrument to "Text Validation" 
And I click on the button labeled "Save"
Then I should see the data instrument labeled "Text Validation"

##ACTION: Create new instrument(Data Types)
When I select the dropdown option labeled "Copy" from the dropdown labeled "Choose action" for the instrument labeled "Text Validation"
And I enter "Data Types" in the field labeled "New instrument name"
And I click on the button labeled "Copy Instrument"
Then I should see "SUCCESS! The instrument was successfully copied."
Given I click on the button labeled "Close" in the dialog box
#VERIFY 
Then I should see the instrument labeled "Data Types"

##VERIFY_Codebook 
When I click on the link labeled "Codebook"
And I should see a table row containing the following values in the data dictionary codebook table: 

| # | Variable/Field Name        |    Field Label                         | Field Attributes(Field Type, Validation, Choices, Calculations, etc.)| 
|   | Instrument: Text Validation (text_validation)| |                                                                                                           |   
| 1 | [record_id]                |     Record ID                          | 	             text                                                |  
| 2 | [text_validation_complete] | Section Header: form status (Complete?)| 	dropdown(0 Incomplete, 1 Unverified, 2 Complete  |
|   | Instrument: Data Types(data_types)| |                                                                                                           |   
| 3 | [record_id]                |     Record ID                          | 	             text                                                |  
| 4 | [data_types_complete] | Section Header: form status (Complete?)| 	dropdown(0 Incomplete, 1 Unverified, 2 Complete  |

##SETUP_DEV
When I click on the link labeled "Designer"
Then I should see "Data Collection Instruments"

#FUNCTIONAL_REQUIREMENT
##ACTION: Fields creation for Text Validation
When I click on the instrument labeled "Text Validation"
Then I should see "Record ID " within the field with variable name "record_id"
And I click on the button labeled "Add Field"
And I add a new Text Box field labeled "Name" with the variable name "ptname_v2_v2 "
And I click on the button labeled "Save" in the dialog box
And I click on the button labeled "Add Field"
And I add a new Text Box field labeled "Email" with the variable name "email_v2 "
And I select the dropdown option "Email" from the dropdown field with the placeholder text "---None---"
And I click on the button labeled "Save" in the dialog box

##ACTION: Name and Textbox fields creation for Data Types
When I click on the link labeled "Next Instrument"
And I should see "Data Types instrument"
And I click on the Edit image for the field named "Record ID"
And I add a new Text Box field labeled "Name" with the variable name "ptname "
And I click on the button labeled "Save" in the dialog box
Then I click on the button labeled "Add Field"
And I add a new Text Box field labeled "Text Box" with the variable name "textbox"
And I click on the button labeled "Save" in the dialog box

##ACTION: Date of Birth and Multiple Choice Dropdown fields creation for Data Types
Then I click on the button labeled "Add Field"
And I add a new Text Box field labeled "Date of Birth" with the variable name "dob"
And I select the dropdown option "Date (D-M-Y)" from the dropdown field with the placeholder text "---None---"
And I enter "01-01-2006" into the input field labeled "Minimum:"
And I enter "01-01-1990" into the input field labeled "Maximum:"
And I enter "must be above 18 years old" into the input field labeled "Field Note (optional):"
And I click on the button labeled "Save" in the dialog box
Then I click on the button labeled "Add Field"
When I click on the dropdown field labeled "Select a Type of Field"
And I add a new Multiple Choice - Drop-down List (Single Answer) field labeled "Multiple Choice Dropdown Manual" with the variable name "multiple_dropdown_manual"
And I enter "5, DDChoice5" on the first row of the input field labeled "Choices (one choice per line)"
And I enter "7, DDChoice7" on the second row of the input field labeled "Choices (one choice per line)"
And I enter "6, DDChoice6" on the third row of the input field labeled "Choices (one choice per line)"
And I click on the button labeled "Save"
Then I should see the field labeled "Multiple Choice Dropdown Manual"
And I should see the dropdown field with the options "DDChoice5","DDChoice7" and "DDChoice6"
And I click on the button labeled "Save"

##ACTION: Checkbox and File Upload fields creation for Data Types
Then I click on the button labeled "Add Field"
When I click on the dropdown field labeled "Select a Type of Field"
And I add a new Checkboxes (multiple answers) labeled "Checkbox" with the variable name "checkbox"
And I enter "1, Checkbox1" on the first row of the input field labeled "Choices (one choice per line)"
And I enter "2, Checkbox2" on the second row of the input field labeled "Choices (one choice per line)"
And I enter "3, Checkbox3" on the third row of the input field labeled "Choices (one choice per line)"
And I click on the button labeled "Save"
Then I should see the field labeled "Checkbox"
And I should see the checkbox button options "Checkbox1", "Checkbox2", " Checkbox3"
Then I click on the button labeled "Add Field"
When I click on the dropdown field labeled "Select a Type of Field"
And I add a new File Upload (for users to upload files) labeled "File Upload" with the variable name "file_upload"
And I click on the button labeled "Save"
Then I should see the field labeled "File Upload"
And I should see the link labeled "Upload file"

##ACTION: Radio Button and Calculated fields creation for Data Types
Then I click on the button labeled "Add Field"
When I click on the dropdown field labeled "Select a Type of Field"
And I add a new Multiple Choice - Radio Buttons (Single Answer) field labeled "Radio Button Manual" with the variable name "radio_button_manual"
And I enter "99, Choice99" on the first row of the input field labeled "Choices (one choice per line)"
And I enter "100, Choice100" on the second row of the input field labeled "Choices (one choice per line)"
And I enter "101, Choice101" on the third row of the input field labeled "Choices (one choice per line)"
And I click on the button labeled "Save"
Then I should see the field labeled "Radio Button Manual"
When I click on the button labeled "Add Field"
And I click on the dropdown field labeled "Select a Type of Field"
And I add a new Calculated Field field labeled "Calculated Field" with the variable name "calculated_field" 
And I enter the equation "3*2" in the Calculation Equation field of the open "Logic Editor" dialog box
And I click on the button labeled "Update & Close Editor" in the dialog box
And I click on the button labeled "Save"
Then I should see the field labeled "Calculated Field"
And I should see the link "View equation"

##ACTION: Descriptive text and Identifier fields creation for Data Types
When I click on the button labeled "Add Field"
When I click on the dropdown field labeled "Select a Type of Field"
And I add a new Descriptive Text (with optional Image/Video/Audio/File Attachment) labeled "Descriptive Text with File" with the variable name "descriptive_text_file"
And I click on the link labeled "Upload file"
And I upload the file labeled "D.111.100_Upload File"
And I click on the button labeled "Upload file" in the dialog box
Then I should see "Document was successfully uploaded! "
When I click on the button labeled "Close" in the dialog box
And I click on the button labeled "Save"

##VERIFY 
Then I should see the field labeled "Descriptive Text with File"
And I should see the link labeled "D.111.100_Upload File"

When I click on the button labeled "Add Field" at the bottom of the instrument
And I click on the dropdown field labeled "Select a Type of Field"
And I add a new Text Box (Short Text, Number, Date/Time ,...) with the variable name "identifier_2"
And I select the radio button labeled "Yes" for the field labeled "Identifier" 
And I click on the button labeled "Save"
Then I should see the field labeled "Identifier"

##ACTION Designating field as required
When I click on the button labeled "Add Field" at the bottom of the instrument
Given I add a new Text Box field labeled "Required" with the variable name "required_2"
And I select the radio button labeled "Yes" for the field labeled "Required"
And I click on the button labeled "Save"
Then I should see "*must provide value" on the next Text Box field labeled "Required"


#FUNCTIONAL_REQUIREMENT
##VERIFY_Codebook 
When I click on the link labeled "Codebook"
And I should see a table row containing the following values in the data dictionary codebook table: 

| #  | Variable/Field Name        |    Field Label                         | Field Attributes(Field Type, Validation, Choices, Calculations, etc.)                   | 
|    | Instrument: Text Validation (text_validation   |   |                                                                                                          |   
| 1  | [record_id]                |     Record ID                          | 	             text                                                                    |  
| 2  | [ptname_v2_v2]             | 	   Name                            | 	             text                                                                    |  
| 3  | [email_v2]                 |     Email                              | 	             text(email)                                                             |  
| 4  | [text_validation_complete] | Section Header: form status (Complete?)| 	dropdown(0 Incomplete, 1 Unverified, 2 Complete                                      |  
|    |  Instrument: Data Types (data_types |  |                                                                                                                      |  
| 5  | [ptname]                   |             Name                       | 	            text                                                                     |  
| 6  | [textbox]                  |             Text Box                   | 	            text                                                                     | 
| 7  | [dob]                      |Date of Birth(must be above 18 years old)| 	     text (date_dmy, Min: 2006-01-01, Max: 1990-01-01)                               | 
| 8  | [multiple_dropdown_manual] | Multiple Choice Dropdown Manual        | 	dropdown(5 DDChoice5, 7 DDChoice6, 6 DDChoice7)                                      |   
| 9  | [checkbox]                 | 	    Checkbox                       | checkbox(1 checkbox__1, Checkbox1),(2 checkbox__2, Checkbox2),(3 checkbox__3, Checkbox3)|
| 10 | [file_upload]              | 	    Field Upload                   | 	           file                                                                      |  
| 11 | [radio_button_manual]      | 	Radio Button Manual                | radio(99 Choice99, 100 DDChoice100, 101 DDChoice101)                                    | 
| 12 | [calculated_field]         |     Calculated Field                   | 	            calc(Calculation: 3*2)                                                   |  
| 13 | [descriptive_text_file]    |     Descriptive Text with File         | 	            descriptive                                                              |
| 14 | [identifier_2]             |     Identifier                         | 	             text, Identifier                                                        |
| 15 | [required]                 |     Required                           | 	            text, Required                                                           |
| 16 | [data_types_complete]      | Section Header: form status (Complete?)| 	dropdown(0 Incomplete, 1 Unverified, 2 Complete                                      |   

#ACTION: Check Edit and Delete fields in codebook
When I click on the link labeled "Designer"
And I click on the instrument labeled "Text Validation"
And  I click on the button labeled "edit icon" for the row labeled "Name"
And  I enter "4567" into the input field labeled "Name" in the action popup 
Then I click on the button labeled "Save"
And  I click on the button labeled "delete icon" for the row labeled "Email"
And  I click on the button labeled "Delete"
And I click on the link labeled "Codebook"
Then I should NOT see "Email"
And I should see "Field: Name4567" within the field with variable name "ptname" 
And I logout
    