Feature: e-Consent

  As a REDCap end user
  I want to see that Record Locking and E-Signatures is functioning as expected

  Scenario: 1 - Create 24_econsent_v1115
    Given I am a "standard" user who logs into REDCap
    And I create a project named "24_econsent_v1115" with project purpose Operational Support via CDISC XML import from fixture location "cdisc_files/core/07_DesignForms_v1115.xml"
    And I enable surveys for the project
    Then I click on the link labeled "Dictionary"
    And I upload the data dictionary located at "core/24_eConsent_DD.csv"
    And I click on the link labeled "Project Setup"
    And I click on the button labeled "Define My Events"
    And I click on the link labeled "Arm 2:"
    And I click on the link labeled "Delete Arm 2"
    Then I should see "DELETE ARM 2? Deleting Arm 2 will also delete ALL events associated with Arm 2. Are you sure you wish to do this?" in an alert box
    And I click on the link labeled "Arm 1:"
    And I delete the Event Name of "Event Three"
    Then I click on the link labeled "Designate Instruments for My Events"
    And I enable the Data Collection Instrument named "Consent" for the Event named "Event 1"
    And I enable the Data Collection Instrument named "Text" for the Event named "Event 1"
    
  Scenario: 2 - Enable survey
    Given I click on the link labeled "Designer" 
    Then I should see "Data Collection Instruments"
    # Make fname as required
    And I click on the table cell containing a link labeled "Consent"
    And the AJAX "GET" request at "Design/edit_field_prefill.php*" tagged by "edit" is being monitored
    And I click on the Edit image for the field named "First name"
    And the AJAX request tagged by "edit" has completed
    And I click on the element identified by "input[id=field_req1]"
    Then I click on the button labeled "Save"
    Then I click on the link labeled "Designer" 
    And I should see "Data Collection Instruments"
    And I click on the button labeled "Enable" for the instrument named "Consent"
    # And I should see the instrument labeled "Consent" is a survey

  Scenario: 3 - Choose Auto-Archiver + e-Consent Framework 
    Then I click on the element identified by "input[name=pdf_auto_archive][value=2]"

  Scenario: 4 - Select options for e-consent
    Then I should see the checkbox identified by "input[id=pdf_econsent_allow_edit]", checked
    And I enter "V1.0" into the field identified by "input[name=pdf_econsent_version]"
    And I select 'fname "First name"' from the dropdown identified by "[name=pdf_econsent_firstname_field]"
    And I select 'lname "Last name"' from the dropdown identified by "[name=pdf_econsent_lastname_field]"
    And I enter "Adult" into the field identified by "input[name=pdf_econsent_type]"
    And I select 'dob "DOB"' from the dropdown identified by "[name=pdf_econsent_dob_field]"
    And I select 'fname "First name"' from the dropdown identified by "[name=pdf_econsent_signature_field1]"
    Then I click on the button labeled "Save Changes"

  Scenario: 5 - Open Public Survey Consent
    Given I click on the link labeled "Survey Distribution Tools"
    And I should see "Public Survey Link"
    And I click on the link labeled "Public Survey Link"
    Then I should see "Using a public survey link is the simplest and fastest way to collect responses for your survey"
    And I visit the public survey URL for this project
    Then I should see "Consent"
    And I should see "Please complete the survey below."
    Then I enter "lname" into the field identified by "input[name=lname]" 
    And I enter "fname" into the field identified by "input[name=fname]"
    And I enter "11-12-2001" into the field identified by "input[name=dob]"

  Scenario: 6 - Click Next Page
    Then I click on the button labeled "Next Page" on the survey
    And I should see "I certify that all of my information in the document above is correct. I understand that clicking 'Submit' will electronically sign the form and that signing this form electronically is the equivalent of signing a physical document."

  Scenario: 7 - Click Previous Page and erase signature
    Then I click on the button labeled "Previous Page" on the survey
    And I should see "You have provided your signature on an earlier page in this survey. This may include typing your name, a PIN, and/or signing your signature. You are allowed to return to a previous page in the survey, but if you do so, please be advised that your signature(s) will be automatically removed, after which you will need to provide it again before you can complete the survey. You will also be able to modify any of your existing responses to the questions in this survey. If this is okay, you may proceed to an earlier page in the survey by clicking the button below."
    Then I click on the button labeled "Erase my signature(s) and go to earlier page"

  Scenario: 8 - Re-enter fields
    Then I enter "F Name" into the field identified by "input[name=fname]"
    And I clear the field and enter "L Name" into the "lname" text input field
    
   Scenario: 9 - Click Next Page Again
    Then I click on the button labeled "Next Page" on the survey
    And I should see "I certify that all of my information in the document above is correct. I understand that clicking 'Submit' will electronically sign the form and that signing this form electronically is the equivalent of signing a physical document."

  Scenario: 10 - Check Data
    # Then I should see "F Name"
    # And I should see "L Name"

  Scenario: 11 - Check checkbox
    Then I check the checkbox identified by "input[id=econsent_confirm_checkbox]"

  Scenario: 12 - Submit the survey
    When I click on the button labeled "Submit" on the survey
    Then I should see "Thank you for taking the survey."
    And I should see "Have a nice day!"
    When I click on the button labeled "Close survey" on the survey

  Scenario: 13 - Check File Repository
    Given I am a "standard" user who logs into REDCap
    Then I should see "New Project"
    And I click on the link labeled "My Projects"
    Then I should see "Project Title" 
    And the AJAX "GET" request at "ProjectSetup/index.php*" tagged by "projsetup" is being monitored
    And I click on the link labeled "24_econsent_v1115"
    And the AJAX request tagged by "projsetup" has completed
    Then I click on the link labeled "File Repository"
    And I should see "PDF Survey Archive"

  Scenario: 14 - Check PDF Survey Archive
    When I click on the link labeled "PDF Survey Archive"
    Then I should see "Name"
    Then I should see "Record"
    And I should see "Survey"
    And I should see "Survey Completion Time"
    And I should see "Identifier (Name, DOB)"
    And I should see "IP Address"
    And I should see "Version"
    And I should see "Type"
    And I should see "Size"
    And I should see a button labeled "Download all (zip)"
    And I should see "F_Name_L_Name_2001-11-12" in the column labeled "Name" in PDF Survey Archive
    And I should see "2" in the column labeled "Record" in PDF Survey Archive
    And I should see "Consent" in the column labeled "Survey" in PDF Survey Archive
    And I should see "today's date" in the column labeled "Survey Completion Time" in PDF Survey Archive
    And I should see "F Name L Name, 2001-11-12" in the column labeled "Identifier (Name, DOB)" in PDF Survey Archive
    And I should see "V1.0" in the column labeled "Version" in PDF Survey Archive
    And I should see "e-Consent" in the column labeled "Type" in PDF Survey Archive
    And I should see "Adult" in the column labeled "Type" in PDF Survey Archive

  Scenario: 15 - Download PDF file
    Then I download the file by clicking the link starting with "F_Name_L_Name" and save the file as "F_Name_L_Name"

  Scenario: 16 - Check data in PDF file
    And I should have a pdf file "F_Name_L_Name" that contains the data "F Name"
    And I should have a pdf file "F_Name_L_Name" that contains the data "L Name"
    And I should have a pdf file "F_Name_L_Name" that contains the data "11-12-2001"
    And I wait for 3 seconds

  Scenario: 17 - Disable e-consent framework
    Given the AJAX "GET" request at "Design/online_designer.php*" tagged by "render" is being monitored
    And I click on the link labeled "Designer"
    And I should see "Data Collection Instruments"
    And the AJAX "GET" request at "Surveys/edit_info.php*" tagged by "edit" is being monitored
    When I click on the button labeled "Survey settings"
    Then I should see "Modify survey settings for data collection instrument"
    Then I click on the element identified by "input[name=pdf_auto_archive][value=0]"
    And the AJAX "GET" request at "Design/online_designer.php*" tagged by "edit" is being monitored
    And I click on the button labeled "Save Changes"

  Scenario: 18 - Open Public Survey Consent and complete it
    Given I click on the link labeled "Survey Distribution Tools"
    And I should see "Public Survey Link"
    And I click on the link labeled "Public Survey Link"
    Then I should see "Using a public survey link is the simplest and fastest way to collect responses for your survey"
    And I visit the public survey URL for this project
    Then I should see "Consent"
    And I should see "Please complete the survey below."
    Then I enter "LastName" into the field identified by "input[name=lname]" 
    And I enter "FirstName" into the field identified by "input[name=fname]"
    And I enter "12-21-2011" into the field identified by "input[name=dob]"

  Scenario: 19 - Submit survey
    Then I click on the button labeled "Submit" on the survey

   Scenario: 20 - Archive not available in File Repository 
    Given I am a "standard" user who logs into REDCap
    Then I should see "New Project"
    And I click on the link labeled "My Projects"
    Then I should see "Project Title" 
    And the AJAX "GET" request at "ProjectSetup/index.php*" tagged by "projsetup" is being monitored
    And I click on the link labeled "24_econsent_v1115"
    And the AJAX request tagged by "projsetup" has completed
    Then I click on the link labeled "File Repository"
    And I should see "PDF Survey Archive"
    When I click on the link labeled "PDF Survey Archive"
    Then I should see "Name"
    And I should see "F_Name_L_Name_2001-11-12"
    And I should NOT see "FirstName_LastName_2011_12-21"
    