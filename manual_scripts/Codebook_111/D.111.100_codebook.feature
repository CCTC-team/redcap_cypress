Feature: Codebook: The system shall support the viewing of codebook.

As a REDCap end user
I want to see that Codebook is functioning as expected

Scenario: Uploading Project D.111.100 consisting Text Validation(Name, Email, Form status) and Data Types(Name, Textbox,Date of Birth, Checkbox,multiple choice dropdown list (single answer), Radio Button Manual, File Upload (file_upload),Calculated Field,Descriptive Text with File, Identifier, Required, Form status) as instruments through the Online Designer to view Codebook.

#SETUP
Given I login to REDCap with the user "Test_Admin"   
And I create a new project named "D.111.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Empty Project", and clicking the "Create Project" button

##VERIFY_Codebook 
When I click on the link labeled "Codebook"
And I should see a table header and rows containing the following values in the codebook table:  

| # | Variable/Field Name        |    Field Label                         | Field Attributes(Field Type, Validation, Choices, Calculations, etc.)| 
|   | Instrument: Form 1 (form_1)|                                        |                                                                      |   
| 1 | [record_id]                |     Record ID                          | 	             text                                                |  
| 2 | [form_1_complete]          | Section Header: form status (Complete?)| 	dropdown(0 Incomplete, 1 Unverified, 2 Complete                  |

##ACTION: Rename instrument
Given I click on the button labeled "Online Designer"
When I click on the first button labeled "Choose action"
And I click on the link labeled "Rename" in the action popup
And I clear field and enter "Text Validation " into the field with the placeholder text of "Form 1"
And I click on the button labeled "Save" to rename an instrument
Then I should see "the data instrument labeled Text Validation"

##ACTION: Create new instrument(Data Types)
    #Oddly, we need the space before this button because otherwise we match on "Create snapshot of instruments"
    When I click on the button labeled exactly " Create"
    And I click on the last button labeled "Add instrument here"
    Then I should see "New instrument name:"
    When I enter "Data Types" into the input field labeled "New instrument name:" within the data collection instrument list
    And I click on the last button labeled "Create"
    Then I should see "SUCCESS!"

    Given I click on the button labeled "Close" in the dialog box
#VERIFY 
Then I should see "the instrument labeled Data Types"

##VERIFY_Codebook 
When I click on the link labeled "Codebook"
And I should see a table header and rows containing the following values in the codebook table:  

| # | Variable/Field Name                          |    Field Label                         | Field Attributes(Field Type, Validation, Choices, Calculations, etc.)| 
|   | Instrument: Text Validation (text_validation)|                                        |                                                                      |   
| 1 | [record_id]                                  |     Record ID                          | 	             text                                                  |  
| 2 | [text_validation_complete]                   | Section Header: form status (Complete?)| 	dropdown(0 Incomplete, 1 Unverified, 2 Complete                    |
|   | Instrument: Data Types(data_types)           |                                        |                                                                      |   
| 3 | [record_id]                                  |     Record ID                          | 	             text                                                  |  
| 4 | [data_types_complete]                        | Section Header: form status (Complete?)| 	dropdown(0 Incomplete, 1 Unverified, 2 Complete                    |

##SETUP_DEV
When I click on the link labeled "Designer"
Then I should see "Data Collection Instruments"

#FUNCTIONAL_REQUIREMENT
##ACTION: Fields creation for Text Validation
When I click on the instrument labeled "Text Validation"
Then I should see "Record ID " within the field with variable name "record_id"
And I click on the button labeled "Add Field"
And I add a new Text Box field labeled "Name" with variable name "ptname_v2_v2" and click on the "Save" button
And I click on the button labeled "Add Field"
And I add a new Text Box field labeled "Email" with variable name "email_v2" and click on the "Save" button
#And I select the dropdown option labeled "Email" from the dropdown field labeled  "---None---"
And I click on the button labeled "Save" in the dialog box

##ACTION: Name and Textbox fields creation for Data Types
When I click on the link labeled "Next Instrument"
And I should see "Data Types instrument"
And I click on the Edit image for the field named "Record ID"
And I add a new Text Box field labeled "Name" with variable name "ptname" and click on the "Save" button
Then I click on the button labeled "Add Field"
And I add a new Text Box field labeled "Text Box" with variable name "textbox" and click on the "Save" button


##ACTION: Date of Birth and Multiple Choice Dropdown fields creation for Data Types
Then I click on the button labeled "Add Field"
And I select "Text Box (Short Text, Number, Date/Time, ...)" from the Field Type dropdown of the open "Add New Field" dialog box
And I enter "Date of Birth" into the Field Label of the open "Add New Field" dialog box
And I enter "dob" into the Variable Name of the open "Add New Field" dialog box
#And I select the dropdown option labeled "Date (D-M-Y)" from the dropdown field labeled  "---None---"
And I enter "01-01-2006" into the input field labeled "Minimum:"
And I enter "01-01-1990" into the input field labeled "Maximum:"
And I enter "must be above 18 years old" into the input field labeled "Field Note (optional):"
And I click on the button labeled "Save" in the dialog box
Then I click on the button labeled "Add Field"
And I select "Multiple Choice - Drop-down List (Single Answer)" from the Field Type dropdown of the open "Add New Field" dialog box
And I enter "Multiple Choice Dropdown Manual" into the Field Label of the open "Add New Field" dialog box
And I enter "multiple_dropdown_manual" into the Variable Name of the open "Add New Field" dialog box
And I enter Choices of "5, DDChoice5" into the open "Add New Field" dialog box
And I enter Choices of "7, DDChoice7" into the open "Add New Field" dialog box
And I enter Choices of "6, DDChoice6" into the open "Add New Field" dialog box
And I click on the button labeled "Save" in the "Add New Field" dialog box
 #VERIFY
Then I should see a field named "Multiple Choice Dropdown Manual"
And I should see the dropdown field labeled "Multiple Choice Dropdown Manual" with the options below
    | DDChoice5 |
    | DDChoice7 |
    | DDChoice6 |

##ACTION: Checkbox and File Upload fields creation for Data Types
Then I click on the button labeled "Add Field"
When I select "Checkboxes (Multiple Answers)" from the Field Type dropdown of the open "Add New Field" dialog box
And I enter "Checkbox" into the Field Label of the open "Add New Field" dialog box
And I enter "checkbox" into the Variable Name of the open "Add New Field" dialog box
And I enter Choices of "1, Checkbox1" into the open "Add New Field" dialog box
And I enter Choices of "2, Checkbox2" into the open "Add New Field" dialog box
And I enter Choices of "3, Checkbox3" into the open "Add New Field" dialog box
And I enter Choices of "Abc123, Checkbox Abc123" into the open "Add New Field" dialog box
And I click on the button labeled "Save" in the "Add New Field" dialog box
Then I should see the field labeled "Checkbox"
And I should see the multiselect field labeled "checkbox" with the options below
    | Checkbox1       |
    | Checkbox2       |
    | Checkbox3       |
Then I click on the button labeled "Add Field"
And I select "File Upload (for users to upload files)" from the Field Type dropdown of the open "Add New Field" dialog box
And I enter "File Upload" into the Field Label of the open "Add New Field" dialog box
And I enter "file_upload" into the Variable Name of the open "Add New Field" dialog box
And I click on the button labeled "Save" in the "Add New Field" dialog box
Then I should see the field labeled "File Upload"
And I should see the link labeled "Upload file"

##ACTION: Radio Button and Calculated fields creation for Data Types
Then I click on the button labeled "Add Field"
And I enter "radio_button_manual" into the Variable Name of the open "Add New Field" dialog box
And I enter Choices of "99, Choice99" into the open "Add New Field" dialog box
And I enter Choices of "100, Choice100" into the open "Add New Field" dialog box
And I enter Choices of "101, Choice101" into the open "Add New Field" dialog box
And I should see "Save"
And I click on the button labeled "Save" in the "Add New Field" dialog box

#VERIFY
Then I should see a field named "Radio Button Manual"
And I should see the radio field labeled "Radio Button Manual" with the options below
  | Choice99      |
  | Choice100     |
  | Choice101     |
When I click on the button labeled "Add Field"
And I select "Calculated Field" from the Field Type dropdown of the open "Add New Field" dialog box
And I enter "Calculated Field" into the Field Label of the open "Add New Field" dialog box
And I enter "calculated_field" into the Variable Name of the open "Add New Field" dialog box
And I enter the equation "3*2" into Calculation Equation of the open "Add New Field" dialog box
And I click on the button labeled "Save" in the "Add New Field" dialog box

#VERIFY
Then I should see a field named "Calculated Field"
And I should see a link labeled "View equation"

##ACTION: Descriptive text and Identifier fields creation for Data Types
When I click on the button labeled "Add Field"
And I select "Descriptive Text (with optional Image/Video/Audio/File Attachment)" from the Field Type dropdown of the open "Add New Field" dialog box
And I enter "Descriptive Text with File" into the Field Label of the open "Add New Field" dialog box
And I enter "descriptive_text_file" into the Variable Name of the open "Add New Field" dialog box
And I click on the link labeled "Upload file"
And I see a dialog containing the following text: "Attach an image, file, or embedded audio"
When I upload a "docx" format file located at "import_files/D.111.100_Upload File.docx", by clicking the button near "Select a file then click the 'Upload File' button" to browse for the file, and clicking the button labeled "Upload file" to upload the file
Then I should see "Document was successfully uploaded!" in the dialog box

Given I click on the button labeled "Close" in the dialog box
And I click on the button labeled "Save" in the "Add New Field" dialog box

##VERIFY 
Then I should see the field labeled "Descriptive Text with File"
And I should see the link labeled "D.111.100_Upload File.docx"

When I click on the button labeled "Add Field"
And I select "Text Box (Short Text, Number, Date/Time, ...)" from the Field Type dropdown of the open "Add New Field" dialog box
And I enter "Identifier" into the Field Label of the open "Add New Field" dialog box
And I enter "identifier_2" into the Variable Name of the open "Add New Field" dialog box
And I select the radio option "Yes" for the field labeled "Identifier"
And I click on the button labeled "Save"
Then I should see the field labeled "Identifier"

##ACTION Designating field as required
When I click on the button labeled "Add Field"
And I select "Text Box (Short Text, Number, Date/Time, ...)" from the Field Type dropdown of the open "Add New Field" dialog box
And I enter "Required" into the Field Label of the open "Add New Field" dialog box
And I enter "required_2" into the Variable Name of the open "Add New Field" dialog box
And I select the radio option "Yes" for the field labeled "Required"
And I click on the button labeled "Save"
Then I should see "*must provide value on the next Text Box field labeled Required"


#FUNCTIONAL_REQUIREMENT
##VERIFY_Codebook 
When I click on the link labeled "Codebook"
And I should see a table header and rows containing the following values in the codebook table:  

| #  | Variable/Field Name                         |    Field Label                          | Field Attributes(Field Type, Validation, Choices, Calculations, etc.)                   | 
|    | Instrument: Text Validation (text_validation|                                         |                                                                                         |   
| 1  | [record_id]                                 |     Record ID                           | 	             text                                                                      |  
| 2  | [ptname_v2_v2]                              | 	   Name                              | 	             text                                                                      |  
| 3  | [email_v2]                                  |     Email                               | 	             text(email)                                                               |  
| 4  | [text_validation_complete]                  | Section Header: form status (Complete?) | 	dropdown(0 Incomplete, 1 Unverified, 2 Complete                                        |  
|    |  Instrument: Data Types (data_types)        |                                         |                                                                                         |  
| 5  | [ptname]                                    |             Name                        | 	            text                                                                       |  
| 6  | [textbox]                                   |             Text Box                    | 	            text                                                                       | 
| 7  | [dob]                                       |Date of Birth(must be above 18 years old)| 	     text (date_dmy, Min: 2006-01-01, Max: 1990-01-01)                                 | 
| 8  | [multiple_dropdown_manual]                  | Multiple Choice Dropdown Manual         | 	dropdown(5 DDChoice5, 7 DDChoice6, 6 DDChoice7)                                        |   
| 9  | [checkbox]                                  | 	    Checkbox                         | checkbox(1 checkbox__1, Checkbox1),(2 checkbox__2, Checkbox2),(3 checkbox__3, Checkbox3)|
| 10 | [file_upload]                               | 	    Field Upload                     | 	           file                                                                        |  
| 11 | [radio_button_manual]                       | 	Radio Button Manual                  | radio(99 Choice99, 100 DDChoice100, 101 DDChoice101)                                    | 
| 12 | [calculated_field]                          |     Calculated Field                    | 	            calc(Calculation: 3*2)                                                     |  
| 13 | [descriptive_text_file]                     |     Descriptive Text with File          | 	            descriptive                                                                |
| 14 | [identifier_2]                              |     Identifier                          | 	             text, Identifier                                                          |
| 15 | [required]                                  |     Required                            | 	            text, Required                                                             |
| 16 | [data_types_complete]                       | Section Header: form status (Complete?) | 	dropdown(0 Incomplete, 1 Unverified, 2 Complete                                        |   

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
    