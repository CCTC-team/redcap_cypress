Feature: My Projects

  As a REDCap end user
  I want to see that My Projects is functioning as expected

  Scenario: Project Setup 1 - Create Project 13_MyProjects_v1115
    Given I am a "standard" user who logs into REDCap
    And I create a project named "13_MyProjects_v1115" with project purpose Operational Support via CDISC XML import from fixture location "cdisc_files/core/07_DesignForms_v1115.xml"
    
  Scenario: Project Setup 2 - Longitudinal Data Collection is enabled and Project is in development
    Given I visit Project ID 14
    Then I should see "Development"
    And I click on the link labeled "Project Setup"
    Then I should see that longitudinal mode is "enabled"

  Scenario: Project Setup 4 - Projects for standard user

  Scenario: 1 - Standard user is able to login
    Given I am a "standard" user who logs into REDCap
    And I click on the link labeled "My Projects"
    Then I should see "Project Title"
    And I should see "Records"
    And I should see "Fields"
    And I should see "Instruments"
    And I should see "Type"
    And I should see "Status"

  Scenario: 2 - The number in Records column in the My Projects dashboard should match the no:of records in a project
    Given I click on the link labeled "My Projects"
    Then I should see "1" in column 2 next to the link "13_MyProjects_v1115"
    And I click on the link labeled '13_MyProjects_v1115'
    Then I should see "13_MyProjects_v1115"
    And I click on the link labeled "Record Status Dashboard"
    Then I should see 1 records in the Record Status Dashboard
    And I click on the link labeled "Arm 2:"
    Then I should see 0 records in the Record Status Dashboard

  Scenario: 3 - The number in Fields column in the My Projects dashboard should match the sum of fields and instruments in a project
    Given I click on the link labeled "My Projects"
    Then I should see "23" in column 3 next to the link "13_MyProjects_v1115"
    And I click on the link labeled '13_MyProjects_v1115'
    Then I should see "13_MyProjects_v1115"
    And I click on the link labeled "Designer"
    Then I should see a total number of 2 instruments
    And The sum of field count of all the instruments should equal to 21
    # No:of instruments + field count = 2+21=23. Which matches the Field Count in My Projects Dashboard

  Scenario: 4 - The number in Instruments column in the My Projects dashboard should match the no:of instruments in a project
    Given I click on the link labeled "My Projects"
    Then I should see "2" in column 4 next to the link "13_MyProjects_v1115"
    And I click on the link labeled '13_MyProjects_v1115'
    Then I should see "13_MyProjects_v1115"
    And I click on the link labeled "Designer"
    Then I should see a total number of 2 instruments

  Scenario: 5 - Check if Longitudinal Data Collection is enabled in both the project and My Projects Dashboard
    Given I click on the link labeled "My Projects"
    Then I should see the icon "Longitudinal / repeating forms" in column 5 next to the link "13_MyProjects_v1115"
    And I click on the link labeled '13_MyProjects_v1115'
    Then I should see "13_MyProjects_v1115"
    And I click on the link labeled 'Project Setup'
    Then I should see that longitudinal mode is "enabled"

  Scenario: 6 - Disable Longitudinal Data Collection and verify it reflects in the My Projects Dashboard
    Given I click on the link labeled "My Projects"
    And I click on the link labeled '13_MyProjects_v1115'
    Then I should see "13_MyProjects_v1115"
    And I click on the link labeled 'Project Setup'
    Then I should see that longitudinal mode is "enabled"
    And I click on the element identified by "button[id=setupLongiBtn]"
    And I confirm to "Disable" the longitudinal data collection
    Then I should see that longitudinal mode is "disabled"
    And I click on the link labeled "My Projects"
    Then I should see the icon "Classic" in column 5 next to the link "13_MyProjects_v1115"
   
  Scenario: 7 - Check if the Project is in Development mode in both the project and My Projects Dashboard
    Given I click on the link labeled "My Projects"
    Then I should see the icon "Development" in column 6 next to the link "13_MyProjects_v1115"
    And I click on the link labeled '13_MyProjects_v1115'
    Then I should see "13_MyProjects_v1115"
    And I should see "Development"

  Scenario: 8
    Given I click on the link labeled "My Projects"
