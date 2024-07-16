Feature: Downloading Metadata only and data

  As a REDCap end user
  I want to see that downloading_metadata.feature is functioning as expected
 
# I used pre existing project and dummy records
# The Project_CUH_v1381 has been setup to include two instruments namely Text Validation and Data Types.
# Text Validation consist of 3 fields namely Record Id(Field name = record_id with attribute text), Name(Field name = ptname_v2_v2 with attribute text) and Section Header:Form status(Field name = text_validation_complete attribute dropdown)
#  Data Types consist of 4 fields namely Date of birth(Field name = dob_v2 with attribute text (Field name = date_dmy with attribute text), Calculated Field(field name = calculated_field with attribute calculation 3*2), Weight (Field name = Weight KG with attribute text(number)) Section Header:Form status(Field name = data_types_complete attribute dropdown)
# Project_CUH_v1381_DataQualityRules(date) was created to be uploaded.
# Dummy records consist of Name(Field name = ptname_v2_v2 with attribute text) as Tony

Scenario 1: Download metadata only(XML)
Given I login to REDCap with the user "test_admin" 
And I click on the link labeled "My Projects"
Then I should see a row labeled "Project_CUH_v1381" in the projects table
 And I click on the link labeled "Project_CUH_v1381"
 And I click on the link labeled "Other Functionality"
 And I click on the button labeled "Download metadata only(XML)"
 Then I should see "Project_CUH_v1381_2024-05-31(date of the download)_1249.REDCap.xml" downloaded to computer
##VERIFY
 # The entire project (all records, instruments, fields, and project attributes) can be downloaded as a single XML file (CDISC ODM format).
 # The XML file can be found in the downloads of the user's system.
 
Scenario 2: Download metadata & data(XML)
 Given I click on the tab labeled "Other Functionality"
 And I click on the button labeled "Download metadata & data(XML)" in the dialog box
 Then I should see "Exporting Entire project(metadata & data)" dialog box
 And I click on the checkbox labeled "Include all uploaded files and signatures?" in the dialog box
 And I select "Export gray form status fields with blank value" on the dropdown field labeled "Export blank values for gray Form Status?" in the dialog box
 And I select ",(comma) - default)" on the dropdown field labeled "Set CSV delimiter character" in the dialog box
 And I select "Use fields native decimal format (default)" on the dropdown field labeled "Force all numbers into a specified decimal format?" in the dialog box
 And I click on the button labeled "Export Entire Project(metadata & data)"
 # De-identification options(optional) which allow you to limit the amount of sensitive information that you are exporting out of the project.
 # Remove Notes/Essay box fields was selected and all the fields was removed from the downloaded project.
 # Remove all date and datetime fields was also selected and all the date and datetime fields was removed from the downloaded project.
 # Deselecting Include all uploaded files and signatures also removes all uploaded files and signatures in the entire project.
 And I should see a dialog containing the following text: "Exporting Data"
 Then I should see a dialog containing the following text: "Data export was successful!"
 Given I click on the download icons to receive the files for the "REDCap XML" format in the dialog box
 ##VERIFY
 # The entire project with data input (all records, instruments, fields, and project attributes) can be downloaded as a single XML file (CDISC ODM format).
 # The XML file can be found in the downloads of the user's system.

 