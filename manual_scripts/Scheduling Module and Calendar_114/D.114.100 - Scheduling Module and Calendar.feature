Feature: D.114.100  Scheduling Module and Calendar

  As a REDCap end user I want to see a working schedule and calander

   Scenario: 
    Given I login to REDCap with the user "test_user1"
    And I create a new project named "D.114.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val_Project_Scheduling_and_Calendar.xml", and clicking the "Create Project" button
    And I click on the button labeled "Enable" in the "Use longitudinal data collection with defined events?" row in the "Main project settings" section
    And I click on the button labeled "Define My Events"
    When I click on the button labeled "Edit"
    Then I enter "0" into the data entry form field labeled "Days Offset"
    # think this is wrong and a new definition needs making for table entry? 
    And I enter "Enrollment" into the data entry form field labeled "Event Label"
    # think this is wrong and a new definition needs making for table entry? 
    And I click on the button labeled "Save"

    Given I enter "1" into the data entry form field labeled "Days Offset"
    When I enter "Baseline" into the data entry form field labeled "Event Label"
    Then I click on the button labeled "Add new event"
    
    Given I enter "2" into the data entry form field labeled "Days Offset"
    When I enter "Visit 1" into the data entry form field labeled "Event Label"
    Then I click on the button labeled "Add new event"
    
    Given I enter "30" into the data entry form field labeled "Days Offset"
    When I clear field and enter "1" into the data entry form field labeled "-"
    And I clear field and enter "2" into the data entry form field labeled "+"
    And I enter "Visit 2" into the data entry form field labeled "Event Label"
    Then I click on the button labeled "Add new event"

    Given I enter "60" into the data entry form field labeled "Days Offset"
    When I clear field and enter "1" into the data entry form field labeled "-"
    And I clear field and enter "2" into the data entry form field labeled "+"
    And I enter "Visit 3" into the data entry form field labeled "Event Label"
    Then I click on the button labeled "Add new event"

    Given I enter "90" into the data entry form field labeled "Days Offset"
    When I clear field and enter "5" into the data entry form field labeled "-"
    And I clear field and enter "10" into the data entry form field labeled "+"
    And I enter "Final Visit" into the data entry form field labeled "Event Label"
    And I enter "[complete_study_date]" into the data entry form field labeled "Custom Event Label"
    Then I click on the button labeled "Add new event"

    Given I enter "120" into the data entry form field labeled "Days Offset"
    When I clear field and enter "1" into the data entry form field labeled "-"
    And I clear field and enter "2" into the data entry form field labeled "+"
    And I enter "Final Visit Follow up" into the data entry form field labeled "Event Label"
    And I enter "[complete_study_date]" into the data entry form field labeled "Custom Event Label"
    Then I click on the button labeled "Add new event"

    Given I click on the link labeled "Designate Instruments for My Events"
    And I click on the tab labeled "Designate Instruments for My Events"
    And I click on the button labeled "Begin Editing"
    



    # i have reached step  in the word document 
