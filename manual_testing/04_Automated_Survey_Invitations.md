+-------------+--------+-----------+----------------------------------+
| **System    |        |           |                                  |
| Setup**     |        |           |                                  |
+=============+========+===========+==================================+
| **Database  | >      | > **Ap    | > <https://localhost:8443/>      |
| Version**   | REDCap | plication |                                  |
|             | > 1    | > URL**   |                                  |
|             | 3.8.1  |           |                                  |
+-------------+--------+-----------+----------------------------------+
| **Document  | > Co   | *         | > 1                              |
| Status**    | mplete | *Document |                                  |
|             |        | V         |                                  |
|             |        | ersion ** |                                  |
+-------------+--------+-----------+----------------------------------+

+-----------------------------------------------------------------------+
| **Test Summary**                                                      |
+-----------------------------------------------------------------------+
| **Feature Category Description:** This feature is used to automate    |
| the surveys so that it can be send out at the specified date and time |
| when a logic becomes true or another survey is completed.             |
|                                                                       |
| **Test Purpose Details:** This test script validates if Automated     |
| Survey Invitations works                                              |
|                                                                       |
| **Functional Requirements:**                                          |
|                                                                       |
| -   4.1 The system shall support the ability to send a survey when a  |
|     logic becomes true                                                |
|                                                                       |
| -   4.2 The system shall support the ability to send a survey when    |
|     another survey is completed                                       |
|                                                                       |
| -   4.3 The system shall support the ability to send a survey after a |
|     specified time when a logic becomes true and/or when another      |
|     survey is completed                                               |
|                                                                       |
| -   4.4 The system shall support the ability to send reminder surveys |
|     when the survey is not completed                                  |
|                                                                       |
| -   4.5 The system shall support the ability to download automated    |
|     survey invitations                                                |
|                                                                       |
| -   4.6 The system shall support the ability to upload automated      |
|     survey invitations                                                |
|                                                                       |
| -   4.7 The system shall support the ability to re-evaluate automated |
|     survey invitations                                                |
+-----------------------------------------------------------------------+
|                                                                       |
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
| ** | **U       | *           | **Minimum       | **Other Settings** |
| ID | sername** | *Password** | User's Rights** |                    |
| ** |           |             |                 |                    |
+----+-----------+-------------+-----------------+--------------------+
| >  | test_user | Testing123  | Standard User   |                    |
| ** |           |             | with 'Project   |                    |
| 1. |           |             | Design and      |                    |
| ** |           |             | Setup'          |                    |
|    |           |             | privileges.     |                    |
+----+-----------+-------------+-----------------+--------------------+
| >  | t         | Testing123  | Administrator   |                    |
| ** | est_admin |             |                 |                    |
| 2. |           |             |                 |                    |
| ** |           |             |                 |                    |
+----+-----------+-------------+-----------------+--------------------+
| >  |           |             |                 |                    |
| ** |           |             |                 |                    |
| 3. |           |             |                 |                    |
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
| \. | Survey_CUH_v1381        | Survey_CUH_v1381.xml                 |
+----+-------------------------+--------------------------------------+
| 2  | > Project Setup         | Use Surveys enabled                  |
| \. |                         |                                      |
|    |                         | Designate an email field... enabled  |
|    |                         | and assign email "Email" field       |
|    |                         |                                      |
|    |                         | Control Center, Modules              |
|    |                         | Configuration:                       |
|    |                         |                                      |
|    |                         | Enable the use of surveys in         |
|    |                         | projects = Enabled                   |
+----+-------------------------+--------------------------------------+
| 3  | > Data Import File      |                                      |
| \. |                         |                                      |
+----+-------------------------+--------------------------------------+
| 4  | > Other Files           |                                      |
| \. |                         |                                      |
+----+-------------------------+--------------------------------------+

+------+----------------------+----------------------+------+----------+
| **   |                      |                      |      |          |
| Test |                      |                      |      |          |
| Ste  |                      |                      |      |          |
| ps** |                      |                      |      |          |
+------+----------------------+----------------------+------+----------+
| **   | **Action Step**      | **Expected Result**  | **   | **Co     |
| Step |                      |                      | Pass | mments** |
| \#** |                      |                      | /    |          |
|      |                      |                      | Fa   |          |
|      |                      |                      | il** |          |
+------+----------------------+----------------------+------+----------+
| > *H | *You must perform    | *After performing    | *C   | *Include |
| elp* | the actions listed   | the actions in the   | heck | un       |
|      | in this column.*     | 'Action Step'        | 'Pa  | expected |
|      |                      | column, you should   | ss', | results, |
|      |                      | see the following.*  | if   | sugg     |
|      |                      |                      | the  | estions. |
|      |                      |                      | ac   | etc.*    |
|      |                      |                      | tual |          |
|      |                      |                      | res  |          |
|      |                      |                      | ults |          |
|      |                      |                      | m    |          |
|      |                      |                      | atch |          |
|      |                      |                      | the  |          |
|      |                      |                      | '    |          |
|      |                      |                      | Expe |          |
|      |                      |                      | cted |          |
|      |                      |                      | Resu |          |
|      |                      |                      | lt'; |          |
|      |                      |                      | ot   |          |
|      |                      |                      | herw |          |
|      |                      |                      | ise, |          |
|      |                      |                      | c    |          |
|      |                      |                      | heck |          |
|      |                      |                      | 'Fai |          |
|      |                      |                      | l'.* |          |
+------+----------------------+----------------------+------+----------+
| 1.   | Login as test_user   | User is able to      | ![C  |          |
|      |                      | login                | heck |          |
|      | Click on             |                      | mark |          |
|      | 'Survey_CUH_v1381'   | Project Opens        | with |          |
|      |                      |                      | s    |          |
|      |                      |                      | olid |          |
|      |                      |                      | f    |          |
|      |                      |                      | ill] |          |
|      |                      |                      | (med |          |
|      |                      |                      | ia/i |          |
|      |                      |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 2.   | In Online Designer   | The Online Designer  | ![C  |          |
|      |                      | page                 | heck |          |
|      | Ensure the survey    |                      | mark |          |
|      | instrument is NOT    | displays the         | with |          |
|      | already enabled as a | Demographics and     | s    |          |
|      | survey.              | Survey instruments.  | olid |          |
|      |                      | The Enable button is | f    |          |
|      | Enable the 'Survey'  | shown under the      | ill] |          |
|      | instrument as a      | 'Enabled as survey'  | (med |          |
|      | survey               | column and nothing   | ia/i |          |
|      |                      | is shown under the   | mage |          |
|      | Accept the defaults  | survey-related       | 2.pn |          |
|      | and Save             | options column.      | g){w |          |
|      |                      |                      | idth |          |
|      |                      | The Set Up My Survey | ="0. |          |
|      |                      | tab displays         | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      | Your survey settings | 8888 |          |
|      |                      | were successfully    | 8888 |          |
|      |                      | saved!               | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      | The Survey           | ght= |          |
|      |                      | instrument is        | "0.1 |          |
|      |                      | enabled, and a green | 5138 |          |
|      |                      | shield with a tick   | 8888 |          |
|      |                      | is visible in the    | 8888 |          |
|      |                      | 'Enabled a survey'   | 8888 |          |
|      |                      | column               | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 3.   | Click on the button  | Automated            | ![C  |          |
|      | labelled 'Automated  | Invitations menu     | heck |          |
|      | Invitations'         | displays with 'Set   | mark |          |
|      |                      | up' buttons for      | with |          |
|      |                      | Event 1 and Event 2  | s    |          |
|      |                      |                      | olid |          |
|      |                      |                      | f    |          |
|      |                      |                      | ill] |          |
|      |                      |                      | (med |          |
|      |                      |                      | ia/i |          |
|      |                      |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 4.   | Click 'Set up'       | 'Define Conditions   | ![C  |          |
|      | button for 'Event 1' | for Automated Survey | heck |          |
|      |                      | Invitations (ASI)'   | mark |          |
|      |                      | window opens         | with |          |
|      |                      |                      | s    |          |
|      |                      |                      | olid |          |
|      |                      |                      | f    |          |
|      |                      |                      | ill] |          |
|      |                      |                      | (med |          |
|      |                      |                      | ia/i |          |
|      |                      |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 5.   | Set the following    | Message displays     | ![C  |          |
|      | settings:            | 'Your settings that  | heck |          |
|      |                      | you defined for      | mark |          |
|      | Select radio button  | sending automated    | with |          |
|      | 'Active'             | survey invitations   | s    |          |
|      |                      | have now been saved  | olid |          |
|      | Step 1:              | for \"Survey\" -     | f    |          |
|      |                      | Event 1.'            | ill] |          |
|      | Subject: Testing     |                      | (med |          |
|      | Survey Event 1       | Click 'Close'        | ia/i |          |
|      |                      |                      | mage |          |
|      | Step 2: Conditions   | The button next to   | 2.pn |          |
|      |                      | Event 1 in the       | g){w |          |
|      | Check the checkbox   | Automated            | idth |          |
|      | ' When the following | Invitations menu     | ="0. |          |
|      | logic becomes true:' | changes to 'Modify'  | 1513 |          |
|      |                      |                      | 8888 |          |
|      | Type                 |                      | 8888 |          |
|      | '\[fname\]!=\'\' and |                      | 8888 |          |
|      | \[email\]!=\'\' ' in |                      | 8in" |          |
|      | the logic editor     |                      | hei  |          |
|      |                      |                      | ght= |          |
|      | Check the checkbox   |                      | "0.1 |          |
|      | ' Ensure logic is    |                      | 5138 |          |
|      | still true before    |                      | 8888 |          |
|      | sending invitation?' |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      | Step 3:              |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      | Check the checkbox   |                      | ss** |          |
|      | 'Send immediately'   |                      |      |          |
|      |                      |                      | **   |          |
|      | Optional: Enable     |                      | Fail |          |
|      | reminders            |                      | ☐**  |          |
|      |                      |                      |      |          |
|      | Check the checkbox   |                      |      |          |
|      | 'Re-send invitation  |                      |      |          |
|      | as a reminder if     |                      |      |          |
|      | participant has not  |                      |      |          |
|      | responded by a       |                      |      |          |
|      | specified time?'     |                      |      |          |
|      |                      |                      |      |          |
|      | Check the checkbox:  |                      |      |          |
|      | 'Send every'         |                      |      |          |
|      |                      |                      |      |          |
|      | and type: 5 minutes  |                      |      |          |
|      |                      |                      |      |          |
|      | Select Recurrence:   |                      |      |          |
|      | 'send up to 2 times' |                      |      |          |
|      |                      |                      |      |          |
|      | Click 'Save'         |                      |      |          |
+------+----------------------+----------------------+------+----------+
| 6.   | Click 'Set up'       | 'Define Conditions   | ![C  |          |
|      | button for 'Event 2' | for Automated Survey | heck |          |
|      |                      | Invitations (ASI)'   | mark |          |
|      |                      | window opens         | with |          |
|      |                      |                      | s    |          |
|      |                      |                      | olid |          |
|      |                      |                      | f    |          |
|      |                      |                      | ill] |          |
|      |                      |                      | (med |          |
|      |                      |                      | ia/i |          |
|      |                      |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 7.   | Set the following    | Message displays     | ![C  |          |
|      | settings:            | ''Your settings that | heck |          |
|      |                      | you defined for      | mark |          |
|      | Select radio button  | sending automated    | with |          |
|      | 'Active'             | survey invitations   | s    |          |
|      |                      | have now been saved  | olid |          |
|      | Step 1:              | for \"Survey\" -     | f    |          |
|      |                      | Event 2.'            | ill] |          |
|      | Subject: Testing     |                      | (med |          |
|      | Survey Event 2       | Click 'Close'        | ia/i |          |
|      |                      |                      | mage |          |
|      | Step 2: Conditions   | The button next to   | 2.pn |          |
|      |                      | Event 2 in the       | g){w |          |
|      | Check the checkbox   | Automated            | idth |          |
|      | 'When the following  | Invitations menu     | ="0. |          |
|      | survey is            | changes to 'Modify'  | 1513 |          |
|      | completed:'          |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      | And select '"Survey  |                      | 8888 |          |
|      | -- Event 1"'         |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      | Step 3:              |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      | Check the checkbox   |                      | 5138 |          |
|      | 'Send the            |                      | 8888 |          |
|      | invitation after     |                      | 8888 |          |
|      | time lapse of'       |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      | and type 10 minutes  |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      | Optional: Enable     |                      |      |          |
|      | reminders            |                      | **   |          |
|      |                      |                      | Fail |          |
|      | Check the checkbox   |                      | ☐**  |          |
|      | 'Re-send invitation  |                      |      |          |
|      | as a reminder if     |                      |      |          |
|      | participant has not  |                      |      |          |
|      | responded by a       |                      |      |          |
|      | specified time?'     |                      |      |          |
|      |                      |                      |      |          |
|      | Check the checkbox:  |                      |      |          |
|      | 'Send every'         |                      |      |          |
|      |                      |                      |      |          |
|      | and select 'Day' at  |                      |      |          |
|      | time 12:00           |                      |      |          |
|      |                      |                      |      |          |
|      | Recurrence: 'Send    |                      |      |          |
|      | only once'           |                      |      |          |
|      |                      |                      |      |          |
|      | Click 'Save'         |                      |      |          |
+------+----------------------+----------------------+------+----------+
| 8.   | Click on 'Add / Edit | 'Add / Edit Records' | ![C  |          |
|      | Records'             | page is displayed    | heck |          |
|      |                      |                      | mark |          |
|      |                      |                      | with |          |
|      |                      |                      | s    |          |
|      |                      | Record Home Page is  | olid |          |
|      |                      | displayed, and       | f    |          |
|      | Click on the button  | 'NEW Record ID 1' is | ill] |          |
|      | 'Add new record'     | visible with         | (med |          |
|      |                      | instruments          | ia/i |          |
|      |                      | Demographics and     | mage |          |
|      |                      | Survey               | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 9.   | Click on the         | 'Demographics'       | ![C  |          |
|      | 'Demographics'       | instrument opens     | heck |          |
|      | instrument           |                      | mark |          |
|      |                      |                      | with |          |
|      |                      |                      | s    |          |
|      |                      |                      | olid |          |
|      | Enter 'George' in    |                      | f    |          |
|      | the field labelled   | Record Home Page is  | ill] |          |
|      | 'Last name'          | displayed with the   | (med |          |
|      |                      | message 'Record      | ia/i |          |
|      | Enter 'Joe' in the   | ID 1 successfully    | mage |          |
|      | field labelled       | added.'              | 2.pn |          |
|      | 'First name'         |                      | g){w |          |
|      |                      |                      | idth |          |
|      | Enter 'joe@abc.com'  |                      | ="0. |          |
|      | in the field         |                      | 1513 |          |
|      | labelled 'Email'     |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      | Click on the button  |                      | 8888 |          |
|      | labelled 'Save &     |                      | 8in" |          |
|      | Exit Form'           |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 10.  | Click on the link    | 'Survey Distribution | ![C  |          |
|      | labelled 'Survey     | Tools' page opens    | heck |          |
|      | Distribution Tools'  |                      | mark |          |
|      |                      | Survey invitation    | with |          |
|      | Click on the tab     | Log shows 1 email    | s    |          |
|      | 'Survey Invitation   | with details:        | olid |          |
|      | Log' and click on    |                      | f    |          |
|      | the button 'View     | -   Email with       | ill] |          |
|      | past invitations'    |     invitation send  | (med |          |
|      |                      |     time: date and   | ia/i |          |
|      |                      |     time Survey was  | mage |          |
|      |                      |     sent(current     | 2.pn |          |
|      |                      |     date time);      | g){w |          |
|      |                      |     Participant      | idth |          |
|      |                      |     Email displays   | ="0. |          |
|      |                      |     joe@abc.com;     | 1513 |          |
|      |                      |     Record column    | 8888 |          |
|      |                      |     displays 1;      | 8888 |          |
|      |                      |     Survey column    | 8888 |          |
|      |                      |     displays :       | 8in" |          |
|      |                      |     Survey Event 1   | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 11.  | Click on the button  | Survey invitation    | ![C  |          |
|      | labelled 'View       | Log shows 2 emails   | heck |          |
|      | future invitations'  | (reminder            | mark |          |
|      |                      | invitations with     | with |          |
|      |                      | bell icon) with      | s    |          |
|      |                      | details:             | olid |          |
|      |                      |                      | f    |          |
|      |                      | -   Record ID 1,     | ill] |          |
|      |                      |     Survey Event 1,  | (med |          |
|      |                      |     joe@abc.com,     | ia/i |          |
|      |                      |     1^st^ one is 5   | mage |          |
|      |                      |     mins from the    | 2.pn |          |
|      |                      |     time survey was  | g){w |          |
|      |                      |     sent             | idth |          |
|      |                      |                      | ="0. |          |
|      |                      | -   Record ID 1,     | 1513 |          |
|      |                      |     Survey Event 1,  | 8888 |          |
|      |                      |     joe@abc.com,     | 8888 |          |
|      |                      |     2^nd^ invitation | 8888 |          |
|      |                      |     is 5 mins from   | 8in" |          |
|      |                      |     the 1^st^        | hei  |          |
|      |                      |     invitation       | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 12.  | Open email inbox     | Email is received    | ![C  |          |
|      | (MailHog) and check  | with details as      | heck |          |
|      |                      | follows:             | mark |          |
|      |                      |                      | with |          |
|      |                      | From: te             | s    |          |
|      |                      | st_user@example.com  | olid |          |
|      |                      |                      | f    |          |
|      |                      | To: joe@abc.com      | ill] |          |
|      |                      |                      | (med |          |
|      |                      | Subject: Testing     | ia/i |          |
|      |                      | Survey Event 1       | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      | Message: Shows the   | g){w |          |
|      |                      | email text with a    | idth |          |
|      |                      | link to survey       | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 13.  | Wait for 5 mins and  | The first reminder   | ![C  |          |
|      | check email inbox    | is sent out.         | heck |          |
|      | (MailHog)            |                      | mark |          |
|      |                      | Email is received    | with |          |
|      |                      | with details as      | s    |          |
|      |                      | follows:             | olid |          |
|      |                      |                      | f    |          |
|      |                      | From: te             | ill] |          |
|      |                      | st_user@example.com  | (med |          |
|      |                      |                      | ia/i |          |
|      |                      | To: joe@abc.com      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      | Subject: Testing     | g){w |          |
|      |                      | Survey Event 1       | idth |          |
|      |                      |                      | ="0. |          |
|      |                      | Message: Shows the   | 1513 |          |
|      |                      | email text with a    | 8888 |          |
|      |                      | link to survey       | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 14.  | In REDCap project,   | Future Survey        | ![C  |          |
|      | in Survey            | invitation Log shows | heck |          |
|      | Distribution Tools,  | 1 email:             | mark |          |
|      | click 'Survey        |                      | with |          |
|      | Invitation Log'      | -   1 invitations    | s    |          |
|      |                      |     with a bell with | olid |          |
|      | Click the button     |     details: Record  | f    |          |
|      | 'View past           |     ID 1, Survey     | ill] |          |
|      | invitations'         |     Event 1,         | (med |          |
|      |                      |     joe@abc.com      | ia/i |          |
|      |                      |     (i.e. 2^nd^      | mage |          |
|      |                      |     reminder)        | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      | Past Survey          | idth |          |
|      |                      | invitation Log shows | ="0. |          |
|      |                      | 2 emails:            | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      | -   email with       | 8888 |          |
|      |                      |     details: Record  | 8888 |          |
|      |                      |     ID 1, Survey     | 8in" |          |
|      |                      |     Event 1,         | hei  |          |
|      |                      |     joe@abc.com      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      | -   reminder         | 5138 |          |
|      |                      |     invitation with  | 8888 |          |
|      |                      |     a bell (1^st^    | 8888 |          |
|      |                      |     reminder) with   | 8888 |          |
|      |                      |     details: Record  | in"} |          |
|      |                      |     ID 1, Survey     | **Pa |          |
|      |                      |     Event 1,         | ss** |          |
|      |                      |     joe@abc.com      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 15.  | Wait for 5 more mins | The second reminder  | ![C  |          |
|      | and check email      | is sent out.         | heck |          |
|      | inbox (MailHog)      |                      | mark |          |
|      |                      | Email is received    | with |          |
|      |                      | with details as      | s    |          |
|      |                      | follows:             | olid |          |
|      |                      |                      | f    |          |
|      |                      | From: te             | ill] |          |
|      |                      | st_user@example.com  | (med |          |
|      |                      |                      | ia/i |          |
|      |                      | To: joe@abc.com      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      | Subject: Testing     | g){w |          |
|      |                      | Survey Event 1       | idth |          |
|      |                      |                      | ="0. |          |
|      |                      | Message: Shows the   | 1513 |          |
|      |                      | email text with a    | 8888 |          |
|      |                      | link to survey       | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 16.  | In REDCap project,   | Future Survey        | ![C  |          |
|      | in Survey            | invitation Log shows | heck |          |
|      | Distribution Tools,  | no emails            | mark |          |
|      | click 'Survey        |                      | with |          |
|      | Invitation Log'      | Past Survey          | s    |          |
|      |                      | invitation Log shows | olid |          |
|      | Click the button     | 3 emails:            | f    |          |
|      | 'View past           |                      | ill] |          |
|      | invitations'         | -   email with       | (med |          |
|      |                      |     details: Record  | ia/i |          |
|      |                      |     ID 1, Survey     | mage |          |
|      |                      |     Event 1,         | 2.pn |          |
|      |                      |     joe@abc.com      | g){w |          |
|      |                      |                      | idth |          |
|      |                      | -   reminder         | ="0. |          |
|      |                      |     invitation with  | 1513 |          |
|      |                      |     a bell (1^st^    | 8888 |          |
|      |                      |     reminder) with   | 8888 |          |
|      |                      |     details: Record  | 8888 |          |
|      |                      |     ID 1, Survey     | 8in" |          |
|      |                      |     Event 1,         | hei  |          |
|      |                      |     joe@abc.com      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      | -   reminder         | 5138 |          |
|      |                      |     invitation with  | 8888 |          |
|      |                      |     a bell (2^nd^    | 8888 |          |
|      |                      |     reminder) with   | 8888 |          |
|      |                      |     details: Record  | in"} |          |
|      |                      |     ID 1, Survey     | **Pa |          |
|      |                      |     Event 1,         | ss** |          |
|      |                      |     joe@abc.com      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 17.  | In email inbox       | Survey opens         | ![C  |          |
|      | (MailHog), click on  |                      | heck |          |
|      | the survey link (in  | Message displays     | mark |          |
|      | any of the 3 emails  | 'Thank you for       | with |          |
|      | sent)                | taking the survey.'  | s    |          |
|      |                      |                      | olid |          |
|      | Enter 1 in           | Returns to email     | f    |          |
|      | 'Reminder' and       | inbox (MailHog)      | ill] |          |
|      | description in       |                      | (med |          |
|      | 'Description' field  |                      | ia/i |          |
|      | and click Submit     |                      | mage |          |
|      | button               |                      | 2.pn |          |
|      |                      |                      | g){w |          |
|      | Click 'Close survey' |                      | idth |          |
|      | button               |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 18.  | In REDCap project,   | Record Status        | ![C  |          |
|      | Click on the link    | Dashboard (all       | heck |          |
|      | 'Record Status       | records) page is     | mark |          |
|      | Dashboard'           | displayed            | with |          |
|      |                      |                      | s    |          |
|      |                      | Record ID 1 has a    | olid |          |
|      |                      | green tick in Survey | f    |          |
|      |                      | in Event 1           | ill] |          |
|      |                      |                      | (med |          |
|      |                      |                      | ia/i |          |
|      |                      |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 19.  | Click Survey         | Future Survey        | ![C  |          |
|      | Distribution Tools,  | invitation Log shows | heck |          |
|      | click 'Survey        | 2 emails with        | mark |          |
|      | Invitation Log'      | details:             | with |          |
|      |                      |                      | s    |          |
|      | Click the button     | -   Email (Survey    | olid |          |
|      | 'View past           |     Event 2) with    | f    |          |
|      | invitations'         |     time 10 mins     | ill] |          |
|      |                      |     after the Survey | (med |          |
|      |                      |     Event 1 is       | ia/i |          |
|      |                      |     completed, with  | mage |          |
|      |                      |     details: Record  | 2.pn |          |
|      |                      |     ID 1, Survey     | g){w |          |
|      |                      |     Event 2,         | idth |          |
|      |                      |     joe@abc.com.     | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      | -   reminder         | 8888 |          |
|      |                      |     invitation with  | 8888 |          |
|      |                      |     a bell (1^st^    | 8888 |          |
|      |                      |     reminder) with   | 8in" |          |
|      |                      |     details: Record  | hei  |          |
|      |                      |     ID 1, Survey     | ght= |          |
|      |                      |     Event 2,         | "0.1 |          |
|      |                      |     joe@abc.com,     | 5138 |          |
|      |                      |     time is at       | 8888 |          |
|      |                      |     12:00pm on the   | 8888 |          |
|      |                      |     next day         | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      | Past Survey          | **Pa |          |
|      |                      | invitation Log shows | ss** |          |
|      |                      | 1 email with         |      |          |
|      |                      | details:             | **   |          |
|      |                      |                      | Fail |          |
|      |                      | -   email with a     | ☐**  |          |
|      |                      |     green tick with  |      |          |
|      |                      |     details: Record  |      |          |
|      |                      |     ID 1, Survey     |      |          |
|      |                      |     Event 1,         |      |          |
|      |                      |     joe@abc.com      |      |          |
+------+----------------------+----------------------+------+----------+
| 20.  | Wait for 10 mins,    | Email is received    | ![C  |          |
|      | Check email inbox    | with details as      | heck |          |
|      | (MailHog)            | follows:             | mark |          |
|      |                      |                      | with |          |
|      |                      | From: te             | s    |          |
|      |                      | st_user@example.com  | olid |          |
|      |                      |                      | f    |          |
|      |                      | To: joe@abc.com      | ill] |          |
|      |                      |                      | (med |          |
|      |                      | Subject: Testing     | ia/i |          |
|      |                      | Survey Event 2       | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      | Message: Shows the   | g){w |          |
|      |                      | email text with a    | idth |          |
|      |                      | link to survey       | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 21.  | In REDCap project,   | Future Survey        | ![C  |          |
|      | in Survey            | invitation Log shows | heck |          |
|      | Distribution Tools,  | 1 email with         | mark |          |
|      | click 'Survey        | details:             | with |          |
|      | Invitation Log'      |                      | s    |          |
|      |                      | -   reminder         | olid |          |
|      | Click the button     |     invitation with  | f    |          |
|      | 'View past           |     a bell (1^st^    | ill] |          |
|      | invitations'         |     reminder) with   | (med |          |
|      |                      |     details: Record  | ia/i |          |
|      |                      |     ID 1, Survey     | mage |          |
|      |                      |     Event 2,         | 2.pn |          |
|      |                      |     joe@abc.com,     | g){w |          |
|      |                      |     time is at       | idth |          |
|      |                      |     12:00pm on the   | ="0. |          |
|      |                      |     next day         | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      | Past Survey          | 8888 |          |
|      |                      | invitation Log shows | 8888 |          |
|      |                      | 2 emails with        | 8in" |          |
|      |                      | details:             | hei  |          |
|      |                      |                      | ght= |          |
|      |                      | -   email with a     | "0.1 |          |
|      |                      |     green tick with  | 5138 |          |
|      |                      |     details: Record  | 8888 |          |
|      |                      |     ID 1, Survey     | 8888 |          |
|      |                      |     Event 1,         | 8888 |          |
|      |                      |     joe@abc.com      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      | -   Email (Survey    | ss** |          |
|      |                      |     Event 2 with     |      |          |
|      |                      |     time 10 mins     | **   |          |
|      |                      |     after the Survey | Fail |          |
|      |                      |     Event 1 is       | ☐**  |          |
|      |                      |     completed, with  |      |          |
|      |                      |     details: Record  |      |          |
|      |                      |     ID 1, Survey     |      |          |
|      |                      |     Event 2,         |      |          |
|      |                      |     joe@abc.com.     |      |          |
+------+----------------------+----------------------+------+----------+
| 22.  | In email inbox       | Survey opens         | ![C  |          |
|      | (MailHog), click on  |                      | heck |          |
|      | the survey link for  | Message displays     | mark |          |
|      | Survey Event 2       | 'Thank you for       | with |          |
|      |                      | taking the survey.'  | s    |          |
|      | Enter 3 in           |                      | olid |          |
|      | 'Reminder' and       | Returns to email     | f    |          |
|      | description3 in      | inbox (MailHog)      | ill] |          |
|      | 'Description' field  |                      | (med |          |
|      | and click Submit     |                      | ia/i |          |
|      | button               |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      | Click 'Close survey' |                      | g){w |          |
|      | button               |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 23.  | In REDCap project,   | Future Survey        | ![C  |          |
|      | in Survey            | invitation Log shows | heck |          |
|      | Distribution Tools,  | no emails. i.e.      | mark |          |
|      | click 'Survey        | reminder is not sent | with |          |
|      | Invitation Log'      | as survey was        | s    |          |
|      |                      | completed            | olid |          |
|      | Click the button     |                      | f    |          |
|      | 'View past           | Past Survey          | ill] |          |
|      | invitations'         | invitation Log shows | (med |          |
|      |                      | 2 emails with        | ia/i |          |
|      |                      | details:             | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      | -   email with a     | g){w |          |
|      |                      |     green tick with  | idth |          |
|      |                      |     details: Record  | ="0. |          |
|      |                      |     ID 1, Survey     | 1513 |          |
|      |                      |     Event 1,         | 8888 |          |
|      |                      |     joe@abc.com      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      | -   email (Survey    | 8in" |          |
|      |                      |     Event 2) with a  | hei  |          |
|      |                      |     green tick with  | ght= |          |
|      |                      |     details: Record  | "0.1 |          |
|      |                      |     ID 1, Survey     | 5138 |          |
|      |                      |     Event 2,         | 8888 |          |
|      |                      |     joe@abc.com.     | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 24.  | Click on the link    | Record Status        | ![C  |          |
|      | 'Record Status       | Dashboard (all       | heck |          |
|      | Dashboard'           | records) page is     | mark |          |
|      |                      | displayed            | with |          |
|      |                      |                      | s    |          |
|      |                      | Record ID 1 has a    | olid |          |
|      |                      | green tick in Survey | f    |          |
|      |                      | in Event 1 and       | ill] |          |
|      |                      | Survey Event 2       | (med |          |
|      |                      |                      | ia/i |          |
|      |                      |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 25.  | Click Designer       | The Online Designer  | ![C  |          |
|      |                      | page displays the    | heck |          |
|      |                      | Demographics and     | mark |          |
|      |                      | Survey instruments.  | with |          |
|      |                      | The Survey           | s    |          |
|      |                      | instrument has a     | olid |          |
|      |                      | green tick showing   | f    |          |
|      |                      | it is a survey.      | ill] |          |
|      |                      |                      | (med |          |
|      |                      |                      | ia/i |          |
|      |                      |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 26.  | Click on the button  | Automated            | ![C  |          |
|      | labelled 'Automated  | Invitations menu     | heck |          |
|      | Invitations'         | displays with        | mark |          |
|      |                      | 'Modify' buttons for | with |          |
|      |                      | Event 1 and Event 2  | s    |          |
|      |                      |                      | olid |          |
|      |                      |                      | f    |          |
|      |                      |                      | ill] |          |
|      |                      |                      | (med |          |
|      |                      |                      | ia/i |          |
|      |                      |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 27.  | Click 'Modify'       | 'Define Conditions   | ![C  |          |
|      | button for 'Event 2' | for Automated Survey | heck |          |
|      |                      | Invitations (ASI)'   | mark |          |
|      |                      | window opens         | with |          |
|      |                      |                      | s    |          |
|      |                      |                      | olid |          |
|      |                      |                      | f    |          |
|      |                      |                      | ill] |          |
|      |                      |                      | (med |          |
|      |                      |                      | ia/i |          |
|      |                      |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 28.  | Add the following    | Message displays     | ![C  |          |
|      | settings:            | 'Your settings that  | heck |          |
|      |                      | you defined for      | mark |          |
|      | Step 2: Conditions   | sending automated    | with |          |
|      |                      | survey invitations   | s    |          |
|      | Select AND from the  | have now been saved  | olid |          |
|      | drop down list and   | for \"Survey\" -     | f    |          |
|      |                      | Event 2.'            | ill] |          |
|      | Check the checkbox   |                      | (med |          |
|      | ' When the following | Click 'Close'        | ia/i |          |
|      | logic becomes true:' |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      | Type                 |                      | g){w |          |
|      | '\[event_1_ar        |                      | idth |          |
|      | m_1\]\[lname\]!=\'\' |                      | ="0. |          |
|      | ' in the logic       |                      | 1513 |          |
|      | editor               |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      | Check the checkbox   |                      | 8888 |          |
|      | ' Ensure logic is    |                      | 8in" |          |
|      | still true before    |                      | hei  |          |
|      | sending invitation?' |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      | Click 'Save'         |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 29.  | Click on 'Add / Edit | 'Add / Edit Records' | ![C  |          |
|      | Records'             | page is displayed    | heck |          |
|      |                      |                      | mark |          |
|      |                      |                      | with |          |
|      |                      |                      | s    |          |
|      |                      | Record Home Page is  | olid |          |
|      |                      | displayed, and       | f    |          |
|      | Click on the button  | 'NEW Record ID 2' is | ill] |          |
|      | 'Add new record'     | visible with         | (med |          |
|      |                      | instruments          | ia/i |          |
|      |                      | Demographics and     | mage |          |
|      |                      | Survey               | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 30.  | Click on the         | 'Demographics'       | ![C  |          |
|      | 'Demographics'       | instrument opens     | heck |          |
|      | instrument           |                      | mark |          |
|      |                      |                      | with |          |
|      |                      |                      | s    |          |
|      |                      |                      | olid |          |
|      | Enter 'Dave' in the  |                      | f    |          |
|      | field labelled       | Record Home Page is  | ill] |          |
|      | 'First name'         | displayed with the   | (med |          |
|      |                      | message 'Record      | ia/i |          |
|      | Enter 'dave@abc.com' | ID 2 successfully    | mage |          |
|      | in the field         | added.'              | 2.pn |          |
|      | labelled 'Email'     |                      | g){w |          |
|      |                      |                      | idth |          |
|      | Click on the button  |                      | ="0. |          |
|      | labelled 'Save &     |                      | 1513 |          |
|      | Exit Form'           |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 31.  | Click on the link    | 'Survey Distribution | ![C  |          |
|      | labelled 'Survey     | Tools' page opens    | heck |          |
|      | Distribution Tools'  |                      | mark |          |
|      |                      | Survey invitation    | with |          |
|      | Click on the tab     | Log shows 3 emails   | s    |          |
|      | 'Survey Invitation   | with details:        | olid |          |
|      | Log' and click on    |                      | f    |          |
|      | the button 'View     | -   email with a     | ill] |          |
|      | past invitations'    |     green tick with  | (med |          |
|      |                      |     details: Record  | ia/i |          |
|      |                      |     ID 1, Survey     | mage |          |
|      |                      |     Event 1,         | 2.pn |          |
|      |                      |     joe@abc.com      | g){w |          |
|      |                      |                      | idth |          |
|      |                      | -   email with a     | ="0. |          |
|      |                      |     green tick with  | 1513 |          |
|      |                      |     details: Record  | 8888 |          |
|      |                      |     ID 1, Survey     | 8888 |          |
|      |                      |     Event 2,         | 8888 |          |
|      |                      |     joe@abc.com.     | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      | -   email with a     | ght= |          |
|      |                      |     grey circle with | "0.1 |          |
|      |                      |     details: Record  | 5138 |          |
|      |                      |     ID 2, Survey     | 8888 |          |
|      |                      |     Event 1,         | 8888 |          |
|      |                      |     <dave@abc.com>,  | 8888 |          |
|      |                      |     current date     | in"} |          |
|      |                      |     time             | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 32.  | Click on the button  | Survey invitation    | ![C  |          |
|      | labelled 'View       | Log shows 2 emails   | heck |          |
|      | future invitations'  | (reminder            | mark |          |
|      |                      | invitations with     | with |          |
|      |                      | bell icon) with      | s    |          |
|      |                      | details:             | olid |          |
|      |                      |                      | f    |          |
|      |                      | -   Record ID 2,     | ill] |          |
|      |                      |     Survey Event 1,  | (med |          |
|      |                      |     dave@abc.com,    | ia/i |          |
|      |                      |     1^st^ one is 5   | mage |          |
|      |                      |     mins from the    | 2.pn |          |
|      |                      |     time survey was  | g){w |          |
|      |                      |     sent             | idth |          |
|      |                      |                      | ="0. |          |
|      |                      | -   Record ID 2,     | 1513 |          |
|      |                      |     Survey Event 1,  | 8888 |          |
|      |                      |     dave@abc.com,    | 8888 |          |
|      |                      |     2nd invitation   | 8888 |          |
|      |                      |     is 5 mins from   | 8in" |          |
|      |                      |     the 1st          | hei  |          |
|      |                      |     invitation       | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 33.  | Open email inbox     | Email is received    | ![C  |          |
|      | (MailHog) and check  | with details as      | heck |          |
|      |                      | follows:             | mark |          |
|      |                      |                      | with |          |
|      |                      | From: te             | s    |          |
|      |                      | st_user@example.com  | olid |          |
|      |                      |                      | f    |          |
|      |                      | To: dave@abc.com     | ill] |          |
|      |                      |                      | (med |          |
|      |                      | Subject: Testing     | ia/i |          |
|      |                      | Survey Event 1       | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      | Message: Shows the   | g){w |          |
|      |                      | email text with a    | idth |          |
|      |                      | link to survey       | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 34.  | In email inbox       | Survey opens         | ![C  |          |
|      | (MailHog), click on  |                      | heck |          |
|      | the survey link for  | Message displays     | mark |          |
|      | Record 2             | 'Thank you for       | with |          |
|      |                      | taking the survey.'  | s    |          |
|      | Enter 45 in          |                      | olid |          |
|      | 'Reminder' and       | Returns to email     | f    |          |
|      | description45 in     | inbox (MailHog)      | ill] |          |
|      | 'Description' field  |                      | (med |          |
|      | and click Submit     |                      | ia/i |          |
|      | button               |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      | Click 'Close survey' |                      | g){w |          |
|      | button               |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 35.  | In the project,      | 'Survey Distribution | ![C  |          |
|      | click on the link    | Tools' page opens    | heck |          |
|      | labelled 'Survey     |                      | mark |          |
|      | Distribution Tools'  | Survey invitation    | with |          |
|      |                      | Log shows 3 emails   | s    |          |
|      | Click on the tab     | with details:        | olid |          |
|      | 'Survey Invitation   |                      | f    |          |
|      | Log' and click on    | -   email with a     | ill] |          |
|      | the button 'View     |     green tick with  | (med |          |
|      | past invitations'    |     details: Record  | ia/i |          |
|      |                      |     ID 1, Survey     | mage |          |
|      |                      |     Event 1,         | 2.pn |          |
|      |                      |     joe@abc.com      | g){w |          |
|      |                      |                      | idth |          |
|      |                      | -   email with a     | ="0. |          |
|      |                      |     green tick with  | 1513 |          |
|      |                      |     details: Record  | 8888 |          |
|      |                      |     ID 1, Survey     | 8888 |          |
|      |                      |     Event 2,         | 8888 |          |
|      |                      |     joe@abc.com.     | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      | -   email with a     | ght= |          |
|      |                      |     green tick with  | "0.1 |          |
|      |                      |     details: Record  | 5138 |          |
|      |                      |     ID 2, Survey     | 8888 |          |
|      |                      |     Event 2,         | 8888 |          |
|      |                      |     dave@abc.com.    | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 36.  | Click on the button  | Survey invitation    | ![C  |          |
|      | labelled 'View       | Log shows no emails  | heck |          |
|      | future invitations'  |                      | mark |          |
|      |                      |                      | with |          |
|      |                      |                      | s    |          |
|      |                      |                      | olid |          |
|      |                      |                      | f    |          |
|      |                      |                      | ill] |          |
|      |                      |                      | (med |          |
|      |                      |                      | ia/i |          |
|      |                      |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 37.  | Click on 'Record     | Record Status        | ![C  |          |
|      | Status Dashboard'    | Dashboard (all       | heck |          |
|      |                      | records) page opens  | mark |          |
|      | Click on the         |                      | with |          |
|      | 'Demographics'       | Demographics         | s    |          |
|      | instrument for       | instrument opens,    | olid |          |
|      | Record ID 2          | Last name is empty   | f    |          |
|      |                      |                      | ill] |          |
|      | Enter 'Paul' in Last | Instrument is saved  | (med |          |
|      | name                 | and message is       | ia/i |          |
|      |                      | displayed 'Record    | mage |          |
|      | Click on the button  | ID 2 successfully    | 2.pn |          |
|      | labelled 'Save &     | edited'.             | g){w |          |
|      | Exit Form'           |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 38.  | Click on the link    | 'Survey Distribution | ![C  |          |
|      | labelled 'Survey     | Tools' page opens    | heck |          |
|      | Distribution Tools'  |                      | mark |          |
|      |                      | Future Survey        | with |          |
|      | Click on the tab     | invitation Log shows | s    |          |
|      | 'Survey Invitation   | 2 emails:            | olid |          |
|      | Log'                 |                      | f    |          |
|      |                      | -   Email (Survey    | ill] |          |
|      | Click on the button  |     Event 2) with    | (med |          |
|      | 'View past           |     time 10 mins     | ia/i |          |
|      | invitations'         |     after the Survey | mage |          |
|      |                      |     Event 1 is       | 2.pn |          |
|      |                      |     completed, with  | g){w |          |
|      |                      |     details: Record  | idth |          |
|      |                      |     ID 2, Survey     | ="0. |          |
|      |                      |     Event 2,         | 1513 |          |
|      |                      |     dave@abc.com.    | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      | -   reminder         | 8888 |          |
|      |                      |     invitation with  | 8in" |          |
|      |                      |     a bell (1^st^    | hei  |          |
|      |                      |     reminder) with   | ght= |          |
|      |                      |     details: Record  | "0.1 |          |
|      |                      |     ID 2, Survey     | 5138 |          |
|      |                      |     Event 2,         | 8888 |          |
|      |                      |     dave@abc.com,    | 8888 |          |
|      |                      |     time is at       | 8888 |          |
|      |                      |     12:00pm on the   | in"} |          |
|      |                      |     next day         | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      | Survey invitation    |      |          |
|      |                      | Log shows 3 emails   | **   |          |
|      |                      | with details:        | Fail |          |
|      |                      |                      | ☐**  |          |
|      |                      | -   email with a     |      |          |
|      |                      |     green tick with  |      |          |
|      |                      |     details: Record  |      |          |
|      |                      |     ID 1, Survey     |      |          |
|      |                      |     Event 1,         |      |          |
|      |                      |     joe@abc.com      |      |          |
|      |                      |                      |      |          |
|      |                      | -   email with a     |      |          |
|      |                      |     green tick with  |      |          |
|      |                      |     details: Record  |      |          |
|      |                      |     ID 1, Survey     |      |          |
|      |                      |     Event 2,         |      |          |
|      |                      |     joe@abc.com.     |      |          |
|      |                      |                      |      |          |
|      |                      | -   email with a     |      |          |
|      |                      |     green tick with  |      |          |
|      |                      |     details: Record  |      |          |
|      |                      |     ID 2, Survey     |      |          |
|      |                      |     Event 2,         |      |          |
|      |                      |     dave@abc.com.    |      |          |
+------+----------------------+----------------------+------+----------+
| 39.  | Wait for 10 mins,    | Email is received    | ![C  |          |
|      | Check email inbox    | with details as      | heck |          |
|      | (MailHog)            | follows:             | mark |          |
|      |                      |                      | with |          |
|      |                      | From: te             | s    |          |
|      |                      | st_user@example.com  | olid |          |
|      |                      |                      | f    |          |
|      |                      | To: dave@abc.com     | ill] |          |
|      |                      |                      | (med |          |
|      |                      | Subject: Testing     | ia/i |          |
|      |                      | Survey Event 2       | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      | Message: Shows the   | g){w |          |
|      |                      | email text with a    | idth |          |
|      |                      | link to survey       | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 40.  | In email inbox       | Survey opens         | ![C  |          |
|      | (MailHog), click on  |                      | heck |          |
|      | the survey link for  | Message displays     | mark |          |
|      | Survey Event 2       | 'Thank you for       | with |          |
|      |                      | taking the survey.'  | s    |          |
|      | Enter 3 in           |                      | olid |          |
|      | 'Reminder' and       | Returns to email     | f    |          |
|      | description3 in      | inbox (MailHog)      | ill] |          |
|      | 'Description' field  |                      | (med |          |
|      | and click Submit     |                      | ia/i |          |
|      | button               |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      | Click 'Close survey' |                      | g){w |          |
|      | button               |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 41.  | In REDCap project,   | Future Survey        | ![C  |          |
|      | in Survey            | invitation Log shows | heck |          |
|      | Distribution Tools,  | no emails. i.e.      | mark |          |
|      | click 'Survey        | reminder is not sent | with |          |
|      | Invitation Log'      | as survey was        | s    |          |
|      |                      | completed            | olid |          |
|      | Click the button     |                      | f    |          |
|      | 'View past           | Past Survey          | ill] |          |
|      | invitations'         | invitation Log shows | (med |          |
|      |                      | 4 emails with        | ia/i |          |
|      |                      | details:             | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      | -   email with a     | g){w |          |
|      |                      |     green tick with  | idth |          |
|      |                      |     details: Record  | ="0. |          |
|      |                      |     ID 1, Survey     | 1513 |          |
|      |                      |     Event 1,         | 8888 |          |
|      |                      |     joe@abc.com      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      | -   email (Survey    | 8in" |          |
|      |                      |     Event 2) with a  | hei  |          |
|      |                      |     green tick with  | ght= |          |
|      |                      |     details: Record  | "0.1 |          |
|      |                      |     ID 1, Survey     | 5138 |          |
|      |                      |     Event 2,         | 8888 |          |
|      |                      |     joe@abc.com.     | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      | -   email with a     | in"} |          |
|      |                      |     green tick with  | **Pa |          |
|      |                      |     details: Record  | ss** |          |
|      |                      |     ID 2, Survey     |      |          |
|      |                      |     Event 1,         | **   |          |
|      |                      |     dave@abc.com     | Fail |          |
|      |                      |                      | ☐**  |          |
|      |                      | -   email (Survey    |      |          |
|      |                      |     Event 2) with a  |      |          |
|      |                      |     green tick with  |      |          |
|      |                      |     details: Record  |      |          |
|      |                      |     ID 2, Survey     |      |          |
|      |                      |     Event 2,         |      |          |
|      |                      |     dave@abc.com.    |      |          |
+------+----------------------+----------------------+------+----------+
| 42.  | Click on the link    | Record Status        | ![C  |          |
|      | 'Record Status       | Dashboard (all       | heck |          |
|      | Dashboard'           | records) page is     | mark |          |
|      |                      | displayed            | with |          |
|      |                      |                      | s    |          |
|      |                      | Record ID 1 has a    | olid |          |
|      |                      | green tick in Survey | f    |          |
|      |                      | in Event 1 and       | ill] |          |
|      |                      | Survey Event 2       | (med |          |
|      |                      |                      | ia/i |          |
|      |                      | Record ID 2 has a    | mage |          |
|      |                      | green tick in Survey | 2.pn |          |
|      |                      | in Event 1 and       | g){w |          |
|      |                      | Survey Event 2       | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 43.  | Click on 'Add / Edit | 'Add / Edit Records' | ![C  |          |
|      | Records'             | page is displayed    | heck |          |
|      |                      |                      | mark |          |
|      |                      |                      | with |          |
|      |                      |                      | s    |          |
|      |                      | Record Home Page is  | olid |          |
|      |                      | displayed, and       | f    |          |
|      | Click on the button  | 'NEW Record ID 3' is | ill] |          |
|      | 'Add new record'     | visible with         | (med |          |
|      |                      | instruments          | ia/i |          |
|      |                      | Demographics and     | mage |          |
|      |                      | Survey               | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 44.  | Click on the         | 'Demographics'       | ![C  |          |
|      | 'Demographics'       | instrument opens     | heck |          |
|      | instrument           |                      | mark |          |
|      |                      |                      | with |          |
|      |                      |                      | s    |          |
|      |                      |                      | olid |          |
|      | Enter 'James' in the |                      | f    |          |
|      | field labelled 'Last | Record Home Page is  | ill] |          |
|      | name'                | displayed with the   | (med |          |
|      |                      | message 'Record      | ia/i |          |
|      | Enter 'Joe' in the   | ID 3 successfully    | mage |          |
|      | field labelled       | added.'              | 2.pn |          |
|      | 'First name'         |                      | g){w |          |
|      |                      |                      | idth |          |
|      | Enter                |                      | ="0. |          |
|      | 'james@abc.com' in   |                      | 1513 |          |
|      | the field labelled   |                      | 8888 |          |
|      | 'Email'              |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      | Click on the button  |                      | 8in" |          |
|      | labelled 'Save &     |                      | hei  |          |
|      | Exit Form'           |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 45.  | Open email inbox     | Email is received    | ![C  |          |
|      | (MailHog) and check  | with details as      | heck |          |
|      |                      | follows:             | mark |          |
|      |                      |                      | with |          |
|      |                      | From: te             | s    |          |
|      |                      | st_user@example.com  | olid |          |
|      |                      |                      | f    |          |
|      |                      | To: james@abc.com    | ill] |          |
|      |                      |                      | (med |          |
|      |                      | Subject: Testing     | ia/i |          |
|      |                      | Survey Event 1       | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      | Message: Shows the   | g){w |          |
|      |                      | email text with a    | idth |          |
|      |                      | link to survey       | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 46.  | In email inbox       | Survey opens         | ![C  |          |
|      | (MailHog), click on  |                      | heck |          |
|      | the survey link for  | Message displays     | mark |          |
|      | Record 3             | 'Thank you for       | with |          |
|      |                      | taking the survey.'  | s    |          |
|      | Enter 10 in          |                      | olid |          |
|      | 'Reminder' and       | Returns to email     | f    |          |
|      | description10 in     | inbox (MailHog)      | ill] |          |
|      | 'Description' field  |                      | (med |          |
|      | and click Submit     |                      | ia/i |          |
|      | button               |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      | Click 'Close survey' |                      | g){w |          |
|      | button               |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 47.  | Click on the link    | 'Survey Distribution | ![C  |          |
|      | labelled 'Survey     | Tools' page opens    | heck |          |
|      | Distribution Tools'  |                      | mark |          |
|      |                      | Past Survey          | with |          |
|      | Click on the tab     | invitation Log shows | s    |          |
|      | 'Survey Invitation   | 5 emails with        | olid |          |
|      | Log' and click on    | details:             | f    |          |
|      | the button 'View     |                      | ill] |          |
|      | past invitations'    | -   email with a     | (med |          |
|      |                      |     green tick with  | ia/i |          |
|      |                      |     details: Record  | mage |          |
|      |                      |     ID 1, Survey     | 2.pn |          |
|      |                      |     Event 1,         | g){w |          |
|      |                      |     joe@abc.com      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      | -   email (Survey    | 1513 |          |
|      |                      |     Event 2) with a  | 8888 |          |
|      |                      |     green tick with  | 8888 |          |
|      |                      |     details: Record  | 8888 |          |
|      |                      |     ID 1, Survey     | 8in" |          |
|      |                      |     Event 2,         | hei  |          |
|      |                      |     joe@abc.com.     | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      | -   email with a     | 5138 |          |
|      |                      |     green tick with  | 8888 |          |
|      |                      |     details: Record  | 8888 |          |
|      |                      |     ID 2, Survey     | 8888 |          |
|      |                      |     Event 1,         | in"} |          |
|      |                      |     dave@abc.com     | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      | -   email (Survey    |      |          |
|      |                      |     Event 2) with a  | **   |          |
|      |                      |     green tick with  | Fail |          |
|      |                      |     details: Record  | ☐**  |          |
|      |                      |     ID 2, Survey     |      |          |
|      |                      |     Event 2,         |      |          |
|      |                      |     dave@abc.com.    |      |          |
|      |                      |                      |      |          |
|      |                      | -   email with a     |      |          |
|      |                      |     green tick with  |      |          |
|      |                      |     details: Record  |      |          |
|      |                      |     ID 3, Survey     |      |          |
|      |                      |     Event 1,         |      |          |
|      |                      |     james@abc.com    |      |          |
+------+----------------------+----------------------+------+----------+
| 48.  | Click on the button  | Future Survey        | ![C  |          |
|      | labelled 'View       | invitation Log shows | heck |          |
|      | future invitations'  | 2 emails with        | mark |          |
|      |                      | details:             | with |          |
|      |                      |                      | s    |          |
|      |                      | -   Email (Survey    | olid |          |
|      |                      |     Event 2) with    | f    |          |
|      |                      |     time 10 mins     | ill] |          |
|      |                      |     after the Survey | (med |          |
|      |                      |     Event 1 is       | ia/i |          |
|      |                      |     completed, with  | mage |          |
|      |                      |     details: Record  | 2.pn |          |
|      |                      |     ID 3, Survey     | g){w |          |
|      |                      |     Event 1,         | idth |          |
|      |                      |     james@abc.com.   | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      | -   reminder         | 8888 |          |
|      |                      |     invitation with  | 8888 |          |
|      |                      |     a bell (1^st^    | 8888 |          |
|      |                      |     reminder) with   | 8in" |          |
|      |                      |     details: Record  | hei  |          |
|      |                      |     ID 3, Survey     | ght= |          |
|      |                      |     Event 2,         | "0.1 |          |
|      |                      |     james@abc.com,   | 5138 |          |
|      |                      |     time is at       | 8888 |          |
|      |                      |     12:00pm on the   | 8888 |          |
|      |                      |     next day         | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 49.  | Click on the link    | The Online Designer  | ![C  |          |
|      | 'Designer'           | page                 | heck |          |
|      |                      |                      | mark |          |
|      | Click on the button  | displays the         | with |          |
|      | 'Auto Invitation     | Demographics and     | s    |          |
|      | options'             | Survey instruments.  | olid |          |
|      |                      |                      | f    |          |
|      |                      | Dropdown is visible  | ill] |          |
|      |                      | with options below:  | (med |          |
|      |                      |                      | ia/i |          |
|      |                      | -   Upload Automated | mage |          |
|      |                      |     Survey           | 2.pn |          |
|      |                      |     Invitations      | g){w |          |
|      |                      |     settings (CSV)   | idth |          |
|      |                      |                      | ="0. |          |
|      |                      | -   Download all     | 1513 |          |
|      |                      |     Automated Survey | 8888 |          |
|      |                      |     Invitations      | 8888 |          |
|      |                      |     settings (CSV)   | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      | -   Re-evaluate      | hei  |          |
|      |                      |     Automated Survey | ght= |          |
|      |                      |     Invitations      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 50.  | Click on the option  | Csv download is      | ![C  |          |
|      | Download all         | available            | heck |          |
|      | 'Automated Survey    |                      | mark |          |
|      | Invitations settings | Csv file is saved    | with |          |
|      | (CSV)'               |                      | s    |          |
|      |                      |                      | olid |          |
|      | Save the csv         |                      | f    |          |
|      | download             |                      | ill] |          |
|      |                      |                      | (med |          |
|      |                      |                      | ia/i |          |
|      |                      |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 51.  | Open the csv file    | Csv file has a file  | ![C  |          |
|      |                      | header and 2 entries | heck |          |
|      | Check the details in | for the survey       | mark |          |
|      | the csv file match   | 'Survey'             | with |          |
|      | that of the auto     |                      | s    |          |
|      | survey invitations   | The conditions in    | olid |          |
|      | for 'Survey' for     | Auto Survey          | f    |          |
|      | Event 1 and Event 2. | Invitations for the  | ill] |          |
|      |                      | events match that in | (med |          |
|      |                      | the csv file.        | ia/i |          |
|      |                      |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      |                      |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 52.  | Change the           | File changed         | ![C  |          |
|      | downloaded csv file  |                      | heck |          |
|      | as follows:          | Csv file saved       | mark |          |
|      |                      |                      | with |          |
|      | condition_logic:     |                      | s    |          |
|      |                      |                      | olid |          |
|      | \[even               |                      | f    |          |
|      | t_1_arm_1\]\[lname\] |                      | ill] |          |
|      | =                    |                      | (med |          |
|      | \[even               |                      | ia/i |          |
|      | t_1_arm_1\]\[fname\] |                      | mage |          |
|      |                      |                      | 2.pn |          |
|      | Save the csv file    |                      | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 53.  | Click on the link    | The Online Designer  | ![C  |          |
|      | 'Designer'           | page                 | heck |          |
|      |                      |                      | mark |          |
|      | Click on the button  | displays the         | with |          |
|      | 'Auto Invitation     | Demographics and     | s    |          |
|      | options' and Click   | Survey instruments.  | olid |          |
|      | on the option        |                      | f    |          |
|      | 'Upload Automated    | Dialog box popsup    | ill] |          |
|      | Survey Invitations   | with message         | (med |          |
|      | settings (CSV)'      | 'Automated           | ia/i |          |
|      |                      | Invitation settings  | mage |          |
|      | Click on the button  | were successfully    | 2.pn |          |
|      | 'Choose and upload   | uploaded!'           | g){w |          |
|      | CSV file' and select |                      | idth |          |
|      | the changed csv file |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      | Click 'Close'        |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 54.  | Click on the button  | 'Re-evaluate         | ![C  |          |
|      | 'Auto Invitation     | conditions for Auto  | heck |          |
|      | options' and Click   | Invitations' window  | mark |          |
|      | on the option        | pops-up with both    | with |          |
|      | 'Re-evaluate         | the surveys ticked   | s    |          |
|      | Automated Survey     |                      | olid |          |
|      | Invitations'         | A message pops-up '0 | f    |          |
|      |                      | invitations were     | ill] |          |
|      | Click on the button  | scheduled (and 2     | (med |          |
|      | 'Re-evaluate         | already-scheduled    | ia/i |          |
|      | selected surveys'    | invitations were     | mage |          |
|      |                      | unscheduled) across  | 2.pn |          |
|      | Click "OK''          | a total of 1 record' | g){w |          |
|      |                      |                      | idth |          |
|      |                      |                      | ="0. |          |
|      |                      |                      | 1513 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      |                      | ght= |          |
|      |                      |                      | "0.1 |          |
|      |                      |                      | 5138 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | 8888 |          |
|      |                      |                      | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      |                      | ss** |          |
|      |                      |                      |      |          |
|      |                      |                      | **   |          |
|      |                      |                      | Fail |          |
|      |                      |                      | ☐**  |          |
+------+----------------------+----------------------+------+----------+
| 55.  | Click on the link    | 'Survey Distribution | ![C  |          |
|      | labelled 'Survey     | Tools' page opens    | heck |          |
|      | Distribution Tools'  |                      | mark |          |
|      |                      | Future Survey        | with |          |
|      | Click on the tab     | invitation Log shows | s    |          |
|      | 'Survey Invitation   | 0 emails. I.e. the   | olid |          |
|      | Log' and click on    | survey and reminder  | f    |          |
|      | the button 'View     | are deleted.         | ill] |          |
|      | past invitations'    |                      | (med |          |
|      |                      | Past Survey          | ia/i |          |
|      |                      | invitation Log shows | mage |          |
|      |                      | 5 emails with        | 2.pn |          |
|      |                      | details:             | g){w |          |
|      |                      |                      | idth |          |
|      |                      | -   email with a     | ="0. |          |
|      |                      |     green tick with  | 1513 |          |
|      |                      |     details: Record  | 8888 |          |
|      |                      |     ID 1, Survey     | 8888 |          |
|      |                      |     Event 1,         | 8888 |          |
|      |                      |     joe@abc.com      | 8in" |          |
|      |                      |                      | hei  |          |
|      |                      | -   email (Survey    | ght= |          |
|      |                      |     Event 2) with a  | "0.1 |          |
|      |                      |     green tick with  | 5138 |          |
|      |                      |     details: Record  | 8888 |          |
|      |                      |     ID 1, Survey     | 8888 |          |
|      |                      |     Event 2,         | 8888 |          |
|      |                      |     joe@abc.com.     | in"} |          |
|      |                      |                      | **Pa |          |
|      |                      | -   email with a     | ss** |          |
|      |                      |     green tick with  |      |          |
|      |                      |     details: Record  | **   |          |
|      |                      |     ID 2, Survey     | Fail |          |
|      |                      |     Event 1,         | ☐**  |          |
|      |                      |     dave@abc.com     |      |          |
|      |                      |                      |      |          |
|      |                      | -   email (Survey    |      |          |
|      |                      |     Event 2) with a  |      |          |
|      |                      |     green tick with  |      |          |
|      |                      |     details: Record  |      |          |
|      |                      |     ID 2, Survey     |      |          |
|      |                      |     Event 2,         |      |          |
|      |                      |     dave@abc.com.    |      |          |
|      |                      |                      |      |          |
|      |                      | -   email with a     |      |          |
|      |                      |     green tick with  |      |          |
|      |                      |     details: Record  |      |          |
|      |                      |     ID 3, Survey     |      |          |
|      |                      |     Event 1,         |      |          |
|      |                      |     james@abc.com    |      |          |
+------+----------------------+----------------------+------+----------+
| 1.   | THIS ENDS THE        |                      |      |          |
|      | TESTING FOR THIS     |                      |      |          |
|      | SCRIPT               |                      |      |          |
+------+----------------------+----------------------+------+----------+

+-----------+--------------------------------------------+---+---+-----+
| **Con     |                                            |   |   |     |
| clusion** |                                            |   |   |     |
+-----------+--------------------------------------------+---+---+-----+
| Did the   |                                            | > |   | >   |
| Actual    |                                            |   |   |  No |
| Results   |                                            | ! |   |     |
| for each  |                                            | [ |   |     |
| test step |                                            | C |   |     |
| match the |                                            | : |   |     |
| Expected  |                                            | \ |   |     |
| Results   |                                            | \ |   |     |
| listed?   |                                            | U |   |     |
|           |                                            | s |   |     |
|           |                                            | e |   |     |
|           |                                            | r |   |     |
|           |                                            | s |   |     |
|           |                                            | \ |   |     |
|           |                                            | \ |   |     |
|           |                                            | a |   |     |
|           |                                            | h |   |     |
|           |                                            | m |   |     |
|           |                                            | e |   |     |
|           |                                            | d |   |     |
|           |                                            | t |   |     |
|           |                                            | \ |   |     |
|           |                                            | \ |   |     |
|           |                                            | A |   |     |
|           |                                            | p |   |     |
|           |                                            | p |   |     |
|           |                                            | D |   |     |
|           |                                            | a |   |     |
|           |                                            | t |   |     |
|           |                                            | a |   |     |
|           |                                            | \ |   |     |
|           |                                            | \ |   |     |
|           |                                            | L |   |     |
|           |                                            | o |   |     |
|           |                                            | c |   |     |
|           |                                            | a |   |     |
|           |                                            | l |   |     |
|           |                                            | \ |   |     |
|           |                                            | \ |   |     |
|           |                                            | M |   |     |
|           |                                            | i |   |     |
|           |                                            | c |   |     |
|           |                                            | r |   |     |
|           |                                            | o |   |     |
|           |                                            | s |   |     |
|           |                                            | o |   |     |
|           |                                            | f |   |     |
|           |                                            | t |   |     |
|           |                                            | \ |   |     |
|           |                                            | \ |   |     |
|           |                                            | W |   |     |
|           |                                            | i |   |     |
|           |                                            | n |   |     |
|           |                                            | d |   |     |
|           |                                            | o |   |     |
|           |                                            | w |   |     |
|           |                                            | s |   |     |
|           |                                            | \ |   |     |
|           |                                            | \ |   |     |
|           |                                            | I |   |     |
|           |                                            | N |   |     |
|           |                                            | e |   |     |
|           |                                            | t |   |     |
|           |                                            | C |   |     |
|           |                                            | a |   |     |
|           |                                            | c |   |     |
|           |                                            | h |   |     |
|           |                                            | e |   |     |
|           |                                            | \ |   |     |
|           |                                            | \ |   |     |
|           |                                            | C |   |     |
|           |                                            | o |   |     |
|           |                                            | n |   |     |
|           |                                            | t |   |     |
|           |                                            | e |   |     |
|           |                                            | n |   |     |
|           |                                            | t |   |     |
|           |                                            | . |   |     |
|           |                                            | M |   |     |
|           |                                            | S |   |     |
|           |                                            | O |   |     |
|           |                                            | \ |   |     |
|           |                                            | \ |   |     |
|           |                                            | 7 |   |     |
|           |                                            | 0 |   |     |
|           |                                            | 7 |   |     |
|           |                                            | 1 |   |     |
|           |                                            | 8 |   |     |
|           |                                            | 2 |   |     |
|           |                                            | 0 |   |     |
|           |                                            | 8 |   |     |
|           |                                            | . |   |     |
|           |                                            | t |   |     |
|           |                                            | m |   |     |
|           |                                            | p |   |     |
|           |                                            | ] |   |     |
|           |                                            | ( |   |     |
|           |                                            | m |   |     |
|           |                                            | e |   |     |
|           |                                            | d |   |     |
|           |                                            | i |   |     |
|           |                                            | a |   |     |
|           |                                            | / |   |     |
|           |                                            | i |   |     |
|           |                                            | m |   |     |
|           |                                            | a |   |     |
|           |                                            | g |   |     |
|           |                                            | e |   |     |
|           |                                            | 3 |   |     |
|           |                                            | . |   |     |
|           |                                            | p |   |     |
|           |                                            | n |   |     |
|           |                                            | g |   |     |
|           |                                            | ) |   |     |
|           |                                            | { |   |     |
|           |                                            | w |   |     |
|           |                                            | i |   |     |
|           |                                            | d |   |     |
|           |                                            | t |   |     |
|           |                                            | h |   |     |
|           |                                            | = |   |     |
|           |                                            | " |   |     |
|           |                                            | 0 |   |     |
|           |                                            | . |   |     |
|           |                                            | 1 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 9 |   |     |
|           |                                            | 5 |   |     |
|           |                                            | 8 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 4 |   |     |
|           |                                            | i |   |     |
|           |                                            | n |   |     |
|           |                                            | " |   |     |
|           |                                            | > |   |     |
|           |                                            |   |   |     |
|           |                                            | h |   |     |
|           |                                            | e |   |     |
|           |                                            | i |   |     |
|           |                                            | g |   |     |
|           |                                            | h |   |     |
|           |                                            | t |   |     |
|           |                                            | = |   |     |
|           |                                            | " |   |     |
|           |                                            | 0 |   |     |
|           |                                            | . |   |     |
|           |                                            | 1 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 9 |   |     |
|           |                                            | 5 |   |     |
|           |                                            | 8 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 3 |   |     |
|           |                                            | 4 |   |     |
|           |                                            | i |   |     |
|           |                                            | n |   |     |
|           |                                            | " |   |     |
|           |                                            | } |   |     |
|           |                                            | Y |   |     |
|           |                                            | e |   |     |
|           |                                            | s |   |     |
|           |                                            |   |   |     |
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
| **        | **Tanwir Ahmed**                           | * | * |     |
| Completed |                                            | * | * |     |
| By**      |                                            | D | 2 |     |
|           |                                            | a | 2 |     |
|           |                                            | t | / |     |
|           |                                            | e | 1 |     |
|           |                                            | : | 1 |     |
|           |                                            | * | / |     |
|           |                                            | * | 2 |     |
|           |                                            |   | 0 |     |
|           |                                            |   | 2 |     |
|           |                                            |   | 3 |     |
|           |                                            |   | * |     |
|           |                                            |   | * |     |
+-----------+--------------------------------------------+---+---+-----+
