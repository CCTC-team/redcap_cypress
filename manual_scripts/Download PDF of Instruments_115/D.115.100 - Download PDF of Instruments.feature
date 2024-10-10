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
    And I open the downloaded PDF?
    # sorry i couldnt find the correct one for the above but there probably is one for that.
    Then I should see the pdf has loaded in the iframe
    And I verify the PDF has the correct variables
    #verify the following Only one field called ‘Identifier’ is visible. ‘Descriptive Text with File’ and ‘Required’ 
    #fields are not visible 


# need to make some new events here 

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
    And I select "Download PDF of record data for all instruments/events" on the dropdown field labeled "Choose action for record"
    When I open the downloaded PDF?
    # sorry i couldnt find the correct one for the above but there probably is one for that.
    Then I should see the pdf has loaded in the iframe
    And I verify the PDF has the correct variables 
    # surely the above is almost impossible to do automatically? look at the list in the word document. 
    And I close the iframe window

    Given I click on the link labeled "Record Status Dashboard"
    And I select "Download PDF of record data for all instruments/events (compact)" on the dropdown field labeled "Choose action for record"
    When I open the downloaded PDF?
    # sorry i couldnt find the correct one for the above but there probably is one for that.
    Then I should see the pdf has loaded in the iframe
    And I verify the PDF has the correct variables 
    # surely the above is almost impossible to do automatically? look at the list in the word document. 
    And I close the iframe window

    Given I click on the link labeled "Record Status Dashboard"
    And I select "Download ZIP file of all uploaded documents" on the dropdown field labeled "Choose action for record"
    When I open the downloaded PDF?
    # sorry i couldnt find the correct one for the above but there probably is one for that.
    Then I should see the pdf has loaded in the iframe
    And I verify the PDF has the correct variables 
    # surely the above is almost impossible to do automatically? look at the list in the word document. 
    And I close the iframe window

   # need to unzip here

#on step 15 but also need to create events at earlier comment 


