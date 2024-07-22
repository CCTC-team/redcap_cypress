Feature: Stats and Charts: The system shall support the viewing of stats and charts.

As a REDCap end user
I want to see that Stats and Charts is functioning as expected

Scenario: Uploading Project D.5.100 consisting Text Validation(Name, Email, Form status) and Data Types(Name, Textbox, Checkbox,multiple choice dropdown list (single answer), Radio Button Manual, File Upload (file_upload), Form status) as instruments through the Online Designer to view stats and charts.

#SETUP
Given I login to REDCap with the user "Test_Admin"   
And I create a new project named "Project D.5.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing "Upload a RedCap project XML file (CDISC ODM format)", clicking "Choose File", selecting the "ProjectCUHV1381xml_2024-5-12_1714.REDCap" and clicking the "Create Project" button

##SETUP_VERIFICATION: Text Validation and  Data Types


#FUNCTIONAL_REQUIREMENT
##ACTION: Data Entry Mode



   
    