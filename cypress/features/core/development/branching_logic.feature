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
  And I should see that surveys are enabled
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
  And I click on the branching logic icon for the field with name "Name"
  And I select the Drag-N-Drop Logic Builder
  And I drag a field from "record_id" to "(define criteria)"
  And I select "=" from the dropdown identified by ".brDrag > select"
  And I enter "999" into the input identified by ".brDrag > input"
  And I click on the button labeled exactly "Save"
  And I close popup

  #refactor out into a function as this logic is repeated

  #the following two lines are repeated to reset the DOM after each drag'n'drop

  And I click on the button labeled "Return to list of instruments"
  And I click on the element identified by "#formlabel-data_types"
  And I click on the branching logic icon for the field with name "Text2"
  And I select the Drag-N-Drop Logic Builder
  And I drag a field from "record_id" to "(define criteria)"
  And I select "=" from the dropdown identified by ".brDrag > select"
  And I enter "999" into the input identified by ".brDrag > input"
  And I click on the button labeled exactly "Save"

  #need to assert that branching logic exists for this field