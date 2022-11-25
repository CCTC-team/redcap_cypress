Feature: Design Forms using Data Dictionary & Online Designer

  As a REDCap end user
  I want to see that Design Forms using Data Dictionary & Online Designer are functioning as expected

  Scenario: Describe scenario here

Scenario: Create a new project with title "TestingProject", purpose "Practice / Just for fun" and Project creation opion "Empty project (blank state)"
    Given I am an "admin" user who logs into REDCap
    And I click on the link labeled "New Project"
    And I enter "TestingProject" into the field identified by "[name=app_title]"
    And I select "Practice / Just for fun" from the dropdown identified by "select[name=purpose]"
    When I click on the button labeled "Create Project"
    Then I should see "Your new REDCap project has been created and is ready to be accessed."

Scenario: I can create a new form labeled "FormTesting"
  Given I click on the link labeled "Designer"
  And I click on the button labeled "Create" next to the text "a new instrument from scratch"
  And I click on the button labeled "Add instrument here"
  And I enter "FormTesting" into the field identified by "input[type='text']" labeled "New instrument name:"
  And I click on the input button labeled "Create"
  Then I should see " The new instrument was successfully created. The page will be reloaded to reflect this change."
  And I click on the button labeled "Close"
