Feature: D.115.300  Download PDF of Instruments

  As a REDCap end user
  I want to be able to download a PDF of instruments

  Scenario: The system shall support the ability to download the PDF of record data of all instruments/events 
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