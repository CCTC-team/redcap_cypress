Feature: D.110.100 Special Functions  - The system shall support the ability to use Special Functions in data entry forms. The following subset of Special Functions is selected and tested: 
    D.110.100.1 - datediff 
    D.110.100.2 - round  
    D.110.100.3 - if 
    D.110.100.4 - mean 
    D.110.100.5 - length 

  As a REDCap end user
  I want to see that Special Functions feature is functioning as expected

 
  Scenario: D.110.100 - Create Special functions 

    #SETUP
    Given I login to REDCap with the user "Test_User"
    And I create a new project named "D.110.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val_Special_Functions.xml", and clicking the "Create Project" button

    #ACTION: D.110.100.1 Add datediff special function into question
    
    When I click on the link labeled "My Projects"  
    And I click on the link labeled "D.110.100" 
    And I click on the link labeled "Designer"
    Then I should see a table header and rows containing the following values in a table:
        | Instrument name          |  Fields |
        | Text Validation          | 3       |
        | Data Types               | 30      |

    And I click on the instrument labeled "Data Types"
    And I should see a field named "Date difference in days"
    And I click on the Edit icon for the variable "calc_date_days" 
    And I enter "datediff([date_1], [date_2], 'd')" into the input field labeled "Calculation Equation" in the dialog box
    And I click on the button labeled "Update & Close Editor"
    And I click on the button labeled "Save"

    
    #ACTION: Test datediff special function using date questions in instrument

    When I click on the link labeled "Add/Edit Records"
    Then I click on the button labeled "+ Add new record for the arm selected above"
    And I should see a Data Collection Instrument named "Data Types" for the Event named "Event 1"
    And I locate the bubble for the "Data Types" instrument on event "1" for record ID "1" and click on the bubble
    And I enter "01-07-2024" into the data entry form field labeled "Date1" 
    And I enter "15-07-2024" into the data entry form field labeled "Date2"

    #VERIFY
    Then I should see "14" in the data entry form field "Date difference in days" 
    And I enter "1" into the data entry form field labeled "Required" 
    And I select the submit option labeled "Save & Exit Record" on the Data Collection Instrument
    And I should see "Record Home Page"


  #ACTION: D.110.100.2 Add round special function to round to one decimal point into question
    When I click on the link labeled "Designer"  
    And I click on the instrument labeled "Data Types"
    And I should see a field named "BMI Calculated"
    And I click on the Edit icon for the variable "bmi_calc" 
    And I enter "round(([weight]*10000)/(([height])^(2)), 1)" into the input field labeled "Calculation Equation" in the dialog box
    And I click on the button labeled "Update & Close Editor"
    And I click on the button labeled "Save"

    
    #ACTION: Test round special function using questions in instrument
    When I click on the link labeled "Record Status Dashboard"
    And I should see a Data Collection Instrument named "Data Types" for the Event named "Event 1"
    And I locate the bubble for the "Data Types" instrument on event "1" for record ID "1" and click on the bubble
    And I enter "55.6" into the data entry form field labeled "Weight KG" 
    And I enter "180" into the data entry form field labeled "Height CM"

    #VERIFY
    Then I should see "17.2" in the data entry form field "BMI Calculated" 
    And I select the submit option labeled "Save & Exit Record" on the Data Collection Instrument
    And I should see "Record Home Page"


   #ACTION: D.110.100.3 Add IF special function to round to one decimal point into question
    
    When I click on the link labeled "Designer"  
    And I click on the instrument labeled "Data Types"
    And I should see a field named "BMI suitable for study 1 = Suitable 0 = Not suitable"
    And I click on the Edit icon for the variable "bmi_suitable" 
    And I enter "if([bmi_calc] > 15, 1, 0)" into the input field labeled "Calculation Equation" in the dialog box
    And I click on the button labeled "Update & Close Editor"
    And I click on the button labeled "Save"

    #ACTION: Test IF special function using questions in instrument

    When I click on the link labeled "Record Status Dashboard"
    Then I click on button labeled "+Add a New Record for this arm"
    And I should see "Record Home Page"
    And I should see a Data Collection Instrument named "Data Types" for the Event named "Event 1"
    And I locate the bubble for the "Data Types" instrument on event "1" for record ID "2" and click on the bubble
    Then I should see "0" in the data entry form field "BMI suitable for study 1 = Suitable 0 = Not suitable" 
    And I enter "55.6" into the data entry form field labeled "Weight KG"
    And I enter "180" into the data entry form field labeled "Height CM"
    Then I should see "17.2" in the data entry form field "BMI Calculated" 
    

    #VERIFY
    Then I should see "1" in the data entry form field "BMI suitable for study 1 = Suitable 0 = Not suitable" 
    And I select the submit option labeled "Save & Exit Record" on the Data Collection Instrument
    And I should see "Record Home Page"


    #ACTION: D.110.100.4 Add Mean special function to round to one decimal point into question
    When I click on the link labeled "Designer"  
    And I click on the instrument labeled "Data Types"
    And I should see a field named "Mean sum of values"
    And I click on the Edit icon for the variable "mean_value" 
    And I enter "mean([value1],[value2],[value3])" into the input field labeled "Calculation Equation" in the dialog box
    And I click on the button labeled "Update & Close Editor"
    And I click on the button labeled "Save"

    
    #ACTION: Test Mean special function using questions in instrument

    When I click on the link labeled "Record Status Dashboard"
    And I should see a Data Collection Instrument named "Data Types" for the Event named "Event 1"
    And I locate the bubble for the "Data Types" instrument on event "1" for record ID "1" and click on the bubble
    And I enter "7" into the data entry form field labeled "Value 1" 
    And I enter "9" into the data entry form field labeled "Value 2" 
    And I enter "11" into the data entry form field labeled "Value3" 

    #VERIFY
    Then I should see "9" in the data entry form field "Mean sum of values" 
    And I select the submit option labeled "Save & Exit Record" on the Data Collection Instrument
    And I should see "Record Home Page"

    #ACTION: D.110.100.5 Add Length special function to round to one decimal point into question
    
    When I click on the link labeled "Designer"  
    And I click on the instrument labeled "Data Types"
    And I should see a field named "Length of text"
    And I click on the Edit icon for the variable "length_text" 
    And I enter "length ([notesbox])" into the input field labeled "Calculation Equation" in the dialog box
    And I click on the button labeled "Update & Close Editor"
    And I click on the button labeled "Save"

    #ACTION: Test Length special function using questions in instrument

    When I click on the link labeled "Record Status Dashboard"
    And I should see a Data Collection Instrument named "Data Types" for the Event named "Event 1"
    And I locate the bubble for the "Data Types" instrument on event "1" for record ID "1" and click on the bubble
    Then I should see "0" in the data entry form field "Length of text" 
    And I enter "Hello World" into the data entry form field labeled "Notes Box" 

    #VERIFY
    When I click on the input element labeled "Length of text" 
    Then I should see "11" in the data entry form field "Length of text" 
    And I select the submit option labeled "Save & Exit Record" on the Data Collection Instrument
    And I should see "Record Home Page"
    