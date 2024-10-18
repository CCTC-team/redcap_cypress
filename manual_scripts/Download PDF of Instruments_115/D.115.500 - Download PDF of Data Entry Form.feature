Feature: D.115.500  Download PDF of Instruments

  As a REDCap end user
  I want to be able to download a PDF of instruments

  Scenario: The system shall support the ability to download the data entry form from within an instrument (instrument contains Record ID)
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