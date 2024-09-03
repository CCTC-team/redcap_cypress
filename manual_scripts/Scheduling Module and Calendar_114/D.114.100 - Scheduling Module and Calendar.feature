Feature: D.114.100 Scheduling Module and Calendar  - The system shall support the ability to use the scheduling module to generate schedules for your project calendar that are auto-generated from project-defined events (e.g., visits, time-points). Scheduling is only available for projects using longitudinal data collection.
D.114.100.1  - The system shall support the ability to schedule events
D.114.100.2  - The system shall support the ability to re-schedule events 
D.114.100.3  - The system shall support the ability to view the schedule in calendar 
D.114.100.4  - The system shall support the ability to add new calendar events 
D.114.100.5  - The system shall support the ability to import calendar to outlook
D.114.100.6  - The system shall support the ability to delete calendar events  

  As a REDCap end user
  I want to see that Scheduling Module and Calendar feature is functioning as expected

  Scenario: 1 D.114.100.1 - Schedule events

  #SETUP
    Given I login to REDCap with the user "Test_User"
    And I create a new project named "D.114.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
        
    