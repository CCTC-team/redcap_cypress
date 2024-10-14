Feature: D.115.700  Download PDF of Instruments

  As a REDCap end user
  I want to be able to download a PDF of instruments

  Scenario: The system shall support the ability to download the PDF of instruments
  Given I click on the link labeled "Record Status Dashboard"
    And I select "Download ZIP file of all uploaded documents" on the dropdown field labeled "Choose action for record"
    And I should see a downloaded file named "Files_D115100_2024-10-11_1226.zip"
    And I open the downloaded zip folder?
    When I unzip the folder 
    # sorry i couldnt find the correct one for the above but there probably is one for that.
    Then I verify the folder has the correct contents 
    #The document folder contains 2 files for record ID 1 (arm 1) - event 2 and event three 
  
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
    And I click on the tab labeled "Other Export Options"
    And I click on the download PDF image for "PDF of data collection instruments containing saved data (all records)"
    #above is wrong or needs making
    And I should see a downloaded file named "D115100_YYYY-MM-DD_TTTT.pdf"
    And I open the downloaded PDF?
    # need to verify thatRecord ID field is displayed as the first field in instrument
    And I should see the pdf has loaded in the iframe
    When I verify the PDF has the correct variables
    Then I should see the latest downloaded "PDF" file containing the headings below
      | | | | |
    #would something like this work? ^
    And I close the iframe window

    Given I click on the link labeled "My Projects"
    Then I should see a table header and rows containing the following values in a table:
      | | | | |
      | | | | |
      | | | | |
      | | | | |
