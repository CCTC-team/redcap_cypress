Feature: D.117.100  File Version History for File Upload fields

  As a REDCap end user
  I want to see that File Version History for File Upload fields is functioning as expected

  Scenario: 
    Given I login to REDCap with the user "Test_User"
    And I create a new project named "D.117.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
    When I click on the button labeled "Additional Customizations"
    