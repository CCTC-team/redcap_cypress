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

    Given 


    