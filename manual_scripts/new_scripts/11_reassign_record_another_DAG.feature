Enter data for a record (patient) assigned to one DAG. Reassign the record (patient) to a new DAG after data has already been collected.	

Reassignment of Records from one DAG to a different DAG once data is entered is possible with appropriate user permissions and not possible for users without permission or assignment to new DAG 	

Tested with Admin role and standard DataEntry role.
Records will automatically be added to a DAG when data is entered by a user assigned to that DAG.
Assign/unassign/reassign records with and without data is only possible by user who has not been assigned to any DAG and has permission to access DAGs. When Record is reassigned to a different DAG, they will retain their trial ID, and it will not be recalculated, i.e. the original DAG ID will still be incorporated in the trial ID.

Mintoo: Added this to D.10.700 Script. Link: https://github.com/CCTC-team/redcap_rsvc/blob/redcap_val/Feature%20Tests/D/Data%20Access%20Groups_10/D.10.700%20-%20Reassign%20record%20to%20another%20DAG.feature

