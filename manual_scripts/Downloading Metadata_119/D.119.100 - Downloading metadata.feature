Feature: D.119.100 Downloading Metadata - The system shall support the ability to download metadata only (XML)


  As a REDCap end user
  I want to see that downloading metadata only feature is functioning as expected
 
    # Project D.119.100 consisting of Instrument Text Validation(Name, Email, Form status) and Data Types(Name, Text2, Textbox, Notes Box, Calculated Field, Checkbox,Multiple choice dropdown Auto, Radio Button Manual, File Upload (file_upload), Form status) as instruments shown in the Online Designer
    # Data quality rule for field variable identifier (Rule logic = [identifier] > 8)
    # User role created in project called 'Test Role'
    # One Data Access group created as DAG1
    # Two records will be imported containing data for both instruments

    Scenario: 1 D.119.100 - Downloading Metadata only(XML) consisting Text Validation(Record ID,Name, Email, Form status) and Data Types(Name, Text2, Textbox, Notes Box, Calculated Field, Multiple choice dropdown Auto, Multiple choice dropdown Manual, Radio Button Manual, Checkbox, Signature (add signature), File Upload (file_upload), Section break, Descriptive Text with File,Identifier,Identifier, Edit Field, Section break, Descriptive Text, Form Status) as instruments shown in Online Designer. User roles, Data Access Group and Data Quality to be included in XML.

      #SETUP
        Given I login to REDCap with the user "Test_Admin"   
        And I create a new project named "D.119.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

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
|           | 	                                                  |                                                                   |  

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
      Then I should see "Data Quality Rules"
      And I should see a table header and rows containing the following values in a table:

|  Role Name      | Username            | Expiration |  Data Access Group  |  Project Design and Setup  | User Rights | Data Access Groups | Data Viewing Rights            | Data Exports Rights          | Alerts and Notifications | Reports & Report Builder |Stats and Charts | Calendar | Data Import Tool | Data Comparison Tool | Logging | File Repository | Record Locking Customization | Lock/Unlock Records | Data Quality (create/edit rules) | Data Quality (execute rules) | API   | REDCap Mobile App | Create Records | Rename Records | Delete Records | User Role ID | Unique Role Name |
|      -          | test_admin          |    never   |       -             |        Ticked              |    Ticked   |       Ticked       |  2 View & Edit                 | 2 Full Data Set              |        Ticked            |      Ticked              |      Ticked     |   Ticked |        Ticked    |  Ticked              |  Ticked |      Ticked     |       Cross                  |      Cross          |        Ticked                    |    Ticked                    | Cross |      Ticked       |      Ticked    |     Cross      |      Cross     |     -        |          -       |
|      Test Role  | [no users assigned  |            |                     |       Cross                |    Ticked   |       Ticked       |  1 Read Only 1 View and Edit   | 1 No Access 1 Full Data Set  |       Cross              |      Ticked              |      Ticked     |   Ticked |      Cross       |     Cross            |  Cross  |      Ticked     |       Cross                  |      Cross          |        Cross                     |    Cross                     | Cross |      Cross        |      Ticked    |     Cross      |     Cross      |     12       |    U-1714W3W7CD  |

    #VERIFY: DAGS in project

      When I click on the link labeled "DAGs"
      Then I should see a table header and rows containing the following values in data access groups table:

      | Data Access Groups        | Users in group                                    | Number of records in group| Unique Group Name (auto generated)| Group ID number|
      | DAGS1                     |                                                   |          0                | dag1                              |      15        |
      | [Not assigned to a group  |  test_admin (Test User) * Can view all records    |          2                |                                   |                |


     
     #ACTION: Download Metadata only xml file for project D.119.100
       
      Given I click on the link labeled "Project Setup"
      Then I click on the link labeled "Other Functionality"
      And I click on the button labeled "Download metadata only(XML)"
      #VERIFY: The entire project (instruments, arms, fields, data quality rules, data access groups, user roles and project attributes) can be downloaded as a single XML file (CDISC ODM format).
      # The XML file can be found in the downloads of the user's system in format of 'D119100_yyyy-mm-dd_HH:MM.REDCap.xml'.


      #FUNCTIONAL_REQUIREMENT
      #ACTION: Create new Project using Metadata downloaded file and verify metadata is correct in this new project
      Given I click on the link labeled "My Projects"
      And I create a new project named "D.119.100_Metadata_only" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "D119100_2024-08-31_0025.REDCap.xml", and clicking the "Create Project" button
  
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
|           | 	                                                  |                                                                   |  

    #VERIFY: User Role with permissions verification in new project
    When I click on the link labeled "User Rights"
    Then I should see "Data Quality Rules"
    And I should see a table header and rows containing the following values in a table:

    |  Role Name      | Username            | Expiration |  Data Access Group  |  Project Design and Setup  | User Rights | Data Access Groups | Data Viewing Rights            | Data Exports Rights          | Alerts and Notifications | Reports & Report Builder |Stats and Charts | Calendar | Data Import Tool | Data Comparison Tool | Logging | File Repository | Record Locking Customization | Lock/Unlock Records | Data Quality (create/edit rules) | Data Quality (execute rules) | API   | REDCap Mobile App | Create Records | Rename Records | Delete Records | User Role ID | Unique Role Name |
    |      -          | test_admin          |    never   |       -             |        Ticked              |    Ticked   |       Ticked       |  2 View & Edit                 | 2 Full Data Set              |        Ticked            |      Ticked              |      Ticked     |   Ticked |        Ticked    |  Ticked              |  Ticked |      Ticked     |       Cross                  |      Cross          |        Ticked                    |    Ticked                    | Cross |      Ticked       |      Ticked    |     Cross      |      Cross     |     -        |          -       |
    |      Test Role  | [no users assigned  |            |                     |       Cross                |    Ticked   |       Ticked       |  1 Read Only 1 View and Edit   | 1 No Access 1 Full Data Set  |       Cross              |      Ticked              |      Ticked     |   Ticked |      Cross       |     Cross            |  Cross  |      Ticked     |       Cross                  |      Cross          |        Cross                     |    Cross                     | Cross |      Cross        |      Ticked    |     Cross      |     Cross      |     12       |    U-1714W3W7CD  |


    #VERIFY: DAGS in project
    When I click on the link labeled "DAGs"
    Then I should see a table header and rows containing the following values in data access groups table:

    | Data Access Groups        | Users in group                                    | Number of records in group| Unique Group Name (auto generated)| Group ID number|
    | DAGS1                     |                                                   |          0                | dag1                              |      15        |
    | [Not assigned to a group  |  test_admin (Test User) * Can view all records    |          2                |                                   |                |
    And I logout