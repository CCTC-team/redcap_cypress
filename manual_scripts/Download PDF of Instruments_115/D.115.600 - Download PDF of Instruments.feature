Feature: D.115.600  Download PDF of Instruments

  As a REDCap end user
  I want to be able to download a PDF of instruments

  Scenario: The system shall support the ability to download the PDF of data of all instruments/events in a compact mode (fields with data only) of all records 
       

    
    Given I click on the link labeled "Data Exports, Reports, and Stats"
    And I click on the tab labeled "Other Export Options"
    And I click on the download compact PDF image for "PDF of data collection instruments containing saved data (all records)"
    #above is wrong or needs making - different to above ! 
    And I should see a downloaded file named "D115100_YYYY-MM-DD_TTTT.pdf"
    And I open the downloaded PDF?
    # need to verify thatRecord ID field is displayed as the first field in instrument
    And I should see the pdf has loaded in the iframe
    When I verify the PDF has the correct variables
    Then I should see the latest downloaded "PDF" file containing the headings below
      | | | | |
    #would something like this work? ^
    And I close the iframe window

