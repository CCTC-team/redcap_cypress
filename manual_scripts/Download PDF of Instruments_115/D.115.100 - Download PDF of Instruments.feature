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
    
   


    
  


   

  






