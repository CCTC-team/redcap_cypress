Feature: D.109.100 Piping - The system shall support the ability to use previously collected data in a text on a data collection form or survey.

  As a REDCap end user
  I want to see that Piping feature is functioning as expected
 

Scenario: D.109.100_Piping - Create Piping into questions

    #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.109.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button


    #ACTION: Create new field called ice_cream in the instrument
    When I click on the link labeled "My Projects"  
    And I click on the link labeled "D.109.100_Piping" 
    Then I click on the link labeled "Designer"
    And I click on the instrument labeled "Data Types"
    And I click on the button labeled "Add Field"
    And I select "Multiple Choice - Radio buttons (Single choice)" on the dropdown field labeled "Field Type" in the dialog box
    And I enter "What is your favorite ice cream?" into the input field labeled "Field Label) " in the dialog box
    And I enter "ice_cream" into the input field labeled "Variable Name " in the dialog box
    And I enter "1, Chocolate" into the input field labeled "Choices (one choice per line) " in the dialog box
    And I enter "2, Strawberry" into the input field labeled "Choices (one choice per line) " in the dialog box
    And I enter "3, Vanilla" into the input field labeled "Choices (one choice per line) " in the dialog box
    And I click on the button labeled "Save"
    Then I should see the field labeled "What is your favorite ice cream?"
    And I should see "Chocolate, Strawberry, Vanilla" within the field with variable name "ice_cream" 

    #ACTION: Create Piping into another new field called love_icecream
    And I click on the button labeled "Add Field"
    And I select "Slider/Visual Analog" on the dropdown field labeled "Field Type" in the dialog box
    And I enter "How much do you love [ice_cream]?" into the input field labeled "Field Label" in the dialog box
    And I enter "love_icecream" into the input field labeled "Variable Name" in the dialog box
    And I enter "Hate it" into the input field labeled "Left label (bottom, if vertical): " in the dialog box
    And I enter "Indifferent" into the input field labeled "Middle label: " in the dialog box
    And I enter "I love [ice_cream]" into the input field labeled "Right label (top, if vertical): " in the dialog box
    And I enter "0" into the input field labeled "Min/max range values:	Min: " in the dialog box
    And I enter "100" into the input field labeled "Min/max range values:	Max: " in the dialog box
    And I select "Right/Horizontal (RH)" on the dropdown field labeled "Custom Alignment" in the dialog box
    And I click on the button labeled "Save"
    Then I should see the field labeled "How much do you love [ice_cream]?"
    And I should see "Hate it, Indifferent, I love [ice_cream]" within the field with variable name "ice_cream" 

    #VERIFY_DE: Testing Piping in data collection form for field 'How much do you love [ice_cream]?'

    When I click on the link labeled "Add/Edit Records"
    Then I click on the button labeled "+ Add new record for the arm selected above"
    And I should see a Data Collection Instrument named "Data Types" for the Event named "Event 1"
    And I locate the bubble for the "Data Types" instrument on event "1" for record ID "1" and click on the bubble
    And I select the radio option "Chocolate" for the field labeled "What is your favorite ice cream?" 
    #VERIFY: Piping has function correctly in question
    Then I should see a field named "How much do you love Chocolate?" after field named "What is your favorite ice cream" 
    And I move the slider field labeled "How much do you love Chocolate?" to the position of 1
    And I enter "1" into the data entry form field labeled "Required" 
    And I select the submit option labeled "Save & Exit Record" on the Data Collection Instrument
    Then I should see "Record Home Page"
    

    
    