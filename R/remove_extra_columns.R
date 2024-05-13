# getting the column names to exclude from data set for client ------------
qa_cols <- c("review_status", "review_quality", "review_comments", "review_corrections")

extra_cols.tool1 <- c(
  # Meta cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "ID_Check", "Province_filter",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
  "Sector",	"Line_Ministry_Name",	"Line_Ministry_Project_Id",	"Line_Ministry_SubProject_Id",	"Type_Of_Implementing_Partner",	"Type_Of_Site_Visit",	"Type_Of_Visit",
  "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",	"tpma_location_id", "Line_Ministry_Sub_Project_Name_And_Description",	
  "Reporting_Period",	"Class1_N_Sample",	"Class2_N_Sample",	"Class3_N_Sample",	"Class4_N_Sample",	"Class5_N_Sample",	"Class6_N_Sample",	"Class7_N_Sample",	"Class8_N_Sample",
  "Class9_N_Sample",	"Class10_N_Sample",	"Class11_N_Sample",	"Class12_N_Sample", "Province_Climate", "Survey_Language", "Survey_Language_Other",
  "Village", "instanceID", "formdef_version", 
   "Type_Of_School_CBE_Based_On_The_Sample_DariPashto", "TPMA_Location_Name", "Entity_Type", "Academic_Year", "acknowledge",# New
  "District_SV", # New
  'qa_log_status', 'indx1', 'indx3', 'F1_Value', 'F3_Value', 'Sub_indx', 'subj_index', 'AA_Full',# NEW
  
  # PII
  "B2", "B5A1", "B5A2","C5", "C6A1", "C6A2", "C12A1", "C12A4", "C15A1", 
  
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy", "Geopoint2-Latitude", "Geopoint2-Longitude", "Geopoint2-Altitude", "Geopoint2-Accuracy",
  
  
  # URLs
  "text_audit_full",
  
  # Labels
  "Grade_Name_Dari",	"Grade_Name_Pashto",'Shift_Name_Dari',"Shift_Name_Pashto", "Sub_name_Dari",	"Sub_name_Pashto", "Feature_Dari",	"Feature_Pashto",
  
  
  # Captions
  "B19_Caption", "B20_Caption", "F2_Caption", "J24_Caption", "L2_Caption", "Please_Add_Any_Relevant_Photo_caption", "A32_Caption",
  "F2_2_Caption", "F2_3_Caption", "F4_Caption",	"F4_2_Caption",	"F4_3_Caption", # NEW
  
  
  # Notes and Re-coded
  "interview_to_be_conducted_with_English", "interview_to_be_conducted_with_Dari", "interview_to_be_conducted_with_Pashto", "Surveyor_Comments",
  "Surveyor_Comments_Translation",	"join_Grade_Name_Eng",	"join_Shift_Name_Eng", "Sample_Type",  "Count_Weekly_Class_Schedule_Photo.re_calc",
  
  # Repeat counter and SET-OFF
  "Support_Respondents_count", "SET-OF-Support_Respondents", "School_Operationality_count", "SET-OF-School_Operationality", # Do find and search for SET-OF and count
  "School_Operationality_Other_Grades_count",	"SET-OF-School_Operationality_Other_Grades",	"Shifts_Detail_count",	"SET-OF-Shifts_Detail",
  "Other_Shifts_Detail_count",	"SET-OF-Other_Shifts_Detail", "Headmasters_count",	"SET-OF-Headmasters", "Curriculum_Changes_count",	"SET-OF-Curriculum_Changes", 
  "SET-OF-Weekly_Class_Schedule",	"Count_Weekly_Class_Schedule_Photo",	"Grades_Curriculum_count", "SET-OF-Grades_Curriculum",
  "Subjects_Detail_count", "SET-OF-Subjects_Detail", "Education_Quality_count",	"SET-OF-Education_Quality", "SET-OF-Relevant_photos",
  "School_indx", "School_rep",
  "Weekly_Schedule_Old_count",	"SET-OF-Weekly_Schedule_Old", "Weekly_Schedule_New_count",	"SET-OF-Weekly_Schedule_New", # NEW
  "Additional_Subjects_count",	"SET-OF-Additional_Subjects",	"Count_Additional_Subjects", 'Count_Support_Respondents', 'Type_Of_School_Sample_Value',	'Count_School_Operationality',
  'Count_Shifts',	'Count_Shifts_Detail', 'Count_Headmasters', 'SET-OF-Weekly_Class_Schedule_New',	'Count_Weekly_Class_Schedule_New', # NEW
  
  
  # FDE Cols
  "FDE_Dari_Hours", "FDE_Mathematics_Hours", "FDE_Drawing_Hours", "FDE_Life_Skills_Hours", "FDE_Calligraphy_Hours", "FDE_English_Hours", "FDE_Pashto_Hours", "FDE_Social_Studies_Hours", "FDE_Arabic_Hours",
  "FDE_Civics_Hours", "FDE_Professional_Skills_Hours", "FDE_Biology_Hours", "FDE_Geography_Hours", "FDE_History_Hours", "FDE_Physics_Hours", "FDE_Chemistry_Hours", "FDE_Islamic_Studies_Hours",
  "FDE_Holy_Quran_Hours", "FDE_Tajweed_Hours", "FDE_Patriotism_Hours", "FDE_Other_Hours"
)

extra_cols.tool2 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Region_Pcode", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto", "Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id", "Province_Climate", "Survey_Language", "Survey_Language_Other",
  "Village", "instanceID", "formdef_version",
  "ID_Check", "TPMA_Location_Name","Entity_Type", "Academic_Year",	"acknowledge", #NEW
  'qa_log_status', 'AA_Full', 'AA_Closure_Interview', 'indx3', 'AA_TLM',# NEW
  
  
  # PII 
  "C4_Respondent_name", "C6_Respondent_phone_number1", "C6_Respondent_phone_number2", "D5", "Respondent1_Phone_Number", "Respondent2_Phone_Number", "D10", "D11", 'C15A1',
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  "Geopoint2-Latitude",	"Geopoint2-Longitude",	"Geopoint2-Altitude",	"Geopoint2-Accuracy", # NEW
  
  # URL
  "text_audit_full",
  
  # Captions
  "B5_Caption", "Photo_closure_1_Caption", "Photo_closure_2_Caption", "G6_Caption", "H12_Caption", "H15_Caption", "i12_Caption", "i15_Caption", "J12_Caption", "J15_Caption" ,
  "Please_Add_Any_Relevant_Photo_caption",
  "H15_Not_In_Use_Caption", "i15_Not_In_Use_Caption", "J15_Not_In_Use_Caption", 'L2_Caption', #NEW
  
  # Notes and Re-coded
  "Sample_Type",
  
  # repeat counter and SET-OFF 
  "Support_Respondents_count",	"SET-OF-Support_Respondents", "SET-OF-Attendance_Sheet_Photos",	"Count_Attendance_Sheet_Photos", "Public_Stationary_Kit_Group_count",	"SET-OF-Public_Stationary_Kit_Group",
  "Teachers_Pack_Group_count",	"SET-OF-Teachers_Pack_Group", "Students_Pack_Group_count",	"SET-OF-Students_Pack_Group",	"SET-OF-Relevant_photos", 'Count_Support_Respondents',
  'School_Operationality_count', 'SET-OF-School_Operationality', 'Count_School_Operationality', 'Shifts_Detail_count',	'SET-OF-Shifts_Detail',	'Count_Shifts_Detail',
  'Headmasters_count',	'SET-OF-Headmasters',	'Count_Headmasters', 'Count_Public_Stationary_Kit_Group', 'Count_Teachers_Pack_Group', 'Count_Students_Pack_Group',
  
  
  
  # FDE
  "FDE_Present_Teachers_Male", "FDE_Absent_Teachers_Male", "FDE_Total_Teachers_Male", "FDE_Present_Teachers_Female", "FDE_Absent_Teachers_Female", "FDE_Total_Teachers_Female",
  
  # Labels
  
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation", "Enumerator_Comments", "Enumerator_Comments_Translation"
)

# extra_cols.tool2 <- c(
#   # Meta Cols
#   "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
#   "Province_DariPashto", "District_DariPashto", "Region_Pcode", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
#   "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
#   "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
#   "Reporting_Period", "tpma_location_id", "Province_Climate", "Survey_Language", "Survey_Language_Other",
#   "Village", "instanceID", "formdef_version",
#   "ID_Check", "TPMA_Location_Name","Entity_Type", "Academic_Year",	"acknowledge", "B2", 'AA_Full', #NEW
#   'qa_log_status', # NEW
#   
#   
#   # PII 
#   "C4_Respondent_name", "C6_Respondent_phone_number1", "C6_Respondent_phone_number2", "D5", "Respondent1_Phone_Number", "Respondent2_Phone_Number", "D10", "D11", "C15A1",
#   
#   # GPS
#   "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
#   "Geopoint2-Latitude",	"Geopoint2-Longitude",	"Geopoint2-Altitude",	"Geopoint2-Accuracy", # NEW
#   
#   # URL
#   "text_audit_full",
#   
#   # Captions
#   "B5_Caption", "Photo_closure_1_Caption", "Photo_closure_2_Caption", "G6_Caption", "H12_Caption", "H15_Caption", "i12_Caption", "i15_Caption", "J12_Caption", "J15_Caption" ,
#   "Please_Add_Any_Relevant_Photo_caption",
#   "H15_Not_In_Use_Caption", "i15_Not_In_Use_Caption", "J15_Not_In_Use_Caption", #NEW
#   
#   # Notes and Re-coded
#   "Sample_Type",
#   
#   # repeat counter and SET-OFF 
#   "Support_Respondents_count",	"SET-OF-Support_Respondents", "SET-OF-Attendance_Sheet_Photos",	"Count_Attendance_Sheet_Photos", "Public_Stationary_Kit_Group_count",	"SET-OF-Public_Stationary_Kit_Group",
#   "Teachers_Pack_Group_count",	"SET-OF-Teachers_Pack_Group", "Students_Pack_Group_count",	"SET-OF-Students_Pack_Group",	"SET-OF-Relevant_photos",
#   
#   # FDE
#   "FDE_Present_Teachers_Male", "FDE_Absent_Teachers_Male", "FDE_Total_Teachers_Male", "FDE_Present_Teachers_Female", "FDE_Absent_Teachers_Female", "FDE_Total_Teachers_Female",
#   
#   # Labels
#   
#   
#   # Surveyor Comments
#   "Surveyor_Comments",	"Surveyor_Comments_Translation", "Enumerator_Comments", "Enumerator_Comments_Translation"
# )

# extra_cols.tool3 <- c(
#   # Meta Cols
#   "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
#   "Province_DariPashto", "District_DariPashto", "Region_Pcode", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	 "School_Program_Sample",
#   "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id", "School_Property_Sample", "School_Shifts_Sample",
#   "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
#   "Reporting_Period", "tpma_location_id", "Class1_N_Sample", "Class2_N_Sample", "Class3_N_Sample", "Class4_N_Sample", "Class5_N_Sample", "Class6_N_Sample", "Class7_N_Sample", "Class8_N_Sample", "Class9_N_Sample",
#   "Class10_N_Sample", "Class11_N_Sample", "Class12_N_Sample", "School_Status_Sample", "School_Status_EMIS",  "Province_Climate", "Survey_Language", "Survey_Language_Other",
#   "Classes", # To be confirmed
#   "Village", "instanceID", "formdef_version",
#   "ID_Check", "TPMA_Location_Name", "Entity_Type",	"Academic_Year",	"acknowledge",  # NEW
#   "Grade_Class_1",	"Grade_Class_2",	"Grade_Class_3",	"Grade_Class_4",	"Grade_Class_5",	"Grade_Class_6", #NEW
#   "Grade_Class_7", "Grade_Class_8",	"Grade_Class_9",	"Grade_Class_10",	"join_indx2", #NEW
#   'qa_log_status', 'indx1', 'indx2',  'E1_Field_Value', 'AA_Full',# NEW
#   
#   
#   # PII 
#   "B3", "B4A1", "B4A2", "B10A1", "B10A4",
#   
#   # GPS
#   "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
#   'Geopoint2-Latitude',	'Geopoint2-Longitude',	'Geopoint2-Altitude',	'Geopoint2-Accuracy', # NEW
#   
#   # URL
#   "text_audit_full",
#   
#   # Captions
#   "C1A2_Caption", "C1A2_2_Caption", "D4_Caption", "D4_2_Caption", "D8_Caption", "D8_2_Caption", "E2_Caption", "E2_2_Caption", "Please_Add_Any_Relevant_Photo_caption",
#   
#   # Notes and Re-coded
#   "Sample_Type",
#   
#   # repeat counter and SET-OFF 
#   "Support_Respondents_count",	"SET-OF-Support_Respondents", "Count_Support_Respondents",	"SET-OF-Enrollement_Attendance_Summary", "Count_Enrollement_Attendance_Summary",	"Count_Grade_Details",
#   "Grade_Details_count",	"SET-OF-Grade_Details","Todays_Attendance_Detail_count",	"SET-OF-Todays_Attendance_Detail",	"Count_Todays_Attendance_Detail",
#   "LastWeek_Attendance_Detail_count",	"SET-OF-LastWeek_Attendance_Detail",	"Count_LastWeek_Attendance_Detail", "Student_Headcount_count",	"SET-OF-Student_Headcount",	"SET-OF-Relevant_photos",
#   "SET-OF-Tool3_Grades_Repeat", "Tool3_Grades_Repeat_count", # NEW
#   
#   # Surveyor Comments
#   "Surveyor_Comments",	"Surveyor_Comments_Translation",
#   
#   # FDE COLUMN
#   "FDE_C1A3", "FDE_C1A4_Male", "FDE_C1A4_Female", "FDE_C1A5_Male", "FDE_C1A5_Female", "FDE_C1A6_Male", "FDE_C1A6_Female", "FDE_Overall_Present_Male_Students_Today", "FDE_Number_Of_Absent_Male_Students_Today",
#   "FDE_Overall_Present_Female_Students_Today", "FDE_Number_Of_Absent_Female_Students_Today", "FDE_Overall_Present_Male_Students_LastWeek", "FDE_Number_Of_Absent_Male_Students_LastWeek",
#   "FDE_Overall_Present_Female_Students_LastWeek", "FDE_Number_Of_Absent_Female_Students_LastWeek", "FDE_E6A11", "FDE_E6A12", "FDE_E6A21", "FDE_E6A22", "FDE_E6A31", "FDE_E6A32"
# )


extra_cols.tool3 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Region_Pcode", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	 "School_Program_Sample", "Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id", "School_Property_Sample", "School_Shifts_Sample",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id", "Class1_N_Sample", "Class2_N_Sample", "Class3_N_Sample", "Class4_N_Sample", "Class5_N_Sample", "Class6_N_Sample", "Class7_N_Sample", "Class8_N_Sample", "Class9_N_Sample",
  "Class10_N_Sample", "Class11_N_Sample", "Class12_N_Sample", "School_Status_Sample", "School_Status_EMIS",  "Province_Climate", "Survey_Language", "Survey_Language_Other",
  "Classes", # To be confirmed
  "Village", "instanceID", "formdef_version",
  "ID_Check", "TPMA_Location_Name", "Entity_Type",	"Academic_Year",	"acknowledge",  # NEW
  "Grade_Class_1",	"Grade_Class_2",	"Grade_Class_3",	"Grade_Class_4",	"Grade_Class_5",	"Grade_Class_6", #NEW
  "Grade_Class_7", "Grade_Class_8",	"Grade_Class_9",	"Grade_Class_10",	"join_indx2", # NEW
  'qa_log_status', 'indx1', 'indx2',  'E1_Field_Value', 'AA_Full', 'Response_Code',# NEW
  
  
  # PII 
  "B3", "B4A1", "B4A2", "B10A1", "B10A4",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  'Geopoint2-Latitude',	'Geopoint2-Longitude',	'Geopoint2-Altitude',	'Geopoint2-Accuracy', # NEW
  
  # URL
  "text_audit_full",
  
  # Captions
  "C1A2_Caption", "C1A2_2_Caption", "D4_Caption", "D4_2_Caption", "D8_Caption", "D8_2_Caption", "E2_Caption", "E2_2_Caption", "Please_Add_Any_Relevant_Photo_caption",
  
  
  # Notes and Re-coded
  "Sample_Type",
  
  # repeat counter and SET-OFF 
  "Support_Respondents_count",	"SET-OF-Support_Respondents", "Count_Support_Respondents",	"SET-OF-Enrollement_Attendance_Summary", "Count_Enrollement_Attendance_Summary",	"Count_Grade_Details",
  "Grade_Details_count",	"SET-OF-Grade_Details","Todays_Attendance_Detail_count",	"SET-OF-Todays_Attendance_Detail",	"Count_Todays_Attendance_Detail",
  "LastWeek_Attendance_Detail_count",	"SET-OF-LastWeek_Attendance_Detail",	"Count_LastWeek_Attendance_Detail", "Student_Headcount_count",	"SET-OF-Student_Headcount",	"SET-OF-Relevant_photos",
  "SET-OF-Tool3_Grades_Repeat", "Tool3_Grades_Repeat_count", 'Count_Student_Headcount', 'Count_Tool3_Grades_Repeat',# NEW
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation",
  
  # FDE COLUMN
  "FDE_C1A3", "FDE_C1A4_Male", "FDE_C1A4_Female", "FDE_C1A5_Male", "FDE_C1A5_Female", "FDE_C1A6_Male", "FDE_C1A6_Female", "FDE_Overall_Present_Male_Students_Today", "FDE_Number_Of_Absent_Male_Students_Today",
  "FDE_Overall_Present_Female_Students_Today", "FDE_Number_Of_Absent_Female_Students_Today", "FDE_Overall_Present_Male_Students_LastWeek", "FDE_Number_Of_Absent_Male_Students_LastWeek",
  "FDE_Overall_Present_Female_Students_LastWeek", "FDE_Number_Of_Absent_Female_Students_LastWeek", "FDE_E6A11", "FDE_E6A12", "FDE_E6A21", "FDE_E6A22", "FDE_E6A31", "FDE_E6A32"
)

extra_cols.tool4 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other", "Village",
  "instanceID", "formdef_version",
  "ID_Check",'TPMA_Location_Name',	"Entity_Type",	"Academic_Year",	"acknowledge",# NEW
  'G8_Translation', "H3_Translation",# NEW
  'qa_log_status',  'AA_Full', 'indx1',# NEW
  
  # PII 
  "Respondent_Full_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  'Geopoint2-Latitude',	'Geopoint2-Longitude',	'Geopoint2-Altitude',	'Geopoint2-Accuracy', # NEW
  
  # URL
  "text_audit_full",
  
  # Captions
  "Please_Add_Any_Relevant_Photo_caption",
  
  # Notes and Re-coded
  "Sample_Type", "",
  
  # repeat counter and SET-OFF 
  "Additional_Subjects_count",	"SET-OF-Additional_Subjects", "Subjects_taught_by_this_teacher_count",	"SET-OF-Subjects_taught_by_this_teacher", "Subjects_Not_Being_Taught_count",	"SET-OF-Subjects_Not_Being_Taught",
  "SET-OF-Relevant_photos",
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
)

extra_cols.tool5 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other", "Village",
  "instanceID", "formdef_version",
  "ID_Check", "Academic_Year",	"Sample_info_correct",	"acknowledge", 'TPMA_Location_Name',	'Entity_Type',# NEW
  'qa_log_status',  'AA_Full',# NEW
  
  # PII 
  "Respondent_Full_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  'Geopoint2-Latitude',	'Geopoint2-Longitude',	'Geopoint2-Altitude',	'Geopoint2-Accuracy', # NEW
  
  
  # URL
  "text_audit_full",
  
  # Captions
  "C3_Caption", "Under_Construction_Toilet_Photo_Caption", "Useable_Toilet_Photo_Caption", "Non_Useable_Toilet_Photo_Caption", "C11_1_Caption", "Please_Add_Any_Relevant_Photo_caption",
  
  # Notes and Re-coded
  "Sample_Type", "",
  
  # repeat counter and SET-OFF 
  "SET-OF-Under_Construction_Toilets",	"Count_Under_Construction_Toilet_Photo", "SET-OF-Useable_Toilets",	"Count_Useable_Toilet_Photo", "SET-OF-Non_Useable_Toilets",	"Count_Non_Useable_Toilet_Photo",
  "SET-OF-Relevant_photos",
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
)

extra_cols.tool6 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other", "Sample_info_correct", "Village",
  "instanceID", "formdef_version",
  "ID_Check", 'Type_of_CBE',	'TPMA_Location_Name',	'Entity_Type',	'Academic_year',	'acknowledge',# NEW
   "indx1", 'qa_log_status',  'AA_Full',# NEW
  
  
  # PII 
  "Respondent_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  'Geopoint2-Latitude',	'Geopoint2-Longitude',	'Geopoint2-Altitude',	'Geopoint2-Accuracy', # NEW
  
  
  # URL
  "text_audit_full",
  
  # Captions
  "Please_Add_Any_Relevant_Photo_caption",
  
  # repeat counter and SET-OFF 
  "Subjects_Added_count",	"SET-OF-Subjects_Added", "SET-OF-Relevant_photos",
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
)

extra_cols.tool7 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other","Sample_info_correct", "Village",
  "instanceID", "formdef_version",
  "ID_Check",'Type_of_CBE',	'TPMA_Location_Name',	'Entity_Type',	'Academic_year',	'acknowledge', 'indx1', 'qa_log_status', 'AA_Full',# NEW
  
  
  # PII 
  "B5", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  'Geopoint2-Latitude',	'Geopoint2-Longitude',	'Geopoint2-Altitude',	'Geopoint2-Accuracy', # NEW
  
  # URL
  "text_audit_full",
  
  # Captions
  "C10_image_Caption", "C10_image2_Caption", "C10_image3_Caption", "C10_image4_Caption", "C10_image5_Caption", "Please_Add_Any_Relevant_Photo_caption",
  
  
  # repeat counter and SET-OFF 
  "C6_list_members_count",	"SET-OF-C6_list_members", "Subjects_Added_count",	"SET-OF-Subjects_Added", "SET-OF-Relevant_photos",
  
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
  
)


# cloning clean datasets for client version
# clean_data.tool0_for_client <- clean_data.tool0
clean_data.tool1_for_client <- clean_data.tool1
clean_data.tool2_for_client <- clean_data.tool2
clean_data.tool3_for_client <- clean_data.tool3
clean_data.tool4_for_client <- clean_data.tool4
clean_data.tool5_for_client <- clean_data.tool5
clean_data.tool6_for_client <- clean_data.tool6
clean_data.tool7_for_client <- clean_data.tool7
# clean_data.tool8_for_client <- clean_data.tool8
# clean_data.tool9_for_client <- clean_data.tool9


# Remove extra cols -------------------------------------------------------
# clean_data.tool0_for_client$data <- clean_data.tool0$data %>% select(-any_of(c(extra_cols.tool0, qa_cols)))
# 
# clean_data.tool0_for_client$Tool3_Classes <- clean_data.tool0$Tool3_Classes %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool0_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool0_for_client$Tool3_T3_Classes_LW <- clean_data.tool0$Tool3_T3_Classes_LW %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool0_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool0_for_client$Tool3_T2_Classes_VD <- clean_data.tool0$Tool3_T2_Classes_VD %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool0_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool0_for_client$Tool1_Timetable_Year <- clean_data.tool0$Tool1_Timetable_Year %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool0_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool0_for_client$Tool1_Timetable1_Repeat <- clean_data.tool0$Tool1_Timetable1_Repeat %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool0_for_client$Tool1_Timetable_Year |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool0_for_client$Tool1_Timetable2_Repeat <- clean_data.tool0$Tool1_Timetable2_Repeat %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool0_for_client$Tool1_Timetable_Year |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool0_for_client$Tool1_Timetable3_Repeat <- clean_data.tool0$Tool1_Timetable3_Repeat %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool0_for_client$Tool1_Timetable_Year |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool0_for_client$Tool1_Timetable4_Repeat <- clean_data.tool0$Tool1_Timetable4_Repeat %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
#   mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
#   left_join(clean_data.tool0_for_client$Tool1_Timetable_Year |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool0_for_client$Tool3_Grades_Repeat <- clean_data.tool0$Tool3_Grades_Repeat %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool0_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())


# Tool 1
clean_data.tool1_for_client$data <- clean_data.tool1$data %>% select(-any_of(c(extra_cols.tool1, qa_cols)))

clean_data.tool1_for_client$Support_Respondents <- clean_data.tool1$Support_Respondents %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool1_for_client$School_Operationality <- clean_data.tool1$School_Operationality %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime", "School_CBE_Gender_Based_On_The_Sample"))) |>
  left_join(clean_data.tool1_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool1_for_client$Shifts_Detail <- clean_data.tool1$Shifts_Detail %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool1_for_client$Headmasters <- clean_data.tool1$Headmasters %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool1_for_client$Weekly_Class_Schedule <- clean_data.tool1$Weekly_Class_Schedule %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool1_for_client$Weekly_Class_Schedule_New <- clean_data.tool1$Weekly_Class_Schedule_New %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool1_for_client$Subjects_Detail <- clean_data.tool1$Subjects_Detail %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool1_for_client$Education_Quality <- clean_data.tool1$Education_Quality %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())


clean_data.tool1_for_client$Relevant_photos <- clean_data.tool1$Relevant_photos %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(clean_data.tool1_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())


# Tool 2
clean_data.tool2_for_client$data <- clean_data.tool2$data %>% select(-any_of(c(extra_cols.tool2, qa_cols)))


clean_data.tool2_for_client$Support_Respondents <- clean_data.tool2$Support_Respondents %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(clean_data.tool2_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool2_for_client$School_Operationality <- clean_data.tool2$School_Operationality %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool2_for_client$Shifts_Detail <- clean_data.tool2$Shifts_Detail %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool2_for_client$Headmasters <- clean_data.tool2$Headmasters %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool2_for_client$Attendance_Sheet_Photos <- clean_data.tool2$Attendance_Sheet_Photos %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool2_for_client$Public_Stationary_Kit_Group <- clean_data.tool2$Public_Stationary_Kit_Group %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool2_for_client$Teachers_Pack_Group <- clean_data.tool2$Teachers_Pack_Group %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool2_for_client$Students_Pack_Group <- clean_data.tool2$Students_Pack_Group %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool2_for_client$Relevant_photos <- clean_data.tool2$Relevant_photos %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())


# Tool 3
clean_data.tool3_for_client$data <- clean_data.tool3$data %>% select(-any_of(c(extra_cols.tool3, qa_cols)))


clean_data.tool3_for_client$Support_Respondents <- clean_data.tool3$Support_Respondents %>% select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(clean_data.tool3_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
  

clean_data.tool3_for_client$Grade_Details <- clean_data.tool3$Grade_Details %>% select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
  left_join(clean_data.tool3_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool3_for_client$Todays_Attendance_Detail <- clean_data.tool3$Todays_Attendance_Detail %>% select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
  left_join(clean_data.tool3_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool3_for_client$Student_Headcount <- clean_data.tool3$Student_Headcount %>% select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
  left_join(clean_data.tool3_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool3_for_client$Tool3_Grades_Repeat <- clean_data.tool3$Tool3_Grades_Repeat %>% select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
  left_join(clean_data.tool3_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool3_for_client$Relevant_photos <- clean_data.tool3$Relevant_photos %>% select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
  left_join(clean_data.tool3_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())


# Tool 4
clean_data.tool4_for_client$data <- clean_data.tool4$data %>% select(-any_of(c(extra_cols.tool4, qa_cols)))

clean_data.tool4_for_client$Additional_Subjects <- clean_data.tool4$Additional_Subjects %>% select(-any_of(c(extra_cols.tool4, qa_cols, "starttime"))) |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(clean_data.tool4_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool4_for_client$Subjects_taught_by_this_teacher <- clean_data.tool4$Subjects_taught_by_this_teacher %>% select(-any_of(c(extra_cols.tool4, qa_cols, "starttime"))) |>
  left_join(clean_data.tool4_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool4_for_client$Subjects_Not_Being_Taught <- clean_data.tool4$Subjects_Not_Being_Taught %>% select(-any_of(c(extra_cols.tool4, qa_cols, "starttime"))) |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(clean_data.tool4_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool4_for_client$Relevant_photos <- clean_data.tool4$Relevant_photos %>% select(-any_of(c(extra_cols.tool4, qa_cols, "starttime"))) |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(clean_data.tool4_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

# Tool 5
clean_data.tool5_for_client$data <- clean_data.tool5$data %>% select(-any_of(c(extra_cols.tool5, qa_cols)))

clean_data.tool5_for_client$Under_Construction_Toilets <- clean_data.tool5$Under_Construction_Toilets %>% select(-any_of(c(extra_cols.tool5, qa_cols, "starttime"))) |>
  left_join(clean_data.tool5_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool5_for_client$Useable_Toilets <- clean_data.tool5$Useable_Toilets %>% select(-any_of(c(extra_cols.tool5, qa_cols, "starttime"))) |>
  left_join(clean_data.tool5_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool5_for_client$Non_Useable_Toilets <- clean_data.tool5$Non_Useable_Toilets %>% select(-any_of(c(extra_cols.tool5, qa_cols, "starttime"))) |>
  left_join(clean_data.tool5_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool5_for_client$Relevant_photos <- clean_data.tool5$Relevant_photos %>% select(-any_of(c(extra_cols.tool5, qa_cols, "starttime"))) |>
  left_join(clean_data.tool5_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())



# Tool 6
clean_data.tool6_for_client$data <- clean_data.tool6$data %>% select(-any_of(c(extra_cols.tool6, qa_cols)))

clean_data.tool6_for_client$Subjects_Added <- clean_data.tool6$Subjects_Added %>% select(-any_of(c(extra_cols.tool6, qa_cols, "starttime"))) |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(clean_data.tool6_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool6_for_client$Relevant_photos <- clean_data.tool6$Relevant_photos %>% select(-any_of(c(extra_cols.tool6, qa_cols, "starttime"))) |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(clean_data.tool6_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

# Tool 7
clean_data.tool7_for_client$data <- clean_data.tool7$data %>% select(-any_of(c(extra_cols.tool7, qa_cols)))

clean_data.tool7_for_client$Subjects_Added <- clean_data.tool7$Subjects_Added %>% select(-any_of(c(extra_cols.tool7, qa_cols, "starttime"))) |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(clean_data.tool7_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())

clean_data.tool7_for_client$Relevant_photos <- clean_data.tool7$Relevant_photos %>% select(-any_of(c(extra_cols.tool7, qa_cols, "starttime"))) |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(clean_data.tool7_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())


# # Tool 8
# clean_data.tool8_for_client$data <- clean_data.tool8$data %>% select(-any_of(c(extra_cols.tool8, qa_cols)))
# 
# clean_data.tool8_for_client$Classes <- clean_data.tool8$Classes %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool8_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool8_for_client$Adults_At_The_CBE <- clean_data.tool8$Adults_At_The_CBE %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool8_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool8_for_client$Section_2_2_3_Attendance_Rec... <- clean_data.tool8$Section_2_2_3_Attendance_Rec... %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool8_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool8_for_client$Section_2_2_4_Headcount <- clean_data.tool8$Section_2_2_4_Headcount %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime", "School_CBE_Gender_Based_On_The_Sample"))) |>
#   left_join(clean_data.tool8_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool8_for_client$Students_Enrolment_Book <- clean_data.tool8$Students_Enrolment_Book %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool8_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool8_for_client$Section_2_4_Student_Ages <- clean_data.tool8$Section_2_4_Student_Ages %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool8_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool8_for_client$Classroom_Materials <- clean_data.tool8$Classroom_Materials %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool8_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool8_for_client$Teacher_Kit <- clean_data.tool8$Teacher_Kit %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool8_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool8_for_client$Student_Kit <- clean_data.tool8$Student_Kit %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool8_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool8_for_client$V_list_of_all_members <- clean_data.tool8$V_list_of_all_members %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool8_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool8_for_client$Subjects_Added <- clean_data.tool8$Subjects_Added %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool8_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())
# 
# clean_data.tool8_for_client$Relevant_photos <- clean_data.tool8$Relevant_photos %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool8_for_client$data |> select(KEY, EMIS_School_ID_CBE_KEY), by = c("PARENT_KEY" = "KEY")) |> 
#   select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, everything())



# clean_data.tool9_for_client$data <- clean_data.tool9$data %>% select(-any_of(c(extra_cols.tool9, qa_cols)))
# clean_data.tool9_for_client$Relevant_photos <- clean_data.tool9$Relevant_photos %>% mutate(PARENT_KEY = as.character(PARENT_KEY)) %>%  select(-any_of(c(extra_cols.tool9, qa_cols, "starttime"))) |>
#   left_join(clean_data.tool9$data |> select(KEY, IP_Name), by = c("PARENT_KEY"="KEY")) |>
#   select(Site_Visit_ID, IP_Name, everything())

# remove extra objects from environment  
# remove(list = c("qa_cols"))

source("R/remove_extra_columns_value.R")
