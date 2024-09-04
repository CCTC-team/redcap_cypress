Feature: Stats and Charts: The system shall support the viewing of stats and charts.

    As a REDCap end user
    I want to see that Stats and Charts is functioning as expected

    Scenario: Uploading Project D.118.100 consisting Text Validation and Data Types as instruments through the Online Designer to view stats and charts.

        #SETUP
        Given I login to REDCap with the user "Test_Admin"   
        And I create a new project named "D.118.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

        ##SETUP_VERIFICATION: Text Validation and  Data Types
        When I click on the link labeled "Designer"
        And I click on the link labeled "Text Validation"
        Then I should see "Record ID" within the field with variable name "record_id"
        And I should see "Name" within the field with variable name "ptname_v2"
        And I should see "Email" within the field with variable name "email_v2"
        Then I click on the link labeled "Next Instrument"
        And I should see "Data Types"
        And I should see "Name" within the field with variable name "ptname" 
        And I should see "Text Box" within the field with variable name "textbox"
        And I should see "Multiple Choice Dropdown Manual" within the field with variable name "multiple_dropdown_manual"
        And I should see "File Upload " within the field with variable name "file_upload"
        And I should see "Calculated Field" within the field with variable name "calculated_field" 
       


        #FUNCTIONAL_REQUIREMENT
        ##ACTION: Import (with records in rows and column)
        Given I click on the link labeled "Data Import Tool"
        When I upload a "csv" format file located at "D.118.100_Data_Import.csv", by clicking the button near "Choose File" to browse for the file, and clicking the button labeled "Upload File" to upload the file
        Then I should see "Your document was uploaded successfully and is ready for review"
        And I click on the button labeled "Import Data"
        Then I should see "Import Successful! 15 records were created or modified during the import"

        #VERIFY_RSD: 15 records
        When I click on the link labeled "Record Status Dashboard"
        Then I should see "of 15 records"


        ##VERIFY_DE
        When I click on the link labeled "Data Exports, Reports, and Stats"
        Then I should see a table rows containing the following values in the reports table:  

         | A | All data (all records and fields)  |  
         | B | Selected instruments and/or events |
        
        And I click on the button labeled "Stats & Charts" 
        Then I see a table header and rows containing the following values in the report data table:   

         | Display Options                            | 
         | Select a data Collection instrument to view| 

        And I select "Text Validation" on the dropdown field labeled "Select a data Collection instrument to view" within the data collection instrument list
        Then I see a table header and rows containing the following values in the report data table: 

         | Name (ptname_v2)                     |           |        |
         | Total Count(N)                       |  Missing  |        | 
         |      12                              |  3(20.0%) |        |
         |Email (email_v2)                      |           |        |
         | Total Count(N)                       | Missing   |        |
         |      11                              |  4(26.7%) |        | 
         | Complete? (text_validation_complete) |           |        |
         |   Total Count(N)                     | Missing   | Unique |
         |     15                               |   0(0.0%) |     3  |

        And I should see "Counts/frequency: Incomplete (4, 26.7%), Unverified (5, 33.3%), Complete (6, 40.0%)"
        And I should see "View as Bar Chart"
        And I should see "a Bar Chart showing Incomplete count: 4, Unverified count: 5, Complete count: 6"
        Then I select "View as Pie Chart" on the dropdown field labeled "Complete?"
        And I should see "a Pie Chart showing Complete 6(40%), Incomplete (4, 26.7%), Unverified 5(33.3%)"
        And I should see "Counts/frequency: Incomplete (4, 26.7%), Unverified (5,33.3%), Complete (6, 40.0%)" in the title

        Then I select "Data Types" on the dropdown field labeled "Select a data Collection instrument to view" within the data collection instrument list
        And I see a table header and rows containing the following values in the report data table:

         |Name (ptname)                                             |          |        |
         | Total Count(N)                                           | Missing  |        |
         |      13                                                  | 2(13.3%) |        |
         |Text Box (textbox)                                        |          |        |
         | Total Count(N)                                           | Missing  |        |
         |      11                                                  |  4(26.7%)|        |
         |Multiple Choice Dropdown Manual (multiple_dropdown_manual)|          |        |
         | Total Count(N)                                           | Missing  | Unique |
         |     12                                                   | 3(20.0%) |   3    |

        And I should see "Counts/frequency: DDChoice5 (3, 25.0%), DDChoice6 (7, 58.3%), DDChoice7 (2, 16.7%)"
        And I should see "View as Bar Chart"
        And I should see "a Bar Chart showing DDChoice5 count: 3, DDChoice6 count: 7, DDChoice7 count: 2"
        Then I select "View as Pie Chart" on the dropdown field labeled "Complete?"
        And I should see "a Pie Chart showing DDChoice7 2(16.7%), DDChoice6 7(58.3%), DDChoice5 3(25.0%)"
       
        Then I should NOT see "File Upload" 
        And I see a table header and rows containing the following values in the report data table: 
         |Calculated Field (calculated_field)|          |        |      |     |      |       |     | Percentile |       |       |             |       |      |        |
         | Total Count(N)                    | Missing  | Unique |  Min | Max | Mean | StDev | Sum |  0.05      | 0.10  |  0.25 | 0.50(Median)| 0.75  | 0.90 |  0.95  |
         |      1                            | 14(93.3%)|    1   |    6 |   6 |   6  |  nan  | 6   |    6       |   6   |   6   |    6        |  6    |  6   |   6    |
        And I should see "Lowest values: 6"
        And I should see "Highest values: 6"
        And I should see "a Bar Chart showing Value 6 / Click plot point to go to this record /"
        And I should see "a Bar Chart showing Median 6 / Median value /"
        And I logout