Feature: D.119.100 Downloading Metadata - The system shall support the ability to download metadata only (XML)


  As a REDCap end user
  I want to see that downloading metadata only feature is functioning as expected
 
    # I used pre existing project and dummy records
    # The Project_redcap_val_Test has been setup to include one instruments namely Text Validation
    # Text Validation consist of 4 fields namely Record Id(Field name = record_id with attribute text), Name(Field name = ptname_v2_v2 with attribute text), Name(Field name = identifier with attribute text),Name(Field name = email_v2 with attribute text), Name(Field name = identifier_2 with attribute text) and Section Header:Form status(Field name = text_validation_complete attribute dropdown)
    # The Project_redcap_val_test contains data quality rules for field identifier (Rule logic = [identifier] > 8)
    # Dummy records consist of Record Id(Field name = record_id with attribute text) as 1, Name(Field name = ptname_v2_v2 with attribute text) as Tan, Name(Field name = identifier with attribute text) as 8

    Scenario: 1 D.119.100 - Downloading Metadata only(XML)

        Given I login to REDCap with the user "test_admin" 
        And I click on the link labeled "My Projects"
        Then I should see a row labeled "Project_redcap_val_Test" in the projects table
        And I click on the link labeled "Project_redcap_val_Test"
        And I click on the link labeled "Other Functionality"
        And I click on the button labeled "Download metadata only(XML)"
        Then I should see "Project_redcap_val_test_(date of the download)_1249.REDCap.xml" downloaded to computer
        ##VERIFY
        # The entire project (instruments, arms, fields, quality rules and project attributes) can be downloaded as a single XML file (CDISC ODM format).
        # The XML file can be found in the downloads of the user's system.
    
        Scenario: 2 Create new project and upload Metadata file and verify all project attributes
        Given I login to REDCap with the user "Test_Admin"
        And I create a new project named "D.119.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val_Test_2024-05-31", and clicking the "Create Project" button 

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
|  Rule #   |                   Rule Name                         | Rule Logic (Show discrepancy  only if...)                         |        
|      A    |  Blank values*                                      |  -                                                                |  
|      B    |  Blank values* (required fields only)               |  -                                                                |  
|      C    |  Field validation errors (incorrect data type)      |  -                                                                |  
|      D    | Field validation errors (out of range)              |  -                                                                |  
|      E    | Outliers for numerical fields (numbers, integers, sliders, calc fields)**|  -                                           |  
|      F    |  Hidden fields that contain values***               |  -                                                                |  
|      G    | Multiple choice fields with invalid values          |  -                                                                |  
|      H    | Incorrect values for calculated fields              |  -                                                                |  
|      I    | Fields containing "missing data codes"              |  -                                                                |  
|      1    | Identifier more than 8                              |  [identifier] > 8			                                            |  
|           | 	                                                  |                                                                   |  
And I logout
      






        
    