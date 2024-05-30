<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

<style>

    * {
        font-family: monospace, Courier;
        word-break: keep-all;
        table-layout: fixed;
    }

    table {
        border-collapse: collapse;
    }

    th, td {
        /* border: dashed grey 1px; */
        padding: 0.5rem 1rem;
    }

    tr:not(:last-child) td:nth-child(4) li::marker {
            color: black;
            font-size: 1.5rem;
            content: '✔';
        }

    .feature-body > *, .js-file-line {
        font-size: 12px;
    }

    .spec-script > * {
        font-size: 14px;        
        font-family: Arial, Helvetica, sans-serif;
    }

    .comments {
        font-size: 12px;
    }

    .comment {
        padding-bottom: 0.2rem;
    }

    .comment-edit {
        font-size: 11px;        
    }

    .timeline {
        font-size: 11px;
    }

    .index-good {
        font-size: 12px;
    }

    .index-errors {
        font-size: 11px;
    }

    .sub-header {
        font-size: 10px;
    }

</style>

## REDCap validation for v13.8.1

<div class="sub-header">
Generated on 30/05/2024 17:41:33 from github project id 10 by rmh54
</div>

<div class="sub-header">
* Note that currently the Project related events are not being picked up see
    See https://github.com/orgs/community/discussions/57326
    The audit trail related to moving columns within a project are not being pulled by graphql
</div>

### Index

<div class="index-good">
<a id=index-redcap_cypress-15 href=#redcap_cypress-15>redcap_cypress-15 | 1. Run Configuration Check</a>

<a id=index-redcap_cypress-12 href=#redcap_cypress-12>redcap_cypress-12 | 2. Add / Manage Users</a>

<a id=index-redcap_cypress-23 href=#redcap_cypress-23>redcap_cypress-23 | 3. Assign Administrators and Account Managers</a>

<a id=index-redcap_cypress-22 href=#redcap_cypress-22>redcap_cypress-22 | 5. Browse Projects</a>

<a id=index-redcap_cypress-24 href=#redcap_cypress-24>redcap_cypress-24 | 6. Assign User Rights</a>

<a id=index-redcap_cypress-25 href=#redcap_cypress-25>redcap_cypress-25 | 1. Two Factor Authentication</a>

<a id=index-redcap_cypress-26 href=#redcap_cypress-26>redcap_cypress-26 | 2. Alerts and Notifications</a>
</div>


<div class="index-errors">
#### The following features cannot be retrieved (uid | title -> error)


</div>

<br/>

### Features


***

<div id="redcap_cypress-15">**Feature:** 1. Run Configuration Check</div>

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**Id:** I_kwDOIaOBn86F-sWg                                                                                              **Uid:** redcap_cypress-15                                                     
                                                                                                                                                                                                        
**Author:** MintooXavier                                                                                                **Created:** 17/04/2024 09:19:15                                               
                                                                                                                                                                                                        
**Assignees:** CoreenDsouza                                                                                             **Resource path:** <a href=https://github.com//CCTC-team/redcap_cypress/issues/15 target=_blank>/CCTC-team/redcap_cypress/issues/15</a>
                                                                                                                                                                                                        
**Milestone:** |none|                                                                                                   **Labels:** Core feature || Gherkin || Automated                               
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**State:** OPEN                                                                                                         **State reason**: REOPENED                                                     
                                                                                                                                                                                                        
**Includes created edit:** true                                                                                         
                                                                                                                                                                                                        
**Closed:** false                                                                                                       **Closed on:** |none|                                                          
                                                                                                                                                                                                        
**Editor:** rmh54                                                                                                       **Updated on:** 30/05/2024 13:49:23                                            
                                                                                                                                                                                                        
**Locked:** false                                                                                                       **Participants:** MintooXavier || rmh54 || CoreenDsouza                        
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

**Project item body:** \
<div class="feature-body">
<p dir="auto">Brief description:<br>
Configuration checklist shows if the REDCap is configured correctly. It tells if the everything is installed correctly, REDCap file structure is correct, tables etc are properly configured.</p>
<p dir="auto">User spec:<br>
<a href="https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/run_configuration_check.spec">https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/run_configuration_check.spec</a></p>
<p dir="auto">Feature link:<br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Configuration%20Check/A.1.1.100%20-%20Run%20Configuration%20Check.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Configuration%20Check/A.1.1.100%20-%20Run%20Configuration%20Check.feature</a></p>
<p dir="auto">Pre review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The user requirements are met</li>
</ul>
<p dir="auto">Post review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) appropriately tests the feature</li>
</ul>
</div>

***

**User specification:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/run_configuration_check.spec_
| 
| A.1.1.100 - Control Center: The system shall support the ability to run a configuration check test page.
</div>

**Test script:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Configuration%20Check/A.1.1.100%20-%20Run%20Configuration%20Check.feature_
| 
| Feature: A.1.1.100 Run Configuration Check test page
| 
|   As a REDCap end user
|   I want to see that Configuration Checklist is functioning as expected
| 
|   Scenario: A.1.1.100.100 Configuration Checklist Tests
| 
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     Then I should be able to locate and visit the Control Center link labeled "Browse Projects"
|     And I should be able to locate and visit the Control Center link labeled "Edit a Project's Settings"
|     And I should be able to locate and visit the Control Center link labeled "Configuration Check"
|     And I should be able to locate and visit the Control Center link labeled "General Configuration"
|     And I should be able to locate and visit the Control Center link labeled "Security & Authentication"
|     And I should be able to locate and visit the Control Center link labeled "User Settings"
|     And I should be able to locate and visit the Control Center link labeled "File Upload Settings"
|     And I should be able to locate and visit the Control Center link labeled "Field Validation Types"
| 
|     When I click on the link labeled "Configuration Check"
|     Then I should see "Configuration Check"
|     And I should see "TEST 1"
|     And I should see "TEST 2"
|     And I should see "TEST 3"
|     And I should see "TEST 4"
|     And I should see "TEST 5"
|     And I should see "TEST 6"
</div>

***

**Comments:** \

<div class="comments">

</div>

***

**Timeline events:** \

<div class="timeline">
<div class="timeline">
LABELLED | *User:* MintooXavier *Created on:* 17/04/2024 09:19:15 *Label name:* Automated *Label description:* 

ASSIGNED | *User:* MintooXavier *Created on:* 17/04/2024 09:38:46 *Assignee:* CoreenDsouza

MILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 09:39:47 *Milestone:* v.13.8.1

LABELLED | *User:* MintooXavier *Created on:* 17/04/2024 09:40:25 *Label name:* Core feature *Label description:* Part of the RSVC core feature set

CLOSED | *User:* MintooXavier *Created on:* 17/04/2024 10:17:16 *Closed reason:* COMPLETED

DEMILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 10:23:13  *Milestone:* v.13.8.1

MILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 10:23:13 *Milestone:* v.14

REOPENED | *User:* MintooXavier *Created on:* 17/04/2024 10:55:59 *Reason:* REOPENED

DEMILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 12:20:50  *Milestone:* v.14

MILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 12:20:50 *Milestone:* v.13.8.1

DEMILESTONED | *User:* rmh54 *Created on:* 19/04/2024 08:40:06  *Milestone:* v.13.8.1

LABELLED | *User:* MintooXavier *Created on:* 22/04/2024 09:24:53 *Label name:* Gherkin *Label description:* Uses a Gherkin syntax

RENAMED TITLE | *User:* MintooXavier *Created on:* 29/05/2024 08:59:40 *Previous title:* 16. Data Import - Data Collection and Storage *Current title:* 1. Run Configuration Check
</div>
</div>


<br/>

--------------- feature ends ---------------

<br/>

***

<div id="redcap_cypress-12">**Feature:** 2. Add / Manage Users</div>

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**Id:** I_kwDOIaOBn86F-kpI                                                                                              **Uid:** redcap_cypress-12                                                     
                                                                                                                                                                                                        
**Author:** MintooXavier                                                                                                **Created:** 17/04/2024 09:05:46                                               
                                                                                                                                                                                                        
**Assignees:** MintooXavier                                                                                             **Resource path:** <a href=https://github.com//CCTC-team/redcap_cypress/issues/12 target=_blank>/CCTC-team/redcap_cypress/issues/12</a>
                                                                                                                                                                                                        
**Milestone:** |none|                                                                                                   **Labels:** Core feature || Gherkin || Automated                               
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**State:** OPEN                                                                                                         **State reason**: REOPENED                                                     
                                                                                                                                                                                                        
**Includes created edit:** true                                                                                         
                                                                                                                                                                                                        
**Closed:** false                                                                                                       **Closed on:** |none|                                                          
                                                                                                                                                                                                        
**Editor:** MintooXavier                                                                                                **Updated on:** 30/05/2024 11:23:13                                            
                                                                                                                                                                                                        
**Locked:** false                                                                                                       **Participants:** MintooXavier || rmh54                                        
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

**Project item body:** \
<div class="feature-body">
<p dir="auto">Brief description:<br>
This features is to add, update or delete a user from REDCap system (in control center).</p>
<p dir="auto">User spec:<br>
<a href="https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/add_manage_users.spec">https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/add_manage_users.spec</a></p>
<p dir="auto">Feature link:<br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.100%20-%20Create%20Users.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.100%20-%20Create%20Users.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.200%20-%20Suspend%20-%20Unsuspend.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.200%20-%20Suspend%20-%20Unsuspend.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.300%20-%20Search%20by%20Criteria.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.300%20-%20Search%20by%20Criteria.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.400%20-%20Delete.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.400%20-%20Delete.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.500%20-%20Tabular%20View.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.500%20-%20Tabular%20View.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.600%20-%20Account%20Lockout.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.600%20-%20Account%20Lockout.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.700%20-%20Account%20Lockout%20Time%20Change.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.700%20-%20Account%20Lockout%20Time%20Change.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.800%20-%20Auto-Logout%20Inactivity%20Time.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.800%20-%20Auto-Logout%20Inactivity%20Time.feature</a></p>
<p dir="auto">Pre review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The user requirements are met</li>
</ul>
<p dir="auto">Post review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) appropriately tests the feature</li>
</ul>
</div>

***

**User specification:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/add_manage_users.spec_
| 
| A.2.2.100 - Control Center - Users: The system shall support the ability create a single unique user with username	first name	last name	primary email	expiration date	and allow the user to create/copy projects.
| A.2.2.200 - Control Center - Users: The system shall support the ability to suspend/unsuspend individual user.					
| A.2.2.300 - Control Center - Users: The system shall support the ability to search for individual users and view/edit user information for username	first name	last name and/or primary email.			
| A.2.2.400 - Control Center - Users: The system shall support deleting a user.					
| A.2.2.500 - Control Center - Users: The system shall support viewing all users in tabular form.					
| A.2.2.600 - Control Center - System Configuration, Security & Authentication: The system shall support the number of failed login attempts before user is locked out for a specific amount of time.				
| A.2.2.700 - Control Center - System Configuration, Security & Authentication: The system shall support the amount of time user will be locked out after having failed login attempts.				
| A.2.2.800 - Control Center - System Configuration, Security & Authentication: The system shall support the amount of inactivity time before auto logout time.
</div>

**Test script:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.100%20-%20Create%20Users.feature_
| 
| Feature: A.2.2.100 Add/Manage users
| 
|  As a REDCap end user
|  I want to see that Add / Manage Users is functioning as expected
| 
|  Scenario: A.2.2.100.100 System-level User Settings
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "User Settings"
|     Then I should see "System-level User Settings"
| 
|     When I click on the link labeled "User Settings"
|     Then I should see "System-level User Settings"
| 
|     When I select "No, only Administrators can create new projects" on the dropdown field labeled "Allow normal users to create new projects?"
|     And I select "No" on the dropdown field labeled "By default, allow new users to create projects"
| 
|     When I click on the button labeled "Save Changes"
|     Then I should see "Your system configuration values have now been changed!"
| 
|  Scenario: A.2.2.100.200 Create a Table-based user
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Add Users (Table-based Only)"
|     Then I should see "User Management for Table-based Authentication"
| 
|     When I enter "Test_User1_Cypress" into the input field labeled "Username:"
|     And I enter "User1" into the input field labeled "First name:"
|     And I enter "Test" into the input field labeled "Last name:"
|     And I enter "Test_User1@redcap.edu" into the input field labeled "Primary email:"
|     And I check the checkbox labeled "Allow this user to request that projects be created for them by a REDCap administrator?"
|     And I click on the button labeled "Save"
|     Then I should see "User has been successfully saved."
|     And I should see "An email with login information was sent to: Test_User1@redcap.edu"
|     And I logout
|     # Reset password through email link
|     # leader will handle password change feature test
| 
|  Scenario: A.2.2.100.300 Create Table-based users via bulk upload
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Add Users (Table-based Only)"
|     Then I should see "User Management for Table-based Authentication"
| 
|     When I click on the link labeled "Create users (bulk upload)"
|     And I upload a "csv" format file located at "import_files/testusers_bulkupload.csv", by clicking the button near "Upload CSV file of new users" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|     Then I should see "User was successfully added, and an email with login info was sent to user"
|     And I should see "Test_User2"
|     And I should see "Test_User3"
|     And I should see "Test_User4"
| 
|  Scenario: A.2.2.100.400 Prevent a Second User with the Same Username
|    Given I login to REDCap with the user "Test_Admin"
|    And I click on the link labeled "Control Center"
|    And I click on the link labeled "Add Users (Table-based Only)"
|    Then I should see "User Management for Table-based Authentication"
| 
|    When I click on the link labeled "Add Users (Table-based Only)"
|    And I enter "Test_User1" into the input field labeled "Username:"
|    And I enter "User1" into the input field labeled "First name:"
|    And I enter "Test" into the input field labeled "Last name:"
|    And I enter "Test_User1@redcap.edu" into the input field labeled "Primary email:"
|    And I click on the button labeled "Save"
|    Then I should see "ERROR: The user could not be added!"
| 
|  Scenario: A.2.2.100.500 Search a Table-based user
|    Given I login to REDCap with the user "Test_Admin"
|    And I click on the link labeled "Control Center"
|    And I click on the link labeled "Browse Users"
|    Then I should see "User Search: Search for user by username, first name, last name, or primary email"
| 
|    When I enter "Test_User1" into the input field labeled "User Search: Search for user by username, first name, last name, or primary email"
|    And I click on the button labeled "Search"
|    Then I should see "Test_User1"
| 
|   Scenario: A.2.2.100.600 User has no control center access
|    Given I login to REDCap with the user "Test_User1"
|    Then I should NOT see "Control Center"
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.200%20-%20Suspend%20-%20Unsuspend.feature_
| 
| Feature: A.2.2.200 Add/Manage users
| 
|   As a REDCap end user
|   I want to see that Suspend/Unsuspend Individual Users is functioning as expected
| 
|   Scenario: A.2.2.200.100 Account suspension
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Add Users (Table-based Only)"
|     Then I should see "User Management for Table-based Authentication"
| 
|     #NOTE: We are testing Suspend / Unsuspend - NOT bulk upload feature
|     # Bulk upload steps are concessions to make this functional if performed manually
|     When I click on the link labeled "Create users (bulk upload)"
|     And I upload a "csv" format file located at "import_files/testusers_bulkupload.csv", by clicking the button near "Upload CSV file of new users" to browse for the file, and clicking the button labeled "Upload File" to upload the file
|     Then I should see "User was successfully added, and an email with login info was sent to user"
|     And I should see "Test_User1"
|     And I should see "Test_User2"
|     And I should see "Test_User3"
|     And I should see "Test_User4"
| 
|     When I click on the link labeled "Browse Users"
|     And I enter "Test_User1" into the input field labeled "User Search: Search for user by username, first name, last name, or primary email"
|     And I click on the button labeled "Search"
|     Then I should see "Test_User1"
| 
|     When I click on the button labeled "Suspend user account" and cancel the confirmation window
|     Then I should NOT see "Success! The user has now been suspended from REDCap"
|     And I should NOT see "unsuspend user"
| 
|     Given I logout
|     And I login to REDCap with the user "Test_User1"
|     Then I should see "Home"
|     And I logout
| 
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Browse Users"
|     Then I should see "User Search: Search for user by username, first name, last name, or primary email"
| 
|     When I enter "Test_User1" into the input field labeled "User Search: Search for user by username, first name, last name, or primary email"
|     And I click on the button labeled "Search"
|     Then I should see "Test_User1"
| 
|     When I click on the button labeled "Suspend user account" and accept the confirmation window
|     Then I should see a dialog containing the following text: "Success! The user has now been suspended from REDCap"
| 
|     Given I click on the button labeled "Close" in the dialog box
|     Then I should see "unsuspend user"
| 
|     When I click on the link labeled "View User List By Criteria"
|     And I select "Suspended users" on the dropdown field labeled "Display only:"
|     And I click on the button labeled "Display User List"
|     Then I should see "Loading..."
|     And I should see "User List"
|     And I should see a link labeled "Test_User1"
| 
|     Given I logout
|     And I login to REDCap with the user "Test_User1"
|     Then I should see "The following REDCap user account has been suspended:"
|     And I logout
| 
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Browse Users"
|     Then I should see "User Search: Search for user by username, first name, last name, or primary email"
| 
|     When I enter "Test_User1" into the input field labeled "User Search: Search for user by username, first name, last name, or primary email"
|     And I click on the button labeled "Search"
|     Then I should see "Test_User1"
| 
|     When I click on the link labeled "unsuspend user" and cancel the confirmation window
|     Then I should see "unsuspend user"
| 
|     Given I logout
|     And I login to REDCap with the user "Test_User1"
|     Then I should see "The following REDCap user account has been suspended:"
|     And I logout
| 
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Browse Users"
|     Then I should see "User Search: Search for user by username, first name, last name, or primary email"
| 
|     When I enter "Test_User1" into the input field labeled "User Search: Search for user by username, first name, last name, or primary email"
|     And I click on the button labeled "Search"
|     Then I should see "Test_User1"
| 
|     When I click on the link labeled "unsuspend user" and accept the confirmation window
|     Then I should see a dialog containing the following text: "Success! The user has now been unsuspended and will now be able to access REDCap again"
| 
|     When I click on the button labeled "Close" in the dialog box
|     And I should see a button labeled "Suspend user account"
| 
|     Given I logout
|     And I login to REDCap with the user "Test_User1"
|     Then I should see "Home"
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.300%20-%20Search%20by%20Criteria.feature_
| 
| Feature: A.2.2.300 Add/Manage users Control Center - Users: The system shall support the ability to search for individual users and view/edit user information for username, first name, last name and/or primary email.
| 
|   As a REDCap end user
|   I want to see that Search Users is functioning as expected.
| 
|   Scenario: A.2.2.300.100 Search by username, first name, last name and/or primary email
| 
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Browse Users"
|     And I click on the link labeled "View User List By Criteria"
|     Then I should see "View User List By Criteria"
| 
|     #FUNCTIONAL REQUIREMENT
|     ##ACTION Search by username with "Keyword search"
|     #Username is Test_Admin
|     When I enter "Test_Admin" into the field with the placeholder text of "Keyword search"
|     And I click on the button labeled "Display User List"
|     #VERIFY_SEARCH
|     Then I should see a table header and rows containing the following values in the browse users table:
|       | Username   | First Name   | Last Name  | Email                |
|       | test_admin | Admin        | User       | test_admin@test.edu |
| 
| 
|     #FUNCTIONAL REQUIREMENT
|     ##ACTION Search by First Name with "Keyword search"
|     When I click on the link labeled "View User List By Criteria"
|     And I enter "Admin" into the field with the placeholder text of "Keyword search"
|     And I click on the button labeled "Display User List"
|     Then I should see a table header and rows containing the following values in the browse users table:
|       | Username   | First Name   | Last Name  | Email                |
|       | test_admin | Admin        | User       | test_admin@test.edu |
| 
|     #FUNCTIONAL REQUIREMENT
|     ##ACTION Search by Last Name with "Keyword search"
|     When I click on the link labeled "View User List By Criteria"
|     And I enter "Test" into the field with the placeholder text of "Keyword search"
|     And I click on the button labeled "Display User List"
|     Then I should see a table header and rows containing the following values in the browse users table:
|       | Username   | First Name   | Last Name  | Email                |
|       | test_admin | Admin        | User       | test_admin@test.edu |
| 
|     #FUNCTIONAL REQUIREMENT
|     ##ACTION Search by Email with "Keyword search"
|     When I click on the link labeled "View User List By Criteria"
|     And I enter "test_admin@test.edu" into the field with the placeholder text of "Keyword search"
|     And I click on the button labeled "Display User List"
|     Then I should see a table header and rows containing the following values in the browse users table:
|       | Username   | First Name   | Last Name  | Email                |
|       | test_admin | Admin        | User       | test_admin@test.edu |
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.400%20-%20Delete.feature_
| 
| Feature: A.2.2.400 Add/Manage users
| 
|   As a REDCap end user
|   I want to see that Delete Users is functioning as expected.
| 
|   Scenario: A.2.2.400.100 Delete User Function
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Add Users (Table-based Only)"
|     Then I should see "Create single user"
| 
|     #SETUP_USER
|     When I enter "Delete_User" into the input field labeled "Username:"
|     And I enter "User_firstname" into the input field labeled "First name:"
|     And I enter "User_lastname" into the input field labeled "Last name:"
|     And I enter "Delete_User@test.edu" into the input field labeled "Primary email:"
|     And I click on the button labeled "Save"
|     Then I should see "User has been successfully saved."
| 
|     When I click on the link labeled "Browse Users"
|     Then I should see "User Search: Search for user by username, first name, last name, or primary email"
| 
|     When I enter "Delete_User" into the input field labeled "User Search: Search for user by username, first name, last name, or primary email"
|     And I click on the button labeled "Search"
|     Then I should see "Editable user attributes"
|     And I should see "Delete_User"
| 
|     #FUNCTIONAL REQUIREMENT
|     ##ACTION Cancel delete user
|     Given I click on the button labeled "Delete user from system" and cancel the confirmation window
|     Then I should NOT see "The user 'Delete_User' has now been removed and deleted from all REDCap projects"
| 
|     When I click on the link labeled "Browse Users"
|     Then I should see "User Search: Search for user by username, first name, last name, or primary email"
| 
|     #VERIFY User exists
|     When I enter "Delete_User" into the input field labeled "User Search: Search for user by username, first name, last name, or primary email"
|     And I click on the button labeled "Search"
|     Then I should see "Editable user attributes"
|     And I should see "Delete_User"
| 
|     #FUNCTIONAL REQUIREMENT
|     ##ACTION Delete user
|     When I click on the button labeled "Delete user from system" and accept the confirmation window
|     Then I should see "The user 'Delete_User' has now been removed and deleted from all REDCap projects"
|     And I click on the button labeled "Close"
| 
|     #VERIFY User does not exist
|     When I click on the link labeled "Browse Users"
|     Then I should see "User Search: Search for user by username, first name, last name, or primary email"
| 
|     When I enter "Delete_User" into the input field labeled "User Search: Search for user by username, first name, last name, or primary email"
|     And I click on the button labeled "Search"
|     Then I should see "User does not exist!"
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.500%20-%20Tabular%20View.feature_
| 
| Feature: A.2.2.500 Add/Manage users
| 
|   As a REDCap end user
|   I want to see that Users in tabular form is functioning as expected
| 
|   Scenario: A.2.2.500.100 Users in tabular form
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Browse Users"
|     Then I should see "User Search: Search for user by username, first name, last name, or primary email"
| 
|     #FUNCTIONAL REQUIREMENT
|     ##ACTION View Users in tabular form
|     When I click on the link labeled "View User List By Criteria"
|     And I select "All users" on the dropdown field labeled "Display only:"
|     And I click on the button labeled "Display User List"
| 
|     #VERIFY View Users in tabular form
|     Then I should see a table header and rows containing the following values in the browse users table:
|       | Username   | First Name   | Last Name  | Email                |
|       | test_admin | Admin        | User       | test_admin@test.edu |
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.600%20-%20Account%20Lockout.feature_
| 
| Feature: A.2.2.600 Add/Manage users
| 
|   As a REDCap end user
|   I want to see that Users failed login lockout is functioning as expected.
| 
|   Scenario: A.2.2.600.100 User account locked out after too many attempts
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Security & Authentication"
|     Then I should see "Security & Authentication Configuration"
| 
|     When I clear the field labeled "Number of failed login attempts before user is locked out for a specified amount of time, which is set below."
|     And I enter "1" into the input field labeled "Number of failed login attempts before user is locked out for a specified amount of time, which is set below."
|     And I clear the field labeled "Amount of time user will be locked out after having failed login attempts exceeding the limit set above."
|     And I enter "2" into the input field labeled "Amount of time user will be locked out after having failed login attempts exceeding the limit set above."
|     And I click on the button labeled "Save Changes"
|     Then I should see "Your system configuration values have now been changed!"
|     Given I logout
| 
|     Given I enter "Test_User1" into the input field labeled "Username:"
|     And I enter "test" into the input field labeled "Password:"
|     And I click on the button labeled "Log In"
|     Then I should see "ERROR: You entered an invalid user name or password!"
| 
|     Given I enter "Test_User1" into the input field labeled "Username:"
|     And I enter "test" into the input field labeled "Password:"
|     And I click on the button labeled "Log In"
|     Then I should see "ACCESS DENIED!"
| 
|     Given I wait for 2 minutes
| 
|     Given I login to REDCap with the user "Test_User1"
|     And I see "My Projects"
|     Given I logout
| 
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Security & Authentication"
|     Then I should see "Security & Authentication Configuration"
| 
|     When I clear the field labeled "Number of failed login attempts before user is locked out for a specified amount of time, which is set below."
|     And I enter "2" into the input field labeled "Number of failed login attempts before user is locked out for a specified amount of time, which is set below."
|     And I clear the field labeled "Amount of time user will be locked out after having failed login attempts exceeding the limit set above."
|     And I enter "1" into the input field labeled "Amount of time user will be locked out after having failed login attempts exceeding the limit set above."
|     And I click on the button labeled "Save Changes"
|     Then I should see "Your system configuration values have now been changed!"
|     Given I logout
| 
|     Given I enter "Test_User1" into the input field labeled "Username:"
|     And I enter "test" into the input field labeled "Password:"
|     And I click on the button labeled "Log In"
|     Then I should see "ERROR"
| 
|     Given I enter "Test_User1" into the input field labeled "Username:"
|     And I enter "test" into the input field labeled "Password:"
|     And I click on the button labeled "Log In"
|     Then I should see "ERROR"
| 
|     Given I enter "Test_User1" into the input field labeled "Username:"
|     And I enter "test" into the input field labeled "Password:"
|     And I click on the button labeled "Log In"
|     Then I should see "ACCESS DENIED!"
| 
|     Given I wait for 1 minute
| 
|     Given I login to REDCap with the user "Test_User1"
|     And I see "My Projects"
|     Given I logout
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.700%20-%20Account%20Lockout%20Time%20Change.feature_
| 
| Feature: A.2.2.700 Add/Manage users
| 
|   As a REDCap end user
|   I want to see that Users failed login lockout is functioning as expected.
| 
|   Scenario: A.2.2.700.100 User account locked time
|     Given I login to REDCap with the user "Test_Admin"
|     When I click on the link labeled "Control Center"
|     And I click on the link labeled "Security & Authentication"
|     Then I should see "Security & Authentication Configuration"
| 
|     Given I clear the field labeled "Number of failed login attempts before user is locked out for a specified amount of time, which is set below."
|     When I enter "1" into the input field labeled "Number of failed login attempts before user is locked out for a specified amount of time, which is set below."
|     And I clear the field labeled "Amount of time user will be locked out after having failed login attempts exceeding the limit set above."
|     And I enter "2" into the input field labeled "Amount of time user will be locked out after having failed login attempts exceeding the limit set above."
|     And I click on the button labeled "Save Changes"
|     Then I should see "Your system configuration values have now been changed!"
|     And I logout
| 
|     #Login with bad password; first failed attempt at logging in
|     Given I enter "Test_User1" into the input field labeled "Username:"
|     And I enter "test" into the input field labeled "Password:"
|     And I click on the button labeled "Log In"
|     Then I should see "ERROR: You entered an invalid user name or password!"
| 
|     #Try to login again with a bad password; we will be locked out
|     Given I enter "Test_User1" into the input field labeled "Username:"
|     And I enter "test" into the input field labeled "Password:"
|     And I click on the button labeled "Log In"
|     Then I should see "ACCESS DENIED!"
| 
|     #Try logging in again after 1 minute
|     Given I wait for 1 minute
|     Given I attempt to login to REDCap with the user "Test_User1"
|     Then I should see "ACCESS DENIED!"
| 
|     #2 minutes of waiting total; now we can login
|     Given I wait for another 1 minute
|     When I attempt to login to REDCap with the user "Test_User1"
|     Then I should see "My Projects"
|     And I logout
| 
|     Given I login to REDCap with the user "Test_Admin"
|     When I click on the link labeled "Control Center"
|     Then I click on the link labeled "Security & Authentication"
|     And I should see "Security & Authentication Configuration"
| 
|     Given I clear the field labeled "Number of failed login attempts before user is locked out for a specified amount of time, which is set below."
|     When I enter "1" into the input field labeled "Number of failed login attempts before user is locked out for a specified amount of time, which is set below."
|     And I clear the field labeled "Amount of time user will be locked out after having failed login attempts exceeding the limit set above."
|     And I enter "1" into the input field labeled "Amount of time user will be locked out after having failed login attempts exceeding the limit set above."
|     And I click on the button labeled "Save Changes"
|     Then I should see "Your system configuration values have now been changed!"
|     And I logout
| 
|     #Login with bad password; first failed attempt at logging in
|     Given I enter "Test_User1" into the input field labeled "Username:"
|     And I enter "test" into the input field labeled "Password:"
|     And I click on the button labeled "Log In"
|     Then I should see "ERROR: You entered an invalid user name or password!"
| 
|     #Try to login again with a bad password and we will be locked out
|     Given I enter "Test_User1" into the input field labeled "Username:"
|     And I enter "test" into the input field labeled "Password:"
|     And I click on the button labeled "Log In"
|     Then I should see "ACCESS DENIED!"
| 
|     #We only have to wait for 1 minute total this time
|     Given I wait for 1 minute
|     When I attempt to login to REDCap with the user "Test_User1"
|     Then I should see "My Projects"
|     And I logout
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Add%20Manage%20Users/A.2.2.800%20-%20Auto-Logout%20Inactivity%20Time.feature_
| 
| Feature: A.2.2.800 Add/Manage users
| 
|   As a REDCap end user
|   I want to see that amount of inactivity time before auto logout time is functioning as expected.
| 
|   Scenario: A.2.2.800.100 User account locked time
| 
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Security & Authentication"
|     Then I should see "Security & Authentication Configuration"
| 
|     When I clear the field labeled "Auto logout time"
|     And I enter "4" into the input field labeled "Auto logout time"
|     And I click on the button labeled "Save Changes"
|     Then I should see "Your system configuration values have now been changed!"
|     Given I logout
| 
|     Given I login to REDCap with the user "Test_User1"
|     And I see "My Projects"
| 
|     Given I wait for 2 minutes
|     Then I should see a dialog containing the following text: "REDCap Auto Logout Warning"
| 
|     Given I wait for another 2 minutes
|     Then I should see a dialog containing the following text: "Due to inactivity, your REDCap session has expired"
| 
|     Given I click on the button labeled "Log In" in the dialog box
|     Then I should see "Please log in with your user name and password."
| 
|     Given I login to REDCap with the user "Test_User1"
|     And I see "My Projects"
|     Given I logout
| 
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Security & Authentication"
|     Then I should see "Security & Authentication Configuration"
| 
|     When I clear the field labeled "Auto logout time"
|     And I enter "3" into the input field labeled "Auto logout time"
|     And I click on the button labeled "Save Changes"
|     Then I should see "Your system configuration values have now been changed!"
|     Given I logout
| 
|     Given I login to REDCap with the user "Test_User1"
|     Given I wait for 2 minutes
|     Then I should see a dialog containing the following text: "REDCap Auto Logout Warning"
| 
|     Given I wait for 1 minute
|     Then I should see a dialog containing the following text: "Due to inactivity, your REDCap session has expired"
| 
|     Given I click on the button labeled "Log In" in the dialog box
|     Then I should see "Please log in with your user name and password."
| 
|     Given I login to REDCap with the user "Test_User1"
|     And I see "My Projects"
|     Given I logout
| 
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Security & Authentication"
|     Then I should see "Security & Authentication Configuration"
| 
|     When I clear the field labeled "Auto logout time"
|     And I enter "20" into the input field labeled "Auto logout time"
|     And I click on the button labeled "Save Changes"
|     Then I should see "Your system configuration values have now been changed!"
|     Given I logout
</div>

***

**Comments:** \

<div class="comments">
<div class="comment">
**Comment:**

*Author:* MintooXavier *Updated on:* 17/04/2024 09:21:40

*Comment body:* <p dir="auto">Rewrite SCenario 14 <a class="user-mention notranslate" data-hovercard-type="user" data-hovercard-url="/users/rmh54/hovercard" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="https://github.com/rmh54">@rmh54</a></p>

*Comment edits:* 

<div class="comment-edit">
*Created:* 17/04/2024 09:21:40 *Edited on:* 17/04/2024 09:21:40 *Edited by:* MintooXavier *Deleted on:* |none| *Deleted by:* |none|

*Diff:*

Rewrite SCenario 14 @rmh54 
</div>
<div class="comment-edit">
*Created:* 17/04/2024 09:21:40 *Edited on:* 17/04/2024 09:21:06 *Edited by:* MintooXavier *Deleted on:* |none| *Deleted by:* |none|

*Diff:*

Rewrite SCenario 14
</div>
</div>

<div class="comment">
**Comment:**

*Author:* MintooXavier *Updated on:* 17/04/2024 09:22:40

*Comment body:* <p dir="auto">Completed rewriting Scenario 14</p>


</div>
</div>

***

**Timeline events:** \

<div class="timeline">
<div class="timeline">
LABELLED | *User:* MintooXavier *Created on:* 17/04/2024 09:05:46 *Label name:* Automated *Label description:* 

ASSIGNED | *User:* MintooXavier *Created on:* 17/04/2024 09:20:28 *Assignee:* MintooXavier

ISSUE COMMENT | *User:* MintooXavier *Created on:* 17/04/2024 09:21:06 *Issue comment body:* <p dir="auto">Rewrite SCenario 14 <a class="user-mention notranslate" data-hovercard-type="user" data-hovercard-url="/users/rmh54/hovercard" data-octo-click="hovercard-link-click" data-octo-dimensions="link_type:self" href="https://github.com/rmh54">@rmh54</a></p>

MENTIONED | *User:* rmh54 *Created on:* 17/04/2024 09:21:41

SUBSCRIBED | *User:* rmh54 *Created on:* 17/04/2024 09:21:41

ISSUE COMMENT | *User:* MintooXavier *Created on:* 17/04/2024 09:22:40 *Issue comment body:* <p dir="auto">Completed rewriting Scenario 14</p>

MILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 09:39:30 *Milestone:* v.13.8.1

LABELLED | *User:* MintooXavier *Created on:* 17/04/2024 09:40:41 *Label name:* Core feature *Label description:* Part of the RSVC core feature set

CLOSED | *User:* MintooXavier *Created on:* 17/04/2024 10:16:23 *Closed reason:* COMPLETED

DEMILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 10:22:53  *Milestone:* v.13.8.1

MILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 10:22:53 *Milestone:* v.14

REOPENED | *User:* MintooXavier *Created on:* 17/04/2024 10:54:49 *Reason:* REOPENED

DEMILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 12:20:48  *Milestone:* v.14

MILESTONED | *User:* MintooXavier *Created on:* 17/04/2024 12:20:48 *Milestone:* v.13.8.1

CLOSED | *User:* rmh54 *Created on:* 18/04/2024 09:50:06 *Closed reason:* COMPLETED

REOPENED | *User:* rmh54 *Created on:* 18/04/2024 09:50:18 *Reason:* REOPENED

DEMILESTONED | *User:* rmh54 *Created on:* 19/04/2024 08:41:29  *Milestone:* v.13.8.1

UNLABELLED | *User:* MintooXavier *Created on:* 22/04/2024 09:22:09 *Label name:* Core feature *Label description:* Part of the RSVC core feature set

LABELLED | *User:* MintooXavier *Created on:* 22/04/2024 09:24:36 *Label name:* Gherkin *Label description:* Uses a Gherkin syntax

LABELLED | *User:* MintooXavier *Created on:* 22/04/2024 09:24:42 *Label name:* Core feature *Label description:* Part of the RSVC core feature set

RENAMED TITLE | *User:* MintooXavier *Created on:* 29/05/2024 08:58:22 *Previous title:* 17. Data Comparison Tool / DDE Module *Current title:* 2. Add / Manage Users
</div>
</div>


<br/>

--------------- feature ends ---------------

<br/>

***

<div id="redcap_cypress-23">**Feature:** 3. Assign Administrators and Account Managers</div>

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**Id:** I_kwDOIaOBn86Kc9WH                                                                                              **Uid:** redcap_cypress-23                                                     
                                                                                                                                                                                                        
**Author:** MintooXavier                                                                                                **Created:** 29/05/2024 09:36:25                                               
                                                                                                                                                                                                        
**Assignees:** |none|                                                                                                   **Resource path:** <a href=https://github.com//CCTC-team/redcap_cypress/issues/23 target=_blank>/CCTC-team/redcap_cypress/issues/23</a>
                                                                                                                                                                                                        
**Milestone:** |none|                                                                                                   **Labels:** Core feature || Gherkin || Automated                               
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**State:** OPEN                                                                                                         **State reason**: |not applicable|                                             
                                                                                                                                                                                                        
**Includes created edit:** true                                                                                         
                                                                                                                                                                                                        
**Closed:** false                                                                                                       **Closed on:** |none|                                                          
                                                                                                                                                                                                        
**Editor:** MintooXavier                                                                                                **Updated on:** 30/05/2024 11:24:26                                            
                                                                                                                                                                                                        
**Locked:** false                                                                                                       **Participants:** MintooXavier                                                 
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

**Project item body:** \
<div class="feature-body">
<p dir="auto">Brief description:<br>
This features is to add a user as an admin in REDCap system (in control center).</p>
<p dir="auto">User spec:<br>
<a href="https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/assign_administrators_and_account_managers.spec">https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/assign_administrators_and_account_managers.spec</a></p>
<p dir="auto">Feature link:<br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Assign%20Administrators/A.2.3.100%20-%20Administrators%20Table.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Assign%20Administrators/A.2.3.100%20-%20Administrators%20Table.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Assign%20Administrators/A.2.3.200%20-%20Add%20Remove%20Admins.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Assign%20Administrators/A.2.3.200%20-%20Add%20Remove%20Admins.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Assign%20Administrators/A.2.3.300%20-%20Super%20Users%20and%20Account%20Managers.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Assign%20Administrators/A.2.3.300%20-%20Super%20Users%20and%20Account%20Managers.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Assign%20Administrators/A.2.3.400%20-%20Assign%20Administrators%20and%20Account%20Managers.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Assign%20Administrators/A.2.3.400%20-%20Assign%20Administrators%20and%20Account%20Managers.feature</a></p>
<p dir="auto">Pre review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The user requirements are met</li>
</ul>
<p dir="auto">Post review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) appropriately tests the feature</li>
</ul>
</div>

***

**User specification:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/assign_administrators_and_account_managers.spec_
| 
| A.2.3.100 - Control Center: The system shall support viewing all current administrators and account managers.					
| A.2.3.200 - Control Center: The system shall support the granting and revoking administrators' and account managers' access to the system to individual users.					
| A.2.3.300 - Control Center: The system shall support the granting and revoking administrators' ability to modify system configuration pages.					
| A.2.3.400 - Control Center: The system shall support the granting and revoking of administrators' ability to access to all projects and data with maximum user privileges.
</div>

**Test script:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Assign%20Administrators/A.2.3.100%20-%20Administrators%20Table.feature_
| 
| Feature: A.2.3.100 Assign administrators and account managers
| 
|   As a REDCap end user
|   I want to see that Control Center is functioning as expected
| 
|   Scenario: A.2.3.100.100 View administrator accounts
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Administrator Privileges"
|     Then I should see "Set administrator privileges"
|     And I should see a table header and rows containing the following values in the administrators table:
|       | Administrators          |
|       | Test_Admin (Admin User) |
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Assign%20Administrators/A.2.3.200%20-%20Add%20Remove%20Admins.feature_
| 
| Feature: A.2.3.200 Assign administrators and account managers
| 
|   As a REDCap end user
|   I want to see that Assign Super Users / Account Managers is functioning as expected
| 
|   Scenario: A.2.3.200.100 Give/remove user admin user rights
|     Given I login to REDCap with the user "Test_Admin"
|     When I click on the link labeled "Control Center"
|     Then I click on the link labeled "Administrator Privileges"
|     And I should see "Set administrator privileges"
| 
|     Given I enter "Test_User1" into the field with the placeholder text of "Search users to add as admin"
|     When I enable the Administrator Privilege "Set administrator privileges" for a new administrator
|     And I click on the button labeled "Add"
|     Then I should see 'The user "Test_User1" has now been granted one or more administrator privileges'
| 
|     Given I click on the button labeled "OK"
|     Then I should see "Test_User1"
| 
|     Given I click on the link labeled "Control Center"
|     When I click on the link labeled "Administrator Privileges"
|     Then I should see "Set administrator privileges"
|     And I should see "Test_User1"
| 
|     Given I logout
|     When I login to REDCap with the user "Test_User1"
|     Then I should see a link labeled "Control Center"
| 
|     Given I logout
|     When I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Administrator Privileges"
|     Then I should see "Set administrator privileges"
| 
|     Given I disable the Administrator Privilege "Set administrator privileges" for the administrator "Test_User1"
|     Then I should see a dialog containing the following text: "Please be aware that you have unchecked ALL the administrator privileges for this user"
| 
|     Given I click on the button labeled "Close" in the dialog box
|     When I click on the link labeled "Administrator Privileges"
|     Then I should see "Set administrator privileges"
|     And I should NOT see "Test_User1"
| 
|     Given I logout
|     When I login to REDCap with the user "Test_User1"
|     Then I should NOT see a link labeled "Control Center"
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Assign%20Administrators/A.2.3.300%20-%20Super%20Users%20and%20Account%20Managers.feature_
| 
| Feature: A.2.3.300 Assign administrators and account managers
| 
|   As a REDCap end user
|   I want to see that Assign Super Users / Account Managers is functioning as expected
| 
|   Scenario: A.2.3.300.100 Modify and Revoke Admin's User Rights
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Administrator Privileges"
|     Then I should see "Set administrator privileges"
| 
|     When I enter "Test_User1" into the field with the placeholder text of "Search users to add as admin"
|     And I enable the Administrator Privilege "Set administrator privileges" for a new administrator
|     And I click on the button labeled "Add"
|     Then I should see 'The user "Test_User1" has now been granted one or more administrator privileges'
|     And I click on the button labeled "OK"
|     And I should see "Test_User1"
| 
|     When I click on the link labeled "Control Center"
|     And I click on the link labeled "Administrator Privileges"
|     Then I should see "Set administrator privileges"
|     And I enable the Administrator Privilege "Manage user accounts" for the administrator "Test_User1"
|     And I enable the Administrator Privilege "Modify system configuration pages" for the administrator "Test_User1"
|     Given I logout
| 
|     Given I login to REDCap with the user "Test_User1"
|     When I click on the link labeled "Control Center"
|     Then I should see "Control Center Home"
|     And I should see a link labeled "Browse Projects"
|     And I should see a link labeled "Browse Users"
|     And I should see a link labeled "Multi-Language Management"
|     And I should see a link labeled "General Configuration"
|     Given I logout
| 
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Administrator Privileges"
|     Then I should see "Set administrator privileges"
| 
|     Given I enable the Administrator Privilege "Access to Control Center dashboards" for the administrator "Test_User1"
|     When I disable the Administrator Privilege "Set administrator privileges" for the administrator "Test_User1"
|     And I disable the Administrator Privilege "Manage user accounts" for the administrator "Test_User1"
|     And I disable the Administrator Privilege "Modify system configuration pages" for the administrator "Test_User1"
|     And I logout
|     And I login to REDCap with the user "Test_User1"
|     Then I should see a link labeled "Control Center"
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Assign%20Administrators/A.2.3.400%20-%20Assign%20Administrators%20and%20Account%20Managers.feature_
| 
| Feature: A.2.3.400 Assign administrators and account managers
| 
|   As a REDCap end user
|   I want to see that Assign Super Users / Account Managers is functioning as expected
| 
|   Scenario: A.2.3.400.100 Give and remove user maximum user privileges
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Administrator Privileges"
|     Then I should see "Set administrator privileges"
| 
|     When I enter "Test_User1" into the field with the placeholder text of "Search users to add as admin"
|     And I enable the Administrator Privilege "Set administrator privileges" for a new administrator
|     And I enable the Administrator Privilege "Access to all projects and data" for a new administrator
|     And I enable the Administrator Privilege "Manage user accounts" for a new administrator
|     And I enable the Administrator Privilege "Perform REDCap upgrades" for a new administrator
|     And I enable the Administrator Privilege "Install, upgrade, and configure" for a new administrator
|     And I enable the Administrator Privilege "Modify system configuration pages" for a new administrator
|     And I enable the Administrator Privilege "Access to Control Center dashboards" for a new administrator
|     And I click on the button labeled "Add"
|     Then I should see 'The user "Test_User1" has now been granted one or more administrator privileges'
|     And I click on the button labeled "OK" in the dialog box
| 
|     Given I logout
|     And I login to REDCap with the user "Test_User1"
|     And I click on the link labeled "Control Center"
|     Then I should see "Control Center Home"
|     And I should see a link labeled "Browse Projects"
|     And I should see a link labeled "Browse Users"
|     And I should see a link labeled "General Configuration"
| 
|     Given I logout
|     And I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Administrator Privilege"
|     Then I should see "Set administrator privileges"
|     When I disable the Administrator Privilege "Set administrator privileges" for the administrator "Test_User1"
|     And I disable the Administrator Privilege "Access to all projects and data" for the administrator "Test_User1"
|     And I disable the Administrator Privilege "Manage user accounts" for the administrator "Test_User1"
|     And I disable the Administrator Privilege "Perform REDCap upgrades" for the administrator "Test_User1"
|     And I disable the Administrator Privilege "Install, upgrade, and configure" for the administrator "Test_User1"
|     And I disable the Administrator Privilege "Modify system configuration pages" for the administrator "Test_User1"
|     And I disable the Administrator Privilege "Access to Control Center dashboards" for the administrator "Test_User1"
|     Then I should see a dialog containing the following text: "NOTICE"
|     And I should see a dialog containing the following text: "Please be aware that you have unchecked ALL the administrator privileges for this user"
|     And I click on the button labeled "Close" in the dialog box
| 
|     Given I logout
|     And I login to REDCap with the user "Test_User1"
|     Then I should NOT see "Control Panel"
|     And I logout
</div>

***

**Comments:** \

<div class="comments">

</div>

***

**Timeline events:** \

<div class="timeline">
<div class="timeline">
RENAMED TITLE | *User:* MintooXavier *Created on:* 29/05/2024 09:40:51 *Previous title:* 3. Assign administrators and account managers *Current title:* 3. Assign Administrators and Account Managers

LABELLED | *User:* MintooXavier *Created on:* 29/05/2024 10:38:50 *Label name:* Core feature *Label description:* Part of the RSVC core feature set

LABELLED | *User:* MintooXavier *Created on:* 29/05/2024 10:38:50 *Label name:* Gherkin *Label description:* Uses a Gherkin syntax

LABELLED | *User:* MintooXavier *Created on:* 29/05/2024 10:38:50 *Label name:* Automated *Label description:* 
</div>
</div>


<br/>

--------------- feature ends ---------------

<br/>

***

<div id="redcap_cypress-22">**Feature:** 5. Browse Projects</div>

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**Id:** I_kwDOIaOBn86KcyDF                                                                                              **Uid:** redcap_cypress-22                                                     
                                                                                                                                                                                                        
**Author:** MintooXavier                                                                                                **Created:** 29/05/2024 09:15:09                                               
                                                                                                                                                                                                        
**Assignees:** |none|                                                                                                   **Resource path:** <a href=https://github.com//CCTC-team/redcap_cypress/issues/22 target=_blank>/CCTC-team/redcap_cypress/issues/22</a>
                                                                                                                                                                                                        
**Milestone:** |none|                                                                                                   **Labels:** Core feature || Gherkin || Automated                               
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**State:** OPEN                                                                                                         **State reason**: |not applicable|                                             
                                                                                                                                                                                                        
**Includes created edit:** true                                                                                         
                                                                                                                                                                                                        
**Closed:** false                                                                                                       **Closed on:** |none|                                                          
                                                                                                                                                                                                        
**Editor:** MintooXavier                                                                                                **Updated on:** 30/05/2024 11:25:28                                            
                                                                                                                                                                                                        
**Locked:** false                                                                                                       **Participants:** MintooXavier                                                 
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

**Project item body:** \
<div class="feature-body">
<p dir="auto">Brief description:<br>
This feature is used to test if we can browse for a project, sort and filter it according to the filter column.</p>
<p dir="auto">User spec:<br>
<a href="https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/browse_projects.spec">https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/browse_projects.spec</a></p>
<p dir="auto">Feature link:<br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Browse%20Projects/A.1.5.100%20-%20Browse%20Projects.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Browse%20Projects/A.1.5.100%20-%20Browse%20Projects.feature</a></p>
<p dir="auto">Pre review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The user requirements are met</li>
</ul>
<p dir="auto">Post review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) appropriately tests the feature</li>
</ul>
</div>

***

**User specification:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/browse_projects.spec_
| 
| A.1.5.100 - Control Center: The system shall support viewing all projects by username, first name, last name and primary email address.
</div>

**Test script:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/A/Browse%20Projects/A.1.5.100%20-%20Browse%20Projects.feature_
| 
| Feature: A.1.5.100 Browse Projects
| 
|   As a REDCap end user
|   I want to see that I have the ability to access, search, and filter projects
| 
|   Scenario: A.1.5.100.100 Search/Sort project and Locate by User
|     Given I login to REDCap with the user "Test_Admin"
|     And I create a new project named "A.1.5.100.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button
|     And I click on the link labeled "Control Center"
|     And I click on the link labeled "Browse Projects"
|     Then I should see "Viewing projects accessible by user:"
| 
|     When I click on the button labeled "View all projects"
|     Then I should see "A.1.5.100.100"
| 
|     When I click on the link labeled "Control Center"
|     And I click on the link labeled "Browse Projects"
|     Then I should see "Viewing projects accessible by user:"
| 
|     When I enter "A.1.5.100.100" into the input field labeled "Search project title by keyword(s):"
|     And I click on the button labeled "Search project title"
|     Then I should see a row labeled "A.1.5.100.100" in the projects table
| 
|     When I click on the link labeled "Browse Projects"
|     Then I should see "Viewing projects accessible by user:"
| 
|     When I click on the button labeled "View all projects"
|     Then I should see "A.1.5.100.100"
| 
|     When I click on the table heading column labeled "Project Title"
|     Then I should see projects sorted correctly when I click on "Project Title" to sort in either direction
| 
|     When I click on the table heading column labeled "Records"
|     Then I should see projects sorted correctly when I click on "Records" to sort in either direction
| 
|     When I click on the table heading column labeled "Fields"
|     Then I should see projects sorted correctly when I click on "Fields" to sort in either direction
| 
|     When I click on the table heading column labeled "Instruments"
|     Then I should see projects sorted correctly when I click on "Instruments" to sort in either direction
| 
|     When I click on the table heading column labeled "Type"
|     Then I should see projects sorted correctly when I click on "Type" to sort in either direction
| 
|     When I click on the table heading column labeled "Status"
|     Then I should see projects sorted correctly when I click on "Status" to sort in either direction
| 
|     When I click on the table heading column labeled "PID"
|     Then I should see projects sorted correctly when I click on "PID" to sort in either direction
| 
|     When I click on the link labeled "Control Center"
|     And I click on the link labeled "Browse Projects"
|     Then I should see "Viewing projects accessible by user:"
| 
|     When I enter "Test_Admin" into the input field labeled "Viewing projects accessible by user:"
|     And I click on the button labeled exactly "View"
|     Then I should see "A.1.5.100.100"
</div>

***

**Comments:** \

<div class="comments">

</div>

***

**Timeline events:** \

<div class="timeline">
<div class="timeline">
LABELLED | *User:* MintooXavier *Created on:* 29/05/2024 10:38:36 *Label name:* Core feature *Label description:* Part of the RSVC core feature set

LABELLED | *User:* MintooXavier *Created on:* 29/05/2024 10:38:36 *Label name:* Gherkin *Label description:* Uses a Gherkin syntax

LABELLED | *User:* MintooXavier *Created on:* 29/05/2024 10:38:36 *Label name:* Automated *Label description:* 
</div>
</div>


<br/>

--------------- feature ends ---------------

<br/>

***

<div id="redcap_cypress-24">**Feature:** 6. Assign User Rights</div>

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**Id:** I_kwDOIaOBn86Kc_y5                                                                                              **Uid:** redcap_cypress-24                                                     
                                                                                                                                                                                                        
**Author:** MintooXavier                                                                                                **Created:** 29/05/2024 09:41:14                                               
                                                                                                                                                                                                        
**Assignees:** |none|                                                                                                   **Resource path:** <a href=https://github.com//CCTC-team/redcap_cypress/issues/24 target=_blank>/CCTC-team/redcap_cypress/issues/24</a>
                                                                                                                                                                                                        
**Milestone:** |none|                                                                                                   **Labels:** Core feature || Gherkin || Automated                               
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**State:** OPEN                                                                                                         **State reason**: |not applicable|                                             
                                                                                                                                                                                                        
**Includes created edit:** true                                                                                         
                                                                                                                                                                                                        
**Closed:** false                                                                                                       **Closed on:** |none|                                                          
                                                                                                                                                                                                        
**Editor:** MintooXavier                                                                                                **Updated on:** 30/05/2024 11:24:59                                            
                                                                                                                                                                                                        
**Locked:** false                                                                                                       **Participants:** MintooXavier                                                 
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

**Project item body:** \
<div class="feature-body">
<p dir="auto">Brief description:<br>
This feature is used to tests the access rights (access to CRFS, data export right, etc) of a user within a project.</p>
<p dir="auto">User spec:<br>
<a href="https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/assign_user_rights.spec">https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/assign_user_rights.spec</a></p>
<p dir="auto">Feature link:<br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.100%20-%20Basic%20Privileges.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.100%20-%20Basic%20Privileges.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.200%20-%20Data%20Entry%20Form%20Access.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.200%20-%20Data%20Entry%20Form%20Access.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.300%20-%20Data%20Export%20Rights.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.300%20-%20Data%20Export%20Rights.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.400%20-%20Creating%20Copying%20Deleting%20Roles.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.400%20-%20Creating%20Copying%20Deleting%20Roles.feature</a><br>
<a href="https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.500%20-%20Adding%20and%20Removing%20Users%20from%20Roles.feature">https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.500%20-%20Adding%20and%20Removing%20Users%20from%20Roles.feature</a></p>
<p dir="auto">Pre review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The user requirements are met</li>
</ul>
<p dir="auto">Post review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) appropriately tests the feature</li>
</ul>
</div>

***

**User specification:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/core/assign_user_rights.spec_
| 
| B.2.6.100 - Project Level: The system shall allow the ability to add, edit or delete user access to application tools for Basic Privileges and expiration date.				
| B.2.6.200 - Project Level: The system shall allow data entry form user access to be (No Access / Read Only / View & Edit / Edit survey responses).					
| B.2.6.300 - Project Level: The system shall allow instrument level data export rights to be (No Access, De-Identified, Remove All Identifier Fields, Full Data Set).		
| B.2.6.400 - Project Level: The system shall allow for the creation, copying and deletion of user roles.				
| B.2.6.500 - Project Level: The system shall support adding and removing users from user roles.
</div>

**Test script:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.100%20-%20Basic%20Privileges.feature_
| 
| Feature: B.2.6.100 Assign user rights Project Level:  The system shall allow the ability to add, edit or delete user access to application tools for "Basic Privileges" and expiration date.
| 
|   As a REDCap end user
|   I want to see that project level user access is functioning as expected
| 
|   Scenario: B.2.6.100.100 Project level User Rights functions (Add, Edit, Expire, Remove)
| 
|     #SETUP
|     Given I login to REDCap with the user "Test_Admin"
|     And I create a new project named "B.2.6.100.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button
|     And I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.100.100"
|     When I click on the link labeled "Project Setup"
|     And I click on the button labeled "Move project to production"
|     And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
|     And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
|     Then I should see Project status: "Production"
| 
|     #FUNCTIONAL REQUIREMENT
|     ##ACTION: Add User with Basic custom rights
| 
|     When I click on the link labeled "User Rights"
|     And I enter "Test_User1" into the input field labeled "Add with custom rights"
|     And I click on the button labeled "Add with custom rights"
|     Then I should see a dialog containing the following text: "Adding new user"
| 
|     When I remove all Basic Rights within the open User Rights dialog box
|     And I save changes within the context of User Rights
| 
|     ##VERIFY_LOG: Verify Update user rights
|     And I click on the link labeled "Logging"
|     Then I should see a table header and rows containing the following values in the logging table:
|       | Time / Date      | Username   | Action   | List of Data Changes OR Fields Exported  |
|       | mm/dd/yyyy hh:mm | test_admin | Add user | user = 'test_admin'                     |
| 
|     ##ACTION #CROSS-FEATURE B.2.23.100: Verify Logging Filter by user name
|     When I select "test_admin" on the dropdown field labeled "Filter by user name"
| 
|     ##VERIFY_LOG #CROSS-FEATURE: Verify Logging Filter by user name
|     Then I should see a table header and rows containing the following values in the logging table:
|       | Time / Date      | Username   | Action   | List of Data Changes OR Fields Exported  |
|       | mm/dd/yyyy hh:mm | test_admin | Add user | user = 'Test_User1'                     |
|     And I logout
| 
|     ##VERIFY: Verify User with Basic custom rights
|     Given I login to REDCap with the user "Test_User1"
|     Then I should see "Logged in as"
| 
|     When I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.100.100"
|     Then I should see a link labeled "Project Home"
|     And I should NOT see a link labeled "Project Setup"
|     And I should NOT see a link labeled "Designer"
|     And I should NOT see a link labeled "Dictionary"
|     And I should see a link labeled "Codebook"
|     And I should NOT see a link labeled "Survey Distribution Tools"
|     And I should see a link labeled "Record Status Dashboard"
|     And I should see a link labeled "View / Edit Records"
|     And I should see "Applications"
|     And I should NOT see a link labeled "Project Dashboards"
|     And I should NOT see a link labeled "Alerts & Notifications"
|     And I should NOT see a link labeled "Multi-Language Management"
|     And I should NOT see a link labeled "Calendar"
|     And I should NOT see a link labeled "Data Import Tool"
|     And I should NOT see a link labeled "Logging and Email Logging"
|     And I should see a link labeled "Field Comment Log"
|     And I should NOT see a link labeled "File Repository"
|     And I should NOT see a link labeled "Data Comparison Tool"
|     And I should NOT see a link labeled "User Rights and DAGs"
|     And I should NOT see a link labeled "Customize & Manage Locking/E-signatures"
|     And I should NOT see a link labeled "Data Quality"
|     And I should NOT see a link labeled "API and API Playground"
|     And I should NOT see a link labeled "REDCap Mobile App"
|     And I logout
| 
|     ##ACTION: Edit User to full custom rights
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.100.100"
|     And I click on the link labeled "User Rights"
|     And I click on the link labeled "Test User1"
|     And I click on the button labeled "Edit user privileges" on the tooltip
|     Then I should see a dialog containing the following text: "Editing existing user"
| 
|     When I check the User Right named "Project Setup & Design"
|     And I check the User Right named "User Rights"
|     And I check the User Right named "Data Access Groups"
|     And I check the User Right named "Survey Distribution Tools"
|     And I check the User Right named "Alerts & Notifications"
|     And I check the User Right named "Calendar"
|     And I check the User Right named "Add/Edit/Organize Reports"
|     And I check the User Right named "Stats & Charts"
|     And I check the User Right named "Data Import Tool"
|     And I check the User Right named "Data Comparison Tool"
|     And I check the User Right named "Logging"
|     And I check the User Right named "File Repository"
|     And I check the User Right named "Data Quality - Create & edit rules"
|     And I check the User Right named "Data Quality - Execute rules"
|     And I check the User Right named "API Export"
|     And I check the User Right named "API Import/Update"
|     And I check the User Right named "Create Records"
|     And I check the User Right named "Rename Records"
|     And I check the User Right named "Delete Records"
|     And I check the User Right named "Record Locking Customization"
| 
|     And I select the User Right named "Lock/Unlock Records" and choose "Locking / Unlocking"
|     And I check the User Right named "Lock/Unlock *Entire* Records (record level)"
| 
|     And I check the User Right named "REDCap Mobile App - Allow users to collect data offline in the mobile app"
|     Then I should see a dialog containing the following text: "Confirm Mobile App Privileges"
|     And I click on the button labeled "Yes, I understand"
| 
|     And I check the User Right named "REDCap Mobile App - Allow user to download data for all records to the app?"
|     And I save changes within the context of User Rights
| 
|     ##VERIFY_LOG: Verify Update user rights
|     And I click on the link labeled "Logging"
|     Then I should see a table header and rows containing the following values in the logging table:
|       | Time / Date      | Username   | Action      | List of Data Changes OR Fields Exported  |
|       | mm/dd/yyyy hh:mm | test_admin | Update user | user = 'test_user1'                     |
|     And I logout
| 
|     ##VERIFY: Verify User with full custom rights
|     Given I login to REDCap with the user "Test_User1"
|     Then I should see "Logged in as"
| 
|     When I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.100.100"
|     Then I should see a link labeled "Project Home"
|     And I should see a link labeled "Project Setup"
|     And I should see a link labeled "Designer"
|     And I should see a link labeled "Dictionary"
|     And I should see a link labeled "Codebook"
|     And I should see a link labeled "Survey Distribution Tools"
|     And I should see a link labeled "Record Status Dashboard"
|     And I should see a link labeled "Add / Edit Records"
|     And I should see "Applications"
|     And I should see a link labeled "Project Dashboards"
|     And I should see a link labeled "Alerts & Notifications"
|     And I should see a link labeled "Multi-Language Management"
|     And I should see a link labeled "Calendar"
|     And I should see a link labeled "Data Import Tool"
|     And I should see a link labeled "Logging"
|     And I should see a link labeled "Email Logging"
|     And I should see a link labeled "Field Comment Log"
|     And I should see a link labeled "File Repository"
|     And I should see a link labeled "Data Comparison Tool"
|     And I should see a link labeled "User Rights"
|     And I should see a link labeled "DAGs"
|     And I should see a link labeled "Customize & Manage Locking/E-signatures"
|     And I should see a link labeled "Data Quality"
|     And I should see a link labeled "API"
|     And I should see a link labeled "API Playground"
|     And I should see a link labeled "REDCap Mobile App"
|     And I logout
| 
|     ##ACTION: Expire User
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.100.100"
|     And I click on the link labeled "User Rights"
|     And I assign an expired expiration date to user "Test User1" with username of "test_user1"
| 
|     ##VERIFY_LOG: Verify Expire User
|     And I click on the link labeled "Logging"
|     #ATS: There is ZERO mention in the logs of anything related to expiration.  It just says Update user in the logs.
|     Then I should see a table header and rows containing the following values in the logging table:
|       | Time / Date      | Username   | Action      | List of Data Changes OR Fields Exported  |
|       | mm/dd/yyyy hh:mm | test_admin | Update user | user = 'test_user1'                     |
| 
|     And I logout
| 
|     ##VERIFY: Verify User access to project
|     Given I login to REDCap with the user "Test_User1"
|     Then I should see "Logged in as"
|     And I click on the link labeled "My Projects"
|     Then I should see a link labeled "B.2.6.100.100"
| 
|     ##ACTION: Remove expiration for User
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.100.100"
|     And I click on the link labeled "User Rights"
|     And I remove the expiration date to user "Test User1" with username of "test_user1"
|     #The Expiration column shows 'never' for "Test_User1"
| 
|     ##VERIFY_LOG: Verify Update user Expiration
|     And I click on the link labeled "Logging"
| 
|     #ATS: ZERO mention in the logs of anything related to expiration.  It just says 'Update user' in the logs.
|     Then I should see a table header and rows containing the following values in the logging table:
|       | Time / Date      | Username   | Action      | List of Data Changes OR Fields Exported  |
|       | mm/dd/yyyy hh:mm | test_admin | Update user | user = 'test_user1'                     |
| 
|     And I logout
| 
|     ##VERIFY: Verify User access to project
|     Given I login to REDCap with the user "Test_User1"
|     Then I should see "Logged in as"
|     And I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.100.100"
|     Then I should see a link labeled "Project Home"
|     And I logout
| 
|     ##ACTION: Remove User from project
|     Given I login to REDCap with the user "Test_Admin"
|     And I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.100.100"
|     And I click on the link labeled "User Rights"
|     And I click on the link labeled "Test User1"
|     And I click on the button labeled "Edit user privileges" on the tooltip
|     Then I should see a dialog containing the following text: "Editing existing user"
| 
|     When I click on the button labeled "Remove user"
|     Then I should see a dialog containing the following text: "Remove user?"
|     And I click on the button labeled "Remove user" in the dialog box
| 
|     ##VERIFY_LOG: Verify Logging of Delete user
|     And I click on the link labeled "Logging"
|     Then I should see a table header and rows containing the following values in the logging table:
|       | Time / Date      | Username   | Action      | List of Data Changes OR Fields Exported  |
|       | mm/dd/yyyy hh:mm | test_admin | Update user | user = 'test_user1'                     |
|       | mm/dd/yyyy hh:mm | test_admin | Delete user | user = 'test_user1'                     |
| 
|     And I logout
| 
|     ##VERIFY: Verify User has no access to project
| 
|     Given I login to REDCap with the user "Test_User1"
|     When I click on the link labeled "My Projects"
|     Then I should NOT see a link labeled "B.2.6.100.100"
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.200%20-%20Data%20Entry%20Form%20Access.feature_
| 
| Feature: B.2.6.200 Assign user rights Project Level:  The system shall allow data entry form user access to be (No Access / Read Only / View & Edit / Edit survey responses)
| 
|   As a REDCap end user
|   I want to see that data entry rights is functioning as expected
| 
|   Scenario: B.2.6.200.100 Data Viewing Rights
| 
|     #SETUP
|     Given I login to REDCap with the user "Test_Admin"
|     And I create a new project named "B.2.6.200.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button
| 
| 
|     When I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.200.100"
|     And I click on the link labeled "Project Setup"
|     And I click on the button labeled "Move project to production"
|     And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
|     And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
|     Then I should see Project status: "Production"
| 
|     When I click on the link labeled "User Rights"
|     And I click on the button labeled "Upload or download users, roles, and assignments"
|     Then I should see "Upload users (CSV)"
| 
|     When I click on the link labeled "Upload users (CSV)"
|     Then I should see a dialog containing the following text: "Upload users (CSV)"
| 
|     Given I upload a "csv" format file located at "import_files/user list for project 1.csv", by clicking the button near "Select your CSV" to browse for the file, and clicking the button labeled "Upload" to upload the file
|     Then I should see a dialog containing the following text: "Upload users (CSV) - Confirm"
|     And I should see a table header and rows containing the following values in a table:
|       | username   |
|       | test_user1 |
|       | test_user2 |
|       | test_user3 |
|       | test_user4 |
| 
|     Given I click on the button labeled "Upload" in the dialog box
|     Then I should see a dialog containing the following text: "SUCCESS!"
|     And I click on the button labeled "Close" in the dialog box
| 
|     And I should see a table header and rows containing the following values in a table:
|       |Role name                | Username            |
|       | —                       | test_admin          |
|       | —                       | test_user1          |
|       | —                       | test_user2          |
|       | —                       | test_user3          |
|       | —                       | test_user4          |
|       | 1_FullRights            | [No users assigned] |
|       | 2_Edit_RemoveID         | [No users assigned] |
|       | 3_ReadOnly_Deidentified | [No users assigned] |
|       | 4_NoAccess_Noexport     | [No users assigned] |
| 
|     When I click on the link labeled "Test User1"
|     And I click on the button labeled "Edit user privileges"
|     Then I should see a dialog containing the following text: "Editing existing user"
| 
|     #FUNCTIONAL REQUIREMENT
|     ##ACTION: Set user access to No Access
| 
|     When I set Data Viewing Rights to No Access for the instrument "Text Validation"
|     And I save changes within the context of User Rights
| 
|     ##VERIFY_LOG: Verify Update user rights
|     And I click on the link labeled "Logging"
|     Then I should see a table header and rows containing the following values in the logging table:
|       | Time / Date      | Username   | Action   | List of Data Changes OR Fields Exported  |
|       | mm/dd/yyyy hh:mm | test_admin | Add user | user = 'test_user1'                     |
| 
|     ##ACTION #CROSS-FEATURE B.2.23.100: Verify Logging Filter by user name
|     When I select the "test_admin" option from the Filter by username dropdown field
| 
|     ##VERIFY_LOG #CROSS-FEATURE: Verify Logging Filter by user name
|     Then I should see a table header and rows containing the following values in the logging table:
|       | Time / Date      | Username   | Action      | List of Data Changes OR Fields Exported  |
|       | mm/dd/yyyy hh:mm | test_admin | Update user | user = 'test_user1'                     |
|     And I logout
| 
|     Given I login to REDCap with the user "Test_User1"
|     And I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.200.100"
|     ##VERIFY: No access to Instrument
|     And I click on the link labeled "Record Status Dashboard"
|     Then I should NOT see "Text Validation"
| 
|     Given I click on the link labeled "User Rights"
|     And I click on the link labeled "Test User1"
|     And I click on the button labeled "Edit user privileges"
|     Then I should see a dialog containing the following text: "Editing existing user"
| 
|     ##ACTION: Set user access to Read Only
|     When I set Data Viewing Rights to Read Only for the instrument "Text Validation"
|     And I save changes within the context of User Rights
| 
|     Given I click on the link labeled "Add / Edit Records"
|     And I select record ID "1" from arm name "Arm 1: Arm 1" on the Add / Edit record page
|     Then I should see "Record Home Page"
| 
|     ##VERIFY: Read Only for the instrument
|     When I click the bubble to select a record for the "Text Validation" longitudinal instrument on event "Event 1"
|     Then I should see "Text Validation"
|     And I should NOT see a button labeled "Save & Exit Form"
| 
|     Given I click on the link labeled "User Rights"
|     And I click on the link labeled "Test User1"
|     And I click on the button labeled "Edit user privileges"
|     Then I should see a dialog containing the following text: "Editing existing user"
| 
|     ##ACTION: Set user access to View & Edit + Edit survey responses
|     When I set Data Viewing Rights to View & Edit with Edit survey responses checked for the instrument "Survey"
|     And I save changes within the context of User Rights
| 
|     Given I click on the link labeled "Add / Edit Records"
|     And I select record ID "1" from arm name "Arm 1: Arm 1" on the Add / Edit record page
|     Then I should see "Record Home Page"
| 
|     ##VERIFY: Create survey record and then try to edit survey response for the instrument
|     When I click the bubble to select a record for the "Survey" longitudinal instrument on event "Event Three"
|     And I click on the button labeled "Survey options"
| 
|     #This opens the survey
|     When I click on the survey option label containing "Open survey" label
|     #We are submitting the survey
|     And I click on the button labeled "Submit"
| 
|     Given I logout
|     And I login to REDCap with the user "Test_User1"
|     And I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.200.100"
|     Given I click on the link labeled "Add / Edit Records"
|     And I select record ID "1" from arm name "Arm 1: Arm 1" on the Add / Edit record page
|     Then I should see "Record Home Page"
| 
|     When I click the bubble to select a record for the "Survey" longitudinal instrument on event "Event Three"
|     Then I should see "Survey response is editable"
| 
|     When I click on the button labeled "Edit response"
|     Then I should see "now editing"
| 
|     When I clear field and enter "Edited Name" into the data entry form field labeled "Name"
|     And I select the submit option labeled "Save & Stay" on the Data Collection Instrument
|     Then I should see "successfully edited"
| 
|     Given I click on the link labeled "User Rights"
|     And I click on the link labeled "Test User1"
|     And I click on the button labeled "Edit user privileges"
|     Then I should see a dialog containing the following text: "Editing existing user"
| 
|     ##ACTION: Remove user access to Edit survey responses
|     When I set Data Viewing Rights to View & Edit with Edit survey responses unchecked for the instrument "Survey"
|     And I save changes within the context of User Rights
| 
|     ##VERIFY: Not able to edit survey responses for the instrument
|     Given I click on the link labeled "Add / Edit Records"
|     And I select record ID "1" from arm name "Arm 1: Arm 1" on the Add / Edit record page
|     Then I should see "Record Home Page"
|     When I click the bubble to select a record for the "Survey" longitudinal instrument on event "Event Three"
|     Then I should see "Survey response is read-only"
|     And I should NOT see a button labeled "Save"
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.300%20-%20Data%20Export%20Rights.feature_
| 
| Feature: B.2.6.300 The system shall allow instrument level data export rights to be (No Access, De-Identified, Remove All Identifier Fields, Full Data Set)
| 
|   As a REDCap end user
|   I want to see that data export rights is functioning as expected
| 
|   Scenario: B.2.6.300.100 Data Export Rights
|     #SETUP_PRODUCTION
|     Given I login to REDCap with the user "Test_Admin"
|     And I create a new project named "B.2.6.300.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button
|     When I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.300.100"
| 
|     When I click on the link labeled "Project Setup"
|     And I click on the button labeled "Move project to production"
|     And I click on the radio labeled "Keep ALL data saved so far" in the dialog box
|     And I click on the button labeled "YES, Move to Production Status" in the dialog box to request a change in project status
|     Then I should see Project status: "Production"
| 
|     ##USER_RIGHTS
|     When I click on the link labeled "User Rights"
|     And I click on the button labeled "Upload or download users, roles, and assignments"
|     Then I should see "Upload users (CSV)"
| 
|     When I click on the link labeled "Upload users (CSV)"
|     Then I should see a dialog containing the following text: "Upload users (CSV)"
| 
|     Given I upload a "csv" format file located at "import_files/user list for project 1.csv", by clicking the button near "Select your CSV" to browse for the file, and clicking the button labeled "Upload" to upload the file
|     Then I should see a dialog containing the following text: "Upload users (CSV) - Confirm"
|     And I should see a table header and rows containing the following values in the a table:
|       | username   |
|       | test_user1 |
|       | test_user2 |
|       | test_user3 |
|       | test_user4 |
| 
|     Given I click on the button labeled "Upload" in the dialog box
|     Then I should see a dialog containing the following text: "SUCCESS!"
|     And I click on the button labeled "Close" in the dialog box
|     And I logout
| 
|     Given I login to REDCap with the user "Test_User1"
|     Then I should see "Logged in as"
| 
|     #FUNCTIONAL REQUIREMENT Export Full Data Set
|     When I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.300.100"
|     And I click on the link labeled "Data Exports, Reports, and Stats"
| 
|     ##ACTION:
|     Then I should see a table header and rows containing the following values in the reports table:
|       | A | All data (all records and fields) |
| 
|     Given I click on the "Export Data" button for the "All data (all records and fields)" report in the My Reports & Exports table
|     And I click on the radio labeled "CSV / Microsoft Excel (raw data)" in the dialog box
|     And I click on the button labeled "Export Data" in the dialog box
|     Then I should see a dialog containing the following text: "Data export was successful!"
| 
|     Given I click on the download icons to receive the files for the "CSV / Microsoft Excel (raw data)" format in the dialog box
|     Then I should have a "csv" file that contains the headings below
|       | record_id | redcap_event_name | redcap_repeat_instrument | redcap_repeat_instance | redcap_data_access_group | redcap_survey_identifier | name | email | text_validation_complete | ptname | textbox | text2 | radio | notesbox | multiple_dropdown_manual | multiple_dropdown_auto | multiple_radio_auto | radio_button_manual | checkbox___1 | checkbox___2 | checkbox___3 | calc_test | calculated_field | signature | file_upload | required | identifier | identifier_2 | edit_field | date_ymd | date_mdy | date_dmy | time_hhmmss | time_hhmm | time_mmss | datetime_ymd_hmss | datetime_ymd_hm | datetime_mdy_hmss | datetime_dmy_hmss | integer | number | number_1_period | number_1_comma | letters | mrn_10_digits | mrn | ssn | phone_north_america | phone_australia | phone_uk | zipcode_us | postal_5 | postal_code_australia | postal_code_canada | data_types_complete | survey_timestamp | name_survey | email_survey | survey_complete | consent_timestamp | name_consent | email_consent | dob | signature_consent | consent_complete |
| 
|     And I click on the button labeled "Close" in the dialog box
| 
|     ##VERIFY_LOG:
|     When I click on the link labeled "Logging"
|     Then I should see a table header and rows containing the following values in the logging table:
|       | Time / Date      | Username   | Action      | List of Data Changes OR Fields Exported  |
|       | mm/dd/yyyy hh:mm | test_user1 | Data export | Download exported data file (CSV raw)   |
|       | mm/dd/yyyy hh:mm | test_admin | Add user    | user = 'test_user1'                     |
| 
|     #SETUP
|     Given I logout
|     Then I should see "Please log in"
|     Given I login to REDCap with the user "Test_User2"
|     Then I should see "Logged in as"
| 
|     #FUNCTIONAL REQUIREMENT Export remove all identifier fields
|     When I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.300.100"
|     And I click on the link labeled "Data Exports, Reports, and Stats"
| 
|     ##ACTION:
|     Then I should see a table header and rows containing the following values in the reports table:
|       | A | All data (all records and fields) |
| 
|     Given I click on the "Export Data" button for the "All data (all records and fields)" report in the My Reports & Exports table
|     And I click on the radio labeled "CSV / Microsoft Excel (raw data)" in the dialog box
|     And I check the checkbox labeled "Remove All Identifier Fields"
|     And I click on the button labeled "Export Data" in the dialog box
|     Then I should see a dialog containing the following text: "Data export was successful!"
| 
|     ##VERIFY_DE:
|     Given I click on the download icons to receive the files for the "CSV / Microsoft Excel (raw data)" format in the dialog box
| 
|     #NOTE: Notice how there is no identifier or identifier_2 fields when removing de-identifiers.  Still want to see ptname.
|     Then I should have a "csv" file that contains the headings below
|       | record_id | redcap_event_name | redcap_repeat_instrument | redcap_repeat_instance | redcap_data_access_group | name | email | text_validation_complete | ptname | textbox | text2 | radio | notesbox | multiple_dropdown_manual | multiple_dropdown_auto | multiple_radio_auto | radio_button_manual | checkbox___1 | checkbox___2 | checkbox___3 | calc_test | calculated_field | signature | file_upload | required | edit_field | date_ymd | date_mdy | date_dmy | time_hhmmss | time_hhmm | time_mmss | datetime_ymd_hmss | datetime_ymd_hm | datetime_mdy_hmss | datetime_dmy_hmss | integer | number | number_1_period | number_1_comma | letters | mrn_10_digits | mrn | ssn | phone_north_america | phone_australia | phone_uk | zipcode_us | postal_5 | postal_code_australia | postal_code_canada | data_types_complete | survey_timestamp | name_survey | email_survey | survey_complete | consent_timestamp | name_consent | email_consent | dob | signature_consent | consent_complete |
| 
|     #SETUP
|     Given I logout
|     Then I should see "Please log in"
|     Given I login to REDCap with the user "Test_User3"
|     Then I should see "Logged in as"
| 
|     #FUNCTIONAL REQUIREMENT: Export Deidentified
|     When I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.300.100"
|     And I click on the link labeled "Data Exports, Reports, and Stats"
| 
|     ##ACTION:
|     Then I should see a table header and rows containing the following values in the reports table:
|       | A | All data (all records and fields) |
| 
|     Given I click on the "Export Data" button for the "All data (all records and fields)" report in the My Reports & Exports table
|     And I click on the radio labeled "CSV / Microsoft Excel (raw data)" in the dialog box
|     And I check the checkbox labeled "Remove All Identifier Fields" in the dialog box
|     And I check the checkbox labeled "Hash the Record ID field" in the dialog box
|     And I click on the button labeled "Export Data" in the dialog box
|     Then I should see a dialog containing the following text: "Data export was successful!"
| 
|     ##VERIFY_DE:
|     Given I click on the download icons to receive the files for the "CSV / Microsoft Excel (raw data)" format in the dialog box
| 
|     #NOTE: Notice how there is no ptname, identifier, or identifier_2 fields when removing de-identifiers AND hashing Record ID
|     Then I should have a "csv" file that contains the headings below
|       | record_id | redcap_event_name | redcap_repeat_instrument | redcap_repeat_instance | redcap_data_access_group | email | text_validation_complete | radio | multiple_dropdown_manual | multiple_dropdown_auto | multiple_radio_auto | radio_button_manual | checkbox___1 | checkbox___2 | checkbox___3 | calc_test | calculated_field | signature | file_upload | date_ymd | date_mdy | date_dmy | time_hhmmss | time_hhmm | time_mmss | datetime_ymd_hmss | datetime_ymd_hm | datetime_mdy_hmss | datetime_dmy_hmss | integer | number | number_1_period | number_1_comma | letters | mrn_10_digits | mrn | ssn | phone_north_america | phone_australia | phone_uk | zipcode_us | postal_5 | postal_code_australia | postal_code_canada | data_types_complete | survey_timestamp | email_survey | survey_complete | consent_timestamp | email_consent | dob | signature_consent,consent_complete |
| 
|     #SETUP
|     Given I logout
|     Then I should see "Please log in"
|     Given I login to REDCap with the user "Test_User4"
|     Then I should see "Logged in as"
| 
|     #FUNCTIONAL REQUIREMENT: Export No Access
|     When I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.300.100"
| 
|     ##ACTION:
|     And I click on the link labeled "Data Exports, Reports, and Stats"
| 
|     ##VERIFY
|     Then I should NOT see a button labeled "Export Data"
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.400%20-%20Creating%20Copying%20Deleting%20Roles.feature_
| 
| Feature: B.2.6.400 Assign user rights Project Level:  The system shall allow for the creation, copying and deletion of user roles.
| 
|   As a REDCap end user
|   I want to see that assign user rights is functioning as expected
| 
|   Scenario: B.2.6.400.100 Create, Copy, & Delete User Roles
|     #SETUP
|     Given I login to REDCap with the user "Test_Admin"
|     And I create a new project named "B.2.6.400.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button
|     When I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.400.100"
|     And I click on the link labeled "User Rights"
| 
|     #FUNCTIONAL REQUIREMENT:
|     ##ACTION: User Rights Create role
|     Given I enter "TestRole2" into the field with the placeholder text of "Enter new role name"
|     And I click on the button labeled "Create role"
|     Then I should see a dialog containing the following text: "Creating new role"
| 
|     ##VERIFY_UR
|     When I click on the button labeled "Create role" in the dialog box
|     Then I should see a table header and rows containing the following values in a table:
|       | Role name               |
|       | 1_FullRights            |
|       | 2_Edit_RemoveID         |
|       | 3_ReadOnly_Deidentified |
|       | 4_NoAccess_Noexport     |
|       | TestRole                |
|       | TestRole2               |
| 
|     ##VERIFY_LOG
|     Given I click on the link labeled "Logging"
| 
|     Then I should see a table header and rows containing the following values in the logging table:
|       | Time / Date      | Username   | Action           | List of Data Changes OR Fields Exported  |
|       | mm/dd/yyyy hh:mm | test_admin | Create user role | role = 'TestRole2'                      |
| 
| 
|     Given I click on the link labeled "User Rights"
|     And I click on the link labeled "TestRole2"
|     Then I should see a dialog containing the following text: "Editing existing user role"
| 
|     ##ACTION: User Rights Copy role
|     Given I click on the button labeled "Copy role" in the dialog box
|     And I clear field and enter "Copy role" into the input field labeled "New role name:"
|     And I click on the button labeled "Copy role" in the dialog box
|     And I click on the button labeled "Cancel" in the dialog box
| 
|     ##VERIFY
|     Then I should see a table header and rows containing the following values in a table:
|       | Role name               |
|       | 1_FullRights            |
|       | 2_Edit_RemoveID         |
|       | 3_ReadOnly_Deidentified |
|       | 4_NoAccess_Noexport     |
|       | Copy role               |
|       | TestRole                |
|       | TestRole2               |
| 
|     Given I click on the link labeled "TestRole2"
| 
|     ##ACTION: User Rights delete role
|     Given I click on the button labeled "Delete role" in the dialog box
|     When I see a dialog containing the following text: "Delete role?"
|     And I click on the button labeled "Delete role" in the dialog box
| 
|     ##VERIFY
|     Then I should NOT see "TestRole2"
|     But I should see a table header and rows containing the following values in a table:
|       | Role name               |
|       | 1_FullRights            |
|       | 2_Edit_RemoveID         |
|       | 3_ReadOnly_Deidentified |
|       | 4_NoAccess_Noexport     |
|       | Copy role               |
|       | TestRole                |
| 
| 
| _https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/B/Assign%20User%20Rights/B.2.6.500%20-%20Adding%20and%20Removing%20Users%20from%20Roles.feature_
| 
| Feature: B.2.6.500 Assign user rights Project Level:  The system shall support adding and removing users from user roles.
| 
|   As a REDCap end user
|   I want to see that assign user rights is functioning as expected
| 
|   Scenario: B.2.6.500.100 Cancel, Assign, Re-assign, & Remove User Roles
|     #SETUP
|     Given I login to REDCap with the user "Test_Admin"
|     And I create a new project named "B.2.6.500.100" by clicking on "New Project" in the menu bar, selecting "Practice / Just for fun" from the dropdown, choosing file "Project_1.xml", and clicking the "Create Project" button
|     When I click on the link labeled "My Projects"
|     And I click on the link labeled "B.2.6.500.100"
|     When I click on the link labeled "User Rights"
|     And I click on the button labeled "Upload or download users, roles, and assignments"
|     Then I should see "Upload users (CSV)"
| 
|     When I click on the link labeled "Upload users (CSV)"
|     Then I should see a dialog containing the following text: "Upload users (CSV)"
| 
|     Given I upload a "csv" format file located at "import_files/user list for project 1.csv", by clicking the button near "Select your CSV" to browse for the file, and clicking the button labeled "Upload" to upload the file
|     Then I should see a dialog containing the following text: "Upload users (CSV) - Confirm"
|     And I should see a table header and rows containing the following values in a table:
|       | username   |
|       | test_user1 |
|       | test_user2 |
|       | test_user3 |
|       | test_user4 |
| 
|     Given I click on the button labeled "Upload" in the dialog box
|     Then I should see a dialog containing the following text: "SUCCESS!"
| 
|     When I click on the button labeled "Close" in the dialog box
|     Then I should see a table header and rows containing the following values in a table:
|       |Role name                | Username            |
|       | —                       | test_admin          |
|       | —                       | test_user1          |
|       | —                       | test_user2          |
|       | —                       | test_user3          |
|       | —                       | test_user4          |
|       | 1_FullRights            | [No users assigned] |
|       | 2_Edit_RemoveID         | [No users assigned] |
|       | 3_ReadOnly_Deidentified | [No users assigned] |
|       | 4_NoAccess_Noexport     | [No users assigned] |
|       | TestRole                | [No users assigned] |
| 
|     #FUNCTIONAL REQUIREMENT
|     ##ACTION: Cancel assign to role
|     When I click on the link labeled "Test User1"
|     And I click on the button labeled "Assign to role" on the tooltip
|     And I select "TestRole" on the dropdown field labeled "Select Role"
|     And I click on the link labeled "Cancel"
| 
|     ##VERIFY
|     Then I should see a table header and rows containing the following values in a table:
|       |Role name                | Username            |
|       | —                       | test_admin          |
|       | —                       | test_user1          |
|       | —                       | test_user2          |
|       | —                       | test_user3          |
|       | —                       | test_user4          |
|       | 1_FullRights            | [No users assigned] |
|       | 2_Edit_RemoveID         | [No users assigned] |
|       | 3_ReadOnly_Deidentified | [No users assigned] |
|       | 4_NoAccess_Noexport     | [No users assigned] |
|       | TestRole                | [No users assigned] |
| 
|     ##ACTION: Assign to role
|     When I click on the link labeled "Test User1"
|     And I click on the button labeled "Assign to role" on the tooltip
|     And I select "TestRole" on the dropdown field labeled "Select Role"
|     And I click on the button labeled exactly "Assign"
| 
|     ##VERIFY
|     Then I should see a table header and rows containing the following values in a table:
|       |Role name                | Username            |
|       | —                       | test_admin          |
|       | —                       | test_user2          |
|       | —                       | test_user3          |
|       | —                       | test_user4          |
|       | 1_FullRights            | [No users assigned] |
|       | 2_Edit_RemoveID         | [No users assigned] |
|       | 3_ReadOnly_Deidentified | [No users assigned] |
|       | 4_NoAccess_Noexport     | [No users assigned] |
|       | TestRole                | test_user1          |
| 
|     ##ACTION: Re-assign to role
|     When I click on the link labeled "Test User1"
|     And I click on the button labeled "Re-assign to role" on the tooltip
|     And I select "1_FullRights" on the dropdown field labeled "Select Role"
|     And I click on the button labeled exactly "Assign"
| 
|     ##VERIFY
|     Then I should see a table header and rows containing the following values in a table:
|       |Role name                | Username            |
|       | —                       | test_admin          |
|       | —                       | test_user1          |
|       | —                       | test_user2          |
|       | —                       | test_user3          |
|       | —                       | test_user4          |
|       | 2_Edit_RemoveID         | [No users assigned] |
|       | 3_ReadOnly_Deidentified | [No users assigned] |
|       | 4_NoAccess_Noexport     | [No users assigned] |
|       | TestRole                | [No users assigned] |
| 
|     ##ACTION: Remove from role
|     When I click on the link labeled "Test User1"
|     And I click on the button labeled "Remove from role"
| 
|     ##VERIFY
|     Then I should see a table header and rows containing the following values in a table:
|       |Role name                | Username            |
|       | —                       | test_admin          |
|       | —                       | test_user1          |
|       | —                       | test_user2          |
|       | —                       | test_user3          |
|       | —                       | test_user4          |
|       | 1_FullRights            | [No users assigned] |
|       | 2_Edit_RemoveID         | [No users assigned] |
|       | 3_ReadOnly_Deidentified | [No users assigned] |
|       | 4_NoAccess_Noexport     | [No users assigned] |
|       | TestRole                | [No users assigned] |
| 
|     And I should see a dialog containing the following text: "User's privileges will remain the same"
|     And I click on the button labeled "Close" in the dialog box
</div>

***

**Comments:** \

<div class="comments">

</div>

***

**Timeline events:** \

<div class="timeline">
<div class="timeline">
LABELLED | *User:* MintooXavier *Created on:* 29/05/2024 10:38:27 *Label name:* Core feature *Label description:* Part of the RSVC core feature set

LABELLED | *User:* MintooXavier *Created on:* 29/05/2024 10:38:27 *Label name:* Gherkin *Label description:* Uses a Gherkin syntax

LABELLED | *User:* MintooXavier *Created on:* 29/05/2024 10:38:27 *Label name:* Automated *Label description:* 
</div>
</div>


<br/>

--------------- feature ends ---------------

<br/>

***

<div id="redcap_cypress-25">**Feature:** 1. Two Factor Authentication</div>

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**Id:** I_kwDOIaOBn86KdfsO                                                                                              **Uid:** redcap_cypress-25                                                     
                                                                                                                                                                                                        
**Author:** MintooXavier                                                                                                **Created:** 29/05/2024 10:40:15                                               
                                                                                                                                                                                                        
**Assignees:** |none|                                                                                                   **Resource path:** <a href=https://github.com//CCTC-team/redcap_cypress/issues/25 target=_blank>/CCTC-team/redcap_cypress/issues/25</a>
                                                                                                                                                                                                        
**Milestone:** |none|                                                                                                   **Labels:** Non-core feature || Manual                                         
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**State:** OPEN                                                                                                         **State reason**: |not applicable|                                             
                                                                                                                                                                                                        
**Includes created edit:** true                                                                                         
                                                                                                                                                                                                        
**Closed:** false                                                                                                       **Closed on:** |none|                                                          
                                                                                                                                                                                                        
**Editor:** MintooXavier                                                                                                **Updated on:** 30/05/2024 11:27:12                                            
                                                                                                                                                                                                        
**Locked:** false                                                                                                       **Participants:** MintooXavier                                                 
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

**Project item body:** \
<div class="feature-body">
<p dir="auto">Brief description:<br>
This feature increases the security of the system by adding an additional security code on top of the password at user login.</p>
<p dir="auto">User spec:<br>
<a href="https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/non_core/two_factor_authentication.spec">https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/non_core/two_factor_authentication.spec</a></p>
<p dir="auto">Feature link:<br>
<a href="https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/manual_testing/01_Two_Factor_Authentication.gfm">https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/manual_testing/01_Two_Factor_Authentication.gfm</a></p>
<p dir="auto">Pre review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The user requirements are met</li>
</ul>
<p dir="auto">Post review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) appropriately tests the feature</li>
</ul>
</div>

***

**User specification:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/non_core/two_factor_authentication.spec_
| 
| 1.1 - The system shall support enabling/disabling of Two-Factor Authentication.
| 1.2 - The system shall support the ability to use Two-Factor Authentication for user login.
</div>

**Test script:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/manual_testing/01_Two_Factor_Authentication.gfm_
| 
| <!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml" lang="" xml:lang=""><head>  <meta charset="utf-8" />  <meta name="generator" content="pandoc" />  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />  <title>01_Two_Factor_Authentication</title>  <style>    code{white-space: pre-wrap;}    span.smallcaps{font-variant: small-caps;}    span.underline{text-decoration: underline;}    div.column{display: inline-block; vertical-align: top; width: 50%;}    div.hanging-indent{margin-left: 1.5em; text-indent: -1.5em;}    ul.task-list{list-style: none;}    .display.math{display: block; text-align: center; margin: 0.5rem auto;}  </style>  <!--[if lt IE 9]>    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv-printshiv.min.js"></script>  <![endif]--></head><body><table style="width:97%;"><colgroup><col style="width: 19%" /><col style="width: 12%" /><col style="width: 18%" /><col style="width: 47%" /></colgroup><thead><tr class="header"><th><strong>System Setup</strong></th><th></th><th></th><th></th></tr></thead><tbody><tr class="odd"><td><strong>Database Version</strong></td><td><blockquote><p>REDCap 1 3.8.1</p></blockquote></td><td><blockquote><p><strong>A pplication URL</strong></p></blockquote></td><td><blockquote><p>https://localhost:8443/</p></blockquote></td></tr><tr class="even"><td><strong>Document Status</strong></td><td><blockquote><p>Co mplete</p></blockquote></td><td><strong>Document Version</strong></td><td><blockquote><p>1</p></blockquote></td></tr></tbody></table><table><colgroup><col style="width: 100%" /></colgroup><tbody><tr class="odd"><td><strong>Test Summary</strong></td></tr><tr class="even"><td><p><strong>Feature Category Description:</strong> Two-Factor Authentication increases the security of the system by adding an additional security code on top of the password at user login.</p><p><strong>Test Purpose Details:</strong> This test script validates if the Two-Factor Authentication works</p><p><strong>Functional Requirements:</strong></p><ul><li><p>1.1 The system shall support enabling/disabling of Two-Factor Authentication.</p></li><li><p>1.2 The system shall support the ability to use Two-Factor Authentication for user login.</p></li></ul></td></tr><tr class="odd"><td></td></tr></tbody></table><table style="width:97%;"><colgroup><col style="width: 6%" /><col style="width: 16%" /><col style="width: 19%" /><col style="width: 25%" /><col style="width: 29%" /></colgroup><tbody><tr class="odd"><td><strong> Te st Re qu ir em en ts </strong></td><td></td><td></td><td></td><td></td></tr><tr class="even"><td><strong> Te st U se rs </strong></td><td></td><td></td><td></td><td></td></tr><tr class="odd"><td><strong> ID </strong></td><td><strong>U sername</strong></td><td><ul><li>*Password**</li></ul></td><td><strong>Minimum Users Rights</strong></td><td><strong>Other Settings</strong></td></tr><tr class="even"><td><blockquote><p><strong> 1. </strong></p></blockquote></td><td>test_user</td><td>Testing123</td><td>Standard User</td><td></td></tr><tr class="odd"><td><blockquote><p><strong> 2. </strong></p></blockquote></td><td>t est_admin</td><td>Testing123</td><td>Administrator</td><td></td></tr></tbody></table><table style="width:97%;"><colgroup><col style="width: 6%" /><col style="width: 36%" /><col style="width: 54%" /></colgroup><tbody><tr class="odd"><td><ul><li>*P ro je ct S et up **</li></ul></td><td></td><td></td></tr><tr class="even"><td><strong> ID </strong></td><td><blockquote><p><strong>Description</strong></p></blockquote></td><td><blockquote><p><strong>Instructions</strong></p></blockquote></td></tr><tr class="odd"><td>1 .</td><td><blockquote><p>Project Setup</p></blockquote></td><td><h4 id="control-center-secur">Control Center, Secur</h4><p>ity &amp; Authentication Configuration:</p><p>Two-factor Authentication = Disabled</p></td></tr><tr class="even"><td>2 .</td><td><blockquote><p>Data Import File</p></blockquote></td><td></td></tr><tr class="odd"><td>3 .</td><td><blockquote><p>Other Files</p></blockquote></td><td></td></tr></tbody></table><table><colgroup><col style="width: 9%" /><col style="width: 31%" /><col style="width: 27%" /><col style="width: 15%" /><col style="width: 15%" /></colgroup><tbody><tr class="odd"><td><strong> Test Ste ps</strong></td><td></td><td></td><td></td><td></td></tr><tr class="even"><td><strong> Step #</strong></td><td><strong>Action Step</strong></td><td><strong>Expected Result</strong></td><td><strong>Pass / Fail</strong></td><td><strong>Com ments</strong></td></tr><tr class="odd"><td><blockquote><p><em>H elp</em></p></blockquote></td><td><em>You must perform the actions listed in this column.</em></td><td><em>After performing the actions in the Action Step column, you should see the following.</em></td><td><em>Check Pass, if the actual results match the  Expected Result; ot herwise, check Fail.</em></td><td><ul><li>Include une xpected r esults, sugge stions. etc.*</li></ul></td></tr><tr class="even"><td><ol type="1"><li></li></ol></td><td>Login as test_user using username and password</td><td>Successfully logs into REDCap</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="2" type="1"><li></li></ol></td><td>Logout as test_user</td><td>Successfully logged off</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="3" type="1"><li></li></ol></td><td>Login as test_admin</td><td>Successfully logs into REDCap</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="4" type="1"><li></li></ol></td><td><p>Go to Control Center.</p><p>Click on Security &amp; Authentication in System Configuration group</p></td><td><p>Control Center page is displayed.</p><p>Security &amp; Authentication Configuration page is displayed</p></td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="5" type="1"><li></li></ol></td><td><p>Set the following settings:</p><p>Two-Factor Authentication = Enabled</p><p>Enforce two-factor authentication ONLY for Table-based users? = No, enforce on all users (Table-based and non-Table-based)</p><p>Authentication interval: Trust a device's two-factor login for X days? = 1</p><p>Save Changes</p></td><td>Security &amp; Authentication Configuration are saved</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="6" type="1"><li></li></ol></td><td>Logout as test_admin</td><td>Successfully logged off</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="7" type="1"><li></li></ol></td><td>Login as test_user using username and password</td><td>Pop-up appears Two-step verification for REDCap login</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="8" type="1"><li></li></ol></td><td><p>Do not check the checkbox Don't prompt me with two-step login on this computer for 24 hours</p><p>Select the radio button for Email</p></td><td>Pop-up appears Enter your verification code</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="9" type="1"><li></li></ol></td><td>Go to test_users email (MailHog) and get the verification code and enter it in the textbox and press the Submit button</td><td><p>A green tick and success appears next to the textbox</p><p>Successfully directed to My Projects page</p></td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="10" type="1"><li></li></ol></td><td>Logout as test_user</td><td>Successfully logged off</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="11" type="1"><li></li></ol></td><td>Login as test_user using username and password</td><td>Pop-up appears Two-step verification for REDCap login</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="12" type="1"><li></li></ol></td><td><p>Check the checkbox Don't prompt me with two-step login on this computer for 24 hours</p><p>Select the radio button for Email</p></td><td>Pop-up appears Enter your verification code</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="13" type="1"><li></li></ol></td><td>Go to test_users email (MailHog) and get the verification code and enter it in the textbox and press the Submit button</td><td><p>A green tick and success appear next to the textbox</p><p>Successfully directed to My Projects page</p></td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="14" type="1"><li></li></ol></td><td>Logout as test_user</td><td>Successfully logged off</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="15" type="1"><li></li></ol></td><td>Login as test_user using username and password</td><td><p>Successfully logs into REDCap</p><p>No verification code asked</p></td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="16" type="1"><li></li></ol></td><td>Logout as test_user</td><td>Successfully logged off</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td></td><td>THIS ENDS THE TESTING FOR THIS SCRIPT</td><td></td><td></td><td></td></tr></tbody></table><table style="width:96%;"><colgroup><col style="width: 16%" /><col style="width: 62%" /><col style="width: 5%" /><col style="width: 5%" /><col style="width: 5%" /></colgroup><tbody><tr class="odd"><td><strong>Con clusion</strong></td><td></td><td></td><td></td><td></td></tr><tr class="even"><td>Did the Actual Results for each test step match the Expected Results listed?</td><td></td><td><ul><li></li></ul>Y e s</td><td></td><td><blockquote></blockquote>N o</td></tr><tr class="odd"><td><blockquote><p><strong>C omments/A dditional Infor mation:</strong></p><p>(Indicate the step number of the step you wish to comment on.)</p></blockquote></td><td></td><td></td><td></td><td></td></tr><tr class="even"><td><strong> Completed By</strong></td><td><strong>Rukayat Yakub</strong></td><td><ul><li></li><li>D a t e :</li><li></li><li></li></ul></td><td><ul><li></li><li>2 0 / 1 1 / 2 0 2 3</li><li></li><li></li></ul></td><td></td></tr></tbody></table></body></html>
</div>

***

**Comments:** \

<div class="comments">

</div>

***

**Timeline events:** \

<div class="timeline">
<div class="timeline">
LABELLED | *User:* MintooXavier *Created on:* 29/05/2024 10:40:30 *Label name:* Non-core feature *Label description:* A feature managed by CCTU

LABELLED | *User:* MintooXavier *Created on:* 29/05/2024 10:40:30 *Label name:* Manual *Label description:* 
</div>
</div>


<br/>

--------------- feature ends ---------------

<br/>

***

<div id="redcap_cypress-26">**Feature:** 2. Alerts and Notifications</div>

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**Id:** I_kwDOIaOBn86KmJ24                                                                                              **Uid:** redcap_cypress-26                                                     
                                                                                                                                                                                                        
**Author:** MintooXavier                                                                                                **Created:** 30/05/2024 09:59:47                                               
                                                                                                                                                                                                        
**Assignees:** |none|                                                                                                   **Resource path:** <a href=https://github.com//CCTC-team/redcap_cypress/issues/26 target=_blank>/CCTC-team/redcap_cypress/issues/26</a>
                                                                                                                                                                                                        
**Milestone:** |none|                                                                                                   **Labels:** Non-core feature || Manual                                         
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------
**State:** OPEN                                                                                                         **State reason**: |not applicable|                                             
                                                                                                                                                                                                        
**Includes created edit:** true                                                                                         
                                                                                                                                                                                                        
**Closed:** false                                                                                                       **Closed on:** |none|                                                          
                                                                                                                                                                                                        
**Editor:** MintooXavier                                                                                                **Updated on:** 30/05/2024 11:29:55                                            
                                                                                                                                                                                                        
**Locked:** false                                                                                                       **Participants:** MintooXavier                                                 
                                                                                                                                                                                                        
----------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------

***

**Project item body:** \
<div class="feature-body">
<p dir="auto">Brief description:<br>
This feature is used to send emails when a record is saved and/or when a condition is met. e.g. when a participant is registered etc.</p>
<p dir="auto">User spec:<br>
<a href="https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/non_core/alerts_and_notifications.spec">https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/non_core/alerts_and_notifications.spec</a></p>
<p dir="auto">Feature link:<br>
<a href="https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/manual_testing/01_Two_Factor_Authentication.gfm">https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/manual_testing/01_Two_Factor_Authentication.gfm</a></p>
<p dir="auto">Pre review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> The user requirements are met</li>
</ul>
<p dir="auto">Post review:</p>
<ul class="contains-task-list">
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) targets the correct feature sufficiently</li>
<li class="task-list-item"><input type="checkbox" id="" disabled="" class="task-list-item-checkbox" checked=""> Script(s) appropriately tests the feature</li>
</ul>
</div>

***

**User specification:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/user_requirement_specification/non_core/alerts_and_notifications.spec_
| 
| 2.1 - The system shall support the ability to send emails when a record is saved on a specific form/survey
| 2.2 - The system shall support the ability to send emails when a record is saved on a specific form/survey with Complete Status Only
| 2.3 - The system shall support the ability to send emails If conditional logic is TRUE when a record is saved on a specific form/survey
| 2.4 - The system shall support the ability to send emails When conditional logic is TRUE during a data import, data entry, or as the result of time-based logic.
</div>

**Test script:** \

<div class="spec-script">
| 
| _https://github.com/CCTC-team/redcap_cypress/blob/redcap_val/manual_testing/01_Two_Factor_Authentication.gfm_
| 
| <!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml" lang="" xml:lang=""><head>  <meta charset="utf-8" />  <meta name="generator" content="pandoc" />  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />  <title>01_Two_Factor_Authentication</title>  <style>    code{white-space: pre-wrap;}    span.smallcaps{font-variant: small-caps;}    span.underline{text-decoration: underline;}    div.column{display: inline-block; vertical-align: top; width: 50%;}    div.hanging-indent{margin-left: 1.5em; text-indent: -1.5em;}    ul.task-list{list-style: none;}    .display.math{display: block; text-align: center; margin: 0.5rem auto;}  </style>  <!--[if lt IE 9]>    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv-printshiv.min.js"></script>  <![endif]--></head><body><table style="width:97%;"><colgroup><col style="width: 19%" /><col style="width: 12%" /><col style="width: 18%" /><col style="width: 47%" /></colgroup><thead><tr class="header"><th><strong>System Setup</strong></th><th></th><th></th><th></th></tr></thead><tbody><tr class="odd"><td><strong>Database Version</strong></td><td><blockquote><p>REDCap 1 3.8.1</p></blockquote></td><td><blockquote><p><strong>A pplication URL</strong></p></blockquote></td><td><blockquote><p>https://localhost:8443/</p></blockquote></td></tr><tr class="even"><td><strong>Document Status</strong></td><td><blockquote><p>Co mplete</p></blockquote></td><td><strong>Document Version</strong></td><td><blockquote><p>1</p></blockquote></td></tr></tbody></table><table><colgroup><col style="width: 100%" /></colgroup><tbody><tr class="odd"><td><strong>Test Summary</strong></td></tr><tr class="even"><td><p><strong>Feature Category Description:</strong> Two-Factor Authentication increases the security of the system by adding an additional security code on top of the password at user login.</p><p><strong>Test Purpose Details:</strong> This test script validates if the Two-Factor Authentication works</p><p><strong>Functional Requirements:</strong></p><ul><li><p>1.1 The system shall support enabling/disabling of Two-Factor Authentication.</p></li><li><p>1.2 The system shall support the ability to use Two-Factor Authentication for user login.</p></li></ul></td></tr><tr class="odd"><td></td></tr></tbody></table><table style="width:97%;"><colgroup><col style="width: 6%" /><col style="width: 16%" /><col style="width: 19%" /><col style="width: 25%" /><col style="width: 29%" /></colgroup><tbody><tr class="odd"><td><strong> Te st Re qu ir em en ts </strong></td><td></td><td></td><td></td><td></td></tr><tr class="even"><td><strong> Te st U se rs </strong></td><td></td><td></td><td></td><td></td></tr><tr class="odd"><td><strong> ID </strong></td><td><strong>U sername</strong></td><td><ul><li>*Password**</li></ul></td><td><strong>Minimum Users Rights</strong></td><td><strong>Other Settings</strong></td></tr><tr class="even"><td><blockquote><p><strong> 1. </strong></p></blockquote></td><td>test_user</td><td>Testing123</td><td>Standard User</td><td></td></tr><tr class="odd"><td><blockquote><p><strong> 2. </strong></p></blockquote></td><td>t est_admin</td><td>Testing123</td><td>Administrator</td><td></td></tr></tbody></table><table style="width:97%;"><colgroup><col style="width: 6%" /><col style="width: 36%" /><col style="width: 54%" /></colgroup><tbody><tr class="odd"><td><ul><li>*P ro je ct S et up **</li></ul></td><td></td><td></td></tr><tr class="even"><td><strong> ID </strong></td><td><blockquote><p><strong>Description</strong></p></blockquote></td><td><blockquote><p><strong>Instructions</strong></p></blockquote></td></tr><tr class="odd"><td>1 .</td><td><blockquote><p>Project Setup</p></blockquote></td><td><h4 id="control-center-secur">Control Center, Secur</h4><p>ity &amp; Authentication Configuration:</p><p>Two-factor Authentication = Disabled</p></td></tr><tr class="even"><td>2 .</td><td><blockquote><p>Data Import File</p></blockquote></td><td></td></tr><tr class="odd"><td>3 .</td><td><blockquote><p>Other Files</p></blockquote></td><td></td></tr></tbody></table><table><colgroup><col style="width: 9%" /><col style="width: 31%" /><col style="width: 27%" /><col style="width: 15%" /><col style="width: 15%" /></colgroup><tbody><tr class="odd"><td><strong> Test Ste ps</strong></td><td></td><td></td><td></td><td></td></tr><tr class="even"><td><strong> Step #</strong></td><td><strong>Action Step</strong></td><td><strong>Expected Result</strong></td><td><strong>Pass / Fail</strong></td><td><strong>Com ments</strong></td></tr><tr class="odd"><td><blockquote><p><em>H elp</em></p></blockquote></td><td><em>You must perform the actions listed in this column.</em></td><td><em>After performing the actions in the Action Step column, you should see the following.</em></td><td><em>Check Pass, if the actual results match the  Expected Result; ot herwise, check Fail.</em></td><td><ul><li>Include une xpected r esults, sugge stions. etc.*</li></ul></td></tr><tr class="even"><td><ol type="1"><li></li></ol></td><td>Login as test_user using username and password</td><td>Successfully logs into REDCap</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="2" type="1"><li></li></ol></td><td>Logout as test_user</td><td>Successfully logged off</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="3" type="1"><li></li></ol></td><td>Login as test_admin</td><td>Successfully logs into REDCap</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="4" type="1"><li></li></ol></td><td><p>Go to Control Center.</p><p>Click on Security &amp; Authentication in System Configuration group</p></td><td><p>Control Center page is displayed.</p><p>Security &amp; Authentication Configuration page is displayed</p></td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="5" type="1"><li></li></ol></td><td><p>Set the following settings:</p><p>Two-Factor Authentication = Enabled</p><p>Enforce two-factor authentication ONLY for Table-based users? = No, enforce on all users (Table-based and non-Table-based)</p><p>Authentication interval: Trust a device's two-factor login for X days? = 1</p><p>Save Changes</p></td><td>Security &amp; Authentication Configuration are saved</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="6" type="1"><li></li></ol></td><td>Logout as test_admin</td><td>Successfully logged off</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="7" type="1"><li></li></ol></td><td>Login as test_user using username and password</td><td>Pop-up appears Two-step verification for REDCap login</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="8" type="1"><li></li></ol></td><td><p>Do not check the checkbox Don't prompt me with two-step login on this computer for 24 hours</p><p>Select the radio button for Email</p></td><td>Pop-up appears Enter your verification code</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="9" type="1"><li></li></ol></td><td>Go to test_users email (MailHog) and get the verification code and enter it in the textbox and press the Submit button</td><td><p>A green tick and success appears next to the textbox</p><p>Successfully directed to My Projects page</p></td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="10" type="1"><li></li></ol></td><td>Logout as test_user</td><td>Successfully logged off</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="11" type="1"><li></li></ol></td><td>Login as test_user using username and password</td><td>Pop-up appears Two-step verification for REDCap login</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="12" type="1"><li></li></ol></td><td><p>Check the checkbox Don't prompt me with two-step login on this computer for 24 hours</p><p>Select the radio button for Email</p></td><td>Pop-up appears Enter your verification code</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="13" type="1"><li></li></ol></td><td>Go to test_users email (MailHog) and get the verification code and enter it in the textbox and press the Submit button</td><td><p>A green tick and success appear next to the textbox</p><p>Successfully directed to My Projects page</p></td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="14" type="1"><li></li></ol></td><td>Logout as test_user</td><td>Successfully logged off</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td><ol start="15" type="1"><li></li></ol></td><td>Login as test_user using username and password</td><td><p>Successfully logs into REDCap</p><p>No verification code asked</p></td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="odd"><td><ol start="16" type="1"><li></li></ol></td><td>Logout as test_user</td><td>Successfully logged off</td><td><ul><li><strong>Pass</strong></li></ul><strong>Fail </strong></td><td></td></tr><tr class="even"><td></td><td>THIS ENDS THE TESTING FOR THIS SCRIPT</td><td></td><td></td><td></td></tr></tbody></table><table style="width:96%;"><colgroup><col style="width: 16%" /><col style="width: 62%" /><col style="width: 5%" /><col style="width: 5%" /><col style="width: 5%" /></colgroup><tbody><tr class="odd"><td><strong>Con clusion</strong></td><td></td><td></td><td></td><td></td></tr><tr class="even"><td>Did the Actual Results for each test step match the Expected Results listed?</td><td></td><td><ul><li></li></ul>Y e s</td><td></td><td><blockquote></blockquote>N o</td></tr><tr class="odd"><td><blockquote><p><strong>C omments/A dditional Infor mation:</strong></p><p>(Indicate the step number of the step you wish to comment on.)</p></blockquote></td><td></td><td></td><td></td><td></td></tr><tr class="even"><td><strong> Completed By</strong></td><td><strong>Rukayat Yakub</strong></td><td><ul><li></li><li>D a t e :</li><li></li><li></li></ul></td><td><ul><li></li><li>2 0 / 1 1 / 2 0 2 3</li><li></li><li></li></ul></td><td></td></tr></tbody></table></body></html>
</div>

***

**Comments:** \

<div class="comments">

</div>

***

**Timeline events:** \

<div class="timeline">
<div class="timeline">
RENAMED TITLE | *User:* MintooXavier *Created on:* 30/05/2024 11:29:41 *Previous title:* Alerts and Notifications *Current title:* 2. Alerts and Notifications

LABELLED | *User:* MintooXavier *Created on:* 30/05/2024 11:29:55 *Label name:* Non-core feature *Label description:* A feature managed by CCTU

LABELLED | *User:* MintooXavier *Created on:* 30/05/2024 11:29:55 *Label name:* Manual *Label description:* 
</div>
</div>


<br/>

--------------- feature ends ---------------

<br/>



</body>
</html>