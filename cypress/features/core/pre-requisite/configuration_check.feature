Feature: Configuration Checklist

  As a REDCap end user
  I want to see that Configuration Checklist is functioning as expected

Background:
    Given I am an "admin" user who logs into REDCap
    And I visit the "Control Center" page

Scenario: Visible Tabs
    Then I should see a link labeled "My Projects"
    And I should see a link labeled "New Project"
    And I should see a link labeled "Help & FAQ"
    And I should see a link labeled "Control Center"

Scenario: Control Center Link Visibiity for Projects 
    Then I should see a Control Center link labeled "Browse Projects"
    And I should see a Control Center link labeled "Edit a Project's Settings"

Scenario: Control Center Link Visibiity for Users 
    Given I visit the "Control Center" page
    Then I should see a Control Center link labeled "Browse Users"
    And I should see a Control Center link labeled "Administrator Privileges"

Scenario: Control Center Link Visibiity for Sysyem Configuration 
    Given I visit the "Control Center" page
    Then I should see a Control Center link labeled "Browse System Configuration"
    And I should see a Control Center link labeled "Configuration Check"
    And I should see a Control Center link labeled "General Configuration"
    And I should see a Control Center link labeled "Security & Authentication"
    And I should see a Control Center link labeled "User Settings"
    And I should see a Control Center link labeled "File Upload Settings"
    And I should see a Control Center link labeled "Field Validation Types"

Scenario: Configuration Checklist Tests
    When I click on the link labeled "Configuration Check"
    Then I should see "Configuration Check"
    And I should see "TEST 1"
    And I should see "TEST 2"
    And I should see "TEST 3"
    And I should see "TEST 4"
    And I should see "TEST 5"
    And I should see "TEST 6"