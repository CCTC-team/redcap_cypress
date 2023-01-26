Feature: Data Quality

  As a REDCap end user
  I want to see that Data Collection and Storage is functioning as expected

  Scenario: Project Setup 1 - Create Project 18_DataQuality_v1115
    Given I am an "admin" user who logs into REDCap
    And I create a project named "18_DataQuality_v1115" with project purpose Practice / Just for fun via CDISC XML import from fixture location "cdisc_files/core/07_DesignForms_v1115.xml"

  Scenario: Project Setup 2 - 
    Given I click on the link labeled "Designer"
    And I click on the link labeled "Data Types"
    And I click on the element identified by "input#btn-textbox-f"
    And I select "text" from the dropdown identified by "#field_type"
    And I enter "Integer Field" into the field identified by "#field_label"  
    And I enter "integer_field" into the field identified by "#field_name" 
    And I select "integer" from the dropdown identified by "#val_type"
    And I enter "0" into the field identified by "#val_min"
    And I enter "10" into the field identified by "#val_max"
    And I click on the button labeled "Save"
    And I click on the link labeled "Data Quality"
    And I click on the link labeled "User Rights"
    And I enter "Test_user" into the field identified by "#new_username"
    And I click on the button labeled "Add with custom rights" 
    And I check the checkbox identified by "input[name='data_quality_design']"
    And I check the checkbox identified by "input[name='data_quality_execute']"
    And I click on the button labeled "Add user"
    And I click on the link labeled "User Rights"
    And I enter "Test_user2" into the field identified by "#new_username"
    And I click on the button labeled "Add with custom rights" 
    And I scroll the user rights page to the bottom
    And I click on the button labeled "Add user"
  
  Scenario: 3
    Given I logout  
   
  

  Scenario: 4
    Given I am a "standard" user who logs into REDCap 
    And I click on the link labeled " My Projects"
    And I click on the link labeled "18_DataQuality_v1115"
    Then I should see "Data Quality"

  Scenario: 5 Click Add / Edit Records and add New record for the arm selected
    Given I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record for the arm selected above"
    
  Scenario: 6 Click on Text Validation
    Given I click on a bubble with instrument named "Text Validation" and event named "Event 1"
    Then I should see " Adding new Record ID " 
  
  Scenario: 7
    Given I enter "user1115_1" into the field identified by "Input[name=ptname_v2_v2]"
    And I enter "user1115_1@redcap.com" into the field identified by "Input[name=email_v2]"

 Scenario: 8
    Given I select "Complete" from the dropdown identified by "select[name=text_validation_complete]"
    And I click on the button labeled "Save & Exit Form"
    Then I see a "circle_green" bubble for instrument named "Text Validation" and event named "Event 1"

 Scenario: 9 Go into the Data Types form
    Given I click on a bubble with instrument named "Data Types" and event named "Event 1"
    And I enter "User11151" into the field identified by "Input[name=ptname]"
    And I enter "This is a text" into the field identified by "Input[name=text2]"
    And I enter "8" into the field identified by "Input[name=integer_field]"
    And I enter "User11151" into the field identified by "Input[name=required]"
    And I select "Complete" from the dropdown identified by "select[name=data_types_complete]"
    And I click on the button labeled "Save & Exit Form"
    Then I see a "circle_green" bubble for instrument named "Data Types" and event named "Event 1"

 Scenario: 10 
    Given I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record for the arm selected above"
    Then I should see 'Record "3" is a new Record ID'

Scenario: 11
    Given I click on a bubble with instrument named "Data Types" and event named "Event 1"

Scenario: 12 and 13
    Given I enter "213" into the field identified by "Input[name=integer_field]" 
    Given I click on the element identified by "Input[name=textbox]"    
    Then I should see "The value you provided is outside the suggested range (0 - 10). " in an alert box
    And I click " Close" on the popup
    Then I see the field identified by "Input[name=integer_field]" turns red
    And I scroll the page to the field identified by "select[name=data_types_complete]"
    And I select "Complete" from the dropdown identified by "select[name=data_types_complete]"
    And I click on the button labeled "Save & Exit Form"
    Then  I click "Ignore and leave record" on the popup
    Then I see a "circle_green" bubble for instrument named "Data Types" and event named "Event 1"
    
    
   