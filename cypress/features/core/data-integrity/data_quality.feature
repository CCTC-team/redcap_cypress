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
    And I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled exactly "1"
    And I click on the button labeled "Choose action for record"
    And I click on the link labeled "Delete record (all forms/events)"
    And I click on the button labeled "DELETE RECORD"
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
    Then I should see 'Record "2" is a new Record ID'

Scenario: 11
    Given I click on a bubble with instrument named "Data Types" and event named "Event 1"

Scenario: 12 and 13
    Given I enter "213" into the field identified by "Input[name=integer_field]" 
    Given I click on the element identified by "Input[name=textbox]"    
    Then I should see "The value you provided is outside the suggested range (0 - 10). " in an alert box
    #And I click "Close" in the popup
    And I close popup
    Then I see the field identified by "Input[name=integer_field]" turns red
    And I scroll the page to the field identified by "select[name=data_types_complete]"
    And I select "Complete" from the dropdown identified by "select[name=data_types_complete]"
    And I click on the button labeled "Save & Exit Form"
    Then  I click "Ignore and leave record" in the popup
    Then I see a "circle_green" bubble for instrument named "Data Types" and event named "Event 1"

Scenario: 14 and 15  
    Given I click on the link labeled "Data Quality"
    And I click on the button labeled "All"
    Then All data quality rules are executed at the same time
    And I see "29" Total Discrepancies under Rule "A"
    And I see "1" Total Discrepancies under Rule "B"
    And I see "0" Total Discrepancies under Rule "C"


 Scenario: 16 and 17 View discrapancies and Exclude discrepancies.  
 Given I click "view" Total Discrepancies under Rule "A"
 And I click on "exclude" for the top "3" rows of descrepancies table
Then Iaa should see "remove exclusion" in the top "3" rows of table identified by "table#table-results_table_pd-3"
 #Then I should see "remove exclusion" in the top "3" rows of descrepancies table
 And I click on the button labeled "Close"

 Scenario: 18 Window opens up with Record 2 that did not have the “Required” field populated
 Given I click "view" Total Discrepancies under Rule "B"
 Then I should see "Blank values* (required fields only)"
 #A new step defination had to be written as the button 'Close' was hidden due to a parent css property
 And I click on the button labeled "Close" in discrepancies window

 Scenario: 19 Window opens up with Record 2 that had 213 entered as the Integer field
 Given  I click "view" Total Discrepancies under Rule "D"
 Then I should see "Field validation errors (out of range)"
 And I click on the button labeled "Close" in discrepancies window

 Scenario: 20 Reset Rules
 Given I click on the button labeled "Clear"
 Then All rules are reset and I see Execute button available
 
 Scenario: 21 Click on “All Except A&B”.Rules C-I are executed and Rules A&B show “Execute” 
 Given I click on the button labeled "All except A&B"
 Then Iaa should see "Execute" in the top "2" rows of table identified by "table[id=table-rules]"
 
 Scenario: 22 Execute Rules A and B separately 
 And I click "Execute" Total Discrepancies under Rule "A"
 And I see "26" Total Discrepancies under Rule "A"
 And I click "Execute" Total Discrepancies under Rule "B"
 And I see "1" Total Discrepancies under Rule "B"

 Scenario: 23 Reset Rules
 Given I click on the button labeled "Clear"
 Then All rules are reset and I see Execute button available

 Scenario: 24 Execute  all rules separately 
 And I click "Execute" Total Discrepancies under Rule "C"
 And I see "0" Total Discrepancies under Rule "C"
 And I click "Execute" Total Discrepancies under Rule "D"
 And I see "1" Total Discrepancies under Rule "D"

Scenario: 25 Reset Rules
 Given I click on the button labeled "Clear"
 Then All rules are reset and I see Execute button available

Scenario: 26 Under the “Apply To” drop box select the Record 2 
And Iaa select dropdown value "2" from list with value "2"
And I click on the button labeled "All"
Then All data quality rules are executed at the same time

Scenario: 27 Reset Rules
 Given I click on the button labeled "Clear"
 Then All rules are reset and I see Execute button available

Scenario: 28 Select the Record 2 and click All Except A & B
And Iaa select dropdown value "2" from list with value "2"
Given I click on the button labeled "All except A&B"
Then Iaa should see "Execute" in the top "2" rows of table identified by "table[id=table-rules]"

Scenario: 29 Reset Rules
Given I click on the button labeled "Clear"
Then All rules are reset and I see Execute button available

Scenario: 30 Select the Record 2 and execute rules separately
And Iaa select dropdown value "2" from list with value "2"
And I click "Execute" Total Discrepancies under Rule "A"
And I see "17" Total Discrepancies under Rule "A"
And I click "Execute" Total Discrepancies under Rule "B"
And I see "1" Total Discrepancies under Rule "B"

Scenario: 31 Reset Rules
Given I click on the button labeled "Clear"
Then All rules are reset and I see Execute button available

Scenario: 32 Add new rule
Given I enter "Test" into the field identified by "#input_rulename_id_0"  
And I click the input element identified by "#input_rulelogic_id_0"
And I enter "[event_1_arm_1][integer_field]>200" into the field identified by "#rc-ace-editor"
And I click on the button labeled "Update & Close Editor" 
And the AJAX "POST" request at "DataQuality/edit_rule_ajax*" tagged by "data_quality" is being monitored
And I click on the button labeled "Add"
And the AJAX request tagged by "data_quality" has completed

Scenario: 33 Execute and view new rule
Given I click "Execute" Total Discrepancies under new rule named "Test"  
Then I see "1" Total Discrepancies under Rule "Test"
Given  I click "view" Total Discrepancies under Rule "Test"
Then I should see "Test"
And I click on the button labeled "Close" in discrepancies window

Scenario: 34 Reset Rules
Given I click on the button labeled "Clear"
Then All rules are reset and I see Execute button available

Scenario: 35 Edit new rule

Given hover element "Click to enable editing"
And I clear text in field identified by "#rc-ace-editor"
#And I clear text in field identified by "#rc-ace-editor"
#I click on the link labeled "Click to enable editing"
And I enter "[event_1_arm_1][integer_field]>201" into the field identified by "#rc-ace-editor"
And I click on the button labeled "Update & Close Editor" 
And the AJAX "POST" request at "DataQuality/edit_rule_ajax*" tagged by "data_quality" is being monitored
And I click on the button labeled "Save"
And the AJAX request tagged by "data_quality" has completed

Scenario: 36 Execute all rules
Given I click on the button labeled "All"
Then All data quality rules are executed at the same time

Scenario: 37 Reset Rules
Given I click on the button labeled "Clear"
Then All rules are reset and I see Execute button available

Scenario: 38 and 39 Execute All Except A & B
Given I click on the button labeled "All except A&B"
Then Iaa should see "Execute" in the top "2" rows of table identified by "table[id=table-rules]"
Given I click on the button labeled "Clear"
Then All rules are reset and I see Execute button available

Scenario: 40 Execute All custom rules
Given I click on the button labeled "All custom"
Then Iaa should see "Execute" in the top "9" rows of table identified by "table[id=table-rules]"

Scenario: 41 Add new rule
Given I enter "Test2" into the field identified by "#input_rulename_id_0"  
And I click the input element identified by "#input_rulelogic_id_0"
And I enter "[event_1_arm_1][integer_field]>300" into the field identified by "#rc-ace-editor"
And I click on the button labeled "Update & Close Editor" 
And the AJAX "POST" request at "DataQuality/edit_rule_ajax*" tagged by "data_quality" is being monitored
And I click on the button labeled "Add"
And the AJAX request tagged by "data_quality" has completed

Scenario: 42 and 43 Execute Test2

Given I click "Execute" Total Discrepancies under new rule named "Test2"  
Then I see "0" Total Discrepancies under Rule "Test2"
And I click on the button labeled "Clear"
Then All rules are reset and I see Execute button available

Scenario: 44 and 45 Execute Test2 (Scenario 40 repeated)

Scenario: 46, 47 and 48 Delete New rule Test2 and run custom rule Test

Given I click X under new rule named "Test2" to delete it
And the AJAX "POST" request at "DataQuality/edit_rule_ajax*" tagged by "data_quality" is being monitored
Given I click on the button labeled "All custom"
And the AJAX request tagged by "data_quality" has completed
And I see "1" Total Discrepancies under Rule "Test"
Given I click on the button labeled "Clear"
Then All rules are reset and I see Execute button available

Scenario: 49 Click Add / Edit Records and add New record for the arm selected

Given I click on the link labeled "Add / Edit Records"
And I click on the button labeled "Add new record for the arm selected above"
Given I click on a bubble with instrument named "Data Types" and event named "Event 1"
Then I should see " Adding new Record ID " 
And I click on the button labeled "Save & Exit Form"
And  I click "Ignore and leave record" in the popup
Then I see a "circle_red" bubble for instrument named "Data Types" and event named "Event 1"

Scenario: 50
Given I click on the link labeled "Data Quality"
And I click "Execute" Total Discrepancies under Rule "H"
#And I see "1" Total Discrepancies under Rule "H"