Feature: Branching Logic

  As a REDCap end user
  I want to see that Branching Logic is functioning as expected

  Scenario: 0 - Project Setup
  Given I am a "standard" user who logs into REDCap
  # And I create a project named "FirstProject_1115" with project purpose Operational Support via CDISC XML import from fixture location "cdisc_files/projects/FirstProject_1115.xml"
  And I create a project named "BranchingLogic_v1115" with project purpose Operational Support via CDISC XML import from fixture location "cdisc_files/projects/DesignForms_v1115.xml"
  And I visit Project ID 14
  Then I should see "Development"
  And I click on the link labeled "Project Setup"
  And I click on the element identified by "button[id=setupLongiBtn]"
  When I click on the button labeled "Disable" in the dialog box
  #Then I should see that longitudinal mode is disabled
  And I click on the element identified by "button[id=setupEnableSurveysBtn]"
  Then I should see that surveys are enabled
  And I click on the button labeled "Online Designer"
  # Refactor this line to abstract css selector
  And I click on the element identified by "#row_2 > :nth-child(5) > .fc"
  And I click on the button labeled "Save Changes"
  # Refactor as duplicated logic in design_forms.feature
  And I click on the Instrument Action "Delete" for the instrument named "Text Validation"
  And the AJAX "GET" request at "/Design/delete_form.php*" tagged by "Delete" is being monitored
  And I click on the button labeled "Yes, delete it"
  And the AJAX request tagged by "Delete" has completed
  Then I should see "Deleted!"
  And I should see "The data collection instrument and all its fields have been successfully deleted!"
  And I should no longer see the element identified by "tr[id=row_1]"
  Then I logout

  Scenario: 1
  Given I am a "standard" user who logs into REDCap
  And I visit Project ID 14
  And I click on the link labeled "Project Setup"
  And I click on the button labeled "Online Designer"
  And I click on the element identified by "#formlabel-data_types"
  #NB typo in manual script - Caculated rather than Calculated
  And I set the branching logic of every field to record_id = "999" except the field named "Caculated Field"
  Then Every field contains the branching logic "[record_id] = '999'" except the Record ID field and the field with the label "Caculated Field"

  Scenario: 2
  Given I click on the link labeled "Survey Distribution Tools"
  When I open the public survey
  Then The fields shown on the public survey are "Caculated Field"
  When I close the public survey
  #alert doesn't appear. Is this because close occurs in the close stub? We don't actually want to close the main browser tab
  Then The survey closes

  Scenario: 3
  Given I click on the link labeled "Add / Edit Records"
  When I click on the button labeled "Add new record"
  #NB typo in manual script - Caculated rather than Calculated
  Then The fields shown on the instrument are "Caculated Field"
  
  Scenario: 4
  #does 'leave' need adding to the step definition regular expression?
  #Given after the next step, I will <leave> a confirmation window containing the text "Changes that you made may not be saved."
  #for now manually click on leave unless running in dev tools mode
  Given I click on the button labeled "Modify instrument"

  #need to call a single step definition which applies the same branching logic to all fields and asserts that this has been successful
  #may need to create helper functions for the update steps and call these from common step definitions
  Scenario: 5
  Given I click on the branching logic icon for the field with name "Name"
  And I click on the link labeled "Clear logic"
  And I click on the element identified by "#advBranchingBox"
  And I enter "[record_id] <> '999'" into the field identified by ".ace_content"
  And I click on the button labeled "Update & Close Editor"
  And I click on the button labeled exactly "Save"
  And I click on the button labeled "No"
  #verify that on one field has been updated
  #duplicated logic
  And I click on the branching logic icon for the field with name "Text2"
  And I click on the link labeled "Clear logic"
  And I click on the element identified by "#advBranchingBox"
  And I enter "[record_id] <> '999'" into the field identified by ".ace_content"
  And I click on the button labeled "Update & Close Editor"
  And I click on the button labeled exactly "Save"
  #NB typo in manual script - Caculated rather than Calculated
  Then I can successfully apply the same branching logic "[record_id] <> '999'" to all fields containing the same original branching logic except the Record ID field and the field with the label "Caculated Field"




