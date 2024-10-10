Feature: D.106.800 Data Resolution Workflow

  As a REDCap end user
  I want to see that I have the ability to add comments to fields. 
  I want to see that I have the ability to filter comments based on records, events, fields, users and keywords.

  Scenario: D.106.800 - Field comments.
      Given I login to REDCap with the user "Test_User1" 
      And I create a new project named "D.106.800" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_redcap_val.xml", and clicking the "Create Project" button

      #ACTION: Verify Field Comment Log is enabled
      Given I click on the link labeled "Project Setup"
      And I click on the button labeled "Additional customizations"
      Then I should see the dropdown field labeled "Enable:" with the option "Field Comment Log" selected
      And I should see a checkbox labeled "Allow users to edit or delete Field Comments" that is checked
      And I click on the button labeled "Cancel"

      #ACTION: Import data
      And I click on the link labeled "Data Import Tool"
      And  I upload a "csv" format file located at "redcap_val_fixtures/import_files/D.106.100_Data_Import.csv", by clicking the button near "Choose file" to browse for the file, and clicking the button labeled "Upload File" to upload the file
      And I should see "Your document was uploaded successfully and is ready for review."
      And I click on the button labeled "Import Data"
      Then I should see "Import Successful! 15 records were created or modified during the import."

      #ACTION: Add Test_User2 
      When I click on the link labeled "User Rights"
      And I enter "Test_User2" into the input field labeled "Add with custom rights"
      And I click on the button labeled "Add with custom rights"
      Then I should see a dialog containing the following text: "Adding new user"
      And I click on the button labeled "Add user" in the dialog box
      Then I should see a table header and rows containing the following values in a table:
      | Role name | Username                |
      | —         | test_user1 (Test User1) |
      | —         | test_user2 (Test User2) |
    
      #ACTION: Add field comments. Users can Edit/Delete Comments
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1"
      And I click on the Comment icon for the field labeled "Name"
      And I enter "Comment 1" into the input field labeled "Comments" 
      And I click on the button labeled "Comment"
      When I click on the Comment icon for the field labeled "Name"
      Then I should see a table header and row containing the following values in a table:
            |                          | Date / Time      | User       | Comments  | 
            |[edit icon] [delete icon] | mm/dd/yyyy hh:mm | Test_User1 | Comment 1 |

      When I click on the Edit icon for the Comment "Comment 1"
      And I clear field and enter "Comment 10" in the placeholder for "Comment 1"
      And I click on the button labeled "Save" in the dialog box
      Then I should see a table header and row containing the following values in a table:
            |                          | Date / Time      | User       | Comments   | 
            |[edit icon] [delete icon] | mm/dd/yyyy hh:mm | Test_User1 | Comment 10 |

      And I enter "Comment 2" into the input field labeled "Comments" 
      And  I click on the button labeled "Comment"
      When I click on the Comment icon for the field labeled "Name"
      Then I should see a table header and row containing the following values in a table:
            |                          | Date / Time      | User       | Comments   |
            |[edit icon] [delete icon] | mm/dd/yyyy hh:mm | Test_User1 | Comment 10 |
            |[edit icon] [delete icon] | mm/dd/yyyy hh:mm | Test_User1 | Comment 2  |

      When I click on the Delete icon for the Comment "Comment 10"
      Then I should see "Delete this Field Comment?" in the dialog box
      And I click on the button labeled "Delete"
      Then I should see a table header and row containing the following values in a table:
            |                          | Date / Time      | User       | Comments  |
            |[edit icon] [delete icon] | mm/dd/yyyy hh:mm | Test_User1 | Comment 2 |

      And I click on the button labeled "Cancel" in the dialog box

      #ACTION: Disable users to edit/delete Field Comments
      Given I click on the link labeled "Project Setup"
      And I click on the button labeled "Additional customizations"
      And I uncheck the checkbox labeled "Allow users to edit or delete Field Comments" in the dialog box 
      Then I click on the button labeled "Save"
      Then I should see "Success! Your changes have been saved"

      Given I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      And I click on the Comment icon for the field labeled "Name"
      Then I should not see Edit icon in the dialog box
      And I should not see Delete icon in the dialog box
      And I click on the button labeled "Cancel" in the dialog box
      And I logout

      Given I login to REDCap with the user "Test_User2"
      And I click on the link labeled "My Projects"
      And I click on the link labeled "D.106.800"
      And I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "1" 
      When I click on the Comment icon for the field labeled "Name"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments  |
            | mm/dd/yyyy hh:mm | Test_User1 | Comment 2 |

      And I enter "Comment 3" into the input field labeled "Comments" 
      And I click on the button labeled "Comment"
      When I click on the Comment icon for the field labeled "Name"
      Then I should see a table header and row containing the following values in a table:
            | Date / Time      | User       | Comments  |
            | mm/dd/yyyy hh:mm | Test_User1 | Comment 2 |
            | mm/dd/yyyy hh:mm | Test_User2 | Comment 3 |

      And I click on the button labeled "Cancel" in the dialog box
      Then I click on the Comment icon for the field labeled "Email"
      And I enter "Comment 4" into the input field labeled "Comments"
      And I click on the button labeled "Comment"

      Given I click on the link labeled "Record Status Dashboard"
      And I click on the bubble for the "Text Validation" data collection instrument for record ID "2" 
      And I click on the Comment icon for the field labeled "Email"
      And I enter "Comment 5" into the input field labeled "Comments"
      And I click on the button labeled "Comment"
      # And I logout

      #ACTION: Verify filtering
      # Given I login to REDCap with the user "Test_User1"
      And I click on the link labeled "My Projects"
      # And I click on the link labeled "D.106.800"
      When I click on the link labeled "Field Comment Log"
      When I select the option "1" from the dropdown field with the placeholder text of "All records"
      And I click on the button labeled "Apply filters"
      Then I should see a table header and row containing the following values in a table:
            | Record                   | Field        | Comments                                                                               |
            | 1 Event 1 (Arm 1: Arm 1) | email_v2     | Test_User2 (mm/dd/yyyy hh:mm):: "Comment 4"                                            |
            | 1 Event 1 (Arm 1: Arm 1) | ptname_v2_v2 | Test_User1 (mm/dd/yyyy hh:mm): "Comment 2" Test_User2 (mm/dd/yyyy hh:mm):: "Comment 3" |

      When I select the option "ptname_v2_v2" from the dropdown field with the placeholder text of 'All fields'
      And I click on the button labeled "Apply filters"
      Then I should see a table header and row containing the following values in a table:
            | Record                   | Field        | Comments                                                                               |
            | 1 Event 1 (Arm 1: Arm 1) | ptname_v2_v2 | Test_User1 (mm/dd/yyyy hh:mm): "Comment 2" Test_User2 (mm/dd/yyyy hh:mm):: "Comment 3" |

      When I select the option "All records" from the dropdown field with the placeholder text of "All records"
      And I select the option "All fields" from the dropdown field with the placeholder text of 'All fields'
      And I select the option "test_user2" from the dropdown field with the placeholder text of 'All users'
      And I click on the button labeled "Apply filters"
      Then I should see a table header and row containing the following values in a table:
            | Record                   | Field        | Comments                                                           |
            | 1 Event 1 (Arm 1: Arm 1) | email_v2     | Test_User2 (mm/dd/yyyy hh:mm): "Comment 4"                         |
            | 1 Event 1 (Arm 1: Arm 1) | ptname_v2_v2 | Test_User1 (mm/dd/yyyy hh:mm): "Comment 2" Test_User2: "Comment 3" |
            | 2 Event 1 (Arm 1: Arm 1) | email_v2     | Test_User2 (mm/dd/yyyy hh:mm): "Comment 5"                         |

      And I enter '"Comment 5"' into the field with the placeholder text of "Keyword search"
      And I click on the button labeled "Apply filters"
      Then I should see a table header and row containing the following values in a table:
            | Record                   | Field        | Comments                                   |
            | 2 Event 1 (Arm 1: Arm 1) | email_v2     | Test_User2 (mm/dd/yyyy hh:mm): "Comment 5" |

      Given I enter "Comments" into the field with the placeholder text of "Keyword search"
      And I click on the button labeled "Apply filters"
      Then I should see "[Returned no results]"

      #VERIFY_LOG
      Given I click on the link labeled "Logging"
      Then I should see a table header and rows containing the following values in the logging table:
            | Time / Date      | Username   | Action        | List of Data Changes OR Fields Exported                                                                 |
            | mm/dd/yyyy hh:mm | test_user2 | Manage/Design | Add field comment (Record: 2, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: "Comment 5")     |
            | mm/dd/yyyy hh:mm | test_user2 | Manage/Design | Add field comment (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: email_v2, Comment: "Comment 4")     |
            | mm/dd/yyyy hh:mm | test_user2 | Manage/Design | Add field comment (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: ptname_v2_v2, Comment: "Comment 3") |
            | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Delete field comment (Record: 1, Field: ptname_v2_v2, Comment: "Comment 10")                            |
            | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Add field comment (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: ptname_v2_v2, Comment: "Comment 2") |
            | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Edit field comment (Record: 1, Field: ptname_v2_v2, Comment: "Comment 10")                              |
            | mm/dd/yyyy hh:mm | test_user1 | Manage/Design | Add field comment (Record: 1, Event: Event 1 (Arm 1: Arm 1), Field: ptname_v2_v2, Comment: "Comment 1") |

      And I logout