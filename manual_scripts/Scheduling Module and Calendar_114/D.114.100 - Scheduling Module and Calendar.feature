Feature: D.114.100  Scheduling Module and Calendar

  As a REDCap end user I want to see a working schedule and calander

   Scenario: 
    Given I login to REDCap with the user "test_user1"
    And I create a new project named "D.116.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val_.xml", and clicking the "Create Project" button
    And I click on the button labeled "Additional Customizations"
    And I should see a checkbox labeled "Enable the Data History popup for all data collection instruments?" that is checked
    And I should see a checkbox labeled "Enable the File Version History for 'File Upload' fields?" that is checked
    When I click on the button labeled "Save"
    Then I should see "Success! Your changes have been saved."
