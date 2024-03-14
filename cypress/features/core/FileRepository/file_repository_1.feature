Feature: User Interface: The system shall support limiting file repository user view access and export rights.

# User Requirements
# C.3.26.200 User Interface: The system shall support limiting file repository user view
# access and export rights.
#--------------------------------------------------------------------------------------

As a REDCap end user 
I want to see that file repository is functioning as expected

Scenario: C.3.26.200.100 Limit user view and export access based on User Rights and DAG
    #SETUP 
    Given I am an "admin" user who logs into REDCap
    And I create a project named "filerepo" with project purpose Operational Support via CDISC XML import from fixture location "cdisc_files/core/Project_1.xml" 

    ##SETUP auto-archive
    And I click on the link labeled "Designer"
    And I click on the button labeled "Survey settings" for the instrument named "Consent"
    And I click on the element identified by "input[name=pdf_auto_archive][value=2]"
    Then I click on the button labeled "Save Changes"

    ##SETUP File Repository
    And I click on the link labeled "File Repository"

    #Create DAG limited folder
    And I click on the button labeled "Create folder"
    And I enter "TestGroup1_Folder" into the input field labeled "New folder name:"
    And I select "TestGroup1" on the dropdown field labeled "Limit access by Data Access Group?"
    And I click on the button labeled "Create folder" in the dialog box 
    Then I should see "TestGroup1_Folder"

    #Create role limited folder
    And I click on the button labeled "Create folder"
    And I enter "Role1_Folder" into the input field labeled "New folder name"
    And I select "1_FullRights" on the dropdown field labeled "Limit access by User Role?"
    And I click on the button labeled "Create folder" in the dialog box
    Then I should see "Role1_Folder"

    #SETUP User Rights:
    When I click on the link labeled "User Rights"   
    And I click on the button labeled "Upload or download users, roles, and assignments"
    And I click on the link labeled "Upload users (CSV)"
    Then I upload a "csv" format file located at "import_files/user_list_for_project_1.csv", by clicking the button near "Select your CSV file of users and their user rights to be added/modified:" in User Rights to browse for the file, and clicking the button labeled "Upload" to upload the file
    Then I should see a dialog containing the following text: "Upload users (CSV) - Confirm"
    And I should see "test_admin"
    And I should see "test_user"
    And I should see "test_user2"
    And I should see "test_user3"
    And I should see "test_user4"
    Given I click on the button labeled "Upload" in the dialog box
    Then I should see a dialog containing the following text: "SUCCESS!"
    And I close the popup
    Then I should see "—" within the "test_admin" row of the column labeled "Role name" of the User Rights table
    Then I should see "—" within the "test_user" row of the column labeled "Role name" of the User Rights table
    Then I should see "—" within the "test_user2" row of the column labeled "Role name" of the User Rights table
    Then I should see "—" within the "test_user3" row of the column labeled "Role name" of the User Rights table
    Then I should see "—" within the "test_user4" row of the column labeled "Role name" of the User Rights table


    ##SETUP Assign to roles
    When I click on the link labeled "test_user" 
    And I click on the button labeled "Assign to role" on the tooltip
    And I select "1_FullRights" from the dropdown identified by "select[id=user_role]"
    And I wait for 2 seconds
    # Have to do the below step twice. Not sure why
    And I select "1_FullRights" from the dropdown identified by "select[id=user_role]"
    And I click on the button labeled exactly "Assign"
    Then I should see "successfully ASSIGNED to the user role"    
    Then I should see "1_FullRights" within the "test_user (Test User)" row of the column labeled "Role name" of the User Rights table

    Then I click on the link labeled "User Rights"  
    When I click on the link labeled "test_user2" 
    And I click on the button labeled "Assign to role" on the tooltip
    And I select "1_FullRights" from the dropdown identified by "select[id=user_role]"
    And I wait for 2 seconds
    # Have to do the below step twice. Not sure why
    And I select "1_FullRights" from the dropdown identified by "select[id=user_role]"
    And I click on the button labeled exactly "Assign"
    Then I should see "successfully ASSIGNED to the user role"    
    Then I should see "1_FullRights" within the "test_user2 (Test User)" row of the column labeled "Role name" of the User Rights table

    Then I click on the link labeled "User Rights"  
    When I click on the link labeled "test_user3" 
    And I click on the button labeled "Assign to role" on the tooltip
    And I select "3_ReadOnly_Deidentified" from the dropdown identified by "select[id=user_role]"
    And I wait for 2 seconds
    # Have to do the below step twice. Not sure why
    And I select "3_ReadOnly_Deidentified" from the dropdown identified by "select[id=user_role]"
    And I click on the button labeled exactly "Assign"
    Then I should see "successfully ASSIGNED to the user role"    
    Then I should see "3_ReadOnly_Deidentified" within the "test_user3 (Test User)" row of the column labeled "Role name" of the User Rights table

    Then I click on the link labeled "User Rights"  
    When I click on the link labeled "test_user4" 
    And I click on the button labeled "Assign to role" on the tooltip
    And I select "3_ReadOnly_Deidentified" from the dropdown identified by "select[id=user_role]"
    And I wait for 2 seconds
    # Have to do the below step twice. Not sure why
    And I select "3_ReadOnly_Deidentified" from the dropdown identified by "select[id=user_role]"
    And I click on the button labeled exactly "Assign"
    Then I should see "successfully ASSIGNED to the user role"    
    Then I should see "3_ReadOnly_Deidentified" within the "test_user4 (Test User)" row of the column labeled "Role name" of the User Rights table

    #SETUP DAG: Assign User to DAG 
    Given I click on the link labeled "Data Access Groups"
    When I select "test_user (Test User)" from the dropdown identified by "select[id=group_users]"
    And I wait for 2 seconds
    When I select "test_user (Test User)" from the dropdown identified by "select[id=group_users]"
    Then I should see "Assign user to a group"
    And I should see "Users in group"
    And I select "TestGroup1" from the dropdown identified by "select[id=groups]"
    And I wait for 2 seconds
    And I select "TestGroup1" from the dropdown identified by "select[id=groups]"
    And I wait for 2 seconds
    And I click on the button labeled "Assign"
    Then I should see "has been assigned to Data Access Group"
    And I should see "test_user (Test User)" users in the DAG named "TestGroup1"
    And I wait for 5 seconds

    Given I click on the link labeled "Data Access Groups"
    When I select "test_user2 (Test User)" from the dropdown identified by "select[id=group_users]"
    And I wait for 2 seconds
    When I select "test_user2 (Test User)" from the dropdown identified by "select[id=group_users]"
    Then I should see "Assign user to a group"
    And I should see "Users in group"
    And I select "TestGroup2" from the dropdown identified by "select[id=groups]"
    And I wait for 2 seconds
    And I select "TestGroup2" from the dropdown identified by "select[id=groups]"
    And I wait for 2 seconds
    And I click on the button labeled "Assign"
    Then I should see "has been assigned to Data Access Group"
    And I should see "test_user2 (Test User)" users in the DAG named "TestGroup2"

    Given I click on the link labeled "Data Access Groups"
    When I select "test_user3 (Test User)" from the dropdown identified by "select[id=group_users]"
    And I wait for 2 seconds
    When I select "test_user3 (Test User)" from the dropdown identified by "select[id=group_users]"
    Then I should see "Assign user to a group"
    And I should see "Users in group"
    And I select "TestGroup1" from the dropdown identified by "select[id=groups]"
    And I wait for 2 seconds
    And I select "TestGroup1" from the dropdown identified by "select[id=groups]"
    And I wait for 2 seconds
    And I click on the button labeled "Assign"
    Then I should see "has been assigned to Data Access Group"
    And I should see "test_user (Test User), test_user3 (Test User)" users in the DAG named "TestGroup1"

    ##"Test_User4" is not assigned to a DAG

    And I logout

    SETUP Record: Create record while in DAG through eConsent framework 
    Given I am an "standard" user who logs into REDCap
    And I click on the link labeled "My Projects"  
    And I click on the link labeled "filerepo"  
    When I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record for the arm selected above"
    
    And I click the bubble to select a record for the "Consent" longitudinal instrument on event "Event 1"
    Then I should see "Adding new Record ID"
    When I click on the button labeled "Save & Exit Form"
    And I should see "successfully added."
    
    Then I click the bubble to select a record for the "Consent" longitudinal instrument on event "Event 1"
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Open survey" label
    And I click on the button labeled "Next Page" 
    Then I should see "I certify that all of my information in the document above is correct. I understand that clicking 'Submit' will electronically sign the form and that signing this form electronically is the equivalent of signing a physical document."
    When I check the checkbox identified by "input[id=econsent_confirm_checkbox]"
    When I click on the button labeled "Submit" on the survey
    Then I should see "Thank you for taking the survey."
    And I should see "Have a nice day!"
    When I click on the button labeled "Close survey" on the survey
    And I logout

    Given I am a "standard" user who logs into REDCap
    Then I should see "New Project"
    And I click on the link labeled "My Projects"  
    Then I should see "filerepo"
    And I click on the link labeled "filerepo" 
    Then I should see "Record Status Dashboard"
    And I click on the link labeled "Record Status Dashboard"
    Then I should see "Record Status Dashboard (all records)"
    Then I click on the link labeled "1-1"
    Then I should see the instrument labeled "Consent" for the event "Event 1" with icon circle_green_tick
    And I should see "TestGroup1"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Upload to top tier file repo (all users will see file) - using the Drag and drop files here to upload button
    When I click on the link labeled "File Repository"
    And I wait for 2 seconds
    Then I should see "The File Repository allows users to store, organize"
    And I upload the file "import_files/user_list_for_project_1.csv" to the drag and drop area in File Repository
    And I wait for 2 seconds
    
    ##VERIFY_FiRe file uploaded in folder
    Then I should see "user_list_for_project_1.csv"
    And I should see "Role1_Folder"
    And I should see "TestGroup1_Folder"


    ##ACTION Upload to top tier file repo (all users will see file) - using the Select files to upload button
    When I click on the link labeled "File Repository"
    And I wait for 2 seconds
    When I click the button labeled "Select files to upload" to select and upload the following file to the File Repository:
      |import_files/testusers_bulkupload.csv|
      
    And I wait for 2 seconds
      
    ##VERIFY_FiRe file uploaded in folder
    Then I should see "testusers_bulkupload.csv"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Upload to DAG folder
    Given I click on the link labeled "File Repository"
    And I wait for 2 seconds
    When I click on the link labeled "TestGroup1_Folder"
    And I wait for 2 seconds
    Then I should see "All Files/TestGroup1_Folder"
    When I upload the file "import_files/user_list_for_project_1.csv" to the drag and drop area in File Repository

    And I wait for 2 seconds

    ##VERIFY_FiRe uploaded in subfolder
    Then I should see "user_list_for_project_1.csv"


    #FUNCTIONAL_REQUIREMENT
    ##ACTION Upload to Role folder
    When I click on the link labeled "File Repository"
    And I wait for 3 seconds
    And I click on the link labeled "Role1_Folder"
    And I wait for 4 seconds
    Then I should see "All Files/Role1_Folder"

  Scenario: C.3.26.400.100 Upload more than one file at the same time using the select files to upload button
    When I click the button labeled "Select files to upload" to select and upload the following files to the File Repository:
      |import_files/user_list_for_project_1.csv|
      |import_files/testusers_bulkupload.csv|

    # And I upload the file "import_files/user_list_for_project_1.csv" to the drag and drop area in File Repository
    # And I wait for 5 seconds

    # And I upload the file "import_files/testusers_bulkupload.csv" to the drag and drop area in File Repository
    # And I wait for 5 seconds

    ##VERIFY_FiRe uploaded in subfolder
    Then I should see "user_list_for_project_1.csv"
    And I should see "testusers_bulkupload.csv"

    # #FUNCTIONAL_REQUIREMENT
    # ##ACTION Auto-archive file in DAG TestGroup1
    When I click on the link labeled "File Repository"
    And I wait for 4 seconds
    And I click on the link labeled "PDF Survey Archive"
    Then I should see "1-1"
    And I logout

    #SETUP Record: Create record while in DAG through
    Given I am a "standard2" user who logs into REDCap
    And I click on the link labeled "My Projects"  
    And I click on the link labeled "filerepo" 
    When I click on the link labeled "Add / Edit Records"
    And I click on the button labeled "Add new record for the arm selected above"
    And I click the bubble to select a record for the "Consent" longitudinal instrument on event "Event 1"
    Then I should see "Adding new Record ID"
    When I click on the button labeled "Save & Exit Form"
    And I should see "successfully added."
    
    Then I click the bubble to select a record for the "Consent" longitudinal instrument on event "Event 1"
    And I click on the button labeled "Survey options"
    And I click on the survey option label containing "Open survey" label
    And I click on the button labeled "Next Page" 
    Then I should see "I certify that all of my information in the document above is correct. I understand that clicking 'Submit' will electronically sign the form and that signing this form electronically is the equivalent of signing a physical document."
    When I check the checkbox identified by "input[id=econsent_confirm_checkbox]"
    When I click on the button labeled "Submit" on the survey
    Then I should see "Thank you for taking the survey."
    And I should see "Have a nice day!"
    When I click on the button labeled "Close survey" on the survey
    And I logout

    Given I am a "standard2" user who logs into REDCap
    Then I should see "New Project"
    And I click on the link labeled "My Projects"  
    Then I should see "filerepo"
    And I click on the link labeled "filerepo" 
    Then I should see "Record Status Dashboard"
    And I click on the link labeled "Record Status Dashboard"
    Then I should see "Record Status Dashboard (all records)"
    Then I click on the link labeled "2-1"
    Then I should see the instrument labeled "Consent" for the event "Event 1" with icon circle_green_tick
    And I should see "TestGroup2"

    #FUNCTIONAL_REQUIREMENT
    When I click on the link labeled "File Repository"
    And I wait for 2 seconds
    ##ACTION Unable to access DAG folder
    ##VERIFY_FiRe See file uploaded by Test_User1
    Then I should see "Data Export Files"
    And I should see "Recycle Bin"
    And I should see "Role1_Folder"
    And I should NOT see "TestGroup1_Folder"
    And I should see "user_list_for_project_1.csv"
    And I should see "testusers_bulkupload.csv"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Interact in Role folder
    And I click on the link labeled "Role1_Folder"
    And I wait for 2 seconds
    #Download file previously uploaded by test_user1
    And I download a csv file by clicking on the link labeled "user_list_for_project_1.csv"
    Then I should have a file named "user_list_for_project_1.csv"

    ##ACTION Upload to Role folder
    When I click the button labeled "Select files to upload" to select and upload the following file to the File Repository:
      |import_files/instrument_designation.csv|

    And I wait for 2 seconds

    ##VERIFY_FiRe uploaded in subfolder
    Then I should see "instrument_designation.csv"
    And I should see "user_list_for_project_1.csv"
    And I should see "testusers_bulkupload.csv"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Auto-archive file in DAG TestGroup2
    When I click on the link labeled "File Repository"
    And I wait for 4 seconds
    And I click on the link labeled "PDF Survey Archive"
    #See consent just created in testgroup2
    #Don't see consent created by testgroup1
    Then I should see "2-1"
    Then I should NOT see "1-1"
    And I logout


    #FUNCTIONAL_REQUIREMENT
    Given I am a "standard3" user who logs into REDCap 
    And I click on the link labeled "My Projects"  
    And I click on the link labeled "filerepo" 
    When I click on the link labeled "File Repository"
    ##ACTION Unable to access Role folder
    ##VERIFY_FiRe See file uploaded by Test_User1
    Then I should see "Data Export Files"
    And I should see "Recycle Bin"
    And I should NOT see "Role1_Folder"
    And I should see "TestGroup1_Folder"
    And I should see "user_list_for_project_1.csv"
    And I should see "upload.csv"

    ##ACTION Download to top tier file imported by user 1 & user 2
    When I download a csv file by clicking on the link labeled "user_list_for_project_1.csv"
    Then I should have a file named "user_list_for_project_1.csv"
    And I wait for 5 seconds
    When I download a csv file by clicking on the link labeled "testusers_bulkupload.csv"
    Then I should have a file named "testusers_bulkupload.csv"
    And I wait for 5 seconds

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Access DAG folder
    When I click on the link labeled "TestGroup1_Folder"
    And I wait for 4 seconds
    Then I should see "user_list_for_project_1.csv"

    When I download a csv file by clicking on the link labeled "user_list_for_project_1.csv"
    ##VERIFY_FiRe Download another users file in subfolder
    Then I should have a file named "user_list_for_project_1.csv"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Auto-archive file in DAG TestGroup1
    When I click on the link labeled "File Repository"
    And I wait for 4 seconds
    And I click on the link labeled "PDF Survey Archive"
    #See consent created by testgroup1
    #Don't see consent created by testgroup2
    Then I should see "1-1"
    Then I should NOT see "2-1"
    And I logout


    #FUNCTIONAL_REQUIREMENT
    ##ACTION Download to top tier file 
    Given I am a "standard4" user who logs into REDCap 
    And I click on the link labeled "My Projects"  
    And I click on the link labeled "filerepo" 
    When I click on the link labeled "File Repository"
    ##ACTION Unable to access Role folder 
    ##VERIFY_FiRe See file uploaded by Test_User1 & Test_User2
    Then I should see "Data Export Files"
    And I should see "Recycle Bin"
    And I should NOT see "Role1_Folder"
    And I should see "TestGroup1_Folder"
    And I should see "user_list_for_project_1.csv"
    And I should see "testusers_bulkupload.csv"

    ##ACTION Download to top tier file imported by user 1 & user 2
    When I download a csv file by clicking on the link labeled "user_list_for_project_1.csv"
    Then I should have a file named "user_list_for_project_1.csv"
    And I wait for 5 seconds
    When I download a csv file by clicking on the link labeled "testusers_bulkupload.csv"
    Then I should have a file named "testusers_bulkupload.csv"
    And I wait for 5 seconds

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Access DAG folder
    When I click on the link labeled "TestGroup1_Folder"
    Then I should see "user_list_for_project_1.csv"

    When I download a csv file by clicking on the link labeled "user_list_for_project_1.csv"
    ##VERIFY_FiRe Download another users file in subfolder
    Then I should have a file named "user_list_for_project_1.csv"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION Auto-archive access all file
    When I click on the link labeled "File Repository"
    And I wait for 5 seconds
    And I click on the link labeled "PDF Survey Archive"
    #See consent created by testgroup1
    #See consent created by testgroup2
    Then I should see "1-1"
    Then I should see "2-1"

    #FUNCTIONAL_REQUIREMENT
    ##ACTION 
  Scenario: C.3.26.500.100 Delete folders - unable to delete with file in folder
    When I click on the link labeled "File Repository"
    And I wait for 5 seconds
    And I check the checkbox labeled "TestGroup1_Folder"
    And I click on the button labeled "Delete"
    ##VERIFY will not let you delete folder with file inside
    Then I should see a dialog containing the following text: "Alert"
    And I should see a dialog containing the following text: "Sorry, but folders can't be deleted this way. They must instead be deleted individually by clicking the X on the right-hand side of each folder."
    When I click on the button labeled "Close" in the dialog box
    Then I should see "TestGroup1_Folder"
    When I click on the Delete folder image for "TestGroup1_Folder" in File Repository
    Then I should see a dialog containing the following text: "Cannot delete folder!"
    And I should see a dialog containing the following text: "Sorry, but the folder below cannot be deleted because it still has files in it."
    When I click on the button labeled "Close" in the dialog box
    And I wait for 2 seconds
    Then I should see "TestGroup1_Folder"

    ##ACTION Cancel Remove files from folder
    When I click on the link labeled "TestGroup1_Folder"
    And I wait for 4 seconds
    And I check the checkbox labeled "user_list_for_project_1.csv"
    And I click on the button labeled "Delete"
    Then I should see a dialog containing the following text: "DELETE MULTIPLE FILES?"
    And I click on the button labeled "Cancel" in the dialog box
    And I wait for 2 seconds
    ##VERIFY file still in folder
    Then I should see "user_list_for_project_1.csv"

    ##ACTION Delete/Remove files from folder
    When I check the checkbox labeled "user_list_for_project_1.csv"
    And I click on the button labeled "Delete"
    Then I should see a dialog containing the following text: "DELETE MULTIPLE FILES?"
    And I click on the button labeled "Delete" in the dialog box
    ##VERIFY file deleted in folder
    Then I should see a dialog containing the following text: "SUCCESS!"
    And I close the popup
    And I wait for 2 seconds
    Then I should NOT see "user_list_for_project_1.csv"

    ##ACTION 
  Scenario: C.3.26.500.100 Delete folders - Cancel deletion 
    When I click on the link labeled "File Repository"
    And I wait for 2 seconds
    And I click on the Delete folder image for "TestGroup1_Folder" in File Repository
    ##VERIFY Cancel deletion 
    Then I should see a dialog containing the following text: "Folder: TestGroup1_Folder"
    When I click on the button labeled "Cancel" in the dialog box
    And I wait for 3 seconds
    Then I should see "TestGroup1_Folder"

    ##ACTION 
  Scenario: C.3.26.500.100 Delete folders
    When I click on the Delete folder image for "TestGroup1_Folder" in File Repository
    ##VERIFY Folder deleted
    Then I should see a dialog containing the following text: "Folder: TestGroup1_Folder"
    When I click on the button labeled "Delete" in the dialog box
    And I wait for 5 seconds
    Then I should NOT see "TestGroup1_Folder"


