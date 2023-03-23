Feature: Branching Logic

  As a REDCap end user
  I want to see that Branching Logic is functioning as expected

  #NB typo in manual script - Caculated rather than Calculated
  #ATS - Agreed to use Advanced Branching Logic Syntax throughout instead of using the Drag-N-Drop Logic Builder due to the complexities observed with drag and drop

  Scenario: 0 - Project Setup
  Given I am a "standard" user who logs into REDCap
  And I create a project named "BranchingLogic_v1115" with project purpose Operational Support via CDISC XML import from fixture location "cdisc_files/projects/DesignForms_v1115.xml"
  And I click on the link labeled "My Projects"
  And I click on the link labeled "BranchingLogic_v1115"
  Then I should see "Development"
  When I click on the link labeled "Project Setup"
  And I disable longitudinal mode
  Then I should see that longitudinal mode is "disabled"
  When I enable surveys for the project
  Then I should see that surveys are enabled
  When I click on the button labeled "Online Designer"
  And I enable surveys for the data instrument named "Data Types"
  Then I should see "Your survey settings were successfully saved!"
  When I delete the data instrument named "Text Validation"
  Then I should see "Deleted!"
  And I should see "The data collection instrument and all its fields have been successfully deleted!"
  Then I logout

  Scenario: 1
  Given I am a "standard" user who logs into REDCap
  And I click on the link labeled "My Projects"
  And I click on the link labeled "BranchingLogic_v1115"
  And I click on the link labeled "Project Setup"
  And I click on the button labeled "Online Designer"
  And I click on the link labeled "Data Types"
  And I set the branching logic of every field to "[record_id] = '999'" except the Record ID field and the field with the label "Caculated Field"
  Then Every field contains the branching logic "[record_id] = '999'" except the Record ID field and the field with the label "Caculated Field"

  Scenario: 2
  Given I click on the link labeled "Survey Distribution Tools"
  When I open the public survey
  Then The fields shown on the public survey are "Caculated Field"
  When I close the public survey
  #alert doesn't always appear. Is this because close occurs in the close stub? We don't actually want to close the main browser tab
  Then The survey closes

  Scenario: 3
  Given I click on the link labeled "Add / Edit Records"
  When I click on the button labeled "Add new record"
  Then The fields shown on the instrument are "Caculated Field"
  
  Scenario: 4
  #does 'leave' need adding to the step definition regular expression?
  #Given after the next step, I will <leave> a confirmation window containing the text "Changes that you made may not be saved."
  #for now manually click on leave (although the leave dialog doesn't always show) unless running in dev tools mode
  Given I click on the button labeled "Modify instrument"

  Scenario: 5
  Given I set the branching logic of the field with the variable name "ptname" to "[record_id] <> '999'" and "temporarily decline" updating fields containing shared branching logic
  #verify that only one field has been updated
  And  I set the branching logic of the field with the variable name "text2" to "[record_id] <> '999'" and "temporarily accept" updating fields containing shared branching logic
  Then Every field contains the branching logic "[record_id] <> '999'" except the Record ID field and the field with the label "Caculated Field"

  Scenario: 6
  Given I click on the link labeled "Survey Distribution Tools"
  When I open the public survey
  Then The fields shown on the public survey are "Name|Text2|Text Box|Notes Box|Caculated Field|Multiple Choice Dropdown Auto|Multiple Choice Dropdown Manual|Radio Button Auto|Radio Button Manual|Checkbox|Signature|File Upload|Descriptive Text with File|Required|Identifier|Identifier|Edit Field|Descriptive Text"
  When I close the public survey
  Then The survey closes

  Scenario: 7
  Given I click on the link labeled "Add / Edit Records"
  When I click on the button labeled "Add new record"
  Then The fields shown on the instrument are "Name|Text2|Text Box|Notes Box|Caculated Field|Multiple Choice Dropdown Auto|Multiple Choice Dropdown Manual|Radio Button Auto|Radio Button Manual|Checkbox|Signature|File Upload|Descriptive Text with File|Required|Identifier|Identifier|Edit Field|Descriptive Text"

  Scenario: 8
  #does 'leave' need adding to the step definition regular expression?
  #Given after the next step, I will <leave> a confirmation window containing the text "Changes that you made may not be saved."
  #for now manually click on leave (although the leave dialog doesn't always show) unless running in dev tools mode
  Given I click on the button labeled "Modify instrument"

  Scenario: 9
  Given I set the branching logic of the field with the variable name "descriptive_text" to "[radio_button_manual] = '101'" and "permanently decline" updating fields containing shared branching logic
  #Need a step definition to check the branching logic of a single field
  #Then ...

  Scenario: 10
  Given I set the branching logic of the field with the variable name "required" to "[checkbox(3)] = '1'"

  Scenario: 11
  Given I click on the link labeled "Survey Distribution Tools"
  When I open the public survey
  And I select the survey radio option "Choice101" for the field labeled "Radio Button Manual"
  Then The fields shown on the public survey are "Name|Text2|Text Box|Notes Box|Caculated Field|Multiple Choice Dropdown Auto|Multiple Choice Dropdown Manual|Radio Button Auto|Radio Button Manual|Checkbox|Signature|File Upload|Descriptive Text with File|Identifier|Identifier|Edit Field|Descriptive Text"
  When I select the survey radio option "Choice99" for the field labeled "Radio Button Manual"
  Then The fields shown on the public survey are "Name|Text2|Text Box|Notes Box|Caculated Field|Multiple Choice Dropdown Auto|Multiple Choice Dropdown Manual|Radio Button Auto|Radio Button Manual|Checkbox|Signature|File Upload|Descriptive Text with File|Identifier|Identifier|Edit Field"
  When I "check" the survey checkbox option "Checkbox3" for the field labeled "Checkbox"
  Then The fields shown on the public survey are "Name|Text2|Text Box|Notes Box|Caculated Field|Multiple Choice Dropdown Auto|Multiple Choice Dropdown Manual|Radio Button Auto|Radio Button Manual|Checkbox|Signature|File Upload|Descriptive Text with File|Required|Identifier|Identifier|Edit Field"
  When I "uncheck" the survey checkbox option "Checkbox3" for the field labeled "Checkbox"
  Then The fields shown on the public survey are "Name|Text2|Text Box|Notes Box|Caculated Field|Multiple Choice Dropdown Auto|Multiple Choice Dropdown Manual|Radio Button Auto|Radio Button Manual|Checkbox|Signature|File Upload|Descriptive Text with File|Identifier|Identifier|Edit Field"
  When I close the public survey
  Then The survey closes
  