Feature: Downloading Metadata and data.The system shall support the ability to download metadata and data (XML)

  As a REDCap end user
  I want to see that 21.2_downloading_metadata_and_data.feature is functioning as expected
 
   # I used pre existing project and dummy records
    # The Project_redcap_val_Test has been setup to include one instruments namely Text Validation
    # Text Validation consist of 4 fields namely Record Id(Field name = record_id with attribute text), Name(Field name = ptname_v2_v2 with attribute text), Name(Field name = identifier with attribute text),Name(Field name = email_v2 with attribute text), Name(Field name = identifier_2 with attribute text) and Section Header:Form status(Field name = text_validation_complete attribute dropdown)
    # The Project_redcap_val_test contains data quality rules for field identifier (Rule logic = [identifier] > 8)
    # Dummy records consist of Record Id(Field name = record_id with attribute text) as 1, Name(Field name = ptname_v2_v2 with attribute text) as Tan, Name(Field name = identifier with attribute text) as 8
    
        Scenario: 1 Download metadata & data(XML)
        Given I login to REDCap with the user "test_admin" 
        And I click on the link labeled "My Projects"
        Then I should see a row labeled "Project_redcap_val_Test" in the projects table
        And I click on the link labeled "Project_redcap_val_Test"
        Given I click on the tab labeled "Other Functionality"
        And I click on the button labeled "Download metadata & data(XML)" in the dialog box
        Then  I should see a dialog containing the following text: "Exporting Entire project(metadata & data)" 
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
        ##VERIFY
        # The entire project with data input (all records, instruments, fields, events, arms and project attributes) can be downloaded as a single XML file (CDISC ODM format).
        # The XML file can be found in the downloads of the user's system.
        
        Scenario: 2 Create new project and upload Metadata file and verify all project attributes
        Given I login to REDCap with the user "Test_Admin"
        And I create a new project named "Project_redcap_val_21.2" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val_Test_2024-05-31", and clicking the "Create Project" button 

        ##VERIFY: Project attributes including instruments, fields, data quality rules, events and arms exist in project

        #VERIFY: Text Validation Instrument and fields 
        When I click on the link labeled "Designer"
        And I click on the instrument labeled "Text Validation"
        Then I should see the field labeled "Record ID"
        And I should see the field labeled "Name"
        And I should see the field labeled "Email"
        And I should see the field labeled "Identifier"
      
      
        
        #VERIFY: Events and Arms
        When I click on the link labeled "Project setup"
        And I click on the button labeled "Designate Instruments for My Events"
        And I click on the input element labeled "Arm 1" 
        And I verify the Data Collection Instrument named "Text Validation" is enabled for the Event named "Event 1" 
        And I verify the Data Collection Instrument named "Text Validation" is enabled for the Event named "Event 2" 
        And I verify the Data Collection Instrument named "Text Validation" is enabled for the Event named "Event 3" 
        Then I click on the input element labeled "Arm 2" 
        And I verify the Data Collection Instrument named "Text Validation" is enabled for the Event named "Event 1" 

        #VERIFY: Data Quality rules
      
        When I click on the link labeled "Data Quality"
        Then I should see "Data Quality Rules"
        And I should see a table header and rows containing the following values in the Data Quality Rules table: 
| Rule # |                               Rule Name                           | Rule Logic (Show discrepancy  only if...) |        
|      A    |  Blank values*                                                    |  -                                                                 |  
|      B    |  Blank values* (required fields only)              |  -                                                                |  
|      C    |  Field validation errors (incorrect data type)|  -                                                                |  
|      D    | Field validation errors (out of range)             |  -                                                                |  
|      E    | Outliers for numerical fields (numbers, integers, sliders, calc fields)**|  -                  |  
|      F    |  Hidden fields that contain values***           |  -                                                                 |  
|      G   | Multiple choice fields with invalid values     |  -                                                                 |  
|      H   | Incorrect values for calculated fields             |  -                                                                 |  
|      I    | Fields containing "missing data codes"           |  -                                                                |  
|      1    | Identifier more than 8                                                         |  [identifier] > 8			      |  
|         | 	                       |                                 |  
     #VERIFY_RSD: All records exist in Record Status Dashboard
     #Dummy records consist of Record Id(Field name = record_id with attribute text) as 1, Name(Field name = ptname_v2_v2 with attribute text) as Tan, Name(Field name = identifier with attribute text) as 8

  When I click on the link labeled "Record Status Dashboard"
  Then I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
  And I should see "Tan" in the data entry form field "Name" 
  And I should see "8" in the data entry form field "identifier" 
  And I should see the dropdown field labeled "Complete" with the option "Complete" selected in the dialog box
  And I logout