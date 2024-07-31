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
| **Feature Category Description:** Form Display Logic is an advanced   |
| feature that provides a way to use conditional logic to disable       |
| specific data entry forms that are displayed on the Record Status     |
| Dashboard, Record Home Page, or the form list on the left-hand menu.  |
| You might think of it as \'form-level branching logic\'.              |
|                                                                       |
| **Test Purpose Details:** This test script validates if the Form      |
| Display Logic works                                                   |
|                                                                       |
| **Functional Requirements:**                                          |
|                                                                       |
| -   3.1 The system shall support the ability to display a             |
|     form/instrument when a condition is met                           |
|                                                                       |
| -   3.2 The system shall support the ability to Keep forms enabled if |
|     they contain data                                                 |
|                                                                       |
| -   3.3 The system shall support the ability to hide forms that are   |
|     disabled                                                          |
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
|    |           |             | privileges      |                    |
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
| \. | Project_CUH_v1381       | Project_CUH_v1381.xml                |
+----+-------------------------+--------------------------------------+
| 2  | > Project Setup         |                                      |
| \. |                         |                                      |
+----+-------------------------+--------------------------------------+
| 3  | > Data Import File      |                                      |
| \. |                         |                                      |
+----+-------------------------+--------------------------------------+
| 4  | > Other Files           |                                      |
| \. |                         |                                      |
+----+-------------------------+--------------------------------------+

+------+----------------------+----------------------+---------+-------+
| **   |                      |                      |         |       |
| Test |                      |                      |         |       |
| Ste  |                      |                      |         |       |
| ps** |                      |                      |         |       |
+------+----------------------+----------------------+---------+-------+
| **   | **Action Step**      | **Expected Result**  | **Pass  | **    |
| Step |                      |                      | /       | Comme |
| \#** |                      |                      | Fail**  | nts** |
+------+----------------------+----------------------+---------+-------+
| > *H | *You must perform    | *After performing    | *Check  | *In   |
| elp* | the actions listed   | the actions in the   | 'Pass', | clude |
|      | in this column.*     | 'Action Step'        | if the  | unexp |
|      |                      | column, you should   | actual  | ected |
|      |                      | see the following.*  | results | res   |
|      |                      |                      | match   | ults, |
|      |                      |                      | the     | su    |
|      |                      |                      | 'E      | ggest |
|      |                      |                      | xpected | ions. |
|      |                      |                      | R       | etc.* |
|      |                      |                      | esult'; |       |
|      |                      |                      | oth     |       |
|      |                      |                      | erwise, |       |
|      |                      |                      | check   |       |
|      |                      |                      | '       |       |
|      |                      |                      | Fail'.* |       |
+------+----------------------+----------------------+---------+-------+
| 1.   | Login as test_user   | User is able to      | -   *   |       |
|      |                      | login                | *Pass** |       |
|      | Click on             |                      |         |       |
|      | 'Project_CUH_v1381'  | Project Opens        | **Fail  |       |
|      |                      |                      | ☐**     |       |
+------+----------------------+----------------------+---------+-------+
| 2.   | Click on Online      | Online Designer      | -   *   |       |
|      | Designer             | opens                | *Pass** |       |
|      |                      |                      |         |       |
|      | In the Online        | The 'Form Display    | **Fail  |       |
|      | Designer, click on   | Logic' window opens. | ☐**     |       |
|      | the button labelled  |                      |         |       |
|      | 'Form Display Logic' | Message is displayed |         |       |
|      |                      | 'Your Form Display   |         |       |
|      | Select 'Data Types   | Logic settings have  |         |       |
|      | in All Event' in     | been successfully    |         |       |
|      | 'Keep the following  | saved.               |         |       |
|      | forms enabled\...'   |                      |         |       |
|      | section              |                      |         |       |
|      |                      |                      |         |       |
|      | Type                 |                      |         |       |
|      | '\[p                 |                      |         |       |
|      | tname_v2_v2\]!=\'\'' |                      |         |       |
|      | in '\...when the     |                      |         |       |
|      | logic below is       |                      |         |       |
|      | TRUE.'               |                      |         |       |
|      |                      |                      |         |       |
|      | Click Save           |                      |         |       |
+------+----------------------+----------------------+---------+-------+
| 3.   | Click on 'Add / Edit | 'Add / Edit Records' | -   *   |       |
|      | Records'             | page is displayed    | *Pass** |       |
|      |                      |                      |         |       |
|      | Select 'Arm 1' and   | Record Home Page is  | **Fail  |       |
|      | Click on the button  | displayed, and 'NEW  | ☐**     |       |
|      | 'Add new record for  | Record ID 2' is      |         |       |
|      | the arm selected     | visible in Arm 1     |         |       |
|      | above'               |                      |         |       |
|      |                      | 'Text Validation'    |         |       |
|      |                      | instrument is        |         |       |
|      |                      | available for Data   |         |       |
|      |                      | Entry.               |         |       |
|      |                      |                      |         |       |
|      |                      | 'Data Types'         |         |       |
|      |                      | instrument is        |         |       |
|      |                      | disabled             |         |       |
+------+----------------------+----------------------+---------+-------+
| 4.   | Click on the 'Text   | 'Text Validation'    | -   *   |       |
|      | Validation'          | instrument opens     | *Pass** |       |
|      | instrument           |                      |         |       |
|      |                      | Record Home Page is  | **Fail  |       |
|      | Enter 'User2' in the | displayed with the   | ☐**     |       |
|      | field labelled       | message 'Record ID 2 |         |       |
|      | 'Name'               | successfully added.' |         |       |
|      |                      |                      |         |       |
|      | Click on the button  | 'Data Types'         |         |       |
|      | labelled 'Save &     | instrument is        |         |       |
|      | Exit Form'           | enabled and          |         |       |
|      |                      | available for data   |         |       |
|      |                      | entry.               |         |       |
+------+----------------------+----------------------+---------+-------+
| 5.   | Click on the 'Data   | 'Data Types'         | -   *   |       |
|      | Types' instrument    | instrument opens     | *Pass** |       |
|      |                      |                      |         |       |
|      | Enter 2 in the field | Record Home Page is  | **Fail  |       |
|      | labelled 'Required'  | displayed with the   | ☐**     |       |
|      |                      | message 'Record ID 2 |         |       |
|      | Click on the button  | successfully         |         |       |
|      | 'Save & Exit Form'   | edited.'             |         |       |
+------+----------------------+----------------------+---------+-------+
| 6.   | Click on the 'Text   | 'Text Validation'    | -   *   |       |
|      | Validation'          | instrument opens     | *Pass** |       |
|      | instrument Delete    |                      |         |       |
|      | 'User2' from the     | Record Home Page is  | **Fail  |       |
|      | field labelled       | displayed with the   | ☐**     |       |
|      | 'Name'               | message 'Record ID 2 |         |       |
|      |                      | successfully         |         |       |
|      | Click on the button  | edited.'             |         |       |
|      | labelled 'Save &     |                      |         |       |
|      | Exit Form'           | 'Data Types'         |         |       |
|      |                      | instrument is greyed |         |       |
|      |                      | out and not          |         |       |
|      |                      | available for data   |         |       |
|      |                      | entry.               |         |       |
+------+----------------------+----------------------+---------+-------+
| 7.   | In the Online        | The 'Form Display    | -   *   |       |
|      | Designer, click on   | Logic' window opens. | *Pass** |       |
|      | the button labelled  |                      |         |       |
|      | 'Form Display Logic' | Message is displayed | **Fail  |       |
|      | Check the optional   | 'Your Form Display   | ☐**     |       |
|      | settings             | Logic settings have  |         |       |
|      |                      | been successfully    |         |       |
|      | -   Keep forms       | saved.               |         |       |
|      |     enabled if they  |                      |         |       |
|      |     contain data     |                      |         |       |
|      |                      |                      |         |       |
|      | -   Hide forms that  |                      |         |       |
|      |     are disabled     |                      |         |       |
|      |                      |                      |         |       |
|      | Click Save           |                      |         |       |
+------+----------------------+----------------------+---------+-------+
| 8.   | Click on 'Add / Edit | 'Add / Edit Records' | -   *   |       |
|      | Records'             | page is displayed    | *Pass** |       |
|      |                      |                      |         |       |
|      | Select 'Arm 1' and   | Record Home Page is  | **Fail  |       |
|      | Click on the button  | displayed, and 'NEW  | ☐**     |       |
|      | 'Add new record for  | Record ID 3' is      |         |       |
|      | the arm selected     | visible in Arm 1     |         |       |
|      | above'               |                      |         |       |
|      |                      | 'Text Validation'    |         |       |
|      |                      | instrument is        |         |       |
|      |                      | available for Data   |         |       |
|      |                      | Entry.               |         |       |
|      |                      |                      |         |       |
|      |                      | 'Data Types'         |         |       |
|      |                      | instrument is not    |         |       |
|      |                      | visible              |         |       |
+------+----------------------+----------------------+---------+-------+
| 9.   | Click on the 'Text   | 'Text Validation'    | -   *   |       |
|      | Validation'          | instrument opens     | *Pass** |       |
|      | instrument           |                      |         |       |
|      |                      | Record Home Page is  | **Fail  |       |
|      | Enter 'User3' in the | displayed with the   | ☐**     |       |
|      | field labelled       | message 'Record ID 3 |         |       |
|      | 'Name'               | successfully         |         |       |
|      |                      | edited.'             |         |       |
|      | Click on the button  |                      |         |       |
|      | labelled 'Save &     | 'Data Types'         |         |       |
|      | Exit Form'           | instrument is        |         |       |
|      |                      | visible and          |         |       |
|      |                      | available for data   |         |       |
|      |                      | entry.               |         |       |
+------+----------------------+----------------------+---------+-------+
| 10.  | Click on the 'Data   | 'Data Types'         | -   *   |       |
|      | Types' instrument    | instrument opens     | *Pass** |       |
|      |                      |                      |         |       |
|      | Enter 3 in the field | Record Home Page is  | **Fail  |       |
|      | labelled 'Required'  | displayed with the   | ☐**     |       |
|      |                      | message 'Record ID 3 |         |       |
|      | Click on the button  | successfully         |         |       |
|      | 'Save & Exit Form'   | edited.'             |         |       |
|      |                      |                      |         |       |
|      |                      | Both the instruments |         |       |
|      |                      | are visible          |         |       |
+------+----------------------+----------------------+---------+-------+
| 11.  | Click on the 'Text   | 'Text Validation'    | -   *   |       |
|      | Validation'          | instrument opens     | *Pass** |       |
|      | instrument           |                      |         |       |
|      |                      | Record Home Page is  | **Fail  |       |
|      | Delete 'User3' from  | displayed with the   | ☐**     |       |
|      | the field labelled   | message 'Record ID 3 |         |       |
|      | 'Name'               | successfully         |         |       |
|      |                      | edited.'             |         |       |
|      | Click on the button  |                      |         |       |
|      | labelled 'Save &     | 'Data Types'         |         |       |
|      | Exit Form'           | instrument is still  |         |       |
|      |                      | visible and          |         |       |
|      |                      | available for data   |         |       |
|      |                      | entry.               |         |       |
+------+----------------------+----------------------+---------+-------+
| 12.  | Logout as test_user  | Successfully logged  | -   *   |       |
|      |                      | off                  | *Pass** |       |
|      |                      |                      |         |       |
|      |                      |                      | **Fail  |       |
|      |                      |                      | ☐**     |       |
+------+----------------------+----------------------+---------+-------+
|      | THIS ENDS THE        |                      |         |       |
|      | TESTING FOR THIS     |                      |         |       |
|      | SCRIPT               |                      |         |       |
+------+----------------------+----------------------+---------+-------+

+-----------+--------------------------------------------+---+---+---+
| **Con     |                                            |   |   |   |
| clusion** |                                            |   |   |   |
+-----------+--------------------------------------------+---+---+---+
| Did the   |                                            | - |   | > |
| Actual    |                                            |   |   |   |
| Results   |                                            |   |   | N |
| for each  |                                            |   |   | o |
| test step |                                            | Y |   |   |
| match the |                                            | e |   |   |
| Expected  |                                            | s |   |   |
| Results   |                                            |   |   |   |
| listed?   |                                            |   |   |   |
+-----------+--------------------------------------------+---+---+---+
| > **C     |                                            |   |   |   |
| omments/A |                                            |   |   |   |
| dditional |                                            |   |   |   |
| > Infor   |                                            |   |   |   |
| mation:** |                                            |   |   |   |
| >         |                                            |   |   |   |
| (Indicate |                                            |   |   |   |
| > the     |                                            |   |   |   |
| > step    |                                            |   |   |   |
| > number  |                                            |   |   |   |
| > of the  |                                            |   |   |   |
| > step    |                                            |   |   |   |
| > you     |                                            |   |   |   |
| > wish to |                                            |   |   |   |
| > comment |                                            |   |   |   |
| > on.)    |                                            |   |   |   |
+-----------+--------------------------------------------+---+---+---+
| **        | **Rukayat Yakub**                          | * | * |   |
| Completed |                                            | * | * |   |
| By**      |                                            | D | 2 |   |
|           |                                            | a | 1 |   |
|           |                                            | t | / |   |
|           |                                            | e | 1 |   |
|           |                                            | : | 1 |   |
|           |                                            | * | / |   |
|           |                                            | * | 2 |   |
|           |                                            |   | 0 |   |
|           |                                            |   | 2 |   |
|           |                                            |   | 3 |   |
|           |                                            |   | * |   |
|           |                                            |   | * |   |
+-----------+--------------------------------------------+---+---+---+
