Feature: D.115.100  Download PDF of Instruments

  As a REDCap end user
  I want to be able to download a PDF of instruments

  Scenario: The system shall support the ability to download the PDF of instruments
    Given I login to REDCap with the user "test_user1"
    Then I create a new project named "D.115.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val_.xml", and clicking the "Create Project" button
   
    Given I click on the link labeled "My Projects"
    And I click on the link labeled "D.115.100"
    And I click on the link labeled "Designer"
    And I click on the instrument labeled "Text Validation"
    And I click on the Edit image for the field named "Email"
    And I enter "email" into the input field labeled "Field Note"
    And I click on the button labeled "Save"
    And I click on the link labeled "Project Setup"
    When I click on the link labeled "Download PDF of all instruments"
    And I open the downloaded PDF?
    # sorry i couldnt find the correct one for the above but there probably is one for that.
    Then I should see the pdf has loaded in the iframe
    And I verify the PDF has the correct variables 
    # surely the above is almost impossible to do automatically? look at the list in the word document. 
    And I close the iframe window

    Given I click on the link labeled "Designer"
    When I click on the instrument labeled "Data Types"
    Then I delete the field named "Identifier" 
    # there are two fields called this, do i go for the variable name = identifier_2, or create a new definition for 'the lase field'
    And I delete the field named "Required" 
    And I delete the field named "Section Break" 
    And I delete the field named "Descriptive Text with File" 

    Given I click on the link labeled "Project Setup"
    When I click on the link labeled "Download PDF of all instruments"
    Then I should see a downloaded file named "D115100_YYYY-MM-DD_TTTT.pdf"
    And I open the downloaded PDF?
    # sorry i couldnt find the correct one for the above but there probably is one for that.
    And I should see the pdf has loaded in the iframe
    When I verify the PDF has the correct variables
    #verify the following Only one field called ‘Identifier’ is visible. ‘Descriptive Text with File’ and ‘Required’ 
    Then I should see the latest downloaded "PDF" file containing the headings below
      | | | | |
      #would something like this work ^

    #fields are not visible 
    
    Given I click on the link labeled "Project Setup"
    And I click on the button labeled "Designate Instruments for My Events"
    When I click on the button labeled "Begin Editing"
    And I enable the Data Collection Instrument named "Data Types" for the Event named "Event 2"
    And I click on the button labeled "Save"
    And I verify the Data Collection Instrument named "Data Types" is enabled for the Event named "Event 2"
    And I enable the Data Collection Instrument named "Data Types" for the Event named "Event Three"
    Then I click on the button labeled "Save"
    And I verify the Data Collection Instrument named "Data Types" is enabled for the Event named "Event Three"

    Given I click on the link labeled "Record Status Dashboard"
    When I locate the bubble for the "Data Types" instrument on event "Event 2" for record ID "1" and click on the bubble
    Then I enter "John" into the input field labeled "Name"
    And I click on the link labeled "Upload file"
    And I upload a "csv" format file located at "redcap_val_fixtures\csv\file1.csv", by clicking the button near "File Upload" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I click on the link labeled "Record Status Dashboard"
    When I locate the bubble for the "Data Types" instrument on event "Event 3" for record ID "1" and click on the bubble
    Then I enter "John" into the input field labeled "Joe"
    And I click on the link labeled "Upload file"
    And I upload a "csv" format file located at "redcap_val_fixtures\csv\file1.csv", by clicking the button near "File Upload" to browse for the file, and clicking the button labeled "Upload file" to upload the file
    And I select the radio option "Choice1" for the field labeled "Radio Button Auto"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    And I select "Download PDF of record data for all instruments/events" on the dropdown field labeled "Choose action for record"
    And I should see a downloaded file named "D115100_YYYY-MM-DD_TTTT.pdf"
    And I open the downloaded PDF?
    # sorry i couldnt find the correct one for the above but there probably is one for that.
    And I should see the pdf has loaded in the iframe
    When I verify the PDF has the correct variables 
    #verify the following Only one field called ‘Identifier’ is visible. ‘Descriptive Text with File’ and ‘Required’ 
    Then I should see the latest downloaded "PDF" file containing the headings below
      | | | | |
      #would something like this work? ^
    And I close the iframe window

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the link labeled "1"
    And I select "Download PDF of record data for all instruments/events (compact)" on the dropdown field labeled "Choose action for record"
    And I should see a downloaded file named "D115100_YYYY-MM-DD_TTTT.pdf"
    And I open the downloaded PDF?
    # sorry i couldnt find the correct one for the above but there probably is one for that.
    And I should see the pdf has loaded in the iframe
    When I verify the PDF has the correct variables
    Then I should see the latest downloaded "PDF" file containing the headings below
      | | | | |
      #would something like this work? ^
    And I close the iframe window

    Given I click on the link labeled "Record Status Dashboard"
    And I select "Download ZIP file of all uploaded documents" on the dropdown field labeled "Choose action for record"
    And I should see a downloaded file named "Files_D115100_2024-10-11_1226.zip"
    And I open the downloaded zip folder?
    When I unzip the folder 
    # sorry i couldnt find the correct one for the above but there probably is one for that.
    Then I verify the folder has the correct contents 
    #The document folder contains 2 files for record ID 1 (arm 1) - event 2 and event three  
    
    Given I click on the link labeled "Project Setup"
    And I click on the button labeled "Additional Customizations"
    When I check the checkbox labeled "PDF Customizations"
    And I enter "CRF Version 1" into the input field labeled "1)"
    And I select "Hide it" on the dropdown field labeled "3)"
    Then I click on the button labeled "Save"

   Given I click on the link labeled "Record Status Dashboard"
   And I click on the link labeled "1"
   And I select "Download PDF of record data for all instruments/events" on the dropdown field labeled "Choose action for record"
   And I should see a downloaded file named "D115100_YYYY-MM-DD_TTTT.pdf"
   And I open the downloaded PDF?
   # need to verify that ir says CRF Version 1 in the top left and that there is a redcap logo. 
   And I should see the pdf has loaded in the iframe
   When I verify the PDF has the correct variables
   Then I should see the latest downloaded "PDF" file containing the headings below
      | | | | |
    #would something like this work? ^
   And I close the iframe window


   Given I click on the link labeled "Project Setup"
   And I click on the button labeled "Additional Customizations"
   When I check the checkbox labeled "PDF Customizations"
   And I enter "CRF Version 1" into the input field labeled "1)"
   And I select the radio option "Hide REDCap logo/URL and instead display the following text:  Powered by REDCap" for the field labeled "2)"
   And I select "Keep it displayed" on the dropdown field labeled "3)"
   Then I click on the button labeled "Save"

   Given I click on the link labeled "Record Status Dashboard"
   And I click on the link labeled "1"
   And I select "Download PDF of record data for all instruments/events" on the dropdown field labeled "Choose action for record"
   And I should see a downloaded file named "D115100_YYYY-MM-DD_TTTT.pdf"
   And I open the downloaded PDF?
   # need to verify that CRF Version 2 is displayed at the top left hand corner; and Project name, Record ID and event name are
   # displayed at the top right hand corner of the PDF.  ‘Powered by REDCap’ is displayed at the bottom right hand corner of the PDF
   #  and that there is no redcap logo. 
   And I should see the pdf has loaded in the iframe
   When I verify the PDF has the correct variables
   Then I should see the latest downloaded "PDF" file containing the headings below
      | | | | |
    #would something like this work? ^
   And I close the iframe window

  Given I click on the link labeled "Record Status Dashboard"
  When I locate the bubble for the "Data Types" instrument on event "Event 2" for record ID "1" and click on the bubble
  And I select "This data entry form (blank)" on the dropdown field labeled "Download PDF of instrument(s)"
  And I should see a downloaded file named "DataTypes_D115100.pdf"
   And I open the downloaded PDF?
   # need to verify thatRecord ID field is displayed as the first field in instrument
   And I should see the pdf has loaded in the iframe
   When I verify the PDF has the correct variables
   Then I should see the latest downloaded "PDF" file containing the headings below
      | | | | |
    #would something like this work? ^
   And I close the iframe window

  
    Given I click on the link labeled "Record Status Dashboard"
    When I locate the bubble for the "Text Validation" instrument on event "Event 1" for record ID "1" and click on the bubble
    And I enter "Dave" into the input field labeled "Name"
    Then I enter "dave@abc.com" into the input field labeled "email"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I click on the link labeled "Record Status Dashboard"
    And I click on the button labeled "Add new record for this arm"
    When I locate the bubble for the "Data Types" instrument on event "Event 2" for record ID "2" and click on the bubble
    Then I enter "Paul" into the input field labeled "Name"
    And I select the submit option labeled "Save & Exit Form" on the Data Collection Instrument

    Given I click on the link labeled "Data Exports, Reports, and Stats"




#on step 30


