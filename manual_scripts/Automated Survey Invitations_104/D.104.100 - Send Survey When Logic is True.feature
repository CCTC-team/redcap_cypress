Feature: D.104.100 - The system shall support the ability to send a survey when a logic becomes true 

  As a REDCap end user
  I want to be able to send surveys under logic conditions

  Scenario: D.104.100 - Send Survey When Logic is True
    Given I login to REDCap with the user "Test_User1"
    Then I create a new project named "D.104.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val_Survey.REDCap.xml", and clicking the "Create Project" button
   
    Given I click on the link labeled "Project Setup"
    And I should see a button labeled "Disable" in the "Use surveys in this project?" row in the "Main project settings" section
    And I click on the button labeled "Enable" in the "Use surveys in this project?" row in the "Main project settings" section
    And I click on the button labeled "Enable" in the dialog box
    When I click on the button labeled "Enable" in the "Designate an email field for communications (including survey invitations and alerts)" row in the "Enable optional modules and customizations" section
    Then I select 'email "Email"' on the dropdown field labeled "Choose an email field to use for invitations to survey participants:"
    And I click on the last button labeled "Save"

    Given I click on the link labeled "Designer"
    And I click on the last button labeled "Enable"
    And I click on the button labeled "Save Changes"
    And I click on the button labeled "Automated Invitations"
    And I click on the first button labeled "+ Set up"
    And I select the radio option "Active" for the field labeled "Activate automated invitations for this survey?"
    And I enter "Testing Survey Event 1" into the input field labeled "Subject:"
    And I check the checkbox labeled "When the following logic becomes true:"
    And I enter "[fname]!='' and [email]!=''" in the textarea field labeled "Logic Editor" in the dialog box
    And I click on the button labeled "Update & Close Editor" 
    And I check the checkbox labeled "Ensure logic is still true before sending invitation?"
    And I check the checkbox labeled "Send immediately"
    And I check the checkbox labeled "Re-send invitation as a reminder if participant has not responded by a specified time?"
    And I select the last radio option labeled "Send every"
    And I enter "5" into the field labeled "minutes" in the section "OPTIONAL: Enable reminders"
    And I select "send up to 2 times" on the dropdown field labeled "Recurrence:"
    When I click on the button labeled "Save"
    Then I should see "Settings for automated invitations were successfully saved!"
    And I click on the button "Close" in the pop-up box

    Given I click on the button labeled "+ Set up"
    And I select the radio option "Active" for the field labeled "Activate automated invitations for this survey?"
    And I enter "Testing Survey Event 2" into the input field labeled "Subject:"
    And I check the checkbox labeled "When the following survey is completed:"
    And I select '"Survey" – Event 1' on the dropdown field labeled "When the following survey is completed:"
    And I click on the radio labeled "Send the invitation after time lapse of" in the dialog box
    And I enter "2" into the field labeled "minutes" in the section "STEP 3: When to send invitations AFTER conditions are met"
    And I check the checkbox labeled "Re-send invitation as a reminder if participant has not responded by a specified time?"
    And I select the first radio option labeled "Send every"
    And I select 'Day' on the dropdown field labeled "at time"
    And I enter "12:00" into the input field labeled "H:M"
    And I click on the button labe "Done"
    And I select "Send only once" on the dropdown field labeled "Recurrence:"
    When I click on the button labeled "Save"
    Then I should see "Settings for automated invitations were successfully saved!"
    And I click on the button "Close" in the pop-up box

    Given I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record"
    When I click the bubble to select a record for the "Demographics" longitudinal instrument on event "Event 1"
    And I enter "George" into the input field labeled "Last name"
    And I enter "Joe" into the input field labeled "First name"
    And I enter "joe@abc.com" into the input field labeled "Email"
    Then I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I click on the link labeled "Survey Distribution Tools"
    And I click on the tab labeled "Survey Invitation Log"
    When I click on the button labeled "View past invitations"
    Then I should see a table header and rows containing the following values in the administrators table:
    | Invitation send time | View Invite          | Participant Email | Record | Participant Identifier | Survey         | Survey Link | Responded?  | Errors (if any) |
    | dd/mm/yyyy hh:mm     | [mail_open_document] | joe@abc.com       | 1      |                        | Survey Event 1 | [link]      | [stop_gray] |                 |


    Given I click on the tab labeled "Survey Invitation Log"
    When I click on the button labeled "View future invitations"
    Then I should see a table header and rows containing the following values in the administrators table:
    | Invitation send time | View Invite          | Participant Email | Record | Participant Identifier | Survey         | Survey Link | Responded?  | Errors (if any) |
    | dd/mm/yyyy hh:mm     | [mail_open_document] | joe@abc.com       | 1      |                        | Survey Event 1 | [link]      | [stop_gray] |                 |
    | dd/mm/yyyy hh:mm     | [mail_open_document] | joe@abc.com       | 1      |                        | Survey Event 1 | [link]      | [stop_gray] |                 |

    

# got to step 12 