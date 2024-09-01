Feature: D.109.100 Piping - The system shall support the ability to use previously collected data in a text on a data collection form or survey.

  As a REDCap end user
  I want to see that Piping feature is functioning as expected
 

Scenario: D.109.100 - Create Piping into questions

    #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.109.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button


    #ACTION: Create new field called ice_cream in the instrument
    When I click on the link labeled "Designer" 
    Then I should see a table header and rows containing the following values in a table:
        | Instrument name          |  Fields |
        | Text Validation          | 3       |
        | Data Types               | 18      |

    And I click on the instrument labeled "Data Types"
    And I click on the first button labeled "Add Field"
    And I select "Multiple Choice - Radio buttons (Single answer)" on the dropdown field labeled "Field Type" in the dialog box
    And I enter "What is your favorite ice cream?" into the input field labeled "Field Label" in the dialog box
    And I enter "ice_cream" into the input field labeled "Variable Name " in the dialog box
    And I enter "1, Chocolate" into the input field labeled "Choices (one choice per line) " in the dialog box
    And I enter "2, Strawberry" into the input field labeled "Choices (one choice per line) " in the dialog box
    And I enter "3, Vanilla" into the input field labeled "Choices (one choice per line) " in the dialog box
    And I click on the button labeled "Save"
    Then I should see the field labeled "What is your favorite ice cream?"
    And I should see "Chocolate, Strawberry, Vanilla" within the field with variable name "ice_cream" 

    #ACTION: Create Piping into another new field called love_icecream
    And I click on the first button labeled "Add Field"
    And I select "Slider/Visual Analog" on the dropdown field labeled "Field Type" in the dialog box
    And I enter "How much do you love [ice_cream]?" into the input field labeled "Field Label" in the dialog box
    And I enter "love_icecream" into the input field labeled "Variable Name" in the dialog box
    And I enter "Hate it" into the input field labeled "Left label (bottom, if vertical): " in the dialog box
    And I enter "Indifferent" into the input field labeled "Middle label: " in the dialog box
    And I enter "I love [ice_cream]" into the input field labeled "Right label (top, if vertical): " in the dialog box
    And I click on the checkbox element labeled "Display number value?" 
    And I enter "1" into the input field labeled "Min/max range values:	Min: " in the dialog box
    And I enter "3" into the input field labeled "Min/max range values:	Max: " in the dialog box
    And I select "Right/Horizontal (RH)" on the dropdown field labeled "Custom Alignment" in the dialog box
    And I click on the button labeled "Save"
    Then I should see the field labeled "How much do you love [ice_cream]?"
    And I should see "Hate it, Indifferent, I love [ice_cream]" within the field with variable name "ice_cream" 


    #VERIFY_DE: Check Piping fields in data collection form

    When I click on the link labeled "Record Status Dashboard"
    Then I should see a table header and row containing the following values in a table:
        
      | Record ID |
      | 1         |     

    And I should see the "Incomplete" icon for the "Text Validation" longitudinal instrument on event "Event 1" for record "1"
    And I should see the "Complete" icon for the "Data Types" longitudinal instrument on event "Event 1" for record "1"
    And I locate the bubble for the "Data Types" instrument on event "1" for record ID "1" and click on the bubble
    And I should see the field labeled "What is your favorite ice cream?"
    And I should see the field labeled "How much do you love ______"

    #VERIFY: Piping functions correctly in question
    When I click on the link labeled "Record Status Dashboard"
    And I should see a Data Collection Instrument named "Data Types" for the Event named "Event 1"
    And I locate the bubble for the "Data Types" instrument on event "1" for record ID "1" and click on the bubble
    And I enter "1" into the data entry form field labeled "Required" 
    And I select the radio option "Chocolate" for the field labeled "What is your favorite ice cream?" 
    Then I should see a field named "How much do you love Chocolate?" after field named "What is your favorite ice cream" 
    And I move the slider field labeled "How much do you love Chocolate?" to the position of 3
    Then I verify "I love Chocolate " is within the data entry form field labeled "How much do you love Chocolate? "

    #VERIFY: Piping value can be changed by selecting another option on What is your favorite ice cream?
    When I select the radio option "Strawberry" for the field labeled "What is your favorite ice cream?" 
    Then I should see a field named "How much do you love Strawberry?" after field named "What is your favorite ice cream" 
    And I move the slider field labeled "How much do you love Strawberry?" to the position of 1
    Then I verify "Hate it" is within the data entry form field labeled "How much do you love Strawberry? "
    And I select the submit option labeled "Save & Exit Record" on the Data Collection Instrument
    Then I should see "Record Home Page"
    
    