Feature: D.113.400 - Additional Customizations

As a REDCap end user
I want to see that I have the ability to specify a reason when making changes to existing records
Scenario: D.113.400 Assign missing codes to blank fields 

Scenario: D.106.200 Open, close, read only, reopen and respond to queries based on user roles

#ACTION: Reason when making changes to existing records SETUP
Given I login to REDCap with the user "Test_Admin" 
And I create a new project named "D.106.200" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

#ACTION: Enable reason when making changes to existing records 
