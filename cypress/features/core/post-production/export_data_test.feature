Feature: Export Data

  As a REDCap end user
  I want to see that Export Data is functioning as expected

  Scenario: Project Setup 4 - Import Data File

    Given I am a "standard" user who logs into REDCap
    And I create a project named "21_ExportDataExtraction_v1115" with project purpose Practice / Just for fun via CDISC XML import from fixture location "cdisc_files/core/21ExportDataExtracti_temp.xml"
    And I click on the link labeled "Record Status Dashboard"
    # Getting the Event wrong
    And I locate the bubble for the "Survey" instrument on event "Event 1" for record ID "1" and click the repeating instrument bubble for the first instance
    And I click on the button labeled "Survey options"
    # And I click on the survey option label containing "Open survey" label
    And I click on the survey option label containing "Open survey" label and want to track the response with a tag of "abc"
    And I click on the button labeled "Submit"
    And I click on the button labeled "Close survey"
    And I logout
        
  Scenario: 1 - Login
    Given I am a "standard" user who logs into REDCap
    # And the AJAX request tagged by "render" has completed
    Then I should see "New Project"
    # And I wait for 2 seconds
    # And the AJAX "GET" request at "/index.php*" tagged by "render" is being monitored
    # And I click on the link labeled "My Projects"
    # And the AJAX request tagged by "render" has completed

  Scenario: 2 - Open project
    And I wait for 2 seconds
    Given I click on the link labeled "My Projects"
    # And I wait for 2 seconds
    And I click on the link labeled "21_ExportDataExtraction_v1115"
    Then I should see "21_ExportDataExtraction_v1115"
 