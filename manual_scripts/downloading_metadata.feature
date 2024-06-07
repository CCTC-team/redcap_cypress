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
 Given I click on the tab labeled "Other Functionality"
 And I click on the button labeled "Download metadata only(XML)"
 And I wait for 0.5 seconds
 Then I should see "Project_CUH_v1381_2024-05-31(date of the download)_1249.REDCap.xml"
 # The entire project (all records, instruments, fields, and project attributes) can be downloaded as a single XML file (CDISC ODM format).
 # The XML file can be found in the downloads of the user's system.
 
Scenario 2: Download metadata & data(XML)
 Given I click on the tab labeled "Other Functionality"
 And I click on the button labeled "Download metadata & data(XML)"
 And I wait for 0.5 seconds
 Then I should see "Exporting Entire project(metadata & data)"
 And I should select "Include all uploaded files and signatures"
 And I should select "Export gray form status fields with blank value" under Advanced data formatting options
 And I should select ",(comma) - default)" under Set CSV delimiter character
 And I should select "Use fields native decimal format (default)"
 Then I click on the button labeled "Export Entire Project(metadata & data)"
 # De-identification options(optional) which allow you to limit the amount of sensitive information that you are exporting out of the project.
 # Remove Notes/Essay box fields was selected and all the fields was removed from the downloaded project.
 # Remove all date and datetime fields was also selected and all the date and datetime fields was removed from the downloaded project.
 # Deselecting Include all uploaded files and signatures also removes all uploaded files and signatures in the entire project.
 And I should see "A popup showing Exporting data"
 And I wait for 1 minute
 And I should see "Data export was successful and data is now ready to be downloaded popup"
 And I should click on "icon to download"
 # The entire project with data input (all records, instruments, fields, and project attributes) can be downloaded as a single XML file (CDISC ODM format).
 # The XML file can be found in the downloads of the user's system.