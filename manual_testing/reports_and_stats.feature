Feature: Reports and Stats

  As a REDCap end user
  I want to see that My Projects is functioning as expected

# I used pre existing project and dummy records
# The Project_CUH_v1381 has been setup to include two instruments namely Text Validation and Data Types.
# Text Validation consist of 3 fields namely Record Id(Field name = record_id with attribute text), Name(Field name = ptname_v2_v2 with attribute text) and Section Header:Form status(Field name = text_validation_complete attribute dropdown)
# Data Types consist of 3 fields namely Date of birth(Field name = dob_v2 with attribute text (Field name = date_dmy with attribute text), Calculated Field(field name = calculated_field with attribute calculation 3*2) Section Header:Form status(Field name = data_types_complete attribute dropdown)
# In Text Validation instrument 3 Record Id has been created. Record Id 3 was intentionally left without entering any data to be able to see how stats and report works.
# Hence added records for Scenarios. So the reports and graphs could work

 Scenario: Test Setup - Text Validation and Data Types
    Given I am a "standard" user who logs into REDCap
    And I click on the link labeled "My Projects"
    And I click on the link labeled "Project_CUH_v1381"
    And I should see the  "Project Setup page"
    And I scroll under "Data Collection" on the left
    And I click on the link labeled "Add/Edit Records"
    And I should see the "Add/Edit Records page"
    Then I should select "Arm 1: Arm 1" 
    And I scroll under "Select record"
    And I click on "1" of 3
    And I wait for 0.5 seconds
    And I should see the "Record Home Page"
    Then I should select "Text Validation"
    And I should see the "Text Validation page"
    And I should enter "John Doe" as the "Name"
    And I scroll under "Form status"
    Then I should select "Complete"
    And I click on the button labeled "Save & Exit Form"
    Then I should see "successfully edited"
    And I scroll under "Data Collection" on the left
    And I click on the link labeled "Select other record"
    And I should see the "Add/Edit Records page"
    And I scroll under "Select record"
    And I click on "2" of 3
    And I wait for 0.5 seconds
    Then I should select "Text Validation"
    And I should see the "Text Validation page"
    And I should enter "Janet Stone" as the "Name"
    And I scroll under "Form status"
    Then I should select "Complete"
    And I click on the button labeled "Save & Exit Form"
    Then I should see "successfully edited"
    And I should see the "Record Home Page"
    Then I should select "Data Types"
    And I should see the "Data Types page"
    And I should enter "4/11/1990" as the "Date of Birth"
    And I should see the "Calculated Field = 6"
    Then I should select "Complete"
    And I click on the button labeled "Save & Exit Form"
    Then I should see "successfully edited"

  
  Scenario 1: Accessing Data Exports, Reports and Stats page for Text Validation and Data Types
    Given I am a "standard" user who logs into REDCap
    And I click on the tab labeled "My Projects"
    And I should see "List of Project Title" 
    Then I click on the link labeled "Project_CUH_v1381"
    And I should see "Project Setup page"
    And I scroll under "Application" on the left
    And I click on the link labeled "Data Exports, Reports and Stats"
    And I should see "My Reports & Exports page"
    And I click on the button labeled "Stats & Charts"
    And I should see "Stats & Charts: All data (all records and fields) page"
    And I click on the dropdown labeled "Select a data collection instrument to view"
    And I should see "select an instrument"
    Then I click the option "Text Validation"
    And I wait for 0.5 seconds
    And I should see "field names" of the current instrument
    And I should see "variable names" of the current instrument
    # Under the field and variable names. There are total count and missing rolls and columns 
    And I should see "Name" showing the 2 names entered
    And I should see "Missing" showing 1 of the name missing
    And I should see "Complete" showing the 2 completed
    And I should see "Missing" showing 1 incompleted
    And I should see "Bar Chart" showing the frequency
    And I should see "Pie Chart" showing the frequency as an option 
    # And then scroll back to the top to do the same for Data Types Instrument
    And I should see "select an instrument"
    Then I click the option "Data Types"
    And I wait for 0.5 seconds
    And I should see "field names" of the current instrument
    And I should see "variable names" of the current instrument
    # Under the field and variable names. There are total count and missing rolls and columns 
    And I should see "Name" showing the 2 names entered
    And I should see "Missing" showing 1 of the name missing
    And I should see "Complete" showing the 2 completed
    And I should see "Missing" showing 1 incompleted
    And I should see "Bar Chart" showing the frequency
    And I should see "Pie Chart" showing the frequency as an option 

Scenario 2: View Report
  Given I click on the button labeled "View Report"
  Then I should see "View Report: All data (all records and fields) page"
  And I should see "Record Id 1,2,3"
  And I should see "Name as John Doe and Janet Stone"
  And I should see "Complete(2)"
  And I should see "4/11/1990" as the "Date of Birth"
  And I should see the "Calculated Field = 6"




  


  




    




   
    