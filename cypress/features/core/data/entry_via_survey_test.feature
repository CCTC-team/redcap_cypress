Feature: Data Entry through the Survey

  As a REDCap end user
  I want to see that Data Entry through the Survey is functioning as expected

  Scenario: Project Setup 1 - Create the Project
    Given I am a "standard" user who logs into REDCap
    And I create a project named "15_DirectDataEntry (Survey) v1115" with project purpose Operational Support via CDISC XML import from fixture location "cdisc_files/core/15_DirectDataEntrySurvey_temp.xml"

  Scenario: 15 - Open survey and enter email for Record ID 1
    # Given I click on the link labeled "Add / Edit Records"
    # And I select "1" from the dropdown identified by "[id=record]"
    # # Not able to click on survey using the below step definition
    # And I click the bubble to select a record for the "Survey" longitudinal instrument on event "Event 2"

    # Not able to click on survey from "Add / Edit Records", hence opening it from "Record Status Dashboard"
    Given I click on the link labeled "Record Status Dashboard"
    # Getting wrong Event. To open Event 2, I have to give Event 1 in the below step
    And I locate the bubble for the "Survey" instrument on event "Event 1" for record ID "1" and click on the bubble
    Then I should see a button labeled "Survey options"
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Open survey" label
    And I enter "test1@test.com" into the field identified by "input[name=email]"
    And I click on the button labeled "Submit"    
    And I click on the button labeled "Close survey"
    And I logout
    Given I am a "standard" user who logs into REDCap
    Then I should see "New Project"
    And I click on the link labeled "My Projects"
    Then I should see "Project Title" 
    And the AJAX "GET" request at "ProjectSetup/index.php?*" tagged by "projsetup" is being monitored
    And I click on the link labeled "15_DirectDataEntry (Survey) v1115"
    And the AJAX request tagged by "projsetup" has completed
    Then I should see "15_DirectDataEntry (Survey) v1115"
    Then I should see "Record Status Dashboard"
    And I click on the link labeled "Record Status Dashboard"
    # Getting wrong Event. To open Event 2, I have to give Event 1 in the below step
    And I locate the bubble for the "Survey" instrument on event "Event 1" for record ID "1" and click on the bubble
    And I should see "Response was completed"

  Scenario: 16 - Open survey and enter email for Record ID 2
    # Given I click on the link labeled "Add / Edit Records"
    # And I select "2" from the dropdown identified by "[id=record]"
    # # Not able to click on survey using the below step definition
    # And I click the bubble to select a record for the "Survey" longitudinal instrument on event "Event 2"

    # Not able to click on survey from "Add / Edit Records", hence opening it from "Record Status Dashboard"
    Given I click on the link labeled "Record Status Dashboard"
    # Getting wrong Event. To open Event 2, I have to give Event 1 in the below step
    And I locate the bubble for the "Survey" instrument on event "Event 1" for record ID "2" and click on the bubble
    Then I should see a button labeled "Survey options"
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Open survey" label
    And I enter "test2@test.com" into the field identified by "input[name=email]"
    And I click on the button labeled "Submit"    
    And I click on the button labeled "Close survey"
    And I logout
    Given I am a "standard" user who logs into REDCap
    Then I should see "New Project"
    And I click on the link labeled "My Projects"
    Then I should see "Project Title"
    And I click on the link labeled "15_DirectDataEntry (Survey) v1115"
    Then I should see "15_DirectDataEntry (Survey) v1115"
    Then I should see "Record Status Dashboard"
    And I click on the link labeled "Record Status Dashboard"
    # Getting wrong Event. To open Event 2, I have to give Event 1 in the below step
    And I locate the bubble for the "Survey" instrument on event "Event 1" for record ID "2" and click on the bubble
    And I should see "Response was completed"

  Scenario: 17 - Participant List shows survey status for both the records
    Given I click on the link labeled "Survey Distribution Tools"
    And I should see "Participant List"
    And I click on the link labeled "Participant List"
    Then I should see "test1@test.com"
    And I select the option '"Survey" - Event 1' for the Participant List
    Then I should see a "gray" bubble for record ID "1"
    Then I should see a "gray" bubble for record ID "2"
    And the AJAX "GET" request at "Surveys/invite_participants.php*" tagged by "list" is being monitored
    And I select the option '"Survey" - Event 2' for the Participant List
    And the AJAX request tagged by "list" has completed
    And I wait for 3 seconds
    Then I should see '"Survey" - Event 2'
    Then I should see a "green" bubble for record ID "1"
    Then I should see a "green" bubble for record ID "2"

  Scenario: 18 - Add/Edit records has 2 records
    Given I click on the link labeled "Add / Edit Records"
    Then I should see the dropdown identified by "[id=record]" with the options below
    | 1 | 2 |

  Scenario: 19 - Enable Demographics as survey
    Given I click on the link labeled "Designer"
    Then I should see "Demographics"
    And I should see the instrument labeled "Demographics" is not a survey
    And I enable surveys for the data instrument named "Demographics"
    Then I should see "Your survey settings were successfully saved!"
    Then I should see the instrument labeled "Demographics" is a survey

  Scenario: 20 - Open Public Survey Demographics
    Given I click on the link labeled "Survey Distribution Tools"
    And I should see "Public Survey Link"
    And I click on the link labeled "Public Survey Link"
    Then I should see "Using a public survey link is the simplest and fastest way to collect responses for your survey"
    And I visit the public survey URL for this project
    Then I should see "Demographics"

  Scenario: 21 - Add 2 more email ids to Participant List and verify count
    Given I am a "standard" user who logs into REDCap
    Then I should see "New Project"
    And I click on the link labeled "My Projects"
    Then I should see "Project Title"
    And I click on the link labeled "15_DirectDataEntry (Survey) v1115"
    Then I should see "Survey Distribution Tools"
    And the AJAX "GET" request at "Surveys/invite_participants.php*" tagged by "list" is being monitored
    Then I click on the link labeled "Survey Distribution Tools"
    And I wait for 3 seconds
    Then I should see "Participant List"
    And the AJAX "GET" request at "Surveys/invite_participants.php*" tagged by "list" is being monitored
    And I click on the link labeled "Participant List"
    And I wait for 3 seconds
    Then I should see "test1@test.com"
    And the AJAX request tagged by "list" has completed
    And I select the option '[Initial survey] "Demographics" - Event 1' for the Participant List
    Then I should see "test1@test.com"
    Then I should see "test2@test.com"
    Then I should see 2 participants listed in the Participant List
    And I click on the button labeled "Add participants"
    And I enter "test3@test.com{enter}test4@test.com" into the field identified by "textarea[id=newPart]"
    And the AJAX "GET" request at "Surveys/participant_list.php*" tagged by "participant_list" is being monitored
    Then I click on the button labeled "Add participants"
    And the AJAX request tagged by "participant_list" has completed   
    Then I should see "PARTICIPANTS ADDED!"
    And I should see 4 participants listed in the Participant List
    Then I logout

  Scenario: 22 - In Control Center - Disable users to edit survey responses
    Given I am an "admin" user who logs into REDCap
    Then I should see "Control Center"
    Then I click on the link labeled "Control Center"
    Then I should see "User Settings"
    And I click on the link labeled "User Settings"
    Then I scroll the page to the field identified by "[name=enable_edit_survey_response]"
    And I select "Disabled" from the dropdown identified by "[name=enable_edit_survey_response]"
    Then I scroll the page to the field identified by "input[value='Save Changes']"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"
    And I logout

  Scenario: 23 - User cannot Edit survey response - Would work after SCenario 15 is fixed
    Given I am a "standard" user who logs into REDCap
    Then I should see "New Project"
    And I click on the link labeled "My Projects"
    Then I should see "Project Title"
    And I click on the link labeled "15_DirectDataEntry (Survey) v1115"
    Then I should see "Record Status Dashboard"
    # Not able to click on survey from "Add / Edit Records", hence opening it from "Record Status Dashboard"
    Then I click on the link labeled "Record Status Dashboard"
    Then I should see "Record Status Dashboard (all records)"
    # Getting wrong Event. To open Event 2, I have to give Event 1 in the below step
    And I locate the bubble for the "Survey" instrument on event "Event 1" for record ID "1" and click on the bubble
    Then I should see "Survey response is read-only"
    And I should NOT see a button labeled "Edit response"
 
  Scenario: 24 - User Rights - 'Edit survey responses' checkbox is not visible
    Given I click on the link labeled "User Rights"
    And the AJAX "POST" request at "Messenger/messenger.php*" tagged by "render" is being monitored
    And I click to edit username "test_user (Test User)"
    Then I click on the button labeled "Edit user privileges"
    And I should no longer see the element identified by "input[id=form-editresp-survey]"
    And I click on the button labeled "Save Changes"
    Then I should see "was successfully edited"

  Scenario: 25 - Enable users to edit response, edit the response and save it
    # Not able to click on survey from "Add / Edit Records", hence opening it from "Record Status Dashboard"
    Then I click on the link labeled "Record Status Dashboard"
    # Getting wrong Event. To open Event 2, I have to give Event 1 in the below step
    And I locate the bubble for the "Survey" instrument on event "Event 1" for record ID "1" and click on the bubble
    Then I should see "Survey response is read-only"
    # Manual test says 'Edit button is not enabled' but I cannot see Edit button
    And I should NOT see a button labeled "Edit response"
    And I logout
    Given I am an "admin" user who logs into REDCap
    Then I should see "Control Center"
    Then I click on the link labeled "Control Center"
    Then I should see "User Settings"
    And I click on the link labeled "User Settings"
    Then I scroll the page to the field identified by "[name=enable_edit_survey_response]"
    And I select "Enabled" from the dropdown identified by "[name=enable_edit_survey_response]"
    Then I scroll the page to the field identified by "input[value='Save Changes']"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"
    # Below 4 steps are to run cron jobs (for Scenario 31 to work)
    Then I click on the link labeled "Control Center"
    Then I click on the link labeled "Configuration Check"
    And I should see "ERROR: Cron job not running!"
    And I click on the link labeled "Go to Cron Jobs page"
    Then I should see "Trigger REDCap cron job in a web browser"
    And I enable the cron job
    And I logout
    Given I am a "standard" user who logs into REDCap
    Then I should see "New Project"
    And I click on the link labeled "My Projects"
    Then I should see "Project Title"
    And I click on the link labeled "15_DirectDataEntry (Survey) v1115"
    Then I should see "User Rights"
    Then I click on the link labeled "User Rights"
    And the AJAX "POST" request at "Messenger/messenger.php*" tagged by "render" is being monitored
    And I click to edit username "test_user (Test User)"
    Then I click on the button labeled "Edit user privileges"
    And I should see the element identified by "input[id=form-editresp-survey]"
    # The checkbox (Edit survey responses) is not checked. I am checking it in the below step
    And I check the checkbox identified by "input[id=form-editresp-survey]"
    # And saving it (not cancelling as in manual script)
    And I click on the button labeled "Save Changes"
    Then I should see "was successfully edited"
     # Not able to click on survey from "Add / Edit Records", hence opening it from "Record Status Dashboard"
    Then I click on the link labeled "Record Status Dashboard"
    # Getting wrong Event. To open Event 2, I have to give Event 1 in the below step
    And I locate the bubble for the "Survey" instrument on event "Event 1" for record ID "1" and click on the bubble
    Then I should see "Survey response is editable"
    And I should see a button labeled "Edit response"
    And the AJAX "GET" request at "DataEntry/index.php*" tagged by "edit" is being monitored
    And I click on the button labeled "Edit response"
    And the AJAX request tagged by "edit" has completed
    Then I should see "(now editing)"
    And I wait for 3 seconds
    And I enter "reminder" into the field identified by "input[name=reminder]"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    # And I close the popup
    Then I should see "successfully edited"

  Scenario: 26 - Modify survey settings - Allow 'Save & Return Later' option = Yes
    Given I click on the link labeled "Designer"
    Given I should see "Survey settings"
    And I click on the button labeled "Survey settings" for the instrument named "Survey"
    And I select "Yes" from the dropdown identified by "[name=save_and_return]"
    And I click on the button labeled "Save Changes"

  Scenario: 27 - Submit Demographics survey for Record 3
    # There is no survey link for test3@test.com and no record 3 associated with it. Hence adding record 3 with email test3@test.com
    Given I click on the link labeled "Add / Edit Records"
    And I should see "Add new record"
    And I click on the button labeled "Add new record"
    And I should see "3"
    Then I click the bubble to select a record for the "Survey" longitudinal instrument on event "Event 1"
    And I enter "test3@test.com" into the field identified by "input[name=email]"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument
    Then I should see "successfully added"
    Given I click on the link labeled "Survey Distribution Tools"
    And I wait for 3 seconds
    And I should see "Participant List"
    And the AJAX "GET" request at "Surveys/invite_participants.php*" tagged by "list" is being monitored
    And I click on the link labeled "Participant List"
    And I wait for 4 seconds
    # And the AJAX request tagged by "list" has completed
    Then I should see "Email"
    And the AJAX "GET" request at "Surveys/invite_participants.php*" tagged by "list" is being monitored
    And I select the option '[Initial survey] "Demographics" - Event 1' for the Participant List
    And I wait for 3 seconds
    And the AJAX request tagged by "list" has completed
    And I click on the link labeled "3"
    Then I should see a button labeled "Survey options"
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Open survey" label
    And I enter "test" into the field identified by "input[name=lname]"
    And I enter "three" into the field identified by "input[name=fname]"
    And I click on the button labeled "Submit"    
    And I click on the button labeled "Close survey"
    And I logout

  Scenario: 28 - 'Save & Return later' Survey for Event 1 and get Return Code
    Given I am a "standard" user who logs into REDCap
    Then I should see "New Project"
    And I click on the link labeled "My Projects"
    Then I should see "Project Title"
    And I click on the link labeled "15_DirectDataEntry (Survey) v1115"
    Then I should see "Survey Distribution Tools"
    And I click on the link labeled "Survey Distribution Tools"
    And I wait for 4 seconds
    Then I should see "Participant List"
    And the AJAX "GET" request at "Surveys/invite_participants.php*" tagged by "list" is being monitored
    And I click on the link labeled "Participant List"
    And the AJAX request tagged by "list" has completed
    And I wait for 3 seconds
    Then I should see "Email"
    Then I should see "Record"
    And the AJAX "GET" request at "Surveys/invite_participants.php*" tagged by "list" is being monitored
    And I select the option '"Survey" - Event 1' for the Participant List
    And I wait for 3 seconds
    And I should see "3"
    And I should see "test3@test.com"
    And I click on the link labeled "3"
    Then I should see a button labeled "Survey options"
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Open survey" label
    And I click on the button labeled "Save & Return Later"
    Then I should see "'Return Code' needed to return" 
    # And I click on the button labeled "Close survey"
    And I logout

  Scenario: 29 - Check the status messages in the surveys
    Given I am a "standard" user who logs into REDCap
    Then I should see "New Project"
    And I click on the link labeled "My Projects"
    Then I should see "Project Title"
    And I click on the link labeled "15_DirectDataEntry (Survey) v1115"
    Then I should see "Add / Edit Records"
    And I click on the link labeled "Add / Edit Records"
    And the AJAX "GET" request at "DataEntry/record_home.php*" tagged by "render" is being monitored
    Then I should see "Choose an existing Record ID"
    Then I select "3" from the dropdown identified by "select[id=record]"
    # The below step is to get the focus away from the above step
    And I click on the element identified by "input[id=search_query]"
    And the AJAX request tagged by "render" has completed
    And I click the bubble to select a record for the "Demographics" longitudinal instrument on event "Event 1"
    Then I should see "Survey response is read-only"
    Then I should see "Response was completed on"
    And I click on the link labeled exactly "Survey"
    Then I should see "Survey response is editable"
    Then I should see "Response is only partial and is not complete"
    Then I should see "Return Code for participant to continue survey:"
    And I click on the link labeled "Add / Edit Records"
    And the AJAX "GET" request at "DataEntry/record_home.php*" tagged by "render" is being monitored
    Then I should see "Choose an existing Record ID"
    Then I select "3" from the dropdown identified by "select[id=record]"
    # The below step is to get the focus away from the above step
    And I click on the element identified by "input[id=search_query]"
    And the AJAX request tagged by "render" has completed
    # In maniual script, it is written 'Open Survey in Event 1', guess this should be 'Event 2'
    And I click the bubble to select a record for the "Survey" longitudinal instrument on event "Event 2"
    Then I should see the dropdown identified by "select[name=survey_complete]" with the option "Incomplete" selected

  Scenario: 30 - Verify the status of the surveys in Survey Distribution Tools
    Given I click on the link labeled "Survey Distribution Tools"
    And I should see "Participant List"
    And I click on the link labeled "Participant List"
    Then I should see "test1@test.com"
    And I select the option '[Initial survey] "Demographics" - Event 1' for the Participant List
    # Added 1 extra participant
    Then I should see 5 participants listed in the Participant List
    Then I should see a "green" bubble for record ID "3"
    And the AJAX "GET" request at "Surveys/invite_participants.php*" tagged by "list" is being monitored
    And I select the option '"Survey" - Event 1' for the Participant List
    And I wait for 4 seconds
    Then I should see "3"
    Then I should see 3 participants listed in the Participant List
    Then I should see a "orange" bubble for record ID "3"
    And the AJAX "GET" request at "Surveys/invite_participants.php*" tagged by "list" is being monitored
    And I select the option '"Survey" - Event 2' for the Participant List
    And I wait for 3 seconds
    Then I should see 3 participants listed in the Participant List
    Then I should see "1"
    Then I should see a "green" bubble for record ID "1"
    Then I should see a "green" bubble for record ID "2"

  Scenario: 31 - Compose Survey Invitations and send it
    Given I select the option '"Survey" - Event 1' for the Participant List
    And I wait for 3 seconds
    Then I should see "3"
    And the AJAX "GET" request at "Surveys/participant_list.php*" tagged by "list" is being monitored
    And I click on the button labeled "Compose Survey Invitations"
    And the AJAX request tagged by "list" has completed
    Then I should see "test1@test.com"
    Then I should see 3 emails listed in the Participant List
    And I should see the checkbox identified by "input[value=IMMEDIATELY]", checked
    And I should see the checkbox identified by "input[id=enable_reminders_chk]", unchecked
    # And I check the checkbox labeled "Immediately"
    # And I uncheck the checkbox labeled "Re-send invitation as a reminder if participant has not responded by a specified time?"
    And I enter "Test" into the field identified by "input[name=emailTitle]"
    And I uncheck the checkbox labeled "test2@test.com"
    And the AJAX "GET" request at "Surveys/participant_list.php*" tagged by "list" is being monitored
    And I click on the button labeled "Send Invitations"
    Then I should see "Your emails are being sent"
    And I click on the button labeled "Close"
    And I wait for 3 seconds
    Then I should see "1"
    Then I should see a "email_go" icon for record ID "1"

  Scenario: 32 - Verify Survey Invitation Log - Past invitations
    Given I click on the link labeled "Survey Distribution Tools"
    And I click on the link labeled "Survey Invitation Log"
    And the AJAX "GET" request at "Surveys/invite_participants.php*" tagged by "list" is being monitored
    And I click on the button labeled "View past invitations"
    Then I should see "Invitation send time"
    Then I should see "View Invite"
    Then I should see "Participant Email"
    Then I should see "Record"
    Then I should see "Participant Identifier"
    Then I should see "Survey"
    Then I should see "Survey Link"
    Then I should see "Responded?"
    Then I should see "Errors (if any)"
    And I should see 1 email listed in the Survey Invitation Log

  Scenario: 33 - Undesignate email for communications setting and check past invitations
    Given I should see "15_DirectDataEntry (Survey) v1115"
    And I should see "Project Setup"
    And I click on the link labeled "Project Setup"
    Then I should see "Designate an email field for communications"
    And I disable designation of an email field for communications setting
    And the AJAX "GET" request at "ProjectSetup/index.php?*" tagged by "projsetup" is being monitored
    Then I should see "Undesignate email field"
    Then I click on the button labeled "Undesignate field"
    And the AJAX request tagged by "projsetup" has completed
    And I wait for 3 seconds
    Then I should see "Designate an email field for communications"
    Then I should see "Randomization module"
    Then I should see that the designate an email field for communications setting is "disabled"
    Then I click on the link labeled "Survey Distribution Tools"
    And I should see "Survey Invitation Log"
    And I click on the link labeled "Survey Invitation Log"
    Then I should see "Invitation send time"
    And the AJAX "GET" request at "Surveys/invite_participants.php*" tagged by "list" is being monitored
    And I click on the button labeled "View past invitations"
    And I should see "[No email listed]"

  # Scenario: 34 - Export Raw Data and check file header - Check data
  #   Given I should see "Data Exports, Reports, and Stats"
  #   And I click on the link labeled "Data Exports, Reports, and Stats"
  #   Then I should see "Export Data"
  #   When I export data for the report named "All data" in "csvraw" format
  #   Then I should see "Data export was successful!"
  #   Then I should receive a download to a "csv" file
  #   Then I should have a "csv" file that contains the headings below
  #   | record_id | redcap_event_name | redcap_survey_identifier | demographics_timestamp | lname | fname | demographics_complete | survey_timestamp | email | reminder | description | survey_complete |
  #   Then I should have a "csv" file that contains 2 distinct records
  #   Then I should have a "csv" file that contains 3 rows
  #   And I click on the button labeled "Close" in the dialog box
  #   Then I should see "My Reports & Exports"

  Scenario: 35 - Delete Survey Settings for the Survey instrument
    Given I should see "15_DirectDataEntry (Survey) v1115"
    And I should see "Designer"
    And I click on the link labeled "Designer"
    And I wait for 3 seconds
    Then I should see "Demographics"
    And I click on the button labeled "Survey settings" for the instrument named "Survey"
    Then I should see "Modify survey settings for data collection instrument"
    When I click on the button labeled "Delete Survey Settings"
    Then I should see "Delete this instrument's survey settings"
    And I click on the button labeled "Delete Survey Settings" in the dialog box
    Then I should see "Survey successfully deleted!"
    And I close the popup
    Then I should see "Data Collection Instruments"
    Then I should see the instrument labeled "Survey" is not a survey
    
  # Scenario: 36 - Export Raw Data and check file header - check data
  #   Given I click on the link labeled "Data Exports, Reports, and Stats"
  #   Then I should see "Export Data"
  #   When I export data for the report named "All data" in "csvraw" format
  #   Then I should see "Data export was successful!"
  #   Then I should receive a download to a "csv" file
  #   Then I should have a "csv" file that contains the headings below
  #   | record_id | redcap_event_name | redcap_survey_identifier | demographics_timestamp | lname | fname | demographics_complete | email | reminder | description | survey_complete |
  #   Then I should have a "csv" file that contains 2 distinct records
  #   Then I should have a "csv" file that contains 3 rows
  #   And I click on the button labeled "Close" in the dialog box
  #   Then I should see "My Reports & Exports"

  Scenario: 37 - No survey-related information is listed on the instrument
    Given I click on the link labeled "Add / Edit Records"
    And I select "2" from the dropdown identified by "[id=record]"
    And the AJAX "GET" request at "DataEntry/index.php?*" tagged by "render" is being monitored
    And I click the bubble to select a record for the "Survey" longitudinal instrument on event "Event 2"
    And the AJAX request tagged by "render" has completed
    And I wait for 3 seconds
    Then I should NOT see a button labeled "Survey options"
    And I click on the button labeled "-- Cancel --"

  Scenario: 38 - Only the Demographics Event 1 is in the Participant List dropdown - To Do
    Given I should see "15_DirectDataEntry (Survey) v1115"
    And I should see "Survey Distribution Tools"
    And I click on the link labeled "Survey Distribution Tools"
    And I should see "Participant List"
    And I click on the link labeled "Participant List"
    Then I should Event List with options below
    | [Initial survey] "Demographics" - Event 1 |

  Scenario: 39 - Logout
    Then I logout
