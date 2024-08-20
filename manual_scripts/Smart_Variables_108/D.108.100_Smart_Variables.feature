Feature: D.108.100 Smart Variables - The system shall support the ability to use Smart Variables in data entry forms. The following subset of Smart Variables is selected and tested: 
    D.108.100.1 - [event-name]  
    D.108.100.2 - [record-dag-id]  
    D.108.100.3 - [user-role-label] 
    D.108.100.4 - [instrument-name] 
    D.108.100.5 - [form-url:instrument]   

  As a REDCap end user
  I want to see that smart variables feature is functioning as expected
 
  
    
  Scenario: 1 D.108.100_Smart_Variables - Create smart variables 

  #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.108.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
        
        