Feature: D.119.200 Downloading Metadata and data - The system shall support the ability to download metadata and data (XML)

  As a REDCap end user
  I want to see that downloading metadata and data feature is functioning as expected
 
    # Project D.119.200 consisting of Instrument Text Validation(Name, Email, Form status) and Data Types(Name, Text2, Textbox, Notes Box, Calculated Field, Checkbox,Multiple choice dropdown Auto, Radio Button Manual, File Upload (file_upload), Form status) as instruments shown in the Online Designer
    # Data quality rule for field variable identifier (Rule logic = [identifier] > 8)
    # User role created in project called 'Test Role'
    # One Data Access group created as DAG1
    # Two records will be imported containing data for both instruments
    
  Scenario: 1 Scenario: 1 D.119.200 - Download metadata & data(XML) consisting Text Validation(Record ID,Name, Email, Form status) and Data Types(Name, Text2, Textbox, Notes Box, Calculated Field, Multiple choice dropdown Auto, Multiple choice dropdown Manual, Radio Button Manual, Checkbox, Signature (add signature), File Upload (file_upload), Section break, Descriptive Text with File,Identifier,Identifier, Edit Field, Section break, Descriptive Text, Form Status) as instruments shown in Online Designer. All records, User roles, Data Access Group and Data Quality to be included in XML.

       #SETUP
        Given I login to REDCap with the user "Test_Admin"   
        And I create a new project named "D.119.200" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

      #VERIFY: Text Validation Instrument
        When I click on the link labeled "Designer"
        Then I should see a table header and rows containing the following values in a table:
        | Instrument name          |  Fields |
        | Text Validation          | 3       |
        | Data Types               | 18      |
       
        And I click on the instrument labeled "Text Validation"
        Then I should see "Record ID " within the field with variable name "record_id"
        And I should see "Name" within the field with variable name "ptname_v2_v2"
        And I should see "Email" within the field with variable name "email_v2"

        #VERIFY: Data Types Instrument
        When I click on the link labeled "Designer"
        Then I should see a table header and rows containing the following values in a table:
        | Instrument name          |  Fields |
        | Text Validation          | 3       |
        | Data Types               | 18      |

        And I click on the instrument labeled "Data Types"
        Then I should see "Record ID" within the field with variable name "record_id"
        And I should see "Name" within the field with variable name "ptname"
        And I should see "Text2" within the field with variable name "text2"
        And I should see "Text Box" within the field with variable name "textbox"
        And I should see "Note Box" within the field with variable name "notesbox"
        And I should see "Calculated Field" within the field with variable name "calculated_field" 
        And I should see "Multiple Choice Dropdown Auto" within the field with variable name "multiple_dropdown_auto"
        And I should see "Multiple Choice Dropdown Manual" within the field with variable name "multiple_dropdown_manual"
        And I should see "Radio Button Auto" within the field with variable name "radio_button_auto"
        And I should see "Radio Button Manual" within the field with variable name "radio_button_manual"
        And I should see "Checkbox" within the field with variable name "checkbox"
        And I should see "Signature" within the field with variable name "signature"
        And I should see "File Upload " within the field with variable name "file_upload"
        And I should see "Descriptive Text with File" within the field with variable name "descriptive_file_text"
        And I should see "Required" within the field with variable name "required"
        And I should see "identifier" within the field with variable name "identifier"
        And I should see "identifier" within the field with variable name "identifier_2"
        And I should see "Edit Field" within the field with variable name "edit_field"
        And I should see "Descriptive Text" within the field with variable name "descriptive_text"

        #VERIFY: Events and Arms
        When I click on the link labeled "Project setup"
        And I click on the button labeled "Designate Instruments for My Events"
        And I click on the input element labeled "Arm 1" 
        And I verify the Data Collection Instrument named "Text Validation" is enabled for the Event named "Event 1"  
        And I verify the Data Collection Instrument named "Data Types" is enabled for the Event named "Event 1" 
        Then I click on the input element labeled "Arm 2" 
        And I verify the Data Collection Instrument named "Data Types" is enabled for the Event named "Event 1" 

        #VERIFY: Data Quality rules
        When I click on the link labeled "Data Quality"
        Then I should see "Data Quality Rules"
        And I should see a table header and rows containing the following values in a table: 
        |  Rule #   |                   Rule Name                         | Rule Logic (Show discrepancy  only if...)                         |        
        |      A    | Blank values*                                       |  -                                                                |  
        |      B    | Blank values* (required fields only)                |  -                                                                |  
        |      C    | Field validation errors (incorrect data type)       |  -                                                                |  
        |      D    | Field validation errors (out of range)              |  -                                                                |  
        |      E    | Outliers for numerical fields (numbers, integers, sliders, calc fields)**|  -                                           |  
        |      F    | Hidden fields that contain values***                |  -                                                                |  
        |      G    | Multiple choice fields with invalid values          |  -                                                                |  
        |      H    | Incorrect values for calculated fields              |  -                                                                |  
        |      I    | Fields containing "missing data codes"              |  -                                                                |  
        |      1    | Identifier more than 8                              |  [identifier] > 8			                                            |  
      
        #FUNCTIONAL_REQUIREMENT
        #ACTION: Import (with records in rows and column)
        Given I click on the link labeled "Data Import Tool"
        When I click on the button labeled "Choose File"
        And  I upload a "csv" format file located at "https://github.com/CCTC-team/redcap_cypress/tree/redcap_val/cypress/fixtures/redcap_val_fixtures/import_files", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
        And I click on the button labeled "Upload File"
        Then I should see "Error Display table and Data Display table"
        And I click on the button labeled "Import Data"
        Then I should see " Import Successful! 2 records were created or modified during the import."

        #VERIFY_RSD: 2 records and instruments
        When I click on the link labeled "Record Status Dashboard"
        And I should see a table header and rows containing the following values in a table:
        | Record ID |
        | 1         |
        | 2         |      

       And I should see the "Complete" icon for the "Text Validation" longitudinal instrument on event "Event 1" for record "1"
       And I should see the "Incomplete" icon for the "Data Types" longitudinal instrument on event "Event 1" for record "1"
       And I should see the "Complete" icon for the "Text Validation" longitudinal instrument on event "Event 1" for record "2"
       And I should see the "Incomplete" icon for the "Data Types" longitudinal instrument on event "Event 1" for record "2"

      #VERIFY: User Role with permissions
      When I click on the link labeled "User Rights"
      And I should see a table header and rows containing the following values in a table:
      |  Role Name      | Username            | Expiration |  Data Access Group  |  Project Design and Setup  | User Rights | Data Access Groups | Data Viewing Rights            | Data Exports Rights          | Alerts and Notifications | Reports & Report Builder |Stats and Charts | Calendar | Data Import Tool | Data Comparison Tool | Logging | File Repository | Record Locking Customization | Lock/Unlock Records | Data Quality (create/edit rules) | Data Quality (execute rules) | API   | REDCap Mobile App | Create Records | Rename Records | Delete Records | User Role ID | Unique Role Name |
      |      -          | test_admin          |    never   |       -             |        Ticked              |    Ticked   |       Ticked       |  2 View & Edit                 | 2 Full Data Set              |        Ticked            |      Ticked              |      Ticked     |   Ticked |        Ticked    |  Ticked              |  Ticked |      Ticked     |       Cross                  |      Cross          |        Ticked                    |    Ticked                    | Cross |      Ticked       |      Ticked    |     Cross      |      Cross     |     -        |          -       |
      |   Test Role     | [no users assigned  |            |                     |       Cross                |    Ticked   |       Ticked       |  1 Read Only 1 View and Edit   | 1 No Access 1 Full Data Set  |       Cross              |      Ticked              |      Ticked     |   Ticked |      Cross       |     Cross            |  Cross  |      Ticked     |       Cross                  |      Cross          |        Cross                     |    Cross                     | Cross |      Cross        |      Ticked    |     Cross      |     Cross      |     12       |    U-1714W3W7CD  |

    #VERIFY: DAGS in project
      When I click on the link labeled "DAGs"
      Then I should see a table header and rows containing the following values in data access groups table:
      | Data Access Groups        | Users in group                                    | Number of records in group| Unique Group Name (auto generated)| Group ID number|
      | DAGS1                     |                                                   |          0                | dag1                              |      15        |
      | [Not assigned to a group  |  test_admin (Test User) * Can view all records    |          2                |                                   |                |

     #ACTION: Download Metadata and data xml file for project D.119.200
      Given I click on the link labeled "Project Setup"
      Then I click on the link labeled "Other Functionality"
      And I click on the button labeled "Download metadata & data(XML)" in the dialog box
      Then  I should see a dialog containing the following text: "Exporting Entire project(metadata & data)" 
      And I click on the checkbox element labeled "Include all uploaded files and signatures?" 
      And I select "Export gray form status fields with blank value" on the dropdown field labeled "Export blank values for gray Form Status?" in the dialog box
      And I select ",(comma) - default)" on the dropdown field labeled "Set CSV delimiter character" in the dialog box
      And I select "Use fields native decimal format (default)" on the dropdown field labeled "Force all numbers into a specified decimal format?" in the dialog box
      And I click on the button labeled "Export Entire Project(metadata & data)"
      # De-identification options(optional) which allow you to limit the amount of sensitive information that you are exporting out of the project.
      # Remove Notes/Essay box fields was selected and all the fields was removed from the downloaded project.
      # Remove all date and datetime fields was also selected and all the date and datetime fields was removed from the downloaded project.
      # Deselecting Include all uploaded files and signatures also removes all uploaded files and signatures in the entire project.
      And I should see a dialog containing the following text: "Exporting Data"
      Then I should see a dialog containing the following text: "Data export was successful!"
      Given I click on the download icons to receive the files for the "REDCap XML" format in the dialog box
      #VERIFY
        # The entire project with data input (all records and data, instruments, fields, events, arms and project attributes) can be downloaded as a single XML file (CDISC ODM format).
        # The XML file can be found in the downloads of the user's system in format of 'D119200_yyyy-mm-dd_HH:MM.REDCap.xml'.

      #FUNCTIONAL_REQUIREMENT
      #ACTION: Create new Project using Metadata and data downloaded file and verify metadata and data is correct in this new project
      Given I click on the link labeled "My Projects"
      And I create a new project named "D.119.200_Metadata_and_data" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "D119200_2024-09-01_2335.REDCap.xml", and clicking the "Create Project" button
  
      #VERIFY: Text Validation and Data Types Instrument verfication in new project
      When I click on the link labeled "Designer"
      Then I should see a table header and rows containing the following values in a table:
      | Instrument name          |  Fields |
      | Text Validation          | 3       |
      | Data Types               | 18      |

      #VERIFY:Events and Arms verfication in new project   
      When I click on the link labeled "Project setup"
      And I click on the button labeled "Designate Instruments for My Events"
      And I click on the input element labeled "Arm 1" 
      And I verify the Data Collection Instrument named "Text Validation" is enabled for the Event named "Event 1"  
      And I verify the Data Collection Instrument named "Data Types" is enabled for the Event named "Event 1" 
      Then I click on the input element labeled "Arm 2" 
      And I verify the Data Collection Instrument named "Data Types" is enabled for the Event named "Event 1" 

      #VERIFY: Data Quality rules verfication in new project 
      When I click on the link labeled "Data Quality"
      Then I should see "Data Quality Rules"
      And I should see a table header and rows containing the following values in a table: 
      |  Rule #   |                   Rule Name                         | Rule Logic (Show discrepancy  only if...)                         |        
      |      A    | Blank values*                                       |  -                                                                |  
      |      B    | Blank values* (required fields only)                |  -                                                                |  
      |      C    | Field validation errors (incorrect data type)       |  -                                                                |  
      |      D    | Field validation errors (out of range)              |  -                                                                |  
      |      E    | Outliers for numerical fields (numbers, integers, sliders, calc fields)**|  -                                           |  
      |      F    | Hidden fields that contain values***                |  -                                                                |  
      |      G    | Multiple choice fields with invalid values          |  -                                                                |  
      |      H    | Incorrect values for calculated fields              |  -                                                                |  
      |      I    | Fields containing "missing data codes"              |  -                                                                |  
      |      1    | Identifier more than 8                              |  [identifier] > 8			                                            |  
      
    #VERIFY: User Role with permissions verification in new project
    When I click on the link labeled "User Rights"
    And I should see a table header and rows containing the following values in a table:
    |  Role Name      | Username            | Expiration |  Data Access Group  |  Project Design and Setup  | User Rights | Data Access Groups | Data Viewing Rights            | Data Exports Rights          | Alerts and Notifications | Reports & Report Builder |Stats and Charts | Calendar | Data Import Tool | Data Comparison Tool | Logging | File Repository | Record Locking Customization | Lock/Unlock Records | Data Quality (create/edit rules) | Data Quality (execute rules) | API   | REDCap Mobile App | Create Records | Rename Records | Delete Records | User Role ID | Unique Role Name |
    |      -          | test_admin          |    never   |       -             |        Ticked              |    Ticked   |       Ticked       |  2 View & Edit                 | 2 Full Data Set              |        Ticked            |      Ticked              |      Ticked     |   Ticked |        Ticked    |  Ticked              |  Ticked |      Ticked     |       Cross                  |      Cross          |        Ticked                    |    Ticked                    | Cross |      Ticked       |      Ticked    |     Cross      |      Cross     |     -        |          -       |
    |   Test Role     | [no users assigned  |            |                     |       Cross                |    Ticked   |       Ticked       |  1 Read Only 1 View and Edit   | 1 No Access 1 Full Data Set  |       Cross              |      Ticked              |      Ticked     |   Ticked |      Cross       |     Cross            |  Cross  |      Ticked     |       Cross                  |      Cross          |        Cross                     |    Cross                     | Cross |      Cross        |      Ticked    |     Cross      |     Cross      |     12       |    U-1714W3W7CD  |

    #VERIFY: DAGS in project
    When I click on the link labeled "DAGs"
    Then I should see a table header and rows containing the following values in data access groups table:
    | Data Access Groups        | Users in group                                    | Number of records in group| Unique Group Name (auto generated)| Group ID number|
    | DAGS1                     |                                                   |          0                | dag1                              |      15        |
    | [Not assigned to a group  |  test_admin (Test User) * Can view all records    |          2                |                                   |                |
  
  #VERIFY_RSD: Check all records and data are visible for instruments in Record Status Dashboard
    When I click on the link labeled "Record Status Dashboard"
    And I should see a table header and rows containing the following values in a table:
    | Record ID |
    | 1         |
    | 2         |      

  #VERIFY: Check data for Record 1
  And I should see the "Complete" icon for the "Text Validation" longitudinal instrument on event "Event 1" for record "1"
  And I should see the "Incomplete" icon for the "Data Types" longitudinal instrument on event "Event 1" for record "1"
  And I should see the "Complete" icon for the "Text Validation" longitudinal instrument on event "Event 1" for record "2"
  And I should see the "Incomplete" icon for the "Data Types" longitudinal instrument on event "Event 1" for record "2"
  Then I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
  And I should see "Tony Stone" in the data entry form field "Name" 
  And I should see "tonystone@example.com" in the data entry form field "Email" 
  And I should see the dropdown field labeled "Complete" with the option "Complete" selected in the dialog box
  Then I click on the bubble for the "Data Types" data collection instrument for record ID "1" 
  And I should see "Lily Brown" in the data entry form field "Name" 
  And I should see "She is a teacher" in the data entry form field "Text box"
  And I should see "6" in the data entry form field "Calculated Field"  
  And I should see the radio labeled "Radio Button Manual" with option "Choice99" selected
  And I should see "7 Image v913.jpg" in the data entry form field "Descriptive Text with File" 
  And I should see "1" in the data entry form field "Required"
  And I should see "7" in the data entry form field "Identifier"
  And I should see the dropdown field labeled "Complete" with the option "Incomplete" selected in the dialog box
  #VERIFY: Check data for Record 2
  Then I click on the link labeled "Record Status Dashboard"
  And I click on the bubble for the "Text Validation" data collection instrument for record ID "2" 
  And I should see "Daniel Smith" in the data entry form field "Name" 
  And I should see "dannysmith@example.com" in the data entry form field "Email" 
  And I should see the dropdown field labeled "Complete" with the option "Complete" selected in the dialog box
  Then I click on the bubble for the "Data Types" data collection instrument for record ID "2" 
  And I should see "Fred Gatefield" in the data entry form field "Name" 
  And I should see "He is a doctor" in the data entry form field "Text box"
  And I should see "6" in the data entry form field "Calculated Field"  
  And I should see the dropdown field labeled "Multiple Choice Dropdown Manual" with the option "DDChoice6" selected within the data collection instrument list
  And I should see the radio labeled "Radio Button Manual" with option "Choice101" selected
  And I should see the radio labeled "Checkbox" with option "Checkbox" selected
  And I should see "7 Image v913.jpg" in the data entry form field "Descriptive Text with File" 
  And I should see "2" in the data entry form field "Required"
  And I should see "9" in the data entry form field "Identifier"
  And I should see the dropdown field labeled "Complete" with the option "Incomplete" selected in the dialog box
  And I logout