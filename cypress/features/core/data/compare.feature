Feature: Data Comparison Tool / DDE Module

  As a REDCap end user
  I want to see that the Data Comparison Tool and DDE Module are functioning as expected

  
  Scenario: Project Setup 1 - Create Project 17_DataComparisonTool_DDE_v1115
    Given I am a "standard" user who logs into REDCap
    And I create a project named "17_DataComparisonTool_DDE_v1115" with project purpose Operational Support via CDISC XML import from fixture location "cdisc_files/core/07_DesignForms_v1115.xml"
   
  Scenario: Project Setup 2 - Disable Longitudinal data collection and Repeating instruments and change Validation type of textbox
    Given I visit Project ID 14
    And I click on the link labeled "Project Setup"
    And I click on the element identified by "button[id=setupLongiBtn]"
    And I confirm to disable the longitudinal data collection
    Then I should see that longitudinal mode is "disabled"
    And I click on the element identified by "button[id=enableRepeatingFormsEventsBtn]"
    And I click on the checkbox labeled "Data Types" for repeating instrument setup
    And I click on the button labeled "Save"
    Then I should see "Your settings for repeating instruments and/or events have been successfully saved. (The page will now reload.)"
    And I close popup
    Then I should see that repeatable instruments are disabled
    And I click on the link labeled "Designer"
    And I click on the table cell containing a link labeled "Data Types"
    And the AJAX "GET" request at "Design/edit_field_prefill.php*" tagged by "edit" is being monitored
    And I click on the Edit image for the field named "Text Box"
    And the AJAX request tagged by "edit" has completed
    And I select "Date (M-D-Y)" from the dropdown identified by "[id=val_type]"
    Then I click on the button labeled "Save"

  Scenario: 1 - Add 2 records and compare
    Given I visit Project ID 14 
    And I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    # Add first record
    Then I click on the image "circle_gray" link for the row containing "Text Validation"
    And I enter "Rolling Stones" into the field identified by "input[name=ptname_v2_v2]"
    And I enter "rs@noreply.edu" into the field identified by "input[name=email_v2]"
    And I select "Complete" from the dropdown identified by "select[name=text_validation_complete]"
    Then I click on the button labeled "Save & Exit Form"
    Then I click on the image "circle_gray" link for the row containing "Data Types"
    And I enter "Mick Jagger" into the field identified by "input[name=ptname]"
    And I enter "singer" into the field identified by "input[name=text2]"
    And I enter "07/26/1943" into the field identified by "input[name=textbox]"
    And I select "DDChoice5" from the dropdown identified by "select[name=multiple_dropdown_manual]"
    And I click on the element identified by "input[id=opt-radio_button_auto_1]"
    And I check the checkbox identified by "input[id='id-__chk__checkbox_RC_1']"
    And I enter "75" into the field identified by "input[name=required]"
    And I select "Complete" from the dropdown identified by "select[name=data_types_complete]"
    Then I click on the button labeled "Save & Exit Form"
    # Add second record
    Then I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    Then I click on the image "circle_gray" link for the row containing "Text Validation"
    And I enter "Guns N' Roses" into the field identified by "input[name=ptname_v2_v2]"
    And I enter "gnr@noreply.edu" into the field identified by "input[name=email_v2]"
    And I select "Complete" from the dropdown identified by "select[name=text_validation_complete]"
    Then I click on the button labeled "Save & Exit Form"
    Then I click on the image "circle_gray" link for the row containing "Data Types"
    And I enter "Axl Rose" into the field identified by "input[name=ptname]"
    And I enter "singer" into the field identified by "input[name=text2]"
    And I enter "02/06/1962" into the field identified by "input[name=textbox]"
    And I select "DDChoice5" from the dropdown identified by "select[name=multiple_dropdown_manual]"
    And I click on the element identified by "input[id=opt-radio_button_auto_2]"
    And I check the checkbox identified by "input[id='id-__chk__checkbox_RC_1']"
    And I enter "57" into the field identified by "input[name=required]"
    And I select "Complete" from the dropdown identified by "select[name=data_types_complete]"
    And I click on the button labeled "Save & Exit Form"
    # Compare the records
    Then I click on the link labeled "Data Comparison Tool"
    And I select "2" from the dropdown identified by "select[id=record1]"
    And I select "3" from the dropdown identified by "select[id=record2]"
    And I click on the input button labeled "Compare"
    Then I see "ptname_v2_v2"
    And I see "email_v2"
    And I see "textbox"
    And I see "radio_button_auto"
    And I see "required"
    And I should NOT see "text2"
    And I should NOT see "multiple_dropdown_manual"
    And I should NOT see "Checkbox"

  Scenario: 2 - Print page
    Given I print the page

  Scenario: 3 - Change Required field from 75 to 57 and compare
    Given I click on the text "75" of Record ID "2"
    # And I scroll the page to the field identified by "input[name=required]"
    Then I should see " Required"
    And I clear the field identified by "input[name=required]"
    Then I enter "57" into the field identified by "input[name=required]"
    And I click on the button labeled "Save & Exit Form"
    #  Compare the records
    Then I click on the link labeled "Data Comparison Tool"
    And I select "2" from the dropdown identified by "select[id=record1]"
    And I select "3" from the dropdown identified by "select[id=record2]"
    And I click on the input button labeled "Compare"
    Then I should NOT see "required"

 Scenario: 4 - Delete the name and compare
    #  Compare the records
    Given I click on the link labeled "Data Comparison Tool"
    And I select "2" from the dropdown identified by "select[id=record1]"
    And I select "3" from the dropdown identified by "select[id=record2]"
    And I click on the input button labeled "Compare"
    And I click on the text "Guns N' Roses" of Record ID "3"
    Then I should see "Name"
    And I clear the field identified by "input[name=ptname_v2_v2]"
    And I click on the button labeled "Save & Exit Form"
    #  Compare the records
    Given I click on the link labeled "Data Comparison Tool"
    And I select "2" from the dropdown identified by "select[id=record1]"
    And I select "3" from the dropdown identified by "select[id=record2]"
    And I click on the input button labeled "Compare"
    Then I should see "ptname_v2_v2"