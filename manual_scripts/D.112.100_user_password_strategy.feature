Feature: User Password Strategy: The system shall support the ability to send password over emails when a user is created, or password is changed.

As a REDCap end user
I want to see that User Password Strategy is functioning as expected

Scenario: User Password Strategy (created, reset and changed)

#SETUP
Given I login to REDCap with the user "Test_Admin"   
And I click on the link labeled "Control Center"
And I click on the link labeled "Add User (Table-based Only)"
Then I should see "User Management for Table-based Authentication" 
When I enter "Test_User12345" into the input field labeled "Username:" 
And I enter "Test" into the input field labeled "First name:"
And I enter "User12345" into the input field labeled "Last name:"
And I enter "Test_User12345@example.com" into the input field labeled "Primary email:"
And I click on the button labeled "Save"
Then I should see "Test has been successfully saved."      
And I should see "An email with login information was sent to: test_user12345@example.com"   

##VERIFY_DE: Sent email in MailHog 
When I click on the link labeled "REDCap access granted"
Then I click on the link labeled "Set your new REDCap password"

#The remaining steps was checked in the live environment and it functions perfectly.

Then I enter "Testing123" into the data entry form field labeled "Password"
And I enter "Testing123" into the data entry form field labeled "Re-type password"
And I click on the button labeled "Submit"
And I logout

#FUNCTIONAL_REQUIREMENT
##ACTION: Change Password While Logged In
When I click on the button labeled "Profile"
Then I click on the button labeled "Reset password"
And I click on the button labeled "Reset" 
Then I enter "Testingpass123" into the data entry form field labeled "Password"
And I enter "Testingpass123" into the data entry form field labeled "Re-type password"
And I click on the button labeled "Submit"
And I logout

##VERIFY_DE: Testing New Password
When I enter "Test_User12345" into the data entry form field labeled "Username"
And I enter "Testingpass123" into the data entry form field labeled "Password"
And I click on the button labeled "Log In"
Then I should see "REDCap Home Page"
And I logout

##ACTION: Forgot Your Password
When I click on the link labeled "Forgot your password"
And I enter "test_user12345" into the data entry form field labeled "Username"
And I click on the button labeled "Send password reset email"
Then I click on the button labeled "Go back to login page"

##VERIFY_DE: Sent email in MailHog 
When I click on the link labeled "REDCap password reset"
Then I click on the link labeled "Set your new REDCap password"

And I enter "Testing1234" into the data entry form field labeled "Password"
And I enter "Testing1234" into the data entry form field labeled "Re-type password"
And I click on the button labeled "Submit"

##VERIFY_DE: Testing New Password
When I enter "Test_User12345" into the data entry form field labeled "Username"
And I enter "Testing1234" into the data entry form field labeled "Password"
And I click on the button labeled "Log In"
Then I should see "REDCap Home Page"
And I logout






   
    