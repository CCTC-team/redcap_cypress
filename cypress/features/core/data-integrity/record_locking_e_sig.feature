Feature: Record Locking and E-Signatures

  As a REDCap end user
  I want to see that Record Locking and E-Signatures is functioning as expected

  Scenario: Test Requirements 1 - Create 19_RecordLockingEsigs_v1115 and add admin as a user
    Given I am an "admin" user who logs into REDCap
    And I create a project named "19_RecordLockingEsigs_v1115" with project purpose Operational Support via CDISC XML import from fixture location "cdisc_files/core/07_DesignForms_v1115.xml"

  Scenario: Test Requirements 2 - Add test_user
    Given I click on the link labeled "User Rights"
    And I enter "test_user" into the field identified by "input[id=new_username]"
    And I click on the button labeled "Add with custom rights"
    And I check the User Right named 'Project Setup & Design'
    And I check the User Right named 'Create Records'
    And I check the User Right named 'Record Locking Customization'
    And I select the User Right named "Lock/Unlock Records" and choose "Locking / Unlocking with E-signature authority"
    And I click on the button labeled "Close" in the dialog box
    And I check the User Right named 'Lock/Unlock *Entire* Records'
    And I save changes within the context of User Rights

  Scenario: Test Requirements 3 - Add test_user2
    Given I click on the link labeled "User Rights"
    Then I enter "test_user2" into the username input field
    And I click on the button labeled "Add with custom rights"
    And I check the User Right named 'Project Setup & Design'
    And I check the User Right named 'Record Locking Customization'
    And I select the User Right named "Lock/Unlock Records" and choose "Disabled"
    And I save changes within the context of User Rights

  Scenario: Project Setup 1 & 2 
    Given I click on the link labeled "My Projects"
    And I click on the link labeled "19_RecordLockingEsigs_v1115"
    And I click on the link labeled "Project Setup"
    And I should see that repeatable instruments are modifiable
    And I open the dialog box for the Repeatable Instruments and Events module
    And I select "-- not repeating --" on the dropdown field labeled "Event 1 (Arm 1: Arm 1)"
    And I select "-- not repeating --" on the dropdown field labeled "Event 2 (Arm 1: Arm 1)"
    And I click on the button labeled "Save"
    Then I should see "Your settings for repeating instruments and/or events have been successfully saved. (The page will now reload.)" in an alert box
    And I click on the button labeled "Online Designer"
    And I click on the link labeled "Project Home"
    And I click on the link labeled "Other Functionality"
    Then I should NOT see "Move back to Development status"

  Scenario: 1 - See Record Locking Module
    Given I am an "standard" user who logs into REDCap
    And I click on the link labeled "My Projects"
    And I click on the link labeled "19_RecordLockingEsigs_v1115"
    Then I should see "Customize & Manage Locking/E-signatures"

  Scenario: 2 - Browse to Customize & Manage Locking/E-signatures
    Given I click on the link labeled "Customize & Manage Locking/E-signatures"
    Then I should see "Customize and Manage the Record Locking and E-signature Functionality"
    And I should see "Record Locking Customization"
    And I should see "E-signature and Locking Management"

  Scenario: 3 - Lock the instrument 'Data Types' for record ID 1
    Given I click on the link labeled "Add / Edit Records"
    And I select "1" from the dropdown identified by "[id=record]"
    And the AJAX "GET" request at "DataEntry/index.php*" tagged by "render" is being monitored
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    And the AJAX request tagged by "render" has completed
    And I enter "1" into the data entry form field labeled "Required"
    And I check the checkbox identified by "input[id=__LOCKRECORD__]"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    Then I should see "Instrument locked by test_user"

  Scenario: 4 - Click on locked record and verify
    Given I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "1" and click on the bubble
    Then I cannot edit the field identified by "input[name=text2]"
    Then I should see "Instrument locked by test_user"

  Scenario: 5 - Verify if locked on Dashboard
    Given I click on the link labeled "Customize & Manage Locking/E-signatures"
    And I click on the link labeled "E-signature and Locking Management"
    Then I should see the instrument labeled "Data Types" locked

  Scenario: 6 - Unlock the instrument 'Data Types' for record ID 1
    Given I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "1" and click on the bubble
    And I click on the button labeled "Unlock form"
    Then I should see "UNLOCK FORM?"
    And I should see "Are you sure you wish to unlock this form for record"
    And I click on the button labeled "Unlock" in the dialog box
    Then I should see "UNLOCK SUCCESSFUL!"
    And I should see "This form has now been unlocked. Users can now modify the data again on this form."
    And I click on the button labeled "Close" in the dialog box
    # Then I enter "1" into the input field labeled "Text2"

  Scenario: 7 - Verify the instrument is unlocked
    Given I click on the link labeled "Record Status Dashboard"
    And I locate the bubble for the "Data Types" instrument on event "Event 1" for record ID "1" and click on the bubble
    Then I should NOT see "Instrument locked by test_user"

  Scenario: 8 - Check 'Display E-signature option' for instrument 'Text Validation'
    Given I click on the link labeled "Customize & Manage Locking/E-signatures"
    And I check the checkbox to display E-signature option for the instrument labeled "Text Validation"
    Then I enter "custom text" into the field identified by "textarea[id=label-text_validation]"
    And I save the option for the instrument labeled "Text Validation"

  Scenario: 9 - Enter data into the instrument 'Text Validation' and lock and e-sign
    Given I click on the link labeled "Add / Edit Records"
    And I select "1" from the dropdown identified by "[id=record]"
    And the AJAX "GET" request at "DataEntry/index.php*" tagged by "render" is being monitored
    And I click the bubble to select a record for the "Text Validation" longitudinal instrument on event "Event 1"
    And the AJAX request tagged by "render" has completed
    And I enter "Blaze Foley" into the data entry form field labeled "Name"
    And I enter "foley@gmail.com" into the data entry form field labeled "Email"
    And I select "Complete" from the dropdown identified by "select[name=text_validation_complete]"
    Then I should see "custom text"
    And I check the checkbox identified by "input[id=__LOCKRECORD__]"
    And I check the checkbox identified by "input[id=__ESIGNATURE__]"
    And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
    And I enter "test_user" into the field identified by "input[id=esign_username]"
    And I enter "Testing123" into the field identified by "input[id=esign_password]"
    Then I click on the button labeled "Save"
    Then I should see "E-signed by test_user"
    And I should see "Instrument locked by test_user"
    And I should see "custom text"
    And I should see the checkbox identified by "input[id=__LOCKRECORD__]", checked
    And I should see the checkbox identified by "input[id=__ESIGNATURE__]", checked

  Scenario: 10 - 'Data Types' instrument is not locked and has no e-sign option
    Given I click on the link labeled "Data Types"
    Then I should NOT see "custom text"
    And I should see "Lock this instrument?"
    And I should see the checkbox identified by "input[id=__LOCKRECORD__]", unchecked
    And I should no longer see the element identified by "input[id=__ESIGNATURE__]"

  Scenario: 11 - Check the icons on the instrument "Text Validation"
    Given I click on the link labeled "1"
    Then I should see the instrument labeled "Text Validation" with icon "lock"
    And I should see the instrument labeled "Text Validation" with icon "tick_shield"

  Scenario: 12 - Lock the entire record
    Given I click on the button labeled "Choose action for record"
    And I click on the link labeled "Lock entire record"
    Then I should see "Do you wish to LOCK record"
    And I click on the button labeled "Lock entire record"
    Then I should see "is now LOCKED"
    And the AJAX "GET" request at "DataEntry/record_home.php*" tagged by "render" is being monitored
    And I click on the button labeled "OK"
    And the AJAX request tagged by "render" has completed
    And I should see "Record Home Page"
    And I click the bubble to select a record for the "Data Types" longitudinal instrument on event "Event 1"
    Then I cannot edit the field identified by "input[name=ptname]"
    Then I click on the link labeled "1"
    Then I should see "Record Home Page"
    And I click on the button labeled "Choose action for record"
    Then I should see "Unlock entire record"

  Scenario: 13 - Uncheck 'Display the Lock' for instrument 'Data Types'
    Given I click on the link labeled "Customize & Manage Locking/E-signatures"
    And I check the checkbox identified by "input[id=dispchk-data_types]"
    Then I should see "saved"

  Scenario: 14 - 
    Given I click on the link labeled "Record Status Dashboard"
    And I click the bubble to select a record for the "Text Validation" longitudinal instrument on event "Event 1"