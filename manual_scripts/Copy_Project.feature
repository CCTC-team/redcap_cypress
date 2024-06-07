Feature: Copy Project

  As a REDCap end user
  I want to see that Copy_Project.feature is functioning as expected
 
# I used pre existing project and dummy records
# The Project_CUH_v1381 has been setup to include two instruments namely Text Validation and Data Types.
# Text Validation consist of 3 fields namely Record Id(Field name = record_id with attribute text), Name(Field name = ptname_v2_v2 with attribute text) and Section Header:Form status(Field name = text_validation_complete attribute dropdown)
# Data Types consist of 4 fields namely Date of birth(Field name = dob_v2 with attribute text (Field name = date_dmy with attribute text), Calculated Field(field name = calculated_field with attribute calculation 3*2), Weight (Field name = Weight KG with attribute text(number)) Section Header:Form status(Field name = data_types_complete attribute dropdown)
# Project_CUH_v1381_DataQualityRules(date) was created to be uploaded.
# Dummy records consist of Name(Field name = ptname_v2_v2 with attribute text) as Tony
 
 
Scenario: Test Setup 1- Creating new alert and notification
 Given I am a "standard" user who logs into REDCap
 And I click on the link labeled "Alerts and notification" under Application
 And I should see "popup create new alert"
 And I should enter "Title of this alert as new data saved"
 And I should select "When a record is saved as on a specific form/survey"
 And I should select "Trigger the alert when as "Text Validation [Any event], is saved with any form status."
 And I should select "Trigger limit: Trigger the alert as only once per record (i.e., never re-trigger)"
 And I should select "When to send the alert as send immediately"
 And I should select "Send it how many times as just once"
 And I should select "Alert Type as Email"
 And I should select "Email From as test_admin@example.com"
 And I should select "Subject as new data saved"
 Then I should select "Message as Test..Test.."
 And I should select "Email To as and email of your choice"
 And I click on the button labeled "Save"
 
Scenario: Test Setup 2 - Data Quality Rule
 Given I click on the button labeled "Data Quality" under Application
 And I click on the button labeled "Upload Data Quality"
 And I should see "Upload Data Quality Rule(CSV)"
 And I should select "Project_CUH_v1381_DataQualityRules(date)"
 And I click on the button labeled "Upload"
 
Scenario: Test Setup 3 - User Role
 Given I click on the button labeled "User Rights" under Application
 Then I should enter "Add new user as Test_db admin"
 And I should enter "Create new roles as Database Admin"
 And I click on the button labeled "Create role"
 And I wait for 0.5 seconds
 And I should see "Creating new role Database Admin popup"
 Then I should see default setting selected "Add/Edit/Organize Reports, Calendar, Stats & Charts, File Repository, Create Records"
 And I should see default setting "Lock/Unlock Records (instrument level) as Disabled"
 And I should see default setting "Data Viewing Rights for Text Validation and Data Types selected for View and Edit"
 And I should see default setting "Data Export Rights for Text Validation and Data Types selected for full data set"
 And I should select "Project Design and Setup"
 And I should select "User Rights"
 And I should select "Rename Records"
 And I click on the button labeled "Create role"
 And I wait for 0.5 seconds
 Then I should see "User Right page" showing the privileges Database Admin has

 Scenario: Test Setup 4 - Survey Queue and Automated Survey Invitation settings
  Given I click on the tab labeled "My Projects"
    And I should see "List of Project Title"
    Then I click on the link labeled "Project_CUH_v1381"
    And I should see "Project Setup page"
    And I click on the button labeled "Enable" under Main project settings
    And I should see "Saved"
    And I click on the link labeled "Designer"
    And I should see "Online Designer page" showing all the instruments
    Then I click on the "Enable" for Text Validation
    And  I should see " Set up my survey for data collecftion instrument Text Validation"
    And I should select "Allow participants to download a PDF of their responses at end of survey as YES"
    And I should select "Send Confirmation Email as YES"
    And I should enter " From as test_admin@example.com"
    And I should enter " Subject as Survey Completed"
    And I should enter "Email message as Survey Completed Thank you"
    Then I click on the button labeled "Save Changes"
    And I should see "A popup saying your survey settings was successfully saved"
    And I should see a triggered button labeled "Survey settings and Automated Invitations"
    Then I click on the button labeled "Automated Invitations"
    And I should see "A popup Define Conditions for Automated Survey Invitations(ASI)"
    Then I Should select "Active" for the survey title Text Validation
    And I should select "From as test_admin@example.com"
    And I should enter "Subject as Survey"
    And I should enter "Email message as Please take this survey.You may open the survey in your web browser by clicking the link below:[survey-link]"
    And I should enter "When the following survey is completed as Data Types"
    And I should enter "When the following logic becomes true as [weight] > 50"
    Then I should select "Ensure logic is still true before sending invitation"
    And I should select "Send immediately"
    And I should select "Re-send invitation as a reminder if participant has not responded by a specified time"
    And I should select "Send every 3 days"
    Then I should select "Recurrence as Send only once"
    And I click on the button labeled "Save"
    And I should see "Your settings that you defined for sending automated survey invitations have now been saved for "Text Validation"
    Then I click on the button labeled "Close"
 
   
Scenario 1: Copying Project
  Given I click on the tab labeled "My Projects"
    And I should see "List of Project Title"
    Then I click on the link labeled "Project_CUH_v1381"
    And I should see "Project Setup page"
    Then I click on the tab labeled "Other Functionality"
    And I wait for 0.5 seconds
    Then I should see "Other Functionality page"
    And I scroll under "Copy or Back Up the project" at the bottom
    Then I should click on the button labeled "Copy the Project"
    And I should see "Copy the Project page"
    And I should enter "Project title as Test Copied Project"
    Then I should see "User roles, Alerts and Notifications, Data Quality rules" selected under also copy the following
    And I wait for 2 minutes
    And I should see "A popup showing Your REDCap project has been copied, and an exact duplicate was generated, which is already loaded and ready for you here"
    And I should see "Project Setup page of the Test Copied Project"
    