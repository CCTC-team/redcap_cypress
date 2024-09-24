Feature: D.107.100  Action Tags and Field Embedding

  As a REDCap end user
  I want to see that File Version History for File Upload fields is functioning as expected

  Scenario: 
    Given I login to REDCap with the user "Test_User"
    And I create a new project named "D.107.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
    And I click on the button labeled "Additional Customizations"
    And I should see a checkbox labeled "Enable the Data History popup for all data collection instruments?" that is checked
    And I should see a checkbox labeled "Enable the File Version History for 'File Upload' fields?" that is checked
    When I click on the button labeled "Save"
    Then I should see "Success! Your changes have been saved."

    Given I click on the link labeled "Designer"
    And I should see "Federal Grants 2012"
    And I should see "Federal Grants 2013"
    And I should see "Federal Grants 2014"
    And I should see "Non-federal Grants 2012"
    And I should see "Non-federal Grants 2013"
    And I should see "Non-federal Grants 2014"
    And I should see "Research Agreements/Contracts 2012"
    And I should see "Research Agreements/Contracts 2013"
    And I should see "Research Agreements/Contracts 2014"
    And I click on the Add Field input button below the field named "Text Box"
    And I select "Descriptive Text (with optional Image/Video/Audio/File Attachment)" on the dropdown field labeled "Field Type:" in the dialog box
    And I check the checkbox labeled "Use the Rich Text Editor"
    And I enter "embedded" into the input field labeled "Variable Name"
    When I create a table with dimensions "4" x "4" with rows rows containing the following values:
      |                                | 2012                                       | 2013                                       | 2014                                       |
      | Federal Grants                 | Federal Grants: {grant2012}                | Federal Grants: {grant2013}                | Federal Grants: {grant2014}                |
      | Non- federal Grants            | Non-federal Grants: {nfgrant2012}          | Non-federal Grants: {nfgrant2013}          | Non-federal Grants: {nfgrant2014}          |
      | Research Agreements/Contracts  | Research Agreements/Contracts: {grant2022} | Research Agreements/Contracts: {grant2023} | Research Agreements/Contracts: {grant2024} |
    And I click on the button labeled "Save"
    Then I should see "Field is embedded elsewhere on page" "9" times
    # check mintoos response for if this is the best way to go or not
    And I should see "Contains embedded fields"

    Given I click on the link labeled "Add / Edit Records"
    When I click on the button labeled "Add new record"
    And I should see a table header and rows containing the following values in a table:
      |                                | 2012                            | 2013                           | 2014                           |
      | Federal Grants                 | Federal Grants:                 | Federal Grants:                | Federal Grants:                |
      | Non- federal Grants            | Non-federal Grants:             | Non-federal Grants:            | Non-federal Grants:            |
      | Research Agreements/Contracts  | Research Agreements/Contracts:  | Research Agreements/Contracts: | Research Agreements/Contracts: |
    And I enter "1" into the input field labeled "Federal Grants 2012"
    And I enter "2" into the input field labeled "Federal Grants 2013"
    And I enter "3" into the input field labeled "Federal Grants 2014"
    And I enter "4" into the input field labeled "Non-federal Grants 2012"
    And I enter "5" into the input field labeled "Non-federal Grants 2013"
    And I enter "6" into the input field labeled "Non-federal Grants 2014"
    And I enter "7" into the input field labeled "Research Agreements/Contracts 2012"
    And I enter "8" into the input field labeled "Research Agreements/Contracts 2013"
    And I enter "9" into the input field labeled "Research Agreements/Contracts 2014"
    Then I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument


# above this is field embedding and below this is action tags 

  Scenario: 
    Given I login to REDCap with the user "Test_User"
    And I create a new project named "D.107.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
    And I click on the button labeled "Additional Customizations"
    And I should see a checkbox labeled "Enable the Data History popup for all data collection instruments?" that is checked
    And I should see a checkbox labeled "Enable the File Version History for 'File Upload' fields?" that is checked
    When I click on the button labeled "Save"
    Then I should see "Success! Your changes have been saved."

    Given I click on the link labeled "Designer"
    And I click on the link labeled "Action Tags Test"
    And I click on the Edit image for the field named "Next Visit Due"
    And I click on the input element labeled "Action Tags / Field Annotation" 
    And I enter "@CALCDATE([visit], 7, 'd')" into the input field labeled "Logic Editor"
    And I click on the button labeled "Update & Close Editor"
    And I enter "@CALCDATE([visit], 7, 'd')" into the input field labeled "Field Note"
    And I click on the button labeled "Save"
    And I click on the link labeled "Add / Edit Records"
    And I select "1" on the dropdown field labeled "Choose an existing Record ID"
    And I click the bubble to select a record for the "Action Tags Test" longitudinal instrument on event "Status"
    #there are no events at the moment? does this^ need to be 'event 1' or perhaps another definition?
    When I enter "02/09/2023" into the input field labeled "Visit Date"
    Then I should see "@CALCDATE(02-09-2023, 7, 'd')"
    And I should see "09-09-2023" in the data entry form field "Next Visit Due" 
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument

    Given I click on the link labeled "Designer"
    And I click on the link labeled "Action Tags Test"
    And I click on the Edit image for the field named "Years Old"
    And I click on the input element labeled "Calculation Equation"
    And I enter "datediff([dob], 'today', 'y')" into the input field labeled "Logic Editor"
    And I click on the button labeled "Update & Close Editor"
    And I click on the button labeled "Save"
    And I click on the Edit image for the field named "This is a CALCTEXT that will output the words you if they are greater than 10 or your child if less than 10. You could use this in piping to other fields."
    And I click on the input element labeled "Action Tags / Field Annotation" 
    And I enter "@CALCTEXT(if([years] >= 10, 'you', 'your child'))" into the input field labeled "Logic Editor"
    And I click on the button labeled "Update & Close Editor"
    And I enter "@CALCTEXT(if([years] >= 10, 'you', 'your child'))" into the input field labeled "Field Note"
    And I click on the button labeled "Save"
    And I click on the link labeled "Add / Edit Records"
    And I select "1" on the dropdown field labeled "Choose an existing Record ID"
    And I click the bubble to select a record for the "Action Tags Test" longitudinal instrument on event "Status"
    And I enter "19-11-1978" into the input field labeled "Participant Date of Birth"
    And I should see "45.84887665957093" in the data entry form field "Years old" 
    And I click on the link labeled "View equation"
    And I should see "Calculation:	@CALCTEXT(if([years] >= 10, 'you', 'your child'))"
    And I click on the button labeled "Close"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    And I should see "@CALCTEXT(if(45.84887665957093 >= 10, 'you', 'your child'))"
    And I clear the field labeled "Participant Date of Birth"
    And I should see "" in the data entry form field "Years old"
    And I should see "your child" in the data entry form field "This is a CALCTEXT that will output the words you if they are greater than 10 or your child if less than 10. You could use this in piping to other fields."

    # need to add some whens, thens, and potentially gaps

    Given I click on the link labeled "Designer"
    And I click on the link labeled "Action Tags Test"

    #reached the start of step 20 in word doc
    
    
    