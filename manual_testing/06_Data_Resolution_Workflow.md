+-------------+--------+-----------+----------------------------------+
| **System    |        |           |                                  |
| Setup**     |        |           |                                  |
+=============+========+===========+==================================+
| **REDCap    | > 1    | > **Ap    |                                  |
| Version**   | 3.8.1  | plication |                                  |
|             |        | > URL**   |                                  |
+-------------+--------+-----------+----------------------------------+
| **Browser   |        | **OS      |                                  |
| Version**   |        | V         |                                  |
|             |        | ersion**  |                                  |
+-------------+--------+-----------+----------------------------------+
| **Actual    |        |           | >                                |
| Execution   |        |           |                                  |
| Time**      |        |           |                                  |
+-------------+--------+-----------+----------------------------------+

+-----------------------------------------------------------------------+
| **Test Summary**                                                      |
+-----------------------------------------------------------------------+
| **Feature Category Description:** This data resolution workflow,      |
| often called \'data queries\' in clinical trials and studies, can be  |
| utilized either on a data entry form or on the Data Quality page when |
| finding data discrepancies.  Users will be allowed to open a workflow |
| for documenting the process of resolving issues with data in the      |
| project (i.e. opening, responding to, and closing data queries).      |
| Alternatively, the 'Field Comments' feature allows users to add       |
| comments to fields                                                    |
|                                                                       |
| **Test Purpose Details:** This test script validates if Data          |
| Resolution Workflow and Field Comments log work                       |
|                                                                       |
| **Functional Requirements:**                                          |
|                                                                       |
| -   The system shall support the ability to open, close, read only,   |
|     reopen and respond to queries based on user roles                 |
|                                                                       |
| -   The system shall support the ability to filter queries based on   |
|     records, fields, events and users                                 |
|                                                                       |
| -   The system shall support the ability to attach files to queries   |
|     and make them available to download based on user roles.          |
|                                                                       |
| -   The system shall support the ability to email and send messages   |
|     via REDCap messenger with a link to queries based on user roles   |
|                                                                       |
| -   The system shall have the ability to highlight open, closed and   |
|     responded to queries.                                             |
|                                                                       |
| -   The system shall have the ability to verify and de-verify data    |
|     value depending on user rights                                    |
|                                                                       |
| -   The system shall have the ability to accept User comments for     |
|     fields                                                            |
|                                                                       |
| -   The system shall have the ability to filter user comments based   |
|     on Records, Events, Fields, Users and Keywords                    |
+-----------------------------------------------------------------------+

+----+-----------+-------------+-----------------+--------------------+
| ** |           |             |                 |                    |
| Te |           |             |                 |                    |
| st |           |             |                 |                    |
| Re |           |             |                 |                    |
| qu |           |             |                 |                    |
| ir |           |             |                 |                    |
| em |           |             |                 |                    |
| en |           |             |                 |                    |
| ts |           |             |                 |                    |
| ** |           |             |                 |                    |
+----+-----------+-------------+-----------------+--------------------+
| ** |           |             |                 |                    |
| Te |           |             |                 |                    |
| st |           |             |                 |                    |
| U  |           |             |                 |                    |
| se |           |             |                 |                    |
| rs |           |             |                 |                    |
| ** |           |             |                 |                    |
+----+-----------+-------------+-----------------+--------------------+
| ** | **U       | *           | **Minimum       | **DAGs and Other   |
| ID | sername** | *Password** | User's Rights** | Settings**         |
| ** |           |             |                 |                    |
+----+-----------+-------------+-----------------+--------------------+
| >  | test_user | Testing123  | Standard User   | User rights --     |
| ** |           |             |                 | Create records and |
| 1. |           |             |                 | Respond only to    |
| ** |           |             |                 | opened queries     |
+----+-----------+-------------+-----------------+--------------------+
| >  | t         | Testing123  | Administrator   | Admin User         |
| ** | est_admin |             |                 |                    |
| 2. |           |             |                 |                    |
| ** |           |             |                 |                    |
+----+-----------+-------------+-----------------+--------------------+
| >  | t         | Testing123  | Standard User   | User rights -      |
| ** | est_user2 |             |                 | Open, close, and   |
| 3. |           |             |                 | respond to queries |
| ** |           |             |                 |                    |
+----+-----------+-------------+-----------------+--------------------+

+----+-------------------------+--------------------------------------+
| *  |                         |                                      |
| *P |                         |                                      |
| ro |                         |                                      |
| je |                         |                                      |
| ct |                         |                                      |
| S  |                         |                                      |
| et |                         |                                      |
| up |                         |                                      |
| ** |                         |                                      |
+----+-------------------------+--------------------------------------+
| ** | > **Description**       | > **Instructions**                   |
| ID |                         |                                      |
| ** |                         |                                      |
+----+-------------------------+--------------------------------------+
| 1  | Project:                | Project created using                |
| \. | Project_CUH_v1381       | Project_CUH_v1381.xml                |
+----+-------------------------+--------------------------------------+
| 2  | > Project Setup         | Disable Repeating instruments        |
| \. |                         |                                      |
|    |                         | Enable the Data Resolution Workflow  |
|    |                         | (Data Queries)                       |
|    |                         |                                      |
|    |                         | Enable optional modules and          |
|    |                         | customizations -\> Additional        |
|    |                         | customizations -\> Check, Enable the |
|    |                         | Field Comment Log or Data Resolution |
|    |                         | Workflow (Data Queries)? -\> Enable  |
|    |                         | -- Data Resolution Workflow          |
+----+-------------------------+--------------------------------------+
| 3  | > Data Import File      |                                      |
| \. |                         |                                      |
+----+-------------------------+--------------------------------------+
| 4  | Other Files             |  send_it.csv                         |
| \. |                         |                                      |
+----+-------------------------+--------------------------------------+

+----------+--------------------+--------------------+-------+--------+
| **Test   |                    |                    |       |        |
| Steps**  |                    |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| **Step   | **Action Step**    | **Expected         | *     | **Comm |
| \#**     |                    | Result**           | *Pass | ents** |
|          |                    |                    | /     |        |
|          |                    |                    | F     |        |
|          |                    |                    | ail** |        |
+----------+--------------------+--------------------+-------+--------+
| > *Help* | *You must perform  | *After performing  | *     | *I     |
|          | the actions listed | the actions in the | Check | nclude |
|          | in this column.*   | 'Action Step'      | 'P    | unex   |
|          |                    | column, you should | ass', | pected |
|          |                    | see the            | if    | re     |
|          |                    | following.*        | the   | sults, |
|          |                    |                    | a     | sugges |
|          |                    |                    | ctual | tions. |
|          |                    |                    | re    | etc.*  |
|          |                    |                    | sults |        |
|          |                    |                    | match |        |
|          |                    |                    | the   |        |
|          |                    |                    | 'Exp  |        |
|          |                    |                    | ected |        |
|          |                    |                    | Res   |        |
|          |                    |                    | ult'; |        |
|          |                    |                    | other |        |
|          |                    |                    | wise, |        |
|          |                    |                    | check |        |
|          |                    |                    | 'Fa   |        |
|          |                    |                    | il'.* |        |
+----------+--------------------+--------------------+-------+--------+
| 1.       | Login as test_user | User is able to    | **☐   |        |
|          |                    | login              | P     |        |
|          | Click on           |                    | ass** |        |
|          | '                  | Project opens      |       |        |
|          | Project_CUH_v1381' |                    | *     |        |
|          |                    |                    | *Fail |        |
|          |                    |                    | ☐**   |        |
+----------+--------------------+--------------------+-------+--------+
| 2.       | Click on 'Record   | Record Status      | **☐   |        |
|          | Status Dashboard'  | Dashboard opens    | P     |        |
|          |                    |                    | ass** |        |
|          | Click 'Add new     | New Record 1 is    |       |        |
|          | Record for this    | created.           | *     |        |
|          | arm'               |                    | *Fail |        |
|          |                    | The instrument     | ☐**   |        |
|          | Click on 'Text     | opens              |       |        |
|          | Validation'        |                    |       |        |
|          | instrument for     | The form is saved  |       |        |
|          | Record 1           |                    |       |        |
|          |                    |                    |       |        |
|          | In the Name field, |                    |       |        |
|          | type 'John'        |                    |       |        |
|          |                    |                    |       |        |
|          | In the Email       |                    |       |        |
|          | field, type        |                    |       |        |
|          | 'John@example.com' |                    |       |        |
|          |                    |                    |       |        |
|          | In the Complete?   |                    |       |        |
|          | Field, select      |                    |       |        |
|          | 'Complete'         |                    |       |        |
|          |                    |                    |       |        |
|          | Click 'Save and    |                    |       |        |
|          | Exit Form'         |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| 3.       | Log out            | test_user is       | **☐   |        |
|          |                    | logged out         | P     |        |
|          | Log in as          |                    | ass** |        |
|          | test_user2         | test_user2 is      |       |        |
|          |                    | logged in          | *     |        |
|          |                    |                    | *Fail |        |
|          |                    |                    | ☐**   |        |
+----------+--------------------+--------------------+-------+--------+
| 4.       | Click on           | Project opens      | **☐   |        |
|          | '                  |                    | P     |        |
|          | Project_CUH_v1381' | Record Status      | ass** |        |
|          |                    | Dashboard opens    |       |        |
|          | Click on 'Record   |                    | *     |        |
|          | Status Dashboard'  | The instrument     | *Fail |        |
|          |                    | opens              | ☐**   |        |
|          | Click on 'Text     |                    |       |        |
|          | Validation'        |                    |       |        |
|          | instrument for     |                    |       |        |
|          | Record 1           |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| 5.       | Click the grey     | 'Data Resolution   | **☐   |        |
|          | message bubble for | Workflow' window   | P     |        |
|          | the 'Name' field.  | opens.             | ass** |        |
|          |                    |                    |       |        |
|          |                    | The log of first   | *     |        |
|          |                    | entry of data, i.e | *Fail |        |
|          |                    |                    | ☐**   |        |
|          |                    | Date/Time of data  |       |        |
|          |                    | entry,             |       |        |
|          |                    |                    |       |        |
|          |                    | The username of    |       |        |
|          |                    | the user that      |       |        |
|          |                    | entered the data   |       |        |
|          |                    | (test_user) and    |       |        |
|          |                    | details of data    |       |        |
|          |                    | entry appear in    |       |        |
|          |                    | the first row.     |       |        |
|          |                    |                    |       |        |
|          |                    | The second row has |       |        |
|          |                    | options 'Verified  |       |        |
|          |                    | data value' or     |       |        |
|          |                    | 'Open query'       |       |        |
+----------+--------------------+--------------------+-------+--------+
| 6.       | Select 'Verified   | A green tick       | **☐   |        |
|          | data value'        | appears in place   | P     |        |
|          |                    | of the grey speech | ass** |        |
|          | Click the button   | bubble to mark     |       |        |
|          | 'Verified data     | data as verified.  | *     |        |
|          | value'             |                    | *Fail |        |
|          |                    |                    | ☐**   |        |
+----------+--------------------+--------------------+-------+--------+
| 7.       | Click the green    | The first two rows | **☐   |        |
|          | tick               | show data changes  | P     |        |
|          |                    | made by test_user  | ass** |        |
|          | Select De-verify   | and test_user2.    |       |        |
|          | data value and     |                    | *     |        |
|          | click the button   | Options to         | *Fail |        |
|          | 'De-verify data    | De-verify data     | ☐**   |        |
|          | value'             | value and Open     |       |        |
|          |                    | query show         |       |        |
|          | Click 'Close'      |                    |       |        |
|          | popup              | A pop-up prompting |       |        |
|          |                    | 'A comment is      |       |        |
|          | Enter 'Test        | required. Please   |       |        |
|          | de-verify data' in | enter a comment.'  |       |        |
|          | the comment box.   | appears            |       |        |
|          |                    |                    |       |        |
|          | Click 'De-verify   | The pop up is      |       |        |
|          | data value' button | closed             |       |        |
|          |                    |                    |       |        |
|          |                    | The comment is     |       |        |
|          |                    | saved.             |       |        |
|          |                    |                    |       |        |
|          |                    | A red exclamation  |       |        |
|          |                    | mark appears next  |       |        |
|          |                    | to the field to    |       |        |
|          |                    | show the data is   |       |        |
|          |                    | de-verified.       |       |        |
+----------+--------------------+--------------------+-------+--------+
| 8.       | Click 'Resolve     | Data Quality page  | **☐   |        |
|          | Issues' in the     | shows up with      | P     |        |
|          | left navigation    | Resolve Issues tab | ass** |        |
|          | bar                | selected           |       |        |
|          |                    |                    | *     |        |
|          | In 'Data           | The 'ptname_v2_v2' | *Fail |        |
|          | Resolution         | field shows up for | ☐**   |        |
|          | Dashboard' filter, | Record 1 with the  |       |        |
|          | select 'All status | values             |       |        |
|          | types'             | 'test_user2' and   |       |        |
|          |                    | '' for First       |       |        |
|          |                    | Update Column and  |       |        |
|          |                    | 'test_user2' and   |       |        |
|          |                    | 'Test de-verify    |       |        |
|          |                    | data' for Last     |       |        |
|          |                    | Update Column      |       |        |
+----------+--------------------+--------------------+-------+--------+
| 9.       | Click 'Record      | Record Status      | **☐   |        |
|          | Status Dashboard'  | Dashboard opens.   | P     |        |
|          |                    |                    | ass** |        |
|          | Click the          | The instrument     |       |        |
|          | instrument 'Text   | opens              | *     |        |
|          | validation' for    |                    | *Fail |        |
|          | Record 1           | 'Data Resolution   | ☐**   |        |
|          |                    | workflow' window   |       |        |
|          | Click on the grey  | opens              |       |        |
|          | bubble next to     |                    |       |        |
|          | 'Email' textbox    | Query is saved. A  |       |        |
|          |                    | yellow message     |       |        |
|          | Select Open query. | bubble with a red  |       |        |
|          | Select 'test_user' | exclamation mark   |       |        |
|          | in Assign query to | appears next to    |       |        |
|          | a user (optional)  | the email text     |       |        |
|          | dropdown           | box.               |       |        |
|          |                    |                    |       |        |
|          | Check 'Email' and  | Query is opened    |       |        |
|          | 'REDCap Messenger' | and saved. The     |       |        |
|          | checkboxes.        | window closes.     |       |        |
|          |                    |                    |       |        |
|          | Type 'Please check | An email and a     |       |        |
|          | email'             | message on         |       |        |
|          |                    | Messenger is sent  |       |        |
|          | In the comments    | to test_user       |       |        |
|          | section.           |                    |       |        |
|          |                    |                    |       |        |
|          | Click 'Open query' |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| 10.      | Log out            | test_user2 is      |       |        |
|          |                    | logged out         |       |        |
+----------+--------------------+--------------------+-------+--------+
| 11.      | Log in as          | test_user is       | **☐   |        |
|          | test_user          | logged in          | P     |        |
|          |                    |                    | ass** |        |
|          | On the top         | The test_user sees |       |        |
|          | navigation bar,    | a message          | *     |        |
|          | under Messenger    | 'Assigned to data  | *Fail |        |
|          | tab, the User is   | Query'.            | ☐**   |        |
|          | notified of a new  |                    |       |        |
|          | message. Click the | The message 'You   |       |        |
|          | Messenger tab.     | have been assigned |       |        |
|          |                    | to a data query    |       |        |
|          | Open the message.  | that was just      |       |        |
|          |                    | opened in the      |       |        |
|          | Click the link in  | REDCap project     |       |        |
|          | the message under  | \"Pr               |       |        |
|          | 'Open the data     | oject_CUH_v1381\"' |       |        |
|          | query assigned to  | is seen.           |       |        |
|          | you:'              |                    |       |        |
|          |                    | The data           |       |        |
|          | Close the window   | resolution         |       |        |
|          | by clicking        | workflow window    |       |        |
|          | 'Cancel'           | for the given      |       |        |
|          |                    | query opens        |       |        |
|          | Click on           |                    |       |        |
|          | '                  | The window closes. |       |        |
|          | Project_CUH_v1381' | (A similar email   |       |        |
|          |                    | is also received   |       |        |
|          | Click on 'Record   | by the test_user)  |       |        |
|          | Status Dashboard'  |                    |       |        |
|          |                    | Project opens      |       |        |
|          | Click on 'Text     |                    |       |        |
|          | Validation'        | Record Status      |       |        |
|          | instrument for     | Dashboard opens    |       |        |
|          | Record 1           |                    |       |        |
|          |                    | The instrument     |       |        |
|          | Click on the       | opens              |       |        |
|          | yellow speech      |                    |       |        |
|          | bubble with the    | Data Resolution    |       |        |
|          | red exclamation    | workflow window    |       |        |
|          | mark next to       | opens              |       |        |
|          | 'Email' field      |                    |       |        |
|          |                    | Pop up saying,     |       |        |
|          | Under 'Reply with  | 'Document was      |       |        |
|          | response' select   | successfully       |       |        |
|          | 'Verified --       | uploaded!' shows.  |       |        |
|          | Confirmed correct  |                    |       |        |
|          | (no error)'        | The pop up is      |       |        |
|          |                    | closed             |       |        |
|          | Click 'Upload      |                    |       |        |
|          | file'. Upload file | A pop up 'Error -- |       |        |
|          | 'Send-it.csv'      | Enter comment'     |       |        |
|          |                    | shows up           |       |        |
|          | 'Close' the pop    |                    |       |        |
|          | up.                | The comment is     |       |        |
|          |                    | saved and the      |       |        |
|          | Click 'Respond to  | window closes. A   |       |        |
|          | query'.            | blue exclamation   |       |        |
|          |                    | appears next to    |       |        |
|          | Close pop-up.      | the field to       |       |        |
|          | Enter 'The value   | indicate the query |       |        |
|          | is correct' in the | is responded to.   |       |        |
|          | comment box. Click |                    |       |        |
|          | 'Respond to query' | No option to       |       |        |
|          |                    | 'Close query' is   |       |        |
|          | Click on the       | made available as  |       |        |
|          | yellow speech      | test_user does not |       |        |
|          | bubble with the    | have these rights. |       |        |
|          | blue exclamation   | A warning message  |       |        |
|          | mark next to       | 'Awaiting action   |       |        |
|          | 'Email' field      | by user with       |       |        |
|          |                    | sufficient user    |       |        |
|          | Close the window   | privileges.'       |       |        |
|          |                    | appears at the     |       |        |
|          |                    | bottom of the      |       |        |
|          |                    | window             |       |        |
|          |                    |                    |       |        |
|          |                    | The window is      |       |        |
|          |                    | closed             |       |        |
+----------+--------------------+--------------------+-------+--------+
| 12.      | Click 'Resolve     | Data Quality page  | **☐   |        |
|          | issues' in the     | shows up with      | P     |        |
|          | left navigation    | Resolve Issues tab | ass** |        |
|          | bar.               | selected           |       |        |
|          |                    |                    | *     |        |
|          | In 'Data           | The 'email_v2'     | *Fail |        |
|          | Resolution         | field shows up for | ☐**   |        |
|          | Dashboard' filter, | Record 1 with the  |       |        |
|          | select 'Open       | values             |       |        |
|          | responded'         | 'test_user2' and   |       |        |
|          |                    | 'Please check      |       |        |
|          | In 'Data           | email' for First   |       |        |
|          | Resolution         | Update Column and  |       |        |
|          | Dashboard' filter, | 'test_user' and'   |       |        |
|          | select 'All status | The value is       |       |        |
|          | types'             | correct' for Last  |       |        |
|          |                    | Update Column      |       |        |
|          | Click 'Export'     |                    |       |        |
|          | button             | Both,              |       |        |
|          |                    | 'ptname_v2_v2' and |       |        |
|          | In 'Data           | 'email_v2'         |       |        |
|          | Resolution         |                    |       |        |
|          | Dashboard' filter, | entries are shown  |       |        |
|          | select 'Data       |                    |       |        |
|          | De-verified'       | A csv file with    |       |        |
|          |                    | both query         |       |        |
|          | Under 'Click       | information        |       |        |
|          | button to          | downloads          |       |        |
|          |                    |                    |       |        |
|          | view data query'   | An entry for       |       |        |
|          | click the button   | 'ptname_v2_v2'     |       |        |
|          | with a red         | shows as           |       |        |
|          | exclamation mark   | De-verified data   |       |        |
|          | for field          |                    |       |        |
|          | 'ptname_v2_v2'     | Data Resolution    |       |        |
|          |                    | workflow window    |       |        |
|          | Close the Data     | opens with Record  |       |        |
|          | Resolution         | ID 1 and history   |       |        |
|          | workflow window.   | of comments for    |       |        |
|          |                    | the de-verified    |       |        |
|          |                    | data field.        |       |        |
|          |                    |                    |       |        |
|          |                    | A warning          |       |        |
|          |                    | 'Awaiting action   |       |        |
|          |                    | by user with       |       |        |
|          |                    | sufficient user    |       |        |
|          |                    | privileges' is     |       |        |
|          |                    | shown.             |       |        |
|          |                    |                    |       |        |
|          |                    | 'Data Resolution   |       |        |
|          |                    | Workflow' window   |       |        |
|          |                    | closes             |       |        |
+----------+--------------------+--------------------+-------+--------+
| 13.      | In 'Data           |                    | **☐   |        |
|          | Resolution         |                    | P     |        |
|          | Dashboard' filter, | Entry for field    | ass** |        |
|          | select 'All status | 'email_v2' appears |       |        |
|          | types'             | for Record 1       | *     |        |
|          |                    |                    | *Fail |        |
|          | Under 'All fields  | 'No results to     | ☐**   |        |
|          | and rules' select  | display' is seen   |       |        |
|          | 'email_v2'         |                    |       |        |
|          |                    | test_user is       |       |        |
|          | Under 'All events' | logged out         |       |        |
|          | select 'Event 1'   |                    |       |        |
|          |                    |                    |       |        |
|          | Under 'User        |                    |       |        |
|          | assigned' select   |                    |       |        |
|          | 'test_user'        |                    |       |        |
|          |                    |                    |       |        |
|          | Under 'All events' |                    |       |        |
|          | select 'Event 1'   |                    |       |        |
|          |                    |                    |       |        |
|          | Under 'User        |                    |       |        |
|          | assigned' select   |                    |       |        |
|          | 'test_user'        |                    |       |        |
|          |                    |                    |       |        |
|          | Logout.            |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| 14.      | Login as           | test_user2 is      | **☐   |        |
|          | 'test_user2'.      | logged in          | P     |        |
|          |                    |                    | ass** |        |
|          | Click on           | Project opens      |       |        |
|          | '                  |                    | *     |        |
|          | Project_CUH_v1381' | Record status      | *Fail |        |
|          |                    | Dashboard opens    | ☐**   |        |
|          | Click on 'Record   |                    |       |        |
|          | Status Dashboard'  | The instrument     |       |        |
|          |                    | opens              |       |        |
|          | Click on 'Text     |                    |       |        |
|          | Validation'        | Status says Data   |       |        |
|          | instrument for     | De-verified        |       |        |
|          | Record 1           |                    |       |        |
|          |                    | The value is       |       |        |
|          | Click the red      | marked as verified |       |        |
|          | exclamation mark   | and the window     |       |        |
|          | next to 'Name'     | closes. A green    |       |        |
|          | field              | tick appears next  |       |        |
|          |                    | to the field       |       |        |
|          | Select 'Verified   |                    |       |        |
|          | data value'. Click |                    |       |        |
|          | 'Verify data       |                    |       |        |
|          | value' button      |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| 15.      | Click the speech   | The 'Data          | **☐   |        |
|          | bubble with the    | Resolution         | P     |        |
|          | blue exclamation   | workflow' window   | ass** |        |
|          | mark next to the   | appears. The       |       |        |
|          | 'Email' field      | recent comments    | *     |        |
|          |                    | from 'test_user',  | *Fail |        |
|          | Click the file     | 'The value is      | ☐**   |        |
|          | uploaded by        | correct' are       |       |        |
|          | 'test_user'.       | shown, along with  |       |        |
|          |                    | the uploaded file. |       |        |
|          | Select 'Send back  |                    |       |        |
|          | for further        | The 'send-it.csv'  |       |        |
|          | attention'.        | file downloads.    |       |        |
|          |                    |                    |       |        |
|          | Type in a comment  | The comment is     |       |        |
|          | 'Please clarify'   | saved and window   |       |        |
|          | and click the      | closes. A red      |       |        |
|          | button 'Send back  | exclamation mark   |       |        |
|          | for further        | to indicate an     |       |        |
|          | attention'         | open query shows   |       |        |
|          |                    | next to the text   |       |        |
|          | Log out.           | field.             |       |        |
|          |                    |                    |       |        |
|          |                    | test_user2 is      |       |        |
|          |                    | logged out         |       |        |
+----------+--------------------+--------------------+-------+--------+
| 16.      | Login as           | test_user is       | **☐   |        |
|          | 'test_user'        | logged in          | P     |        |
|          |                    |                    | ass** |        |
|          | Click on           | Project opens      |       |        |
|          | '                  |                    | *     |        |
|          | Project_CUH_v1381' | The data quality   | *Fail |        |
|          |                    | page with Resolve  | ☐**   |        |
|          | Click 'Resolve     | issues tab         |       |        |
|          | Issues' in the     | selected           |       |        |
|          | left navigation    |                    |       |        |
|          | bar                | The recently       |       |        |
|          |                    | opened query on    |       |        |
|          | Under 'Data        | 'email_v2' field   |       |        |
|          | Resolution         | shows along with   |       |        |
|          | Dashboard' filter, | the latest update  |       |        |
|          | select 'Open /     | 'Please clarify'   |       |        |
|          | unresolved issues' | and the first      |       |        |
|          |                    | update 'Please     |       |        |
|          |                    | check email'       |       |        |
+----------+--------------------+--------------------+-------+--------+
| 17.      | Under 'Click       | 'Data Resolution   | **☐   |        |
|          | button to          | Workflow' window   | P     |        |
|          |                    | for 'email_v2'     | ass** |        |
|          | view data query'   | opens              |       |        |
|          | click the button   |                    | *     |        |
|          | for record 1       | Response is saved. | *Fail |        |
|          |                    | Data Resolution    | ☐**   |        |
|          | Select 'Corrected  | Workflow window    |       |        |
|          | -- Typographical   | closes.            |       |        |
|          | error'.            |                    |       |        |
|          |                    | Under 'Click       |       |        |
|          | Enter 'Corrected'  | button to          |       |        |
|          | under comments and |                    |       |        |
|          | click 'Respond to  | view data query' 4 |       |        |
|          | query'             | comments are seen  |       |        |
|          |                    | and under Last     |       |        |
|          |                    | Update column, the |       |        |
|          |                    | most recent        |       |        |
|          |                    | comment            |       |        |
|          |                    | 'Corrected'        |       |        |
|          |                    | appears with the   |       |        |
|          |                    | username and time  |       |        |
|          |                    | of comment update  |       |        |
+----------+--------------------+--------------------+-------+--------+
| 18.      | Click 'Record      | Record Status      | **☐   |        |
|          | Status Dashboard'  | Dashboard opens    | P     |        |
|          |                    |                    | ass** |        |
|          | Click on 'Text     | 'Text Validation'  |       |        |
|          | Validation'        | instrument opens   | *     |        |
|          | instrument for     |                    | *Fail |        |
|          | Record 1           | The form is saved  | ☐**   |        |
|          |                    |                    |       |        |
|          | In the Name field, | 'Text Validation'  |       |        |
|          | delete the value   | instrument opens   |       |        |
|          | and type 'Joe'     |                    |       |        |
|          |                    | And a red          |       |        |
|          | Click 'Save and    | exclamation mark   |       |        |
|          | Exit Form'         | appears next to    |       |        |
|          |                    | Name field.        |       |        |
|          | Click on 'Text     |                    |       |        |
|          | Validation'        | Data Resolution    |       |        |
|          | instrument for     | Workflow window    |       |        |
|          | Record 1           | pops up with a new |       |        |
|          |                    | entry              |       |        |
|          | Click the red      | '                  |       |        |
|          | exclamation mark   | Action:De-verified |       |        |
|          | next to 'Name'     | data value         |       |        |
|          | field              | (automatically via |       |        |
|          |                    | data change)'.     |       |        |
|          | Close the window   |                    |       |        |
|          | and log out        | test_user is       |       |        |
|          |                    | logged out         |       |        |
+----------+--------------------+--------------------+-------+--------+
| 19.      | Login as           | Logged in as       | **☐   |        |
|          | 'test_user2'       | 'test_user2'       | P     |        |
|          |                    |                    | ass** |        |
|          | Click 'Resolve     | Data Quality page  |       |        |
|          | Issues'            | with Resolve       | *     |        |
|          |                    | Issues tab opens   | *Fail |        |
|          | In 'Data           |                    | ☐**   |        |
|          | Resolution         | The recently       |       |        |
|          | Dashboard' filter, | responded to query |       |        |
|          | select 'Open       | on 'email_v2'      |       |        |
|          | responded'         | field shows along  |       |        |
|          |                    | with the latest    |       |        |
|          |                    | update             |       |        |
+----------+--------------------+--------------------+-------+--------+
| 20.      | Click on the       | Record 1 with      | **☐   |        |
|          | record number 1.   | responded query    | P     |        |
|          |                    | field opens        | ass** |        |
|          | Click the speech   |                    |       |        |
|          | bubble with the    | Data Resolution    | *     |        |
|          | blue exclamation   | Workflow window    | *Fail |        |
|          | mark next to       | opens              | ☐**   |        |
|          | 'Email' text       |                    |       |        |
|          | field.             |                    |       |        |
|          |                    |                    |       |        |
|          | Select 'Close the  |                    |       |        |
|          | query'.            |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| 21.      | Enter 'Closed' in  | The comment is     | **☐   |        |
|          | the comment box    | saved and the      | P     |        |
|          | and click 'Close   | window closes      | ass** |        |
|          | the query'         |                    |       |        |
|          |                    | A green tick       | *     |        |
|          | Log out.           | appears next to    | *Fail |        |
|          |                    | the field to       | ☐**   |        |
|          |                    | indicate query is  |       |        |
|          |                    | closed             |       |        |
|          |                    |                    |       |        |
|          |                    | test_user2 is      |       |        |
|          |                    | logged out         |       |        |
+----------+--------------------+--------------------+-------+--------+
| 22.      | Login as           | test_user is       | **☐   |        |
|          | 'test_user'        | logged in          | P     |        |
|          |                    |                    | ass** |        |
|          | Click 'My          | 'My Projects' page |       |        |
|          | Projects'          | opens              | *     |        |
|          |                    |                    | *Fail |        |
|          | Select             | Home page for      | ☐**   |        |
|          | Project_CUH_v1381  | Project_CUH_v1381  |       |        |
|          |                    | opens              |       |        |
|          | Click 'Resolve     |                    |       |        |
|          | Issues'            | Data Quality page  |       |        |
|          |                    | with Resolve tab   |       |        |
|          | In 'Data           | opens              |       |        |
|          | Resolution         |                    |       |        |
|          | Dashboard' filter  | No queries are     |       |        |
|          |                    | shown              |       |        |
|          | select 'Open /     |                    |       |        |
|          | unresolved issues' |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| 23.      | In 'Data           | The recently       | **☐   |        |
|          | Resolution         | closed query on    | P     |        |
|          | Dashboard' filter, | 'email_v2' is      | ass** |        |
|          |                    | shown with the     |       |        |
|          | select             | latest comments    | *     |        |
|          | 'Closed/resolved   |                    | *Fail |        |
|          | issues'            | test_user logs out | ☐**   |        |
|          |                    |                    |       |        |
|          | Logout             |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| 24.      | Login as           | Logged in as       | **☐   |        |
|          | test_admin         | test_admin         | P     |        |
|          |                    |                    | ass** |        |
|          | Click 'My          | 'My Projects' page |       |        |
|          | Projects'          | opens              | *     |        |
|          |                    |                    | *Fail |        |
|          | Select             | Home page for      | ☐**   |        |
|          | Project_CUH_v1381  | Project_CUH_v1381  |       |        |
|          |                    | opens              |       |        |
|          | Click on 'User     |                    |       |        |
|          | Rights' in the     | User rights page   |       |        |
|          | navigation bar     | opens              |       |        |
|          |                    |                    |       |        |
|          | Click 'test_user'  | User actions       |       |        |
|          | in the User right  | window pops up     |       |        |
|          | table              |                    |       |        |
|          |                    | User privileges    |       |        |
|          | Select 'Edit user  | window opens       |       |        |
|          | privileges'        |                    |       |        |
|          |                    | User privileges    |       |        |
|          | Under 'Other       | window closes and  |       |        |
|          | privileges:'       | 'User "test_user"  |       |        |
|          | select 'No access' | successfully       |       |        |
|          | for 'Data          | edited' message    |       |        |
|          | Resolution         | appears            |       |        |
|          | Workflow'          |                    |       |        |
|          |                    |                    |       |        |
|          | Click 'Save        |                    |       |        |
|          | Changes'           |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| 25.      | Click 'test_user2' | User actions       | **☐   |        |
|          |                    | window pops up     | P     |        |
|          | Select 'Edit user  |                    | ass** |        |
|          | privileges'        | User privileges    |       |        |
|          |                    | window opens       | *     |        |
|          | Under 'Other       |                    | *Fail |        |
|          | privileges:'       | User privileges    | ☐**   |        |
|          | select 'View only' | window closes and  |       |        |
|          | for 'Data          | 'User "test_user2" |       |        |
|          | Resolution         | successfully       |       |        |
|          | Workflow'          | edited 'message    |       |        |
|          |                    | appears            |       |        |
|          | Click 'Save        |                    |       |        |
|          | Changes'           | test_admin is      |       |        |
|          |                    | logged out         |       |        |
|          | Logout             |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| 26.      | Login as           | Logged in as       | **☐   |        |
|          | 'test_user'        | test_user          | P     |        |
|          |                    |                    | ass** |        |
|          | Click 'My          | 'My Projects' page |       |        |
|          | Projects'          | opens              | *     |        |
|          |                    |                    | *Fail |        |
|          | Select             | Home page for      | ☐**   |        |
|          | Project_CUH_v1381  | Project_CUH_v1381  |       |        |
|          |                    | opens              |       |        |
|          | Click 'Record      |                    |       |        |
|          | Status Dashboard'  | Record Status      |       |        |
|          |                    | Dashboard opens    |       |        |
|          | Click on 'Text     |                    |       |        |
|          | Validation'        | 'Text Validation'  |       |        |
|          | instrument for     | instrument opens   |       |        |
|          | Record 1           |                    |       |        |
|          |                    | The Data           |       |        |
|          | Logout             | resolution         |       |        |
|          |                    | workflow icon next |       |        |
|          |                    | to both, Name and  |       |        |
|          |                    | Email fields       |       |        |
|          |                    |                    |       |        |
|          |                    | is not available.  |       |        |
|          |                    |                    |       |        |
|          |                    | test_user is       |       |        |
|          |                    | logged out         |       |        |
+----------+--------------------+--------------------+-------+--------+
| 27.      | Login as           | Logged in as       | **☐   |        |
|          | 'test_user2'       | test_user2         | P     |        |
|          |                    |                    | ass** |        |
|          | Click 'My          | 'My Projects' page |       |        |
|          | Projects'          | opens              | *     |        |
|          |                    |                    | *Fail |        |
|          | Select             | Home page for      | ☐**   |        |
|          | Project_CUH_v1381  | Project_CUH_v1381  |       |        |
|          |                    | opens              |       |        |
|          | Click 'Record      |                    |       |        |
|          | Status Dashboard'  | Record Status      |       |        |
|          |                    | Dashboard opens    |       |        |
|          | Click on 'Text     |                    |       |        |
|          | Validation'        | 'Text Validation'  |       |        |
|          | instrument for     | instrument opens   |       |        |
|          | Record 1           |                    |       |        |
|          |                    | The 'Data          |       |        |
|          | Click the data     | Resolution         |       |        |
|          | resolution icon    | Workflow' window   |       |        |
|          | next to 'Name'     | opens in read only |       |        |
|          | field              | mode -- Options to |       |        |
|          |                    | open query/respond |       |        |
|          | Close the 'Data    | to query/ close    |       |        |
|          | Resolution         | query are not      |       |        |
|          | Workflow' window   | available.         |       |        |
|          |                    |                    |       |        |
|          | Logout             | A warning message  |       |        |
|          |                    | 'Awaiting action   |       |        |
|          |                    | by user with       |       |        |
|          |                    | sufficient user    |       |        |
|          |                    | privileges.'       |       |        |
|          |                    | appears at the     |       |        |
|          |                    | bottom of the      |       |        |
|          |                    | window             |       |        |
|          |                    |                    |       |        |
|          |                    | 'Data Resolution   |       |        |
|          |                    | Workflow' window   |       |        |
|          |                    | closes             |       |        |
|          |                    |                    |       |        |
|          |                    | test_user2 is      |       |        |
|          |                    | logged out         |       |        |
+----------+--------------------+--------------------+-------+--------+
| 28.      | Login as           | Logged in as       | **☐   |        |
|          | test_admin         | test_admin         | P     |        |
|          |                    |                    | ass** |        |
|          | Click 'My          | 'My Projects' page |       |        |
|          | Projects'          | opens              | *     |        |
|          |                    |                    | *Fail |        |
|          | Select             | Project_CUH_v1381  | ☐**   |        |
|          | Project_CUH_v1381  | opens              |       |        |
|          |                    |                    |       |        |
|          | Click on 'User     | User rights page   |       |        |
|          | Rights'            | opens              |       |        |
|          |                    |                    |       |        |
|          | Click 'test_user'  | User actions       |       |        |
|          |                    | window pops up     |       |        |
|          | Select 'Edit user  |                    |       |        |
|          | privileges'        | User privileges    |       |        |
|          |                    | window opens       |       |        |
|          | Under 'Other       |                    |       |        |
|          | privileges:'       | User privileges    |       |        |
|          | select 'Open       | window closes and  |       |        |
|          | queries only'      | 'User "test_user"  |       |        |
|          | under 'Data        | successfully       |       |        |
|          | Resolution         | edited ' message   |       |        |
|          | Workflow'          | appears            |       |        |
|          |                    |                    |       |        |
|          | Click 'Save        |                    |       |        |
|          | Changes'           |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| 29.      | Click 'test_user2' | User actions       | **☐   |        |
|          |                    | window pops up     | P     |        |
|          | Select 'Edit user  |                    | ass** |        |
|          | privileges'        | User privileges    |       |        |
|          |                    | window opens       | *     |        |
|          | Under 'Other       |                    | *Fail |        |
|          | privileges:'       | User privileges    | ☐**   |        |
|          | select 'Open and   | window closes and  |       |        |
|          | respond to         | 'User "test_user2" |       |        |
|          | queries' under     | successfully       |       |        |
|          | 'Data Resolution   | edited' message    |       |        |
|          | Workflow'          | appears            |       |        |
|          |                    |                    |       |        |
|          | Click 'Save        | test_admin is      |       |        |
|          | Changes'           | logged out         |       |        |
|          |                    |                    |       |        |
|          | Log out            |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| 30.      | Login as test_user | Logged in as       | **☐   |        |
|          |                    | test_user          | P     |        |
|          | Click 'My          |                    | ass** |        |
|          | Projects'          | 'My Projects' page |       |        |
|          |                    | opens              | *     |        |
|          | Select             |                    | *Fail |        |
|          | Project_CUH_v1381  | Project_CUH_v1381  | ☐**   |        |
|          |                    | opens              |       |        |
|          | Click 'Record      |                    |       |        |
|          | Status Dashboard'  | Record Status      |       |        |
|          |                    | Dashboard opens    |       |        |
|          | Click on 'Text     |                    |       |        |
|          | Validation'        | 'Text Validation'  |       |        |
|          | instrument for     | instrument opens   |       |        |
|          | Record 1           |                    |       |        |
|          |                    | Data Resolution    |       |        |
|          | Click the data     | Workflow window    |       |        |
|          | resolution icon    | opens. An option   |       |        |
|          | next to 'Email'    | to 'Open query' is |       |        |
|          | field              | available.         |       |        |
|          |                    |                    |       |        |
|          | Check 'Reopen the  | Query is saved and |       |        |
|          | closed query'      | Data Resolution    |       |        |
|          | checkbox.          | Workflow window    |       |        |
|          |                    | closes.            |       |        |
|          | In comments box,   |                    |       |        |
|          | type 'Reopen the   | A red exclamation  |       |        |
|          | closed query'      | mark is seen on    |       |        |
|          |                    | the 'Data          |       |        |
|          | Click 'Reopen      | Resolution         |       |        |
|          | query' button      | Workflow' icon.    |       |        |
|          |                    |                    |       |        |
|          | Click the data     | Data Resolution    |       |        |
|          | resolution icon    | Workflow window    |       |        |
|          | next to 'Email'    | opens. Options to  |       |        |
|          | field              | close/respond to   |       |        |
|          |                    | queries is not     |       |        |
|          | Close the Data     | available. A       |       |        |
|          | Resolution         | warning message    |       |        |
|          | Workflow window    | 'Awaiting action   |       |        |
|          |                    | by user with       |       |        |
|          | Logout             | sufficient user    |       |        |
|          |                    | privileges.'       |       |        |
|          |                    | appears            |       |        |
|          |                    |                    |       |        |
|          |                    | Data Resolution    |       |        |
|          |                    | Workflow window    |       |        |
|          |                    | closes             |       |        |
|          |                    |                    |       |        |
|          |                    | test_user is       |       |        |
|          |                    | logged out         |       |        |
+----------+--------------------+--------------------+-------+--------+
| 31.      | Login as           | Logged in as       | **☐   |        |
|          | test_user2         | test_user2         | P     |        |
|          |                    |                    | ass** |        |
|          | Click 'My          | 'My Projects' page |       |        |
|          | Projects'          | opens              | *     |        |
|          |                    |                    | *Fail |        |
|          | Select             | Project_CUH_v1381  | ☐**   |        |
|          | Project_CUH_v1381  | opens              |       |        |
|          |                    |                    |       |        |
|          | Click 'Record      | Record Status      |       |        |
|          | Status Dashboard'  | Dashboard opens    |       |        |
|          |                    |                    |       |        |
|          | Click on 'Text     | 'Text Validation'  |       |        |
|          | Validation'        | instrument opens   |       |        |
|          | instrument for     |                    |       |        |
|          | Record 1           | Data Resolution    |       |        |
|          |                    | Workflow window    |       |        |
|          | Click the data     | opens. An option   |       |        |
|          | resolution icon    | to 'Open query' is |       |        |
|          | next to 'Name'     | available.         |       |        |
|          | field              |                    |       |        |
|          |                    | Query is opened    |       |        |
|          | Select 'Open       | and saved. Data    |       |        |
|          | query'.            | Resolution         |       |        |
|          |                    | Workflow window    |       |        |
|          | In comments box    | closes             |       |        |
|          | type 'New query'   |                    |       |        |
|          |                    | Data Resolution    |       |        |
|          | Click 'Open query' | Workflow window    |       |        |
|          | button             | opens. An option   |       |        |
|          |                    | to respond to      |       |        |
|          | Click the data     | query is           |       |        |
|          | resolution icon    | available.         |       |        |
|          | next to 'Email'    |                    |       |        |
|          | field              | Response is saved. |       |        |
|          |                    | Data Resolution    |       |        |
|          | Under 'Reply with  | Workflow window    |       |        |
|          | response:' select  | closes             |       |        |
|          |                    |                    |       |        |
|          | 'Corrected -- Data | The query is shown |       |        |
|          | missing'           | as responded to    |       |        |
|          |                    | with a blue        |       |        |
|          | In comments field, | exclamation mark   |       |        |
|          | type 'Response'    | on the data        |       |        |
|          |                    | resolution icon.   |       |        |
|          | Click the button   |                    |       |        |
|          | 'Respond to query' | Data Resolution    |       |        |
|          |                    | Workflow window    |       |        |
|          | Click the data     | opens. There is no |       |        |
|          | resolution icon    | option available   |       |        |
|          | next to 'Email'    | to close the       |       |        |
|          | field              | query.A message    |       |        |
|          |                    | 'Awaiting action   |       |        |
|          | Close Data         | by user with       |       |        |
|          | Resolution         | sufficient user    |       |        |
|          | Workflow window    | privileges.'       |       |        |
|          |                    | appears at the     |       |        |
|          | Logout             | bottom of the      |       |        |
|          |                    | window.            |       |        |
|          |                    |                    |       |        |
|          |                    | Data Resolution    |       |        |
|          |                    | Workflow window    |       |        |
|          |                    | closes             |       |        |
|          |                    |                    |       |        |
|          |                    | test_user2 is      |       |        |
|          |                    | logged out         |       |        |
+----------+--------------------+--------------------+-------+--------+
| > 32\.   | Login as           | Logged in as       | **☐   |        |
|          | test_admin         | test_admin         | P     |        |
|          |                    |                    | ass** |        |
|          | Click 'My          | 'My Projects' page |       |        |
|          | Projects'          | opens              | *     |        |
|          |                    |                    | *Fail |        |
|          | Select             | Project_CUH_v1381  | ☐**   |        |
|          | Project_CUH_v1381  | opens              |       |        |
|          |                    |                    |       |        |
|          | Click 'Project     | 'Project Setup'    |       |        |
|          | Setup'             | tab opens          |       |        |
|          |                    |                    |       |        |
|          | Under 'Enable      | Additional         |       |        |
|          | optional modules   | customizations     |       |        |
|          | and                | window pops up     |       |        |
|          | customizations',   |                    |       |        |
|          | select 'Additional | A message          |       |        |
|          | customizations'    | 'Success! Your     |       |        |
|          |                    | changes have been  |       |        |
|          | Under 'Enable the  | saved' appears     |       |        |
|          | Field Comment Log  |                    |       |        |
|          | or Data Resolution | test_admin is      |       |        |
|          | Workflow (Data     | logged out         |       |        |
|          | Queries)?', select |                    |       |        |
|          | 'Field comment     |                    |       |        |
|          | log'               |                    |       |        |
|          |                    |                    |       |        |
|          | Click save         |                    |       |        |
|          |                    |                    |       |        |
|          | Log out            |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| > 33\.   | Login as test_user | Logged in as       | **☐   |        |
|          |                    | test_user          | P     |        |
|          | Click 'My          |                    | ass** |        |
|          | Projects'          | 'My Projects' page |       |        |
|          |                    | opens              | *     |        |
|          | Select             |                    | *Fail |        |
|          | Project_CUH_v1381  | Project_CUH_v1381  | ☐**   |        |
|          |                    | opens              |       |        |
|          | Click 'Record      |                    |       |        |
|          | Status Dashboard'  | Record Status      |       |        |
|          |                    | Dashboard opens    |       |        |
|          | Click on 'Record   |                    |       |        |
|          | Status Dashboard'  | New Record 2 is    |       |        |
|          |                    | created.           |       |        |
|          | Click 'Add new     |                    |       |        |
|          | Record for this    | The instrument     |       |        |
|          | arm'               | opens              |       |        |
|          |                    |                    |       |        |
|          | Click on 'Text     | The form is saved  |       |        |
|          | Validation'        |                    |       |        |
|          | instrument for     |                    |       |        |
|          | Record 1           |                    |       |        |
|          |                    |                    |       |        |
|          | In the Name field, |                    |       |        |
|          | type 'John'        |                    |       |        |
|          |                    |                    |       |        |
|          | In the Email       |                    |       |        |
|          | field, type        |                    |       |        |
|          | 'John@example.com' |                    |       |        |
|          |                    |                    |       |        |
|          | In the Complete?   |                    |       |        |
|          | Field, select      |                    |       |        |
|          | 'Complete'         |                    |       |        |
|          |                    |                    |       |        |
|          | Click 'Save and    |                    |       |        |
|          | Exit Form'         |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| > 34\.   | In the record      | The instrument     | **☐   |        |
|          | Dashboard, select  | 'Text Validation'  | P     |        |
|          | the instrument     | opens              | ass** |        |
|          | 'Text Validation'  |                    |       |        |
|          |                    | The 'Field Comment | *     |        |
|          | Click the speech   | Log' opens         | *Fail |        |
|          | bubble next to     |                    | ☐**   |        |
|          | 'Name' field       | The comment is     |       |        |
|          |                    | saved              |       |        |
|          | Type 'Comment 1'   |                    |       |        |
|          | in the comments    | The 'Field Comment |       |        |
|          | box                | Log' opens         |       |        |
|          |                    |                    |       |        |
|          | Click 'Comment'    | The comment is     |       |        |
|          | button             | saved              |       |        |
|          |                    |                    |       |        |
|          | Click the speech   | 'Field Comment     |       |        |
|          | bubble next to     | Log' page loads    |       |        |
|          | \'Email' field     | and shows the two  |       |        |
|          |                    | field comment logs |       |        |
|          | Type 'Comment 2'   | made by test_user  |       |        |
|          | in the comments    |                    |       |        |
|          | box                | A csv file with    |       |        |
|          |                    | the two entries is |       |        |
|          | Click 'Comment'    | downloaded         |       |        |
|          | button             |                    |       |        |
|          |                    | No entries are     |       |        |
|          | Click 'Field       | shown              |       |        |
|          | Comment Log' in    |                    |       |        |
|          | the left           | The 'Comment 2'    |       |        |
|          | navigation bar     | entry for email    |       |        |
|          |                    | log appears        |       |        |
|          | Click the excel    |                    |       |        |
|          | button to download | The user is logged |       |        |
|          | the log            | out                |       |        |
|          |                    |                    |       |        |
|          | Under filters,     |                    |       |        |
|          | select Record '1'  |                    |       |        |
|          |                    |                    |       |        |
|          | Under filters,     |                    |       |        |
|          | select Record 2.   |                    |       |        |
|          |                    |                    |       |        |
|          | Under fields,      |                    |       |        |
|          | select             |                    |       |        |
|          | email_V2(Email)    |                    |       |        |
|          |                    |                    |       |        |
|          | In the users drop  |                    |       |        |
|          | down field, select |                    |       |        |
|          | test_user. Click   |                    |       |        |
|          | 'Apply filters'    |                    |       |        |
|          |                    |                    |       |        |
|          | Log out            |                    |       |        |
+----------+--------------------+--------------------+-------+--------+
| > 35\.   | Login as test_user | Logged in as       | **☐   |        |
|          |                    | test_user          | P     |        |
|          | Click 'My          |                    | ass** |        |
|          | Projects'          | 'My Projects' page |       |        |
|          |                    | opens              | *     |        |
|          | Select             |                    | *Fail |        |
|          | Project_CUH_v1381  | Project_CUH_v1381  | ☐**   |        |
|          |                    | opens              |       |        |
|          | Click 'Record      |                    |       |        |
|          | Status Dashboard'  | Record Status      |       |        |
|          |                    | Dashboard opens    |       |        |
|          | Click 'Text        |                    |       |        |
|          | Validation'        | Text Validation    |       |        |
|          | instrument for     | instrument opens   |       |        |
|          | Record 2           |                    |       |        |
|          |                    | The 'Field Comment |       |        |
|          | Click the speech   | Log' opens.        |       |        |
|          | bubble next to     | Comment 'Comment   |       |        |
|          | 'Name' field       | 1' by test_user is |       |        |
|          |                    | seen along with    |       |        |
|          | Type 'Comment 3    | date and time      |       |        |
|          | test' in the       |                    |       |        |
|          | comments box.      | The comment is     |       |        |
|          | Click 'Comment'    | saved              |       |        |
|          | button             |                    |       |        |
|          |                    | 'Field Comment     |       |        |
|          | Click 'Field       | Log' page loads    |       |        |
|          | Comment Log' in    | and shows the two  |       |        |
|          | the left           | fields with        |       |        |
|          | navigation bar     | comments for       |       |        |
|          |                    | Record 2           |       |        |
|          | Under filters,     |                    |       |        |
|          | select All         | 'Name' field shows |       |        |
|          | records, Event     | two comments,      |       |        |
|          | 1(Arm 1: Arm1),    | 'Comment 1' by     |       |        |
|          | All fields, All    | test_user and      |       |        |
|          | users and in the   | 'Comment 3 test'   |       |        |
|          | keyword field,     | by test_user2,     |       |        |
|          | type 'test'.       | along with date    |       |        |
|          |                    | and time           |       |        |
|          | Click 'Apply       |                    |       |        |
|          | filters'           | 'Comment 3 test'   |       |        |
|          |                    | on Record 2, under |       |        |
|          | Logout             | name field, made   |       |        |
|          |                    | by test_user2 is   |       |        |
|          |                    | shown.             |       |        |
|          |                    |                    |       |        |
|          |                    | The User is logged |       |        |
|          |                    | out                |       |        |
+----------+--------------------+--------------------+-------+--------+
|          | THIS ENDS THE      |                    |       |        |
|          | TESTING FOR THIS   |                    |       |        |
|          | SCRIPT             |                    |       |        |
+----------+--------------------+--------------------+-------+--------+

+-----------+--------------------------------------------+---+---+-----+
| **Con     |                                            |   |   |     |
| clusion** |                                            |   |   |     |
+-----------+--------------------------------------------+---+---+-----+
| Did the   |                                            | > |   | >   |
| Actual    |                                            |   |   |  No |
| Results   |                                            | Y |   |     |
| for each  |                                            | e |   |     |
| test step |                                            | s |   |     |
| match the |                                            |   |   |     |
| Expected  |                                            |   |   |     |
| Results   |                                            |   |   |     |
| listed?   |                                            |   |   |     |
+-----------+--------------------------------------------+---+---+-----+
| > **C     |                                            |   |   |     |
| omments/A |                                            |   |   |     |
| dditional |                                            |   |   |     |
| > Infor   |                                            |   |   |     |
| mation:** |                                            |   |   |     |
| >         |                                            |   |   |     |
| (Indicate |                                            |   |   |     |
| > the     |                                            |   |   |     |
| > step    |                                            |   |   |     |
| > number  |                                            |   |   |     |
| > of the  |                                            |   |   |     |
| > step    |                                            |   |   |     |
| > you     |                                            |   |   |     |
| > wish to |                                            |   |   |     |
| > comment |                                            |   |   |     |
| > on.)    |                                            |   |   |     |
+-----------+--------------------------------------------+---+---+-----+
| **        |                                            | * |   |     |
| Completed |                                            | * |   |     |
| By**      |                                            | D |   |     |
|           |                                            | a |   |     |
|           |                                            | t |   |     |
|           |                                            | e |   |     |
|           |                                            | : |   |     |
|           |                                            | * |   |     |
|           |                                            | * |   |     |
+-----------+--------------------------------------------+---+---+-----+
