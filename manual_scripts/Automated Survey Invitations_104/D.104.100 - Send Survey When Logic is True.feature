Feature: D.104.100 - The system shall support the ability to send a survey when a logic becomes true 

  As a REDCap end user
  I want to be able to send surveys under logic conditions

  Scenario: D.104.100 - Send Survey When Logic is True
    Given I login to REDCap with the user "Test_User1"
    Then I create a new project named "D.104.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val_.xml", and clicking the "Create Project" button
   

   Survey_CUH_v1381.xml