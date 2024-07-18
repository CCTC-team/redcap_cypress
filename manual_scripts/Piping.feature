Feature: Piping. The system shall support the ability to use previously collected data in a text on a data collection form or survey.

  As a REDCap end user
  I want to see that Piping feature is functioning as expected
 

Scenario: Project_CUH_v1381 Piping
    #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "Project_CUH_v1381_Piping" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_CUH_v1381.xml", and clicking the "Create Project" button


 