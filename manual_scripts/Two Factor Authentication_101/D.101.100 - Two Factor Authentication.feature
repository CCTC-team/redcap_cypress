Feature: Two Factor Authentication: The system shall support enabling/disabling of Two-Factor Authentication.
    

    As a REDCap end user
    I want to see that Two Factor Authentication is functioning as expected

    Scenario: D.101.100 Enabling/Disabling of Two-Factor Authentication

        #SETUP
        Given I login to REDCap with the user "Test_User" 
        Then I should see "Welcome to REDCap"
        And I logout

        Given I login to REDCap with the user "Test_Admin"
        And I click on the link labeled "Control Center"
        And I click on the link labeled "Security & Authentication"
        Then I should see "Security & Authentication Configuration"
        And I should see the dropdown field labeled "Two-Factor Authentication" with the option "Disabled" selected 
        And I select "Enabled" on the dropdown field labeled "Two-Factor Authentication"
        And I should see the dropdown field labeled "Enforce two-factor authentication ONLY for Table-based users?" with the option "No, enforce on all users (Table-based and non-Table-based)" selected
        And I should see the dropdown field labeled "Authentication interval: Trust a device's two-factor login for X days?" with the option "1" selected
        Then I click on the button labeled "Save Changes"
        And I should see "Your system configuration values have now been changed!"
        And I logout

        
        
    Scenario: D.101.200 Wrong Authentication Code and Two-Factor Authentication for user login
        #FUNCTIONAL_REQUIREMENT
        ##ACTION: Wrong Authentication Code
        Given I login to REDCap with the user "Test_User" 
        When I click on the radio labeled "Email: Send an email containing your verification code to your email account." in the dialog box
        And I should see "Enter your verification code"
        And I enter "125593" into the input field labeled "Enter the verification code that you obtained from Email"
        Then I should see "Sorry, but you did not enter a valid verification code. Please try again."
        And I click on the button labeled "Close"

        
        ##ACTION: Using the Two-step Verification For REDCap login
        Given I login to REDCap with the user "Test_User" 
        Then I should see a checkbox labeled "Don't prompt me with two-step login on this computer for 24 hours" that is unchecked
        And I click on the radio labeled "Email: Send an email containing your verification code to your email account." in the dialog box
        Then I should see "Enter your verification code"

        ##VERIFY: Sent email in MailHog 
        Given I open Email
        And I click on the link labeled "REDCap 2-step login"
        Then I should see "REDCap Verification code"
        #Copy the code and Paste
        And I click on the button labeled "Submit"
        Then I should see "Success"
        And I should see "Welcome to REDCap"
        And I logout

        
        Given I login to REDCap with the user "Test_User" 
        And I check the checkbox labeled "Don't prompt me with two-step login on this computer for 24 hours"
        Then I click on the radio labeled "Email: Send an email containing your verification code to your email account." in the dialog box
        And I should see "Enter your verification code"

        ##VERIFY: Sent email in MailHog 
        Given I open Email
        And I click on the link labeled "REDCap 2-step login"
        Then I should see "REDCap Verification code"
        #Copy the code and Paste
        Then I click on the button labeled "Submit"
        And I should see "Success"
        And I should see "My Projects page"
        And I logout

        Given I login to REDCap with the user "Test_User" 
        #No verification code asked
        And I logout

        
        