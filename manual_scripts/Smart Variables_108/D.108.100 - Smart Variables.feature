Feature: D.108.100 Smart Variables - The system shall support the ability to use Smart Variables in data entry forms. The following subset of Smart Variables is selected and tested: 
    D.108.100.1 - [event-name]  
    D.108.100.2 - [record-dag-id]  
    D.108.100.3 - [user-role-label] 
    D.108.100.4 - [instrument-name] 
    D.108.100.5 - [form-url:instrument]   

  As a REDCap end user
  I want to see that smart variables feature is functioning as expected
 
  #Create a DAG group called 'DAG_TEST_GROUP' to test smart variables
  #Create a user called 'Data Manager' to test smart variables

  Scenario: 1 D.108.100 - Create smart variables 

  #SETUP
    Given I login to REDCap with the user "Test_Admin"
    And I create a new project named "D.108.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button
        
    #ACTION: Create Data Acesss group
    When I click on the link labeled "DAGs"
    Then I should see "+ Create new groups:"
    And I enter "DAG_TEST_GROUP" into the data entry form field labeled "Enter new group name" 
    And I click on the button labeled "+ Add Group"
    
    #VERIFY
    Then I should see a table header and rows containing the following values in data access groups table:
      | Data Access Groups        | Users in group                                                      | Numbers of records in group|
      | DAG_TEST_GROUP            |                                                                     |            0               |
      | DAG1                      |                                                                     |            0               |
      | [Not assigned to a group] |test admin (Test User), test_user (Test User) *Can view all records  |            1               |

    #ACTION: Add user to project D.108.100
    When I click on the link labeled "User Rights"
    And I enter "test_user" into the input field labeled "Add with custom rights"
    And I click on the button labeled "Add with custom rights"
    And I check the User Right named "Project Setup & Design"
    And I click on the button labeled "Add User"

    #VERIFY
    Then I should see a table header and rows containing the following values in a table:
      | Role name               | Username                  |
      | —                       | test_admin  (Test User)   |
      | —                       | test_user  (Test User)   |
     
    #ACTION: Assign DAG to test_user
    When I select "test_user (Test User)" on the dropdown field labeled "Assign user"
    When I select "TestGroup2" on the dropdown field labeled "to"
    And I click on the button labeled "Assign"

    #VERIFY
    Then I should see a table header and rows containing the following values in data access groups table:
      | Data Access Groups        | Users in group                                                      | Numbers of records in group| Unique group name (auto generated)| Group ID number|
      | DAG_TEST_GROUP            |                                                                     |            0               |     dag_test_group                | 22             |
      | DAG1                      |                                                                     |            0               |          dag1                     | 21             |
      | [Not assigned to a group] |test admin (Test User), test_user (Test User) *Can view all records  |            1               |                                   |                |
    And I logout

    #ACTION: Login with Test User
    Given I login to REDCap with the user "Test_User"
    When I click on the link labeled "My Projects"  
    And I click on the link labeled "D.108.100" 
    Then I click on the link labeled "Designer"
    
    And I should see a table header and rows containing the following values in a table:
        | Instrument name          |  Fields |
        | Text Validation          | 3       |
        | Data Types               | 18      |

    #ACTION: D.108.100.1 Add smart variable [event-name] into field
    When I click on the instrument labeled "Data Types"
    And I click on the first button labeled "Add Field"
    And I select "Descriptive Text (with optional Image/Video/File Attachment" on the dropdown field labeled "Field Type" in the dialog box
    And I enter "[event-name]" into the input field labeled "Field Label" in the dialog box
    And I enter "event_name_desc" into the input field labeled "Variable Name" in the dialog box
    Then I click on the button labeled "Save"

    #VERIFY: [event-name] shows correctly in instrument
    When I click on the link labeled "Add / Edit Records"
    And I click on the link labeled "+ Add new record for the arm selected above"
    Then I should see "Record Home Page"
    And I should see the "Incomplete (no data saved)" icon for the "Text Validation" longitudinal instrument on event "Event 1" for record "22-1"
    And I should see the "Incomplete (no data saved)" icon for the "Data Types" longitudinal instrument on event "Event 1" for record "22-1" 
    And I click on the bubble for the "Text Validation" data collection instrument for record ID "22-1"
    Then I should see a field named "event_1_arm_1" after field named "Record ID" 
    And I enter "1" into the data entry form field labeled "Required"
    And I select the submit option labeled "Save & Exit Record" on the Data Collection Instrument
    Then I should see "Record Home Page"
    

