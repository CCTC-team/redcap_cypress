Feature: D.114.100  Scheduling Module and Calendar

  As a REDCap end user I want to see a working schedule and calander

   Scenario: 
    Given I login to REDCap with the user "test_user1"
    And I create a new project named "D.114.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val_Project_Scheduling_and_Calendar.xml", and clicking the "Create Project" button
    And I click on the button labeled "Enable" in the "Use longitudinal data collection with defined events?" row in the "Main project settings" section
    And I click on the button labeled "Define My Events"
    When I click on the button labeled "Edit"
    Then I enter "0" into the data entry form field labeled "Days Offset"
    # think this is wrong and a new definition needs making for table entry? 
    And I enter "Enrollment" into the data entry form field labeled "Event Label"
    # think this is wrong and a new definition needs making for table entry? 
    And I click on the button labeled "Save"

    Given I add an event named "Baseline" with offset of 1 day into the currently selected arm
    Then I click on the button labeled "Add new event"

 
    Given I add an event named "Visit 1" with offset of 2 days into the currently selected arm   
    Then I click on the button labeled "Add new event"
    
    Given I add an event named "Visit 2" with offset of 30 days into the currently selected arm
    When I clear field and enter "1" into the data entry form field labeled "-"
    And I clear field and enter "2" into the data entry form field labeled "+"
    Then I click on the button labeled "Add new event"


    Given I add an event named "Visit 3" with offset of 60 days into the currently selected arm
    When I clear field and enter "1" into the data entry form field labeled "-"
    And I clear field and enter "2" into the data entry form field labeled "+"
    Then I click on the button labeled "Add new event"

    Given I add an event named "Final Visit" with offset of 90 days into the currently selected arm
    When I clear field and enter "5" into the data entry form field labeled "-"
    And I clear field and enter "10" into the data entry form field labeled "+"
    And I add a custom event label of "[complete_study_date]"
    #new definition required above
    Then I click on the button labeled "Add new event"

    Given I add an event named "Final Visit Follow up" with offset of 120 days into the currently selected arm
    When I clear field and enter "1" into the data entry form field labeled "-"
    And I clear field and enter "2" into the data entry form field labeled "+"
    Then I add a custom event label of "[complete_study_date]"
    #new definition required above
    

    Given I click on the link labeled "Designate Instruments for My Events"
    And I click on the tab labeled "Designate Instruments for My Events"
    And I click on the button labeled "Begin Editing"
    #only problem here is enrollment has every form at first and i cant see a definition to clear it
    And I enable the Data Collection Instrument named "Demographics" for the Event named "Enrollment"
    And I enable the Data Collection Instrument named "Baseline Data" for the Event named "Baseline"
    And I enable the Data Collection Instrument named "Month 1 Data" for the Event named "Visit 1"
    And I enable the Data Collection Instrument named "Month 2 Data" for the Event named "Visit 2"
    And I enable the Data Collection Instrument named "Month 3 Data" for the Event named "Visit 3"
    And I enable the Data Collection Instrument named "Completion Data" for the Event named "Final Visit"
    #shouldnt there be one for the last visit?
    When I click on the button labeled "Save"
    Then I verify the Data Collection Instrument named "Demographics" is enabled for the Event named "Enrollment"
    And I verify the Data Collection Instrument named "Baseline Data" is enabled for the Event named "Baseline"
    And I verify the Data Collection Instrument named "Month 1 Data" is enabled for the Event named "Visit 1"
    And I verify the Data Collection Instrument named "Month 2 Data" is enabled for the Event named "Visit 2"
    And I verify the Data Collection Instrument named "Month 3 Data" is enabled for the Event named "Visit 3"
    And I verify the Data Collection Instrument named "Completion Data" is enabled for the Event named "Final Visit"

    
    Given I select the dropdown option "Download instrument-event mappings" for the Data Collection Instrument field labeled "Upload or download instrument mappings" 
    And I click on the download icons to receive the files for the "D114100_InstrumentDesignations_2024-10-03.csv" format in the dialog box
    # Insert steps here to do the following: Open excel csv file and make edits for event mapping as below in the last row for the following columns: 
    # Arm_num = 1 
    # Unique_event_name = final_visit_follow_arm_1   ------ this is the only one that needs changing
    # Form = completion_data 
    # Save the excel csv file and close excel 
    And I select the dropdown option "Upload instrument-event mappings" for the Data Collection Instrument field labeled "Upload or download instrument mappings"
    When I upload a "csv" format file located at "import_files/D114100_InstrumentDesignations_2024-10-03.csv", by clicking the button near "Upload CSV file of new users" to browse for the file, and clicking the button labeled "Upload" to upload the file
    Then I verify the Data Collection Instrument named "Completion Data" is enabled for the Event named "Final Visit Follow up"

    Given I click on the link labeled "Scheduling"
    And I clear field and enter "11/20/2023" into the data entry form field labeled "Start Date:"
    And I click on the button labeled "Generate Schedule"
    And I should see 'The projected schedule below was automatically generated for Study ID "1" based on your pre-defined Events.'
    When I add a time "13:30" to the Event Name "Enrollment"
    And I add a time "15:00" to the Event Name "Baseline"
    And I add a time "14:00" to the Event Name "Visit 1"
    And I add a time "14:00" to the Event Name "Visit 2"
    And I add a time "14:00" to the Event Name "Visit 3"
    And I add a time "14:00" to the Event Name "Final Visit"
    And I add a time "14:00" to the Event Name "Final Visit Follow up"
    #new step required here
    And I clear field and enter "02/19/2024" into the data entry form field labeled "Sunday"
    #unsure if this needs to be less specific but new step required if so, similar but not the same as the one above.
    Then I click on the button labeled "Create Schedule"
    And I should see a table header and rows containing the following values in a table:
      | Time    | Date                  | Event Name            |                                     
      | 1:30pm	| 11/20/2023  Monday    |	Enrollment            |
      | 3:00pm	| 11/21/2023  Tuesday   |	Baseline              |
      | 2:00pm	| 11/22/2023  Wednesday |	Visit 1               |
      | 2:00pm	| 12/20/2023  Wednesday |	Visit 2               |
      | 2:00pm	| 01/19/2024  Friday    |	Visit 3               |
      | 2:00pm	| 02/19/2024  Monday    |	Final Visit           |
      | 2:00pm	| 03/19/2024  Tuesday   |	Final Visit Follow up |
    
    Given I click on the button labeled "Generate Schedule"
    #do i need a step here to visually check the table?
    #there would have been nowhere to enter the time / date before if the table didnt exist
    And I click on the button labeled "Create Schedule"
    And I click on the tab "View or Edit Schedule"
    And I select the dropdown option "2" for the Data Collection Instrument field labeled "Select a previously scheduled Study ID:"
    And I click on the Edit image for the event row "Enrollment"
    And I click on the first Edit image for the field named "Enrollment"
    #new step required, could be either of the abobe
    And I add a time "10:00" to the Event Name "Enrollment"
    #possibly different to when this is used above because its in a different table, but this needs to happen
    And I click on the button labeled "Save"
    And I click on the Edit image for the event row "Final Visit"
    And I click on the first Edit image for the field named "Final Visit"
    #new step required, could be either of the abobe
    And I add a Time "16:00" to the Event Name "Final Visit"
    And I add a Date "03/04/2024" to the Event Name "Final Visit"
    And I click on the button labeled "Ok"
    #possibly different to when this is used above because its in a different table, but this needs to happen
    And I click on the button labeled "Save"
    And I click on the button labeled "NO just this one"
    And I clear field and enter "04/04/2024" into the data entry form field labeled "Add new Ad Hoc calendar event on"
    And I enter "9:00" into the data entry form field labeled "Time:"
    And I enter "Test check up" into the data entry form field labeled "Notes:"
    And I click on the button labeled "Add Calendar Event"
    And I click on the delete icon for the visit "Ad Hoc"


    # i have reached step 10 in the word document, about a third of the way through it. 

