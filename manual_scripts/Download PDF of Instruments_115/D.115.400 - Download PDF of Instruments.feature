Feature: D.115.400  Download PDF of Instruments

  As a REDCap end user
  I want to be able to download a PDF of instruments

  Scenario: The system shall support the ability to download the PDF of record data of all instruments/events in a compact mode (fields with data only)

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