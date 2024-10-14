Feature: D.115.200  Download PDF of Instruments

  As a REDCap end user
  I want to be able to download a PDF of instruments

  Scenario: The system shall support additional customization of PDF of instruments
  Given I click on the link labeled "Project Setup"
   And I click on the button labeled "Additional Customizations"
   When I check the checkbox labeled "PDF Customizations"
   And I enter "CRF Version 1" into the input field labeled "1)"
   And I select the radio option "Hide REDCap logo/URL and instead display the following text:  Powered by REDCap" for the field labeled "2)"
   And I select "Keep it displayed" on the dropdown field labeled "3)"
   Then I click on the button labeled "Save"

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

