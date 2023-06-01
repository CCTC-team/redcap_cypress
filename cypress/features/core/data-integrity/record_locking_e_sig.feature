Feature: Record Locking and E-Signatures

  As a REDCap end user
  I want to see that Record Locking and E-Signatures is functioning as expected

  Scenario: Test Requirements 1 - Create 19_RecordLockingEsigs_v1115 and add admin as a user
    Given I am an "admin" user who logs into REDCap
    And I create a project named "Recording Locking and E-signatures Feature" with project purpose Operational Support via CDISC XML import from fixture location "cdisc_files/projects/DesignForms_v1115.xml"

    Given I click on the link labeled "My Projects"
    And I click on the link labeled "Recording Locking and E-signatures Feature"
    And I click on the link labeled "User Rights"
  
  Scenario: Test Requirements 2 - Add test_user
    Given I click on the link labeled "My Projects"
    And I click on the link labeled "Recording Locking and E-signatures Feature"
    And I click on the link labeled "User Rights"

    And I enter "test_user" into the field identified by "input[id=new_username]"
    And I click on the button labeled "Add with custom rights"
    And I check the User Right named 'Project Setup & Design'
    And I check the User Right named 'Create Records'
    And I check the User Right named 'Record Locking Customization'
    And I select the User Right named "Lock/Unlock Records" and choose "Locking / Unlocking with E-signature authority"
    And I click on the button labeled "Close" in the dialog box
    And I save changes within the context of User Rights

  Scenario: Test Requirements 3 - Add test_user2
    Given I click on the link labeled "My Projects"
    And I click on the link labeled "Recording Locking and E-signatures Feature"
    And I click on the link labeled "User Rights"

    Then I enter "test_user2" into the username input field
    And I click on the button labeled "Add with custom rights"
    And I check the User Right named 'Project Setup & Design'
    And I check the User Right named 'Record Locking Customization'
    And I select the User Right named "Lock/Unlock Records" and choose "Disabled"
    And I save changes within the context of User Rights

  Scenario: Project Setup 1 & 2 
    Given I click on the link labeled "My Projects"
    And I click on the link labeled "Recording Locking and E-signatures Feature"
    And I click on the link labeled "Project Setup"
    #And I open the dialog box for the Repeatable Instruments and Events module
    And I click on the button labeled "Online Designer"
    #And I delete the data instrument named "Data Dictionary"
    And I click on the link labeled "Project Home"
    And I click on the link labeled "Other Functionality"
    Then I should NOT see "Move back to Development status"
    
  Scenario: 1 - See Record Locking Module
    Given I am an "standard" user who logs into REDCap
    And I click on the link labeled "My Projects"
    And I click on the link labeled "Recording Locking and E-signatures Feature"
    Then I should see "Customize & Manage Locking/E-signatures"
  
  Scenario: 2 - Browse to Customize & Manage Locking/E-signatures
    Given I click on the link labeled "Customize & Manage Locking/E-signatures"
    Then I should see "Customize and Manage the Record Locking and E-signature Functionality"
    And I should see "Record Locking Customization"
    And I should see "E-signature and Locking Management"

  Scenario: 3 - Add/Edit Record
    Given I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "1" and click on the bubble
    And I enter "1" into the data entry form field labeled "Required"
    And I check the checkbox labeled "Lock"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    Then I should see "Instrument locked by test_user"

  Scenario: 4 - Click on locked fields
    Given I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "1" and click on the bubble
    Then I cannot edit the input field labeled "Text2"

  Scenario: 5 - Check if locked on Dashboard
    Given I click on the link labeled "Customize & Manage Locking/E-signatures"
    And I click on the link labeled "E-signature and Locking Management"
    # Should this be more robust
    Then I should see an instrument named "Data Types" locked

  Scenario: 6 - Unlock Form
    Given I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "1" and click on the bubble
    And I click on the input button labeled "Unlock form"
    And I click on the button labeled "Unlock" in the dialog box
    And I click on the button labeled "Close" in the dialog box
    Then I enter "1" into the input field labeled "Text2"

  Scenario: 7 - 