Feature: A.6.4.500 Manage project creation, deletion, and settings

  Manage project creation, deletion, and settings
  Control Center: The system shall support the option to limit adding or modifying repeatable instruments while in production to administrators.

  Scenario: A.6.4.500.100 User’s ability to add or modify repeatable instrument while in production mode

    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "A.6.4.500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button
    When I click on the link labeled "My Projects"
    And I click on the link labeled "A.6.4.500.100"
    And I click on the link labeled "User Rights"
    And I enter "Test_User1" into the field with the placeholder text of "Assign new user to role"
    And I click on the button labeled "Assign to role"
    And I select "1_FullRights" on the dropdown field labeled "Select Role" on the role selector dropdown
    When I click on the button labeled exactly "Assign" on the role selector dropdown
    Then I should see "Test User1" within the "1_FullRights" row of the column labeled "Username" of the User Rights table

    Given I click on the link labeled "Project Setup"
    And I click on the button labeled "Move project to production"
    And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
    And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
    Then I should see Project status: "Production"

    When I click on the link labeled "Control Center"
    And I click on the link labeled "User Settings"
    Then I should see "System-level User Settings"
    When I select "No, only Administrators can modify the repeating instance setup in production" on the dropdown field labeled "Allow normal users to modify the 'Repeating Instruments & Events' settings for projects while in production status?"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"
    Given I logout

    Given I login to REDCap with the user "Test_User1"
    When I click on the link labeled "My Projects"
    And I click on the link labeled "A.6.4.500.100"
    And I click on the link labeled "Project Setup"
    Then I should see that repeatable instruments are unchangeable
    Given I logout

    Given I login to REDCap with the user "Test_Admin"
    When I click on the link labeled "My Projects"
    And I click on the link labeled "A.6.4.500.100"
    When I click on the link labeled "Control Center"
    And I click on the link labeled "User Settings"
    Then I should see "System-level User Settings"
    When I select "Yes, normal users can modify the repeating instance setup in production" on the dropdown field labeled "Allow normal users to modify the 'Repeating Instruments & Events' settings for projects while in production status?"
    And I click on the button labeled "Save Changes"
    Then I should see "Your system configuration values have now been changed!"
    Given I logout

    Given I login to REDCap with the user "Test_User1"
    When I click on the link labeled "My Projects"
    And I click on the link labeled "A.6.4.500.100"
    And I click on the link labeled "Project Setup"
    Then I should see "Repeating instruments and events"

    When I open the dialog box for the Repeatable Instruments and Events module
    And I close the popup
    And I select "-- not repeating --" on the dropdown field labeled "Event 1 (Arm 1: Arm 1)"
    And I select "Repeat Instruments (repeat independently of each other)" on the dropdown field labeled "Event Three (Arm 1: Arm 1)"
    And I check the checkbox labeled "Survey"
    And I click on the button labeled "Save"
    Then I should see "Your settings for repeating instruments and/or events have been successfully saved. (The page will now reload.)"

    And I click on the link labeled "Logging"
    Then I should see "Set up repeating instruments/events" in the logging table

    Given I click on the link labeled "Add / Edit Records"
    Given I select record ID "1" from arm name "Arm 1: Arm 1" on the Add / Edit record page
    And I click the bubble to select a record for the "Survey" longitudinal instrument on event "Event Three"
    And I enter "MyName" into the data entry form field labeled "Name"
    Given I select the submit option labeled "Save & Add New Instance" on the Data Collection Instrument
    And I enter "MyOtherName" into the data entry form field labeled "Name"
    Given I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    And I click the bubble to select a record for the "Survey" longitudinal instrument on event "Event Three"
    Then I see "Current instance: "
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    Then I should NOT see "Current instance:"

    And I click on the link labeled "Data Export, Reports, and Stats"
    Then I should see "A All data (records and fields)"
    And I click on the button labeled "View Report"
    Then I should NOT see repeat instrument "Data Types" for "Event 1 (Arm 1: Arm 1)"
    And I should see repeat instrument "Data Types” for "Event Three (Arm 1: Arm 1)"
    And I should see "MyOtherName"

    And I click on the link labeled "Project Setup"
    Then I should see "repeating instruments and events"

    When I open the dialog box for the Repeatable Instruments and Events module
    And I close the popup
    And I select "Repeat Instruments (repeat independently of each other)" on the dropdown field labeled "Event 1 (Arm 1: Arm 1)"
    And I check the checkbox labeled "Data Types"
    And I select "Not repeating" on the dropdown field labeled "Event Three (Arm 1: Arm 1)"
    And I click on the button labeled "Save"
    Then I see "Successfully saved"

    And I click on the button labeled "Logging"
    Then I see "Set up repeating instruments/events"

    Given I click on the link labeled "Add/Edit Records"
    And I select "1" on the dropdown field labeled "Choose an existing Record ID"
    And I click the bubble to select a record for the "Survey" longitudinal instrument on event "Event Three"
    Then I should NOT see "Current instance:"
    And I click on the button labeled "Cancel"
    And I click on the button labeled "OK" in the dialog box
    Then I see "data entry cancelled - not saved"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    Then I see "Current instance:"

    And I click on the link labeled "Data Export, Reports, and Stats"
    Then I should see "A All data (records and fields)"
    And I click on the button labeled "View Report"
    Then I should see repeat instrument instance for instrument "Data Types" for "Event 1 (Arm 1: Arm 1)"
    And I should NOT see repeat instrument instance for instrument "Data Types" for "Event Three (Arm 1: Arm 1)"
    And I should NOT see "MyOtherName"
    And I should see repeat event instance for event "Event 2 (Arm 1: Arm 1)"
    And I should NOT see repeat event instance for event "Event Three (Arm 1: Arm 1)"

    When I click on the link labeled "Project Setup"
    And I open the dialog box for the Repeatable Instruments and Events module
    And I close the popup
    And I select "Not repeating" on the dropdown field labeled "Event 2 (Arm 1: Arm 1)"
    And I select "Repeat Entire Event" on the dropdown field labeled "Event Three (Arm 1: Arm 1)"
    And I click on the button labeled "Save"
    Then I see "Successfully saved"

    And I click on the button labeled "Logging"
    Then I see "Set up repeating instruments/events"

    Given I click on the link labeled "Add/Edit Records"
    And I select "1" on the dropdown field labeled "Choose an existing Record ID"
    Then I should NOT see "(#2)"
    When I click on "Add New"
    And I click the bubble for the "Survey" longitudinal instrument on event "Event Three" instance "2"
    And I enter "My repeat event name" into the "Name" text input field
    And I click the button "Save & Exit Form"
    Then I see "(#2)"

    And I click on the link labeled "Data Export, Reports, and Stats"
    Then I should see "A All data (records and fields)"
    And I click on the button labeled "View Report"
    Then I should NOT see repeat event instance for event "Event 2 (Arm 1: Arm 1)"
    And I should see repeat event instance for event "Event Three (Arm 1: Arm 1)"
    And I should see "My repeat event name"

    When I click on the link labeled "Project Setup"
    And I open the dialog box for the Repeatable Instruments and Events module
    And I close the popup
    And I select "Repeat Entire Event" on the dropdown field labeled "Event 2 (Arm 1: Arm 1)"
    And I select "Not repeating" on the dropdown field labeled "Event Three (Arm 1: Arm 1)"
    And I click on the button labeled "Save"
    Then I see "Successfully saved"

    When I click on the link labeled "Data Export, Reports, and Stats"
    Then I should see "A All data (records and fields)
    And I click on the button labeled "View Report"
    Then I should see repeat event instance for event "Event 2 (Arm 1: Arm 1)"
    And I should see repeat event instance for event "Event Three (Arm 1: Arm 1)"
    And I should NOT see "My repeat event name"

    Given I click on the link labeled "Add/Edit Records"
    And I select "1" on the dropdown field labeled "Choose an existing Record ID"
    And I click the X to delete all data related to the event named "Event 2 (Arm 1: Arm 1)"
    And I click on the button labeled "Delete this instance of this event" in the dialog box
    Then I should NOT see "(#2)"

    And I click on the button labeled "Logging"
    Then I see "Delete record"