Feature: Send It: The system shall support the ability to send a file to user/users.
    As a REDCap end user
    I want to see that Send It is functioning as expected

    Scenario: D.105.100 Send a file to user/users

        #SETUP
        Given I login to REDCap with the user "Test_user"
        And I click on the link labeled "Send-It"
        And I should see "From: test_user@example.com "
        And I select "associate another email to your account" on the dropdown field labeled "From"
        And I enter "thomas@abc.com" into the input field labeled "Enter new email:"
        And I enter "thomas@abc.com" into the input field labeled "Re-enter new email:"
        And I click on the button labeled "Add email"
        Then I should see "Verification email sent to thomas@abc.com"
        #Before this new email address can be utilized by your REDCap account, 
        #you will first need to confirm it by checking your email account thomas@abc.com for the verification email sent by REDCap, and follow its instructions. 
        #You will not be able to utilize this new email address in REDCap until this verification process has been completed. Thank you! Check your email account thomas@abc.com"
        And I click on the button labeled "Close"
        And I logout

        ##VERIFY: Sent email in MailHog 
        Given I open Email
        When I click on the link labeled "[REDCap] Verify your email address"
        Then I click on the link labeled "Click here to confirm your email address"
        And I should see "Email account verified"
        And I click on the button labeled "Access REDCap"

        And I should see "Logged in as test_user"
        And I click on the link labeled "Send-It"
        And I select "thomas@abc.com" on the dropdown field labeled "From"


        And I enter "joe@abc.com" into the input field labeled "To"
        And I enter "Send-it file" into the input field labeled "Email subject:"
        And I enter "Send-it csv file" into the input field labeled "Email message:"
        And I enter "1 day" into the input field labeled "Expiration:"
        And I should see "Select a file:"
        When I click on the button labeled "Choose File"
        And I should see "the file labeled D.118.100_Data_Import.csv"
        And I click on the button labeled "Open"
        And I click on the button labeled "Send It!"
        Then I should see "File successfully uploaded!"
        #The file will expire and become inaccessible on Day, Date, HH:MM. Recipients:joe@abc.com

        ##VERIFY: Sent email in MailHog 
        Given I open Email
        When I click on the link labeled "Re: [REDCap Send-It] Send-it file"
        Then I should see "Below is the password for downloading the file mentioned in the previous email. D844ELR9"
        Given I open the second Email
        When I click on the link labeled "https://localhost:8443/surveys/index.php?__passthru=index.php&route=SendItController%3Adownload&E508544F7F83ACEBC91E73F16"
        Then I should see "Send-It: File Download"
        And I enter "D844ELR9" into the input field labeled "Enter password:"
        And I click on the button labeled "Download File"
        And I should see "SUCCESS! The file will begin downloading momentarily."

        #FUNCTIONAL_REQUIREMENT
        ##ACTION:Send a file to users
        And I should see "Send-It"
        And I should see "SEND ANOTHER FILE?"
        And I should see "From: test_user@example.com"
        And I enter "dave@abc.com, paul@abc.com" into the input field labeled "To:"
        And I enter "Send-it file2" into the input field labeled "Email subject:"
        And I enter "Send-it csv file" into the input field labeled "Email message:"
        And I enter "1 day" into the input field labeled "Expiration:"
        And I should see "Select a file:"
        When I click on the button labeled "Choose File"
        And I should see "the file labeled D.118.100_Data_Import.csv"
        And I click on the button labeled "Open"
        And I check the checkbox labeled "Receive Confirmation?"
        And I click on the button labeled "Send It!"
        Then I should see "File successfully uploaded!"
        #The file will expire and become inaccessible on Day, Date, HH:MM. Recipients: dave@abc.com, paul@abc.com

        ##VERIFY: Sent email in MailHog for dave@abc.com
        Given I open Email
        When I click on the link labeled "Re: [REDCap Send-It] Send-it file2"
        And I should see "To: dave@abc.com"
        Then I should see "Below is the password for downloading the file mentioned in the previous email. EDNREN7P"
        Given I open the second Email
        When I click on the link labeled "https://localhost:8443/surveys/index.php?__passthru=index.php&route=SendItController%3Adownload&E6872CCB5D2860792A12C3AAA"
        Then I should see "Send-It: File Download"
        And I enter "EDNREN7P" into the input field labeled "Enter password:"
        And I click on the button labeled "Download File"
        And I should see "SUCCESS! The file will begin downloading momentarily."

        ##VERIFY: Sent email in MailHog for paul@abc.com
        Given I open Email
        When I click on the link labeled "Re: [REDCap Send-It] Send-it file2"
        And I should see "To: paul@abc.com"
        Then I should see "Below is the password for downloading the file mentioned in the previous email. HRMR8F9A"
        Given I open the second Email
        When I click on the link labeled "https://localhost:8443/surveys/index.php?__passthru=index.php&route=SendItController%3Adownload&ADB10FCF28F8CCEED9BB64A81"
        Then I should see "Send-It: File Download"
        And I enter "HRMR8F9A" into the input field labeled "Enter password:"
        And I click on the button labeled "Download File"
        And I should see "SUCCESS! The file will begin downloading momentarily."

        

    Scenario: D.105.200 Received Confirmation
    Scenario: D.105.300 Expiration Time
      ##VERIFY: Sent email in MailHog 
      Given I open Email
      When I click on the link labeled "REDCap Send-It] Confirmation of file download"
      Then I should see "The file you uploaded, D118100_Data_Import.csv (Size), was downloaded by dave@abc.com on Day, Date HH:MM."

      ##VERIFY: Sent email in MailHog 
      Given I open Email
      When I click on the link labeled "REDCap Send-It] Confirmation of file download"
      Then I should see "The file you uploaded, D118100_Data_Import.csv (Size), was downloaded by paul@abc.com on Day, Date HH:MM."
      
      And I logout

    