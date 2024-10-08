Feature: Send It: The system shall support the ability to send a file to user/users.

  As a REDCap end user
  I want to see that Send It is functioning as expected


  Scenario: D.105.100 Send a file to user
    Given I login to REDCap with the user "Test_user" 
    And I should see "Send-It"
    And I should see "From: test_user@example.com"
    And I enter "joe@abc.com" into the input field labeled "To"
    And I enter "Send-it file" into the input field labeled "Email subject"
    And I enter "Send-it csv file" into the input field labeled "Email message"
    And I select "2 days" on the dropdown field labeled "Expiration"
    And I should see "Select a file:"
    When I click on the button labeled "Choose File"
    And I should see "the file labeled D.118.100_Data_Import.csv"
    And I click on the button labeled "Open"
    And I upload a "D.118.100_Data_Import.csv" 
    And I check the checkbox labeled "Receive Confirmation?"
    And I click on the button labeled "Send It!"
    Then I should see "File successfully uploaded!"
    #The file will expire and become inaccessible on the 2nd Day, Date, HH:MM. Recipients: joe@abc.com

    ##VERIFY: Sent email in MailHog for joe@abc.com
    Given I open Email
    When I click on the link labeled "Re: [REDCap Send-It] Send-it file"
    And I should see "To: joe@abc.com
    Then I should see "Below is the password for downloading the file mentioned in the previous email."
    # The password seen should be copied.
    Given I open the second Email
    When I click on the link labeled "Inbox"
    And I click on the link labeled "[REDCap Send-It] Send-it file"
    When I click on the link containing "SendItController"
    Then I should see "Send-It: File Download"
    And I enter "the password" into the input field labeled "Enter password"
    And I click on the button labeled "Download File"
    And I should see "SUCCESS! The file will begin downloading momentarily."
    # The file is download on the system and accessible until the 2nd day the file was sent.
    And I logout

    #FUNCTIONAL_REQUIREMENT
    ##ACTION:Send a file to users
    Given I login to REDCap with the user "Test_user" 
    And I should see "Send-It"
    And I should see "From: test_user@example.com"
    And I enter "dave@abc.com, paul@abc.com" into the input field labeled "To"
    And I enter "Send-it file2" into the input field labeled "Email subject"
    And I enter "Send-it csv file" into the input field labeled "Email message"
    And I select "2 days" on the dropdown field labeled "Expiration"
    And I should see "Select a file:"
    When I click on the button labeled "Choose File"
    And I should see "the file labeled D.118.100_Data_Import.csv"
    And I click on the button labeled "Open"
    And I upload a "D.118.100_Data_Import.csv" 
    And I check the checkbox labeled "Receive Confirmation?"
    And I click on the button labeled "Send It!"
    Then I should see "File successfully uploaded!"
    #The file will expire and become inaccessible on the 2nd Day, Date, HH:MM. Recipients: dave@abc.com, paul@abc.com

    ##VERIFY: Sent email in MailHog for dave@abc.com
    Given I open Email
    When I click on the link labeled "Re: [REDCap Send-It] Send-it file2"
    And I should see "To: dave@abc.com"
    Then I should see "Below is the password for downloading the file mentioned in the previous email."
    # The password seen should be copied.
    Given I open the second Email
    When I click on the link labeled "Inbox"
    And I click on the link labeled "[REDCap Send-It] Send-it file2"
    When I click on the link containing "SendItController"
    Then I should see "Send-It: File Download"
    And I enter "the password" into the input field labeled "Enter password"
    And I click on the button labeled "Download File"
    And I should see "SUCCESS! The file will begin downloading momentarily."
    # The file is download on the system and accessible until the 2nd day the file was sent.

    ##VERIFY: Sent email in MailHog for paul@abc.com
    Given I open Email
    When I click on the link labeled "Re: [REDCap Send-It] Send-it file2"
    And I should see "To: paul@abc.com"
    Then I should see "Below is the password for downloading the file mentioned in the previous email."
    # The password seen should be copied.
    Given I open the second Email
    When I click on the link labeled "Inbox"
    And I click on the link labeled "[REDCap Send-It] Send-it file2"
    When I click on the link containing "SendItController"
    Then I should see "Send-It: File Download"
    And I enter "the password" into the input field labeled "Enter password"
    And I click on the button labeled "Download File"
    And I should see "SUCCESS! The file will begin downloading momentarily."
    # The file is download on the system and accessible until the 2nd day the file was sent.

  Scenario: D.105.200 Received Confirmation
    ##VERIFY: Sent email in MailHog 
    Given I open Email
    When I click on the link labeled "REDCap Send-It] Confirmation of file download"
    Then I should see "The file you uploaded, D118100_Data_Import.csv (Size), was downloaded by joe@abc.com on Day, Date HH:MM."

    ##VERIFY: Sent email in MailHog 
    Given I open Email
    When I click on the link labeled "REDCap Send-It] Confirmation of file download"
    Then I should see "The file you uploaded, D118100_Data_Import.csv (Size), was downloaded by dave@abc.com on Day, Date HH:MM."

    ##VERIFY: Sent email in MailHog 
    Given I open Email
    When I click on the link labeled "REDCap Send-It] Confirmation of file download"
    Then I should see "The file you uploaded, D118100_Data_Import.csv (Size), was downloaded by paul@abc.com on Day, Date HH:MM."
    And I logout

  Scenario: D.105.300 Expiration Time
    # After the expiration day
    ##VERIFY: Sent email in MailHog 
    Given I open Email
    When I click on the link labeled "[REDCap Send-It] Send-it file"
    Then I click on the link containing "SendItController"
    And I should see "The file has expired."

    ##VERIFY: Sent email in MailHog 
    When I click on the link labeled "Inbox"
    And I click on the link labeled "[REDCap Send-It] Send-it file2"
    When I click on the link containing "SendItController"
    And I should see "The file has expired."
        
    And I logout
      

    