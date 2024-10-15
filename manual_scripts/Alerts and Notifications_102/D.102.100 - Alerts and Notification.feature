Feature: Alerts and Notifications: The system shall support sending emails when a record is saved and/or when a condition is met.


    As a REDCap end user
    I want to see that Alerts and Notifications is functioning as expected

    Scenario: D.102.100 Send emails when a record is saved on a specific form/survey.
        #SETUP
        Given I login to REDCap with the user "Test_user"   
        And I create a new project named "D.102.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

        #FUNCTIONAL_REQUIREMENT
        ##ACTION: New Alert
        Given I click on the link labeled "Alerts & Notifications"
        When I click on the button labeled "Add New Alert"
        Then I enter "Email Alert" into the input field labeled "Title of this alert"
        And I select "“Data Types (Event 1 (Arm 1: Arm 1))" on the dropdown field labeled "Trigger the alert..."
        And I should see "is saved with any form status"
        And I select "[event_1_arm_1][email_v2] “Email(Event 1 (Arm 1: Arm 1))" on the dropdown field labeled "Email To"
        And I enter "Testing Alerts and Notifications" into the input field labeled "Subject"
        And I enter "Alerts and Notifications" into the input field labeled "Message"
        And I click on the button labeled "Save" in the dialog box
        And I should see "Success! New alert created"
        And I should see "Alert #1:Email Alert"
        And I should see "When the instrument Data Types (Event 1 (Arm 1: Arm 1)) is saved with any form status."

        And I click on the link labeled "Add / Edit Records"
        And I click on the button labeled "+ Add new record for the arm selected above"
        And I click on the instrument labeled "Text Validation"
        And I enter "test_user2@example.com" into the input field labeled "Email"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 1 successfully edited"
        And I click on the instrument labeled "Data Types"
        And I enter "Lily Brown" into the input field labeled "Name"
        And I enter "2" into the input field labeled "Required"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 1 successfully edited"

        ##VERIFY: Sent email in MailHog 
        Given I open Email
        When I click on the link labeled "Testing Alerts and Notifications"
        Then I should see "From	test_user@example.com"
        And I should see "To test_user2@example.com"
        And I should see "Alerts and Notifications"

        Given I click on the link labeled "Alerts & Notifications"
        When I click on the link labeled "Notification Log"
        And I click on the button labeled "View past notifications"
        And I should see a table header and rows containing the following values in the a table:
            |  Notification send time|  Alert  |   View Notification   |   Record                     |  Recipient             | Subject                         | 
            |  MM/DD/YYYY HH:MM      |  #1(A-5)|     ""                | 1(#) - Event 1 (Arm 1: Arm 1)| test_user2@example.com | Testing Alerts and Notifications|

    Scenario: D.102.200 Send emails when a record is saved on a specific form/survey with Complete Status Only.
        Given I click on the link labeled "Alerts & Notifications"
        When I click on the link labeled "Edit"
        And I should see "Title of this alert: Email Alert"
        And I should see the dropdown field labeled "Trigger the alert... when" with the option "Data Types (Event 1 (Arm 1: Arm 1))" selected
        And I select "is saved with Complete status only" on the dropdown field labeled "Trigger the alert..when"
        And I should see "Email From: test_user@example,com"
        And I should see "Email To: [event_1_arm_1][email_v2] “Email(Event 1 (Arm 1: Arm 1))"
        And I should see "Subject Testing Alerts and Notifications" 
        And I should see "Message: Alerts and Notifications"
        And I click on the button labeled "Save" in the dialog box
        And I should see "Success! Alert was updated"
        And I should see "Alert #1:Email Alert"
        And I should see "When the instrument Data Types (Event 1 (Arm 1: Arm 1)) is saved and has a Complete status."

        And I click on the link labeled "Add / Edit Records"
        And I click on the button labeled "+ Add new record for the arm selected above"
        And I should see "NEW Record ID 2"
        And I click on the instrument labeled "Text Validation" 
        And I enter "test_user3@example.com" into the input field labeled "Email"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 2 successfully added"
        And I click on the instrument labeled "Data Types"
        And I enter "Thomas Stone" into the input field labeled "Name"
        And I enter "3" into the input field labeled "Required"
        And I click on the button labeled "Save & Exit Form" 
        And I should see "Record ID 2 successfully edited" 

        ##VERIFY: Sent email in MailHog 
        Given I open Email
        Then I should NOT see "an email sent to test_user3@example.com"

        Given I click on the link labeled "Alerts & Notifications"
        When I click on the link labeled "Notification Log"
        And I click on the button labeled "View past notifications"
        And I should NOT see "The email notification sent for Record: 2"

        And I click on the link labeled "Record Status Dashboard"
        And I click on the instrument labeled "Data Types for Record ID 2" 
        And I select "Complete" on the dropdown field labeled "Complete?"  
        And I click on the button labeled "Save & Exit Form"

        Given I click on the link labeled "Alerts & Notifications"
        When I click on the link labeled "Notification Log"
        And I click on the button labeled "View past notifications"
        And I should see a table header and rows containing the following values in the a table:
            |  Notification send time|  Alert  |   View Notification   |   Record                     |  Recipient             | Subject                         | 
            |  MM/DD/YYYY HH:MM      |  #1(A-5)|      ""               | 1(#) - Event 1 (Arm 1: Arm 1)| test_user2@example.com | Testing Alerts and Notifications|
            |  MM/DD/YYYY HH:MM      |  #1(A-5)|      ""               | 2(#) - Event 1 (Arm 1: Arm 1)| test_user3@example.com | Testing Alerts and Notifications|

       ##VERIFY: Sent email in MailHog 
        Given I open Email
        When I click on the link labeled "Testing Alerts and Notifications"
        Then I should see "From	test_user@example.com"
        And I should see "To test_user3@example.com"
        And I should see "Alerts and Notifications"

    Scenario: D.102.300 Send emails If conditional logic is TRUE when a record is saved on a specific form/survey.
        Given I click on the link labeled "Designer"
        And I click on the instrument labeled "Data Types"
        And I click on the button labeled "edit icon" for the row labeled "Text Box"
        And I click on the input element labeled "Action Tags / Field Annotation (optional)"
        And I enter "@CALCTEXT(if([ptname] != '', 'Pass', 'Fail'))" into the textarea field labeled "Logic Editor" 
        And I click on the button labeled "Update & Close Editor"
        And I click on the button labeled "Save"
        And I click on the link labeled "Alerts & Notifications"
        And I click on the link labeled "Edit icon"
        And I select the radio option "If conditional logic is TRUE when a record is saved on a specific form/survey*" for the field labeled "How will this alert be triggered?"
        And I should see the dropdown field labeled "Trigger the alert... when" with the option "Data Types (Event 1 (Arm 1: Arm 1))" selected
        And I should see the dropdown field labeled "Email To" with the option "[event_1_arm_1][email_v2] “Email(Event 1 (Arm 1: Arm 1))" selected
        And I select "is saved with any form status" on the dropdown field labeled "Trigger the alert..when"
        And I click on the input element labeled "while the following logic is true:"
        And I enter "[textbox]='Pass'" into the textarea field labeled "Logic Editor" 
        And I click on the button labeled "Update & Close Editor"
        And I check the checkbox labeled "Ensure logic is still true before sending notification?"
        And I click on the button labeled "Save"
        And I should see "Success! The alert was updated"
        And I should see "If the following logic is TRUE when the instrument Data Types (Event 1 (Arm 1: Arm 1)) is saved and has any form status: [textbox]='Pass'"
        And I click on the link labeled "Add / Edit Records"
        And I click on the button labeled "+ Add new record for the arm selected above"
        And I should see "NEW Record ID 3"
        And I click on the instrument labeled "Text Validation"
        And I enter "test_user4@example.com" into the input field labeled "Email"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 3 successfully added"
        And I click on the instrument labeled "Data Types"
        And I should see "Fail" in the data entry form field "Text Box"
        And I enter "User4" into the input field labeled "Name"
        And I should see "Pass" in the data entry form field "Text Box"
        And I enter "4" into the input field labeled "Required"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 3 successfully edited"

       ##VERIFY: Sent email in MailHog 
        Given I open Email
        When I click on the link labeled "Testing Alerts and Notifications"
        Then I should see "From	test_user@example.com"
        And I should see "To test_user4@example.com"
        And I should see "Alerts and Notifications"

        Given I click on the link labeled "Alerts & Notifications"
        When I click on the link labeled "Notification Log"
        And I click on the button labeled "View past notifications"
        And I should see a table header and rows containing the following values in the a table:
            |  Notification send time|  Alert  |   View Notification   |   Record                     |  Recipient             | Subject                         | 
            |  MM/DD/YYYY HH:MM      |  #1(A-5)|      ""               | 1(#) - Event 1 (Arm 1: Arm 1)| test_user2@example.com | Testing Alerts and Notifications|
            |  MM/DD/YYYY HH:MM      |  #1(A-5)|      ""               | 2(#) - Event 1 (Arm 1: Arm 1)| test_user3@example.com | Testing Alerts and Notifications|
            |  MM/DD/YYYY HH:MM      |  #1(A-5)|      ""               | 3(#) - Event 1 (Arm 1: Arm 1)| test_user4@example.com | Testing Alerts and Notifications|

        And I click on the link labeled "Add / Edit Records"
        And I click on the button labeled "+ Add new record for the arm selected above"
        And I should see "NEW Record ID 4"
        And I click on the instrument labeled "Text Validation"
        And I enter "test_user5@example.com" into the input field labeled "Email"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 4 successfully added"
        And I click on the instrument labeled "Data Types"
        And I should see "Fail" in the data entry form field "Text Box"
        And I enter "5" into the input field labeled "Required"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 4 successfully edited"

       ##VERIFY: Sent email in MailHog 
        Given I open Email
        Then I should NOT see "an email sent to test_user5@example.com"

        Given I click on the link labeled "Alerts & Notifications"
        When I click on the link labeled "Notification Log"
        And I click on the button labeled "View past notifications"
        And I should NOT see "The email notification sent for Record: 4"
     

    Scenario: D.102.400 Send emails When conditional logic is TRUE during a data import, data entry, or as the result of time-based logic.
        Given I click on the link labeled "Alerts & Notifications"
        When I click on the link labeled "Edit"
        And I select the radio option "When conditional logic is TRUE during a data import, data entry, or as the result of time-based logic" for the field labeled "How will this alert be triggered?"
        And I should see "[textbox]='Pass'" in the data entry form field "while the following logic is true:" 
        And I should see a checkbox labeled "Ensure logic is still true before sending notification?" that is unchecked
        And I click on the button labeled "Save"
        And I should see "Success! The alert was updated"
        And I click on the link labeled "Add / Edit Records"
        And I click on the button labeled "+ Add new record for the arm selected above"
        And I should see "NEW Record ID 5"
        And I click on the instrument labeled "Text Validation"
        And I enter "test_user6@example.com" into the input field labeled "Email"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 5 successfully added"
        And I click on the instrument labeled "Data Types"
        And I should see "Fail" in the data entry form field "Text Box" 
        And I enter "User6" into the input field labeled "Name"
        And I should see "Pass" in the data entry form field "Text Box"
        And I enter "6" into the input field labeled "Required"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 5 successfully edited"

      ##VERIFY: Sent email in MailHog 
        Given I open Email
        When I click on the link labeled "Testing Alerts and Notifications"
        Then I should see "From	test_user@example.com"
        And I should see "To test_user6@example.com"
        And I should see "Alerts and Notifications"

        Given I click on the link labeled "Alerts & Notifications"
        When I click on the link labeled "Notification Log"
        And I click on the button labeled "View past notifications"
        And I should see a table header and rows containing the following values in the a table:
            |  Notification send time|  Alert  |   View Notification   |   Record                     |  Recipient             | Subject                         | 
            |  MM/DD/YYYY HH:MM      |  #1(A-5)|      ""               | 1(#) - Event 1 (Arm 1: Arm 1)| test_user2@example.com | Testing Alerts and Notifications|
            |  MM/DD/YYYY HH:MM      |  #1(A-5)|      ""               | 2(#) - Event 1 (Arm 1: Arm 1)| test_user3@example.com | Testing Alerts and Notifications|
            |  MM/DD/YYYY HH:MM      |  #1(A-5)|      ""               | 3(#) - Event 1 (Arm 1: Arm 1)| test_user4@example.com | Testing Alerts and Notifications|
            |  MM/DD/YYYY HH:MM      |  #1(A-5)|      ""               | 4(#) - Event 1 (Arm 1: Arm 1)| test_user6@example.com | Testing Alerts and Notifications|
        And I click on the link labeled "Add / Edit Records"
        And I click on the button labeled "+ Add new record for the arm selected above"
        And I should see "NEW Record ID 6"
        And I click on the instrument labeled "Text Validation"
        And I enter "test_user7@example.com" into the input field labeled "Email"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 6 successfully added"
        And I click on the instrument labeled "Data Types"
        And I should see "Fail" in the data entry form field "Text Box" 
        And I enter "7" into the input field labeled "Required"
        And I click on the button labeled "Save & Exit Form"
        And I should see "Record ID 6 successfully edited"
        ##VERIFY: Sent email in MailHog 
        Given I open Email
        Then I should NOT see "an email sent to test_user7@example.com"

        Given I click on the link labeled "Alerts & Notifications"
        When I click on the link labeled "Notification Log"
        And I click on the button labeled "View past notifications"
        And I should NOT see "The email notification sent for Record: 6"

        ##ACTION: Deactivate alert
        Given I click on the link labeled "Alerts & Notifications"
        When I click on the link labeled "Options"
        And I should see "Are you sure you want to deactivate this Alert? It can be re-enabled later, if needed."
        And I click on the button labeled "Deactivate"
        And I should see "Success! The alert was deactivated"
        And I should see "No matching records found"

        ##ACTION: Logging Table
        Given I click on the link labeled "Logging"
        Then I should see a table header and rows containing the following values in the logging table:
         |  Time / Date     |   Username  |      Action                                 |  List of Data Changes OR Fields Exported                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |  
         | MM/DD/YYYY HH:MM |  test_user  | Manage/Design Deactivate alert              | Alert #1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
         | MM/DD/YYYY HH:MM |  test_user  | Update record 7 (Event 1 (Arm 1: Arm 1))    | textbox = 'Fail', required = '7', calculated_field = '6', data_types_complete = '0'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
         | MM/DD/YYYY HH:MM |  test_user  | Create record 7 (Event 1 (Arm 1: Arm 1))    | email_v2 = 'test_user7@example.com', text_validation_complete = '0', record_id = '7'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |  
         | MM/DD/YYYY HH:MM |  test_user  | Sent alert Record 6 (Event 1 (Arm 1: Arm 1))| Alert #1, From: 'test_user@example.com', To: 'test_user7@example.com', Subject: 'Testing Alerts and Notifications', Message: 'Alert and Notification'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |  
         | MM/DD/YYYY HH:MM |  test_user  | Update record 6 (Event 1 (Arm 1: Arm 1))    | ptname = 'User7', textbox = 'Pass', required = '7', calculated_field = '6', data_types_complete = '0'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |  
         | MM/DD/YYYY HH:MM |  test_user  | Create record 6 (Event 1 (Arm 1: Arm 1))    | email_v2 = 'test_user7@example.com', text_validation_complete = '0', record_id = '6                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |  
         | MM/DD/YYYY HH:MM |  test_user  | Manage/Design Modify alert                  | Alert #1, alert_title = 'Email Alert ', alert_type = 'EMAIL', alert_stop_type = 'RECORD', alert_expiration = '', form_name = 'data_types', form_name_event = 'event_1_arm_1', alert_condition = '[textbox]='Pass'', ensure_logic_still_true = 'yes', prevent_piping_identifiers = 'yes', trigger_on_instrument_save_status = 'complete_status_only', email_from = 'test_user@example.com', email_from_display = '', email_to = '[event_1_arm_1][email_v2]', phone_number_to = '', email_cc = '', email_bcc = '', email_subject = 'Testing Alerts and Notifications', alert_message = 'Alert and Notification', email_failed = '', email_attachment_variable = '', email_attachment1 = '', email_attachment2 = '', email_attachment3 = '', email_attachment4 = '', email_attachment5 = '', trigger_on_every_instrument_save = 'no', email_repetitive_change = '0', email_repetitive_change_calcs = '0', cron_send_email_on = 'now', cron_send_email_on_date = '', cron_send_email_on_time_lag_days = '', cron_send_email_on_time_lag_hours = '', cron_send_email_on_time_lag_minutes = '', cron_send_email_on_field = '', cron_send_email_on_field_after = 'after', cron_send_email_on_next_day_type = 'DAY', cron_send_email_on_next_time = '', cron_repeat_for = '0', cron_repeat_for_units = 'DAYS', cron_repeat_for_max = '', alert_order = '', sendgrid_template_id = '', sendgrid_template_data = '{}', sendgrid_mail_send_configuration = '{}'|  
         | MM/DD/YYYY HH:MM |  test_user  | Sent alert Record 5 (Event 1 (Arm 1: Arm 1))| Alert #1, From: 'test_user@example.com', To: 'test_user6@example.com', Subject: 'Testing Alerts and Notifications', Message: 'Alert and Notification'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |  
         | MM/DD/YYYY HH:MM |  test_user  | Update record 5 (Event 1 (Arm 1: Arm 1))    | ptname = 'User6', textbox = 'Pass', required = '6', calculated_field = '6', data_types_complete = '0'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
         | MM/DD/YYYY HH:MM |  test_user  | Create record 5 (Event 1 (Arm 1: Arm 1))    | email_v2 = 'test_user6@example.com', text_validation_complete = '0', record_id = '5'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
         | MM/DD/YYYY HH:MM |  test_user  | Manage/Design Modify alert                  | Alert #1, alert_title = 'Email Alert ', alert_type = 'EMAIL', alert_stop_type = 'RECORD', alert_expiration = '', form_name = 'data_types', form_name_event = 'event_1_arm_1', alert_condition = '[textbox]='Pass'', ensure_logic_still_true = 'yes', prevent_piping_identifiers = 'yes', trigger_on_instrument_save_status = 'complete_status_only', email_from = 'test_user@example.com', email_from_display = '', email_to = '[event_1_arm_1][email_v2]', phone_number_to = '', email_cc = '', email_bcc = '', email_subject = 'Testing Alerts and Notifications', alert_message = 'Alert and Notification', email_failed = '', email_attachment_variable = '', email_attachment1 = '', email_attachment2 = '', email_attachment3 = '', email_attachment4 = '', email_attachment5 = '', trigger_on_every_instrument_save = 'no', email_repetitive_change = '0', email_repetitive_change_calcs = '0', cron_send_email_on = 'now', cron_send_email_on_date = '', cron_send_email_on_time_lag_days = '', cron_send_email_on_time_lag_hours = '', cron_send_email_on_time_lag_minutes = '', cron_send_email_on_field = '', cron_send_email_on_field_after = 'after', cron_send_email_on_next_day_type = 'DAY', cron_send_email_on_next_time = '', cron_repeat_for = '0', cron_repeat_for_units = 'DAYS', cron_repeat_for_max = '', alert_order = '', sendgrid_template_id = '', sendgrid_template_data = '{}', sendgrid_mail_send_configuration = '{}'|
         | MM/DD/YYYY HH:MM |  test_user  | Manage/Design Modify alert                  | Alert #1, alert_title = 'Email Alert ', alert_type = 'EMAIL', alert_stop_type = 'RECORD', alert_expiration = '', form_name = 'data_types', form_name_event = 'event_1_arm_1', alert_condition = '[textbox]='Pass'', ensure_logic_still_true = 'yes', prevent_piping_identifiers = 'yes', trigger_on_instrument_save_status = 'complete_status_only', email_from = 'test_user@example.com', email_from_display = '', email_to = '[event_1_arm_1][email_v2]', phone_number_to = '', email_cc = '', email_bcc = '', email_subject = 'Testing Alerts and Notifications', alert_message = 'Alert and Notification', email_failed = '', email_attachment_variable = '', email_attachment1 = '', email_attachment2 = '', email_attachment3 = '', email_attachment4 = '', email_attachment5 = '', trigger_on_every_instrument_save = 'no', email_repetitive_change = '0', email_repetitive_change_calcs = '0', cron_send_email_on = 'now', cron_send_email_on_date = '', cron_send_email_on_time_lag_days = '', cron_send_email_on_time_lag_hours = '', cron_send_email_on_time_lag_minutes = '', cron_send_email_on_field = '', cron_send_email_on_field_after = 'after', cron_send_email_on_next_day_type = 'DAY', cron_send_email_on_next_time = '', cron_repeat_for = '0', cron_repeat_for_units = 'DAYS', cron_repeat_for_max = '', alert_order = '', sendgrid_template_id = '', sendgrid_template_data = '{}', sendgrid_mail_send_configuration = '{}'|
         | MM/DD/YYYY HH:MM |  test_user  | Sent alert Record 4 (Event 1 (Arm 1: Arm 1))| Alert #1, From: 'test_user@example.com', To: 'test_user5@example.com', Subject: 'Testing Alerts and Notifications', Message: 'Alert and Notification'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                        
         | MM/DD/YYYY HH:MM |  test_user  | Update record 4 (Event 1 (Arm 1: Arm 1))    | ptname = 'User5', textbox = 'Fail', required = '5', calculated_field = '6', data_types_complete = '0'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | 
         | MM/DD/YYYY HH:MM |  test_user  | Create Record 4 (Event 1 (Arm 1: Arm 1))    | email_v2 = 'test_user5@example.com', text_validation_complete = '0', record_id = '4'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | 
         | MM/DD/YYYY HH:MM |  test_user  | Sent alert Record 3 (Event 1 (Arm 1: Arm 1))| Alert #1, From: 'test_user@example.com', To: 'test_user4@example.com', Subject: 'Testing Alerts and Notifications', Message: 'Alert and Notification'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | 
         | MM/DD/YYYY HH:MM |  test_user  | Update record 3 (Event 1 (Arm 1: Arm 1))    | ptname = 'User4', textbox = 'Pass', required = '4', calculated_field = '6', data_types_complete = '0'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | 
         | MM/DD/YYYY HH:MM |  test_user  | Create record 3 Modify alert                | email_v2 = 'test_user4@example.com', text_validation_complete = '0', record_id = '3'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | 
         | MM/DD/YYYY HH:MM |  test_user  | Manage/Design Modify alert                  | Alert #1, alert_title = 'Email Alert ', alert_type = 'EMAIL', alert_stop_type = 'RECORD', alert_expiration = '', form_name = 'data_types', form_name_event = 'event_1_arm_1', alert_condition = '[textbox]='Pass'', ensure_logic_still_true = 'yes', prevent_piping_identifiers = 'yes', trigger_on_instrument_save_status = 'complete_status_only', email_from = 'test_user@example.com', email_from_display = '', email_to = '[event_1_arm_1][email_v2]', phone_number_to = '', email_cc = '', email_bcc = '', email_subject = 'Testing Alerts and Notifications', alert_message = 'Alert and Notification', email_failed = '', email_attachment_variable = '', email_attachment1 = '', email_attachment2 = '', email_attachment3 = '', email_attachment4 = '', email_attachment5 = '', trigger_on_every_instrument_save = 'no', email_repetitive_change = '0', email_repetitive_change_calcs = '0', cron_send_email_on = 'now', cron_send_email_on_date = '', cron_send_email_on_time_lag_days = '', cron_send_email_on_time_lag_hours = '', cron_send_email_on_time_lag_minutes = '', cron_send_email_on_field = '', cron_send_email_on_field_after = 'after', cron_send_email_on_next_day_type = 'DAY', cron_send_email_on_next_time = '', cron_repeat_for = '0', cron_repeat_for_units = 'DAYS', cron_repeat_for_max = '', alert_order = '', sendgrid_template_id = '', sendgrid_template_data = '{}', sendgrid_mail_send_configuration = '{}'| 
         
        And I logout
