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
    And I should see the link labeled "Project_CUH_v1381"
    And I should see "PID = 16"
    And I should see "Records = 2"
    And I should see "Fields = 6"
    And I should see "Instruments = 2 forms"
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

  
  Scenario 1: Accessing Data Exports, Reports and Stats page for Text Validation
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
    # Same Scenario for Data Types

Scenario 2: View Report
  Given I click on the button labeled "View Report"
  Then I should see "View Report: All data (all records and fields) page"
  And I should see "Record Id 1,2,3"
  And I should see "Name as John Doe and Janet Stone"
  And I should see "Complete(2)"
  And I should see "4/11/1990" as the "Date of Birth"
  And I should see the "Calculated Field = 6"

Scenario 3: Export Data
 Given I click on the button labeled "Export Data"
 # Ask if we are using all the option seen on the page


  


  




    




    Scenario: 2 - My Projects dashboard displays six columns
    Given I click on the link labeled "My Projects"
    Then I should see "Project Title"
    And I should see "Records"
    And I should see "Fields"
    And I should see "Instruments"
    And I should see "Type"
    And I should see "Status"


  Scenario: Project Setup 2 - Longitudinal Data Collection is enabled and Project is in development
    Given I click on the link labeled "My Projects"
    And I click on the link labeled "13_MyProjects_v1115"
    And I should see "Development"
    And I click on the link labeled "Project Setup"
    And I should see that longitudinal mode is "enabled"

  Scenario: 2 - My Projects dashboard displays six columns
    Given I click on the link labeled "My Projects"
    Then I should see "Project Title"
    And I should see "Records"
    And I should see "Fields"
    And I should see "Instruments"
    And I should see "Type"
    And I should see "Status"

  Scenario: 2 - The number in Records column in the My Projects dashboard should match the no:of records in a project
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Record Status Dashboard"
    Then I should see 1 record in the Record Status Dashboard
    And I click on the link labeled "Arm 2:"
    Then I should see 0 records in the Record Status Dashboard
    And I click on the link labeled "My Projects"
    Then I should see "1" in column 2 next to the link "13_MyProjects_v1115"

  Scenario: 3 - The number in Fields column in the My Projects dashboard should match the sum of fields and instruments in a project
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Designer"
    Then I should see 2 instruments
    And The sum of field count of all the instruments should equal to 21
    And I click on the link labeled "My Projects"
    Then I should see "23" in column 3 next to the link "13_MyProjects_v1115"
    # No:of instruments + field count = 2+21=23. Which matches the Field Count in My Projects Dashboard
    
  Scenario: 4 - The number in Instruments column in the My Projects dashboard should match the no:of instruments in a project
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Designer"
    Then I should see 2 instruments
    And I click on the link labeled "My Projects"
    Then I should see "2" in column 4 next to the link "13_MyProjects_v1115"
   
  Scenario: 5 - Check if Longitudinal Data Collection is enabled in both the project and My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Project Setup"
    Then I should see that longitudinal mode is "enabled"
    And I click on the link labeled "My Projects"
    Then I should see the icon "Longitudinal / repeating forms" in column 5 next to the link "13_MyProjects_v1115"
    
  Scenario: 6 - Disable Longitudinal Data Collection and ensure it reflects in the My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Project Setup"
    And I disable longitudinal mode
    And I click on the link labeled "My Projects"
    Then I should see the icon "Classic" in column 5 next to the link "13_MyProjects_v1115"
   
  Scenario: 7 - Check if the Project is in Development mode in both the project and My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115"
    Then I should see "Development"
    And I click on the link labeled "My Projects"
    Then I should see the icon "Development" in column 6 next to the link "13_MyProjects_v1115"
    
  Scenario: 8 - Change the Project Title and ensure it reflects in the My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Modify project title, purpose, etc."
    And I enter "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789Validation" into the field identified by "[id=app_title]"
    And I click on the button labeled "Save"
    Then I should see "13_MyProjects_v1115ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789Validation"
    And I click on the link labeled "My Projects"
    Then I should see "13_MyProjects_v1115ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789Validation"

  Scenario: 9 - Change the Project Title back and ensure it reflects in the My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789Validation"
    Then I should see "13_MyProjects_v1115ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789Validation"
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Modify project title, purpose, etc."
    And I clear the field identified by "[id=app_title]"
    And I enter "13_MyProjects_v1115" into the field identified by "[id=app_title]"
    And I click on the button labeled "Save"
    Then I should see "13_MyProjects_v1115"
    And I click on the link labeled "My Projects"
    Then I should see "13_MyProjects_v1115"

  Scenario: 10 - Add a new record and ensure it reflects in the My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    Then I click on the image "circle_gray" link for the row containing "Text Validation"
    And I enter "John" into the field identified by "input[name=ptname_v2_v2]"
    And I enter "John@gmail.com" into the field identified by "input[name=email_v2]"
    And I click on the button labeled "Save & Exit Form"
    Then I should see "successfully added"
    And I click on the link labeled "Record Status Dashboard"
    Then I should see 2 records in the Record Status Dashboard
    And I click on the link labeled "My Projects"
    Then I should see "2" in column 2 next to the link "13_MyProjects_v1115"

  # Not able to delete record 2. Link containing 2 does not point to Record 2 but points to Arm 2. 
  # Hence added 2 records for Scenario 10. So Scenario 11 could work
  Scenario: 10 Duplicate - Add a new record and ensure it reflects in the My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    Then I click on the image "circle_gray" link for the row containing "Text Validation"
    And I enter "JohnDup" into the field identified by "input[name=ptname_v2_v2]"
    And I enter "JohnDup@gmail.com" into the field identified by "input[name=email_v2]"
    And I click on the button labeled "Save & Exit Form"
    Then I should see "successfully added"
    And I click on the link labeled "Record Status Dashboard"
    Then I should see 3 records in the Record Status Dashboard
    And I click on the link labeled "My Projects"
    Then I should see "3" in column 2 next to the link "13_MyProjects_v1115"

  Scenario: 11 - Delete the last record and ensure it reflects in the My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "3"
    And I click on the button labeled "Choose action for record"
    And I click on the link labeled "Delete record"
    And I click on the button labeled "DELETE RECORD"
    Then I should see 'Record ID "3" was successfully deleted.'
    And I close the popup
    And I click on the link labeled "Record Status Dashboard"
    Then I should see 2 records in the Record Status Dashboard
    And I click on the link labeled "My Projects"
    Then I should see "2" in column 2 next to the link "13_MyProjects_v1115"

  Scenario: 12 - Add a field and ensure it reflects in the My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Designer"
    And I click on the table cell containing a link labeled "Text Validation"
    And I click on the Add Field input button below the field named "Email"
    And I select "textarea" from the dropdown identified by "select[name=field_type]"
    And I enter "Notes Box" into the field identified by "textarea[name=field_label]"
    And I enter "notesbox1" into the field identified by "input[name=field_name]"
    And the AJAX "GET" request at "Design/online_designer_render_fields.php*" tagged by "render" is being monitored
    And I click on the button labeled "Save"
    # And the AJAX request tagged by "render" has completed
    Then I should see "notesbox1"
    And I should see the element identified by "textarea[id=notesbox1]"
    And I click on the link labeled "Designer"
    Then I should see 2 instruments
    And The sum of field count of all the instruments should equal to 22
    And I click on the link labeled "My Projects"
    Then I should see "24" in column 3 next to the link "13_MyProjects_v1115"
    # No:of instruments + field count = 2+22=24. Which matches the Field Count in My Projects Dashboard

  Scenario: 13 - Delete a field and ensure it reflects in the My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Designer"
    And I click on the table cell containing a link labeled "Text Validation"
    And the AJAX "GET" request at "Design/delete_field.php?*" tagged by "delete" is being monitored
    And the AJAX "GET" request at "Design/online_designer_render_fields.php*" tagged by "render" is being monitored
    And I delete the field named "notesbox1"
    And the AJAX request tagged by "delete" has completed
    And the AJAX request tagged by "render" has completed
    Then I should NOT see "notesbox1"
    And I click on the link labeled "Designer"
    Then I should see 2 instruments
    And The sum of field count of all the instruments should equal to 21
    And I click on the link labeled "My Projects"
    Then I should see "23" in column 3 next to the link "13_MyProjects_v1115"
    # No:of instruments + field count = 2+21=23. Which matches the Field Count in My Projects Dashboard

  Scenario: 14 - Add an instrument and ensure it reflects in the My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Designer"
    And I click on the button labeled exactly " Create"
    Then I should see a button labeled "Add instrument here"
    And I add an instrument below the instrument named "Data Types"
    And I enter "Test" into the field identified by "input[id=new_form-data_types]"
    And I click on the element identified by "input[value=Create]"
    Then I should see a dialog containing the following text: "The new instrument was successfully created. The page will be reloaded to reflect this change."
    And I click on the button labeled "Close" in the dialog box
    Then I should see "Test"
    And I should see 3 instruments
    And I click on the link labeled "My Projects"
    Then I should see "3" in column 4 next to the link "13_MyProjects_v1115"
  
  Scenario: 15 - Delete an instrument and ensure it reflects in the My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Designer"
    And I click on the Instrument Action "Delete" for the instrument named "Test"
    And the AJAX "GET" request at "/Design/delete_form.php*" tagged by "Delete" is being monitored
    And I click on the button labeled "Yes, delete it"
    And the AJAX request tagged by "Delete" has completed
    Then I should see "Deleted!"
    And I should see "The data collection instrument and all its fields have been successfully deleted!"
    Then I should no longer see the element identified by "tr[id=row_3]"
    And I should see 2 instruments
    And I click on the link labeled "My Projects"
    Then I should see "2" in column 4 next to the link "13_MyProjects_v1115"

  # Manual testing document does not say to login as admin while moving to Production
  Scenario: 16 - Move to Production and mark Project as complete and ensure the project no longer appears on the My Projects Dashboard
    Given I am an "admin" user who logs into REDCap
    And  I click on the link labeled "Control Center"
    And  I click on the link labeled "Browse Projects"
    And I wait for 0.5 seconds
    And I enter "13_MyProjects_v1115" into the field identified by "input[id=project_search]"
    And I click on the button labeled "Search project title"
    Then I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far." in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box
    Then I should see "Success! The project is now in production."
    Then I logout
    When I am an "standard" user who logs into REDCap
    And I click on the link labeled "My Projects"
    And I click on the link labeled "13_MyProjects_v1115"
    Then I should see "13_MyProjects_v1115"
    And I click on the link labeled "Other Functionality"
    And I click on the button labeled "Mark project as Completed"
    And I confirm to mark project as complete
    Then I should see "The project has now been marked as COMPLETED" in an alert box
    # Added wait due to DOM detachment error
    And I wait for 3 seconds
    Then I should see "My Projects"
    And I click on the link labeled "My Projects"
    Then I should NOT see "13_MyProjects_v1115"
    
  Scenario: 17 - Project is displayed in Completed list
    Given I click on the link labeled "My Projects"
    And I click on the link labeled "Show Completed Projects"
    Then I should see "13_MyProjects_v1115"
    And I should see the icon "Completed" in column 6 next to the link "13_MyProjects_v1115"

  Scenario: 18 - Hide the Completed list and the project is no longer displayed
    Given I click on the link labeled "Hide Completed Projects"
    Then I should NOT see "13_MyProjects_v1115"

  Scenario: 19 - Project is restored back to production and ensure it reflects in the My Projects Dashboard
    Given I am an "admin" user who logs into REDCap
    And  I click on the link labeled "Control Center"
    And  I click on the link labeled "Browse Projects"
    And I wait for 0.5 seconds
    And I enter "13_MyProjects_v1115" into the field identified by "input[id=project_search]"
    And I click on the button labeled "Search project title"
    Then I click on the link labeled "13_MyProjects_v1115"
    Then I should see "Please note that this project has been marked as 'Completed' and is no longer accessible."
    And the AJAX "POST" request at "ProjectGeneral/change_project_status.php*" tagged by "render" is being monitored
    And I click on the button labeled "Restore Project"
    And the AJAX request tagged by "render" has completed
    Then I should see "The project has now been restored. The page will now reload to reflect the changes"
    And I close the popup
    When I am an "standard" user who logs into REDCap
    And I click on the link labeled "My Projects"
    Then I should see "13_MyProjects_v1115"
    And I should see the icon "Production" in column 6 next to the link "13_MyProjects_v1115"
    
  Scenario: 20 - Move the project to Analysis/Cleanup and ensure it reflects in the My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115"
    And I click on the link labeled "Other Functionality"
    And I click on the button labeled "Move to Analysis/Cleanup status"
    Then I should see "Do you wish to set the status of the project to ANALYSIS/CLEANUP?"
    And I click on the button labeled "YES, Move to Analysis/Cleanup Status" 
    Then I should see "The project has now been set to ANALYSIS/CLEANUP status." in an alert box
    And I scroll the page to the field identified by "button[id=modify-data-locked]"
    And I click on the link labeled "My Projects"
    Then I should see "13_MyProjects_v1115"
    And I should see the icon "Analysis/Cleanup" in column 6 next to the link "13_MyProjects_v1115"

  Scenario: 21 - Move the project to back to Production and ensure it reflects in the My Projects Dashboard
    Given I click on the link labeled "13_MyProjects_v1115"
    Then I should see "Analysis/Cleanup"
    And I click on the link labeled "Other Functionality"
    And I click on the button labeled "Move back to Production status"
    And the AJAX "POST" request at "ProjectGeneral/change_project_status.php*" tagged by "render" is being monitored
    And I click on the button labeled "YES, Move to Production Status" 
    And the AJAX request tagged by "render" has completed
    Then I should see "The project has now been moved back to PRODUCTION status." in an alert box
    When I am an "standard" user who logs into REDCap
    And I click on the link labeled "My Projects"
    Then I should see "13_MyProjects_v1115"
    And I should see the icon "Production" in column 6 next to the link "13_MyProjects_v1115"
    
  Scenario: 22 - Filter Projects by title
    Given I am an "admin" user who logs into REDCap
    And  I click on the link labeled "Control Center"
    And  I click on the link labeled "Browse Projects"
    And I wait for 0.5 seconds
    And I enter "Project" into the field identified by "input[id=project_search]"
    And I click on the button labeled "Search project title"
    Then I should see all the projects containing "Project"
    