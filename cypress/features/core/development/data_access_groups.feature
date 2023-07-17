Feature: Data Access Groups (DAGs)

  As a REDCap end user
  I want to see that Data Access Groups (DAGs) are functioning as expected

Scenario: Project Setup - 1
    Given I am an "admin" user who logs into REDCap
    And I create a project named "10_DataAccessGroups_v1115" with project purpose Practice / Just for fun via CDISC XML import from fixture location "cdisc_files/core/07_DesignForms_v1115.xml"
    When I click on the link labeled "User Rights"
    And I assign the "Project Design and Setup" user right to the user named "Test User" with the username of "test_user"
    Then I should see "was successfully edited"
    And I click to edit username "test_user (Test User)"
    Then I click on the button labeled "Edit user privileges"
    And I check the User Right named "User Rights"
    And I check the User Right named "Data Access Groups"
    And the AJAX "POST" request at "UserRights/edit_user.php*" tagged by "render" is being monitored
    And I click on the button labeled "Save Changes"
    Then I should see "was successfully edited"
    And the AJAX request tagged by "render" has completed
    
    Then I enter "test_user2" into the field identified by "input[id=new_username]"
    And the AJAX "POST" request at "UserRights/edit_user.php*" tagged by "render" is being monitored
    And I click on the button labeled "Add with custom rights"
    And the AJAX request tagged by "render" has completed
    And I check the User Right named "Project Setup & Design"
    Then I click on the button labeled "Add user"
    Then I should see "was successfully added"

Scenario: Project Setup - 2   
    When I click on the link labeled "Project Setup"
    When I click on the link labeled "Other Functionality"
    And I click on the button labeled "Erase all data"
    And I click on the button labeled "Erase all data" in the dialog box 
    And I close the popup

    When I click on the link labeled "Project Setup"
    And I enable surveys for the project
    Then I should see that surveys are enabled

    And I disable longitudinal mode
    Then I should see that longitudinal mode is "disabled"

    And I open the dialog box for the Repeatable Instruments and Events module
    And I check the checkbox labeled "Text Validation"
    And I check the checkbox labeled "Data Types"
    And I uncheck the checkbox labeled "Text Validation"
    And I uncheck the checkbox labeled "Data Types"
    And I click on the button labeled "Save" in the dialog box

    And I should see that repeatable instruments are disabled

    When I should see that auto-numbering is "enabled"
    And I should see that the scheduling module is "disabled"
    And I should see that the randomization module is "disabled"
    And I should see that the designate an email field for communications setting is "disabled"

    When I click on the button labeled "Additional customizations"
    And I check the checkbox identified by "[id=custom_record_label_chkbx]"
    And I enter "[name]" into the field identified by "[id=custom_record_label]"
    And I click on the button labeled "Save" in the dialog box

Scenario: 1 - Login as Test User
    # Given I am a "standard" user who logs into REDCap
    Given I am an "admin" user who logs into REDCap

Scenario: 2 - Go to My Projects Page
    Given I click on the link labeled "My Projects"
    And I click on the link labeled "10_DataAccessGroups_v1115"

Scenario: 3 - Upload Data Dictionary
    When I click on the button labeled "Data Dictionary"
    And I upload the data dictionary located at "core/10_DataAccessGroups_v1115_DataDictionary.csv"
    Then I should see "Changes Made Successfully!"

Scenario: 4 - Designate and Email Field 
    When I click on the link labeled "Project Setup"
    Then I should see that the designate an email field for communications setting is "enabled"
    And I should see "email"

Scenario: 5 - Enable Dag Test instrument as survey
    Given I click on the link labeled "Designer"
    Then I should see "Dag Test"
    And I should see the instrument labeled "Dag Test" is not a survey
    And I enable surveys for the data instrument named "Dag Test"
    Then I should see "Your survey settings were successfully saved!"
    Then I should see the instrument labeled "Dag Test" is a survey

Scenario: 6 - DAG Link
   When I click on the link labeled "DAGs"
   Then I should see "Data Access Groups"
   And I should see "[Not assigned to a group]"

Scenario: 7 - Create DAG Data Access 1
   When I enter "Data Access 1" into the field identified by "[id=new_group]"
   And I click on the button labeled "Add Group"
   Then I should see "has been created!"
   And I should see "Data Access 1" in the column named "Data Access Groups"
   And I logout

Scenario: 8 - Assign users to DAG Data Access 1
    Given I am a "standard" user who logs into REDCap
    Then I click on the link labeled "My Projects"
    And I click on the link labeled "10_DataAccessGroups_v1115"
    Then I click on the link labeled "DAGs"
    And I select "test_admin (Test User)" from the dropdown identified by "select[id=group_users]"
    And I select "Data Access 1" from the dropdown identified by "select[id=groups]"
    And I click on the button labeled "Assign"
    Then I should see "has been assigned to Data Access Group"
    And I wait for 2 seconds
    And I should see "test_admin (Test User)" in the column named "Users in group"
    And I should see the user "test_admin (Test User)" in the DAG named "Data Access 1"
    And I logout

    Given I am an "admin" user who logs into REDCap
    Then I click on the link labeled "My Projects"
    And I click on the link labeled "10_DataAccessGroups_v1115"
    Then I click on the link labeled "DAGs"
    And I select "test_user (Test User)" from the dropdown identified by "select[id=group_users]"
    And I select "Data Access 1" from the dropdown identified by "select[id=groups]"
    And I click on the button labeled "Assign"
    And I wait for 2 seconds
    Then I should see "has been assigned to Data Access Group"
    And I should see "test_admin (Test User),test_user (Test User)" in the column named "Users in group"
    And I should see the user "test_admin (Test User),test_user (Test User)" in the DAG named "Data Access 1"
    # Then I logout
   
Scenario: 9 - Create DAG Data Access 2
    # Given I am an "admin" user who logs into REDCap
    And I click on the link labeled "My Projects"
    And I click on the link labeled "10_DataAccessGroups_v1115"
    And I click on the link labeled "DAGs"
    When I enter "Data Access 2" into the field identified by "[id=new_group]"
    And I click on the button labeled "Add Group"
    Then I should see "has been created!"
    And I should see "Data Access 2" in the column named "Data Access Groups"
 
Scenario: 10 - Assign user to DAG Data Access 2
    And I select "test_user2 (Test User)" from the dropdown identified by "select[id=group_users]"
    And I select "Data Access 2" from the dropdown identified by "select[id=groups]"
    And I click on the button labeled "Assign"
    And I wait for 0.5 seconds
    Then I should see "has been assigned to Data Access Group"
    And I should see "test_user2 (Test User)" in the column named "Users in group"
    And I should see the user "test_user2 (Test User)" in the DAG named "Data Access 2"
    
Scenario: 11 - Add a record to DAG 1
    Given I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    And I select "Data Access 1" from the dropdown identified by "select[name=__GROUPID__]"
    And I enter "Record1" into the field identified by "input[name=name]"
    And I enter "record1@abc.com" into the field identified by "input[name=email]"
    Then I click on the button labeled "Save & Exit Form"
    Then I should see "successfully added"
    And I should see "Data Access 1"
    And I should see "1"

Scenario: 12 - Check email in Participant List in Survey Distribution Tools
    Given I click on the link labeled "Survey Distribution Tools"
    Then I click on the link labeled "Participant List"
    And I should see "Email"
    And I should see "Record"
    And I should see "Participant Identifier"
    And I should see "Responded?"
    And I should see "Invitation Scheduled?"
    And I should see "Invitation Sent?"
    And I should see "Link"
    And I should see "Survey Access Code and"
    And I should see "QR Code"
    And I should see "record1@abc.com"
    Then I logout

Scenario: 13 - Add a record to DAG 2 and check email in Participant List in Survey Distribution Tools
    Given I am a "standard2" user who logs into REDCap
    And I click on the link labeled "My Projects"
    And I click on the link labeled "10_DataAccessGroups_v1115"
    Then I click on the link labeled "Record Status Dashboard"
    # And I should NOT see a link labeled "1"
    And I should see the dropdown identified by "select[id=record]" with the options below
    | -- select record -- |
    Then I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    And I enter "Record2" into the field identified by "input[name=name]"
    And I enter "record2@abc.com" into the field identified by "input[name=email]"
    Then I click on the button labeled "Save & Exit Form"
    Then I should see "successfully added"
    And I should see "Data Access 2"
    And I should see "2"
    Then I click on the link labeled "Survey Distribution Tools"
    Then I click on the link labeled "Participant List"
    And I should see "record2@abc.com"
    And I should NOT see "record1@abc.com"
    Then I logout

Scenario: 14 - 
    Given I am an "admin" user who logs into REDCap
    And I click on the link labeled "My Projects"
    And I click on the link labeled "10_DataAccessGroups_v1115"
    Then I click on the link labeled "Record Status Dashboard"
    # And I should NOT see a link labeled "1"
    And I should see the dropdown identified by "select[id=record]" with the options below
    | -- select record -- | 
    Then I click on the link labeled "Add / Edit Records"