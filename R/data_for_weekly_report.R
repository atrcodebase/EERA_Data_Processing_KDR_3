# last weeks data

# Clone data sets --------------------------------------------------------------
# clean_data.tool0.report <- clean_data.tool0
clean_data.tool1.report <- clean_data.tool1
clean_data.tool2.report <- clean_data.tool2
clean_data.tool3.report <- clean_data.tool3
clean_data.tool4.report <- clean_data.tool4
clean_data.tool5.report <- clean_data.tool5
clean_data.tool6.report <- clean_data.tool6
clean_data.tool7.report <- clean_data.tool7
# clean_data.tool8.report <- clean_data.tool8
# clean_data.tool9.report <- clean_data.tool9


# Tool 0 - Data Entry
# clean_data.tool0.report$data <- clean_data.tool0.report$data %>% filter(KEY %in% c(approved_keys_ps, pending_key_ps, approved_keys_cbe, pending_key_cbe) & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))
# clean_data.tool0.report$Tool3_Classes <- clean_data.tool0.report$Tool3_Classes %>% filter(PARENT_KEY %in% clean_data.tool0.report$data$KEY & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))
# clean_data.tool0.report$Tool3_T3_Classes_LW <- clean_data.tool0.report$Tool3_T3_Classes_LW %>% filter(PARENT_KEY %in% clean_data.tool0.report$data$KEY & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))
# clean_data.tool0.report$Tool3_T2_Classes_VD <- clean_data.tool0.report$Tool3_T2_Classes_VD %>% filter(PARENT_KEY %in% clean_data.tool0.report$data$KEY & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))
# clean_data.tool0.report$Tool1_Timetable_Year <- clean_data.tool0.report$Tool1_Timetable_Year %>% filter(PARENT_KEY %in% clean_data.tool0.report$data$KEY & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))
# clean_data.tool0.report$Tool1_Timetable1_Repeat <- clean_data.tool0.report$Tool1_Timetable1_Repeat %>% filter(PARENT_KEY %in% clean_data.tool0.report$Tool1_Timetable_Year$KEY & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))
# clean_data.tool0.report$Tool1_Timetable2_Repeat <- clean_data.tool0.report$Tool1_Timetable2_Repeat %>% filter(PARENT_KEY %in% clean_data.tool0.report$Tool1_Timetable_Year$KEY & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))
# clean_data.tool0.report$Tool1_Timetable3_Repeat <- clean_data.tool0.report$Tool1_Timetable3_Repeat %>% filter(PARENT_KEY %in% clean_data.tool0.report$Tool1_Timetable_Year$KEY & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))
# clean_data.tool0.report$Tool1_Timetable4_Repeat <- clean_data.tool0.report$Tool1_Timetable4_Repeat %>% filter(PARENT_KEY %in% clean_data.tool0.report$Tool1_Timetable_Year$KEY & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))
# clean_data.tool0.report$Tool3_Grades_Repeat <- clean_data.tool0.report$Tool3_Grades_Repeat %>% filter(PARENT_KEY %in% clean_data.tool0.report$data$KEY & !KEY %in% c(deleted_keys_ps, deleted_keys_cbe))


# Tool 1 - Headmaster
clean_data.tool1.report$data <- clean_data.tool1.report$data %>% filter(KEY %in% c(approved_keys_ps, pending_key_ps) & !KEY %in% deleted_keys_ps)
clean_data.tool1.report$Support_Respondents <- clean_data.tool1.report$Support_Respondents %>% filter(PARENT_KEY %in% clean_data.tool1.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1.report$School_Operationality <- clean_data.tool1.report$School_Operationality %>% filter(PARENT_KEY %in% clean_data.tool1.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1.report$School_Operationality_Other_... <- clean_data.tool1.report$School_Operationality_Other_... %>% filter(PARENT_KEY %in% clean_data.tool1.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1.report$Shifts_Detail <- clean_data.tool1.report$Shifts_Detail %>% filter(PARENT_KEY %in% clean_data.tool1.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1.report$Other_Shifts_Detail <- clean_data.tool1.report$Other_Shifts_Detail %>% filter(PARENT_KEY %in% clean_data.tool1.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1.report$Headmasters <- clean_data.tool1.report$Headmasters %>% filter(PARENT_KEY %in% clean_data.tool1.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1.report$Weekly_Schedule_Old <- clean_data.tool1.report$Weekly_Schedule_Old %>% filter(PARENT_KEY %in% clean_data.tool1.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1.report$Weekly_Schedule_New <- clean_data.tool1.report$Weekly_Schedule_New %>% filter(PARENT_KEY %in% clean_data.tool1.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1.report$Subjects_Detail <- clean_data.tool1.report$Subjects_Detail %>% filter(PARENT_KEY %in% clean_data.tool1.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1.report$Additional_Subjects <- clean_data.tool1.report$Additional_Subjects %>% filter(PARENT_KEY %in% clean_data.tool1.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1.report$Education_Quality <- clean_data.tool1.report$Education_Quality %>% filter(PARENT_KEY %in% clean_data.tool1.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1.report$Relevant_photos <- clean_data.tool1.report$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool1.report$data$KEY & !KEY %in% deleted_keys_ps)

# Tool 2 - Light
clean_data.tool2.report$data <- clean_data.tool2.report$data %>% filter(KEY %in% c(approved_keys_ps, pending_key_ps) & !KEY %in% deleted_keys_ps)
clean_data.tool2.report$Support_Respondents <- clean_data.tool2.report$Support_Respondents %>% filter(PARENT_KEY %in% clean_data.tool2.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2.report$Attendance_Sheet_Photos <- clean_data.tool2.report$Attendance_Sheet_Photos %>% filter(PARENT_KEY %in% clean_data.tool2.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2.report$Public_Stationary_Kit_Group <- clean_data.tool2.report$Public_Stationary_Kit_Group %>% filter(PARENT_KEY %in% clean_data.tool2.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2.report$Teachers_Pack_Group <- clean_data.tool2.report$Teachers_Pack_Group %>% filter(PARENT_KEY %in% clean_data.tool2.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2.report$Students_Pack_Group <- clean_data.tool2.report$Students_Pack_Group %>% filter(PARENT_KEY %in% clean_data.tool2.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2.report$Relevant_photos <- clean_data.tool2.report$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool2.report$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 3 - Headcount
clean_data.tool3.report$data <- clean_data.tool3.report$data %>% filter(KEY %in% c(approved_keys_ps, pending_key_ps) & !KEY %in% deleted_keys_ps)
clean_data.tool3.report$Support_Respondents <- clean_data.tool3.report$Support_Respondents %>% filter(PARENT_KEY %in% clean_data.tool3.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3.report$Grade_Details <- clean_data.tool3.report$Grade_Details %>% filter(PARENT_KEY %in% clean_data.tool3.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3.report$Todays_Attendance_Detail <- clean_data.tool3.report$Todays_Attendance_Detail %>% filter(PARENT_KEY %in% clean_data.tool3.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3.report$LastWeek_Attendance_Detail <- clean_data.tool3.report$LastWeek_Attendance_Detail %>% filter(PARENT_KEY %in% clean_data.tool3.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3.report$Student_Headcount <- clean_data.tool3.report$Student_Headcount %>% filter(PARENT_KEY %in% clean_data.tool3.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3.report$Tool3_Grades_Repeat <- clean_data.tool3.report$Tool3_Grades_Repeat %>% filter(PARENT_KEY %in% clean_data.tool3.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3.report$Relevant_photos <- clean_data.tool3.report$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool3.report$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 4 - Teacher
clean_data.tool4.report$data <- clean_data.tool4.report$data %>% filter(KEY %in% c(approved_keys_ps, pending_key_ps) & !KEY %in% deleted_keys_ps)
clean_data.tool4.report$Additional_Subjects <- clean_data.tool4.report$Additional_Subjects %>% filter(PARENT_KEY %in% clean_data.tool4.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool4.report$Subjects_taught_by_this_teacher <- clean_data.tool4.report$Subjects_taught_by_this_teacher %>% filter(PARENT_KEY %in% clean_data.tool4.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool4.report$Subjects_Not_Being_Taught <- clean_data.tool4.report$Subjects_Not_Being_Taught %>% filter(PARENT_KEY %in% clean_data.tool4.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool4.report$Relevant_photos <- clean_data.tool4.report$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool4.report$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 5 - WASH
clean_data.tool5.report$data <- clean_data.tool5.report$data %>% filter(KEY %in% c(approved_keys_ps, pending_key_ps) & !KEY %in% deleted_keys_ps)
clean_data.tool5.report$Under_Construction_Toilets <- clean_data.tool5.report$Under_Construction_Toilets %>% filter(PARENT_KEY %in% clean_data.tool5.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool5.report$Useable_Toilets <- clean_data.tool5.report$Useable_Toilets %>% filter(PARENT_KEY %in% clean_data.tool5.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool5.report$Non_Useable_Toilets <- clean_data.tool5.report$Non_Useable_Toilets %>% filter(PARENT_KEY %in% clean_data.tool5.report$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool5.report$Relevant_photos <- clean_data.tool5.report$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool5.report$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 6 - Parent
clean_data.tool6.report$data <- clean_data.tool6.report$data %>% filter((KEY %in% c(approved_keys_ps, pending_key_ps) | KEY %in% c(approved_keys_cbe, pending_key_cbe)) & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))
clean_data.tool6.report$Subjects_Added <- clean_data.tool6.report$Subjects_Added %>% filter(PARENT_KEY %in% clean_data.tool6.report$data$KEY & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))


# Tool 7 - SHURA
clean_data.tool7.report$data <- clean_data.tool7.report$data %>% filter((KEY %in% c(approved_keys_ps, pending_key_ps) | KEY %in% c(approved_keys_cbe, pending_key_cbe)) & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))
clean_data.tool7.report$C6_list_members <- clean_data.tool7.report$C6_list_members %>% filter(PARENT_KEY %in% clean_data.tool7.report$data$KEY & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))
clean_data.tool7.report$Subjects_Added <- clean_data.tool7.report$Subjects_Added %>% filter(PARENT_KEY %in% clean_data.tool7.report$data$KEY & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))


# # Tool 8 - Class
# clean_data.tool8.report$data <- clean_data.tool8.report$data %>% filter(KEY %in% c(approved_keys_cbe, pending_key_cbe) & !KEY %in% deleted_keys_cbe)
# clean_data.tool8.report$Classes <- clean_data.tool8.report$Classes %>% filter(PARENT_KEY %in% clean_data.tool8.report$data$KEY & !KEY %in% deleted_keys_cbe)
# clean_data.tool8.report$Adults_At_The_CBE <- clean_data.tool8.report$Adults_At_The_CBE %>% filter(PARENT_KEY %in% clean_data.tool8.report$data$KEY & !KEY %in% deleted_keys_cbe)
# clean_data.tool8.report$Section_2_2_3_Attendance_Rec... <- clean_data.tool8.report$Section_2_2_3_Attendance_Rec... %>% filter(PARENT_KEY %in% clean_data.tool8.report$data$KEY & !KEY %in% deleted_keys_cbe)
# clean_data.tool8.report$Section_2_2_4_Headcount <- clean_data.tool8.report$Section_2_2_4_Headcount %>% filter(PARENT_KEY %in% clean_data.tool8.report$data$KEY & !KEY %in% deleted_keys_cbe)
# clean_data.tool8.report$Students_Enrolment_Book <- clean_data.tool8.report$Students_Enrolment_Book %>% filter(PARENT_KEY %in% clean_data.tool8.report$data$KEY & !KEY %in% deleted_keys_cbe)
# clean_data.tool8.report$Section_2_4_Student_Ages <- clean_data.tool8.report$Section_2_4_Student_Ages %>% filter(PARENT_KEY %in% clean_data.tool8.report$data$KEY & !KEY %in% deleted_keys_cbe)
# clean_data.tool8.report$Classroom_Materials <- clean_data.tool8.report$Classroom_Materials %>% filter(PARENT_KEY %in% clean_data.tool8.report$data$KEY & !KEY %in% deleted_keys_cbe)
# clean_data.tool8.report$Teacher_Kit <- clean_data.tool8.report$Teacher_Kit %>% filter(PARENT_KEY %in% clean_data.tool8.report$data$KEY & !KEY %in% deleted_keys_cbe)
# clean_data.tool8.report$Student_Kit <- clean_data.tool8.report$Student_Kit %>% filter(PARENT_KEY %in% clean_data.tool8.report$data$KEY & !KEY %in% deleted_keys_cbe)
# clean_data.tool8.report$V_list_of_all_members <- clean_data.tool8.report$V_list_of_all_members %>% filter(PARENT_KEY %in% clean_data.tool8.report$data$KEY & !KEY %in% deleted_keys_cbe)
# clean_data.tool8.report$Subjects_Added <- clean_data.tool8.report$Subjects_Added %>% filter(PARENT_KEY %in% clean_data.tool8.report$data$KEY & !KEY %in% deleted_keys_cbe)
# clean_data.tool8.report$Relevant_photos <- clean_data.tool8.report$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool8.report$data$KEY & !KEY %in% deleted_keys_cbe)
# 
# 
# # Tool 9 - IP
# clean_data.tool9.report$data <- clean_data.tool9.report$data %>% filter(KEY %in% c(approved_keys_cbe, pending_key_cbe) & !KEY %in% deleted_keys_cbe)
# clean_data.tool9.report$Relevant_photos <- clean_data.tool9.report$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool9.report$data$KEY & !KEY %in% deleted_keys_cbe)


# Attach Labels
tool0_path = "./input/tools/Tool 0.EERA Public School_CBE - Data Entry Tool - R2.xlsx"
# tool1_path = "./input/tools/Tool 1_EERA School Indepth Visit_Principal Interview_R2.xlsx"
# tool2_path = "./input/tools/Tool 2_EERA School Light Tool_R2.xlsx"
# tool3_path = "./input/tools/Tool 3_EERA School Student Documents and Headcount Monitoring_R2.xlsx"
# tool4_path = "./input/tools/Tool 4_EERA School Teacher Interview_R2.xlsx"
# tool5_path = "./input/tools/Tool 5_EERA School WASH Monitoring_R2.xlsx"
# tool6_path = "./input/tools/Tool 6_EERA School_CBE Student Parent Interview_R2.xlsx"
# tool7_path = "./input/tools/Tool 7_EERA School_CBE Shura Member Interview_R2.xlsx"
# tool8_path = "./input/tools/Tool 8_EERA CBE_Teacher Interview_R2.xlsx"
# tool9_path = "./input/tools/Tool 9_EERA CBE_IP Interview_R2.xlsx"

# Tool 0 ------------------------------------------------------------------
clean_data.tool0.report$data <- labeler(
  data = clean_data.tool0.report$data, 
  tool = tool0_path, 
  survey_label = "label",
  choice_lable = "label")

clean_data.tool0.report$Tool3_Classes <- labeler(
  data = clean_data.tool0.report$Tool3_Classes, 
  tool = tool0_path, 
  survey_label = "label",
  choice_lable = "label")

clean_data.tool0.report$Tool3_T3_Classes_LW <- labeler(
  data = clean_data.tool0.report$Tool3_T3_Classes_LW, 
  tool = tool0_path, 
  survey_label = "label",
  choice_lable = "label")

clean_data.tool0.report$Tool3_T2_Classes_VD <- labeler(
  data = clean_data.tool0.report$Tool3_T2_Classes_VD, 
  tool = tool0_path, 
  survey_label = "label",
  choice_lable = "label")

clean_data.tool0.report$Tool1_Timetable_Year <- labeler(
  data = clean_data.tool0.report$Tool1_Timetable_Year, 
  tool = tool0_path, 
  survey_label = "label",
  choice_lable = "label")

clean_data.tool0.report$Tool1_Timetable1_Repeat <- labeler(
  data = clean_data.tool0.report$Tool1_Timetable1_Repeat, 
  tool = tool0_path, 
  survey_label = "label",
  choice_lable = "label")

clean_data.tool0.report$Tool1_Timetable2_Repeat <- labeler(
  data = clean_data.tool0.report$Tool1_Timetable2_Repeat, 
  tool = tool0_path, 
  survey_label = "label",
  choice_lable = "label")

clean_data.tool0.report$Tool1_Timetable3_Repeat <- labeler(
  data = clean_data.tool0.report$Tool1_Timetable3_Repeat, 
  tool = tool0_path, 
  survey_label = "label",
  choice_lable = "label")

clean_data.tool0.report$Tool1_Timetable4_Repeat <- labeler(
  data = clean_data.tool0.report$Tool1_Timetable4_Repeat, 
  tool = tool0_path, 
  survey_label = "label",
  choice_lable = "label")

clean_data.tool0.report$Tool3_Grades_Repeat <- labeler(
  data = clean_data.tool0.report$Tool3_Grades_Repeat, 
  tool = tool0_path, 
  survey_label = "label",
  choice_lable = "label")


# Tool 1 ------------------------------------------------------------------
# clean_data.tool1.report$data <- labeler(
#   data = clean_data.tool1.report$data, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1.report$Support_Respondents <- labeler(
#   data = clean_data.tool1.report$Support_Respondents, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1.report$School_Operationality <- labeler(
#   data = clean_data.tool1.report$School_Operationality, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1.report$School_Operationality_Other_... <- labeler(
#   data = clean_data.tool1.report$School_Operationality_Other_..., 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1.report$Shifts_Detail <- labeler(
#   data = clean_data.tool1.report$Shifts_Detail, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1.report$Other_Shifts_Detail <- labeler(
#   data = clean_data.tool1.report$Other_Shifts_Detail, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1.report$Headmasters <- labeler(
#   data = clean_data.tool1.report$Headmasters, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1.report$Weekly_Schedule_Old <- labeler(
#   data = clean_data.tool1.report$Weekly_Schedule_Old, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1.report$Weekly_Schedule_New <- labeler(
#   data = clean_data.tool1.report$Weekly_Schedule_New, 
#   tool = tool1_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1.report$Subjects_Detail <- labeler(
#   data = clean_data.tool1.report$Subjects_Detail, 
#   tool = tool1_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1.report$Additional_Subjects <- labeler(
#   data = clean_data.tool1.report$Additional_Subjects, 
#   tool = tool1_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1.report$Education_Quality <- labeler(
#   data = clean_data.tool1.report$Education_Quality, 
#   tool = tool1_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1.report$Relevant_photos <- labeler(
#   data = clean_data.tool1.report$Relevant_photos, 
#   tool = tool1_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# 
# # Tool 2 ------------------------------------------------------------------
# clean_data.tool2.report$data <- labeler(
#   data = clean_data.tool2.report$data, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool2.report$Support_Respondents <- labeler(
#   data = clean_data.tool2.report$Support_Respondents, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool2.report$Attendance_Sheet_Photos <- labeler(
#   data = clean_data.tool2.report$Attendance_Sheet_Photos, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool2.report$Public_Stationary_Kit_Group <- labeler(
#   data = clean_data.tool2.report$Public_Stationary_Kit_Group, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool2.report$Teachers_Pack_Group <- labeler(
#   data = clean_data.tool2.report$Teachers_Pack_Group, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool2.report$Students_Pack_Group <- labeler(
#   data = clean_data.tool2.report$Students_Pack_Group, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool2.report$Relevant_photos <- labeler(
#   data = clean_data.tool2.report$Relevant_photos, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Tool 3 ------------------------------------------------------------------
# clean_data.tool3.report$data <- labeler(
#   data = clean_data.tool3.report$data, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3.report$Support_Respondents <- labeler(
#   data = clean_data.tool3.report$Support_Respondents, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3.report$Grade_Details <- labeler(
#   data = clean_data.tool3.report$Grade_Details, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3.report$Todays_Attendance_Detail <- labeler(
#   data = clean_data.tool3.report$Todays_Attendance_Detail, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3.report$LastWeek_Attendance_Detail <- labeler(
#   data = clean_data.tool3.report$LastWeek_Attendance_Detail, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3.report$Student_Headcount <- labeler(
#   data = clean_data.tool3.report$Student_Headcount, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3.report$Tool3_Grades_Repeat <- labeler(
#   data = clean_data.tool3.report$Tool3_Grades_Repeat, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3.report$Relevant_photos <- labeler(
#   data = clean_data.tool3.report$Relevant_photos, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# 
# # Tool 4 ------------------------------------------------------------------
# clean_data.tool4.report$data <- labeler(
#   data = clean_data.tool4.report$data, 
#   tool = tool4_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool4.report$Additional_Subjects <- labeler(
#   data = clean_data.tool4.report$Additional_Subjects, 
#   tool = tool4_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool4.report$Subjects_taught_by_this_teacher <- labeler(
#   data = clean_data.tool4.report$Subjects_taught_by_this_teacher, 
#   tool = tool4_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool4.report$Subjects_Not_Being_Taught <- labeler(
#   data = clean_data.tool4.report$Subjects_Not_Being_Taught, 
#   tool = tool4_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool4.report$Relevant_photos <- labeler(
#   data = clean_data.tool4.report$Relevant_photos, 
#   tool = tool4_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Tool 5 ------------------------------------------------------------------
# clean_data.tool5.report$data <- labeler(
#   data = clean_data.tool5.report$data, 
#   tool = tool5_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool5.report$Under_Construction_Toilets <- labeler(
#   data = clean_data.tool5.report$Under_Construction_Toilets, 
#   tool = tool5_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool5.report$Useable_Toilets <- labeler(
#   data = clean_data.tool5.report$Useable_Toilets, 
#   tool = tool5_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool5.report$Non_Useable_Toilets <- labeler(
#   data = clean_data.tool5.report$Non_Useable_Toilets, 
#   tool = tool5_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool5.report$Relevant_photos <- labeler(
#   data = clean_data.tool5.report$Relevant_photos, 
#   tool = tool5_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Tool 6 ------------------------------------------------------------------
# clean_data.tool6.report$data <- labeler(
#   data = clean_data.tool6.report$data, 
#   tool = tool6_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool6.report$Subjects_Added <- labeler(
#   data = clean_data.tool6.report$Subjects_Added, 
#   tool = tool6_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Tool 7 ------------------------------------------------------------------
# clean_data.tool7.report$data <- labeler(
#   data = clean_data.tool7.report$data, 
#   tool = tool7_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool7.report$C6_list_members <- labeler(
#   data = clean_data.tool7.report$C6_list_members, 
#   tool = tool7_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool7.report$Subjects_Added <- labeler(
#   data = clean_data.tool7.report$Subjects_Added, 
#   tool = tool7_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Tool 8 ------------------------------------------------------------------
# clean_data.tool8.report$data <- labeler(
#   data = clean_data.tool8.report$data, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8.report$Classes <- labeler(
#   data = clean_data.tool8.report$Classes, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8.report$Adults_At_The_CBE <- labeler(
#   data = clean_data.tool8.report$Adults_At_The_CBE, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8.report$Section_2_2_3_Attendance_Rec... <- labeler(
#   data = clean_data.tool8.report$Section_2_2_3_Attendance_Rec..., 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8.report$Section_2_2_4_Headcount <- labeler(
#   data = clean_data.tool8.report$Section_2_2_4_Headcount, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8.report$Students_Enrolment_Book <- labeler(
#   data = clean_data.tool8.report$Students_Enrolment_Book, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8.report$Section_2_4_Student_Ages <- labeler(
#   data = clean_data.tool8.report$Section_2_4_Student_Ages, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8.report$Classroom_Materials <- labeler(
#   data = clean_data.tool8.report$Classroom_Materials, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8.report$Teacher_Kit <- labeler(
#   data = clean_data.tool8.report$Teacher_Kit, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8.report$Student_Kit <- labeler(
#   data = clean_data.tool8.report$Student_Kit, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8.report$V_list_of_all_members <- labeler(
#   data = clean_data.tool8.report$V_list_of_all_members, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8.report$Subjects_Added <- labeler(
#   data = clean_data.tool8.report$Subjects_Added, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8.report$Relevant_photos <- labeler(
#   data = clean_data.tool8.report$Relevant_photos, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Tool 9 ------------------------------------------------------------------
# clean_data.tool9.report$data <- labeler(
#   data = clean_data.tool9.report$data, 
#   tool = tool9_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool9.report$Relevant_photos <- labeler(
#   data = clean_data.tool9.report$Relevant_photos, 
#   tool = tool9_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Summary ----------------------------------------------------------------------
# int_per_school.tool1 <- clean_data.tool1.report$data |> 
#   group_by(Site_Visit_ID, EMIS_School_ID_CBE_KEY) |>
#   summarise(
#     `Headmaster` = n(),
#     `Headmaster (Open Schools)` = sum(!A34 %in% c("Yes, school is open, but there are no admin/academic staff members, teachers, or students inside",
#                                                                          "No, school is closed and there is no one inside")),
#     `Headmaster (Close Schools)` = sum(A34 %in% c("Yes, school is open, but there are no admin/academic staff members, teachers, or students inside",
#                                                                          "No, school is closed and there is no one inside"))
#   )
# 
# int_per_school.tool2 <- clean_data.tool2.report$data |>
#   group_by(Site_Visit_ID, EMIS_School_ID_CBE_KEY) |>
#   summarise(
#     `Light` = n(),
#     `Light (Open Schools)` = sum(!B7 %in% c("Yes, school is open, but there are no admin/academic staff members, teachers, or students inside",
#                                                  "No, school is closed and there is no one inside")),
#     `Light (Close Schools)` = sum(B7 %in% c("Yes, school is open, but there are no admin/academic staff members, teachers, or students inside",
#                                                  "No, school is closed and there is no one inside"))
#   )
# 
# int_per_school.tool3 <- clean_data.tool3.report$data |>
#   group_by(Site_Visit_ID, EMIS_School_ID_CBE_KEY) |>
#   summarise(
#     `Headcount` = n()
#   )
# 
# int_per_school.tool4 <- clean_data.tool4.report$data |>
#   # group_by(Site_Visit_ID, EMIS_School_ID_CBE_KEY) |>
#   group_by(Site_Visit_ID) |>
#   summarise(
#     `Teacher` = n()
#   )
# 
# int_per_school.tool5 <- clean_data.tool5.report$data |>
#   group_by(Site_Visit_ID, EMIS_School_ID_CBE_KEY) |>
#   summarise(
#     `WASH` = n(),
#     `WASH (Schools with Building)` = sum(C0 == "Yes"),
#     `WASH (Schools Without Building)` = sum(C0 == "No")
#   )
# 
# int_per_school.tool6.ps <- clean_data.tool6.report$data |>
#   filter(Sample_Type == "Public School") |>
#   group_by(Site_Visit_ID, EMIS_School_ID_CBE_KEY) |>
#   summarise(
#     `Parent` = n()
#   )
# 
# int_per_school.tool6.cbe <- clean_data.tool6.report$data |>
#   filter(Sample_Type == "CBE") |>
#   group_by(Site_Visit_ID, EMIS_School_ID_CBE_KEY) |>
#   summarise(
#     `Parent` = n()
#   )
# 
# int_per_school.tool7.ps <- clean_data.tool7.report$data |>
#   filter(Sample_Type == "Public School") |>
#   group_by(Site_Visit_ID, EMIS_School_ID_CBE_KEY) |>
#   summarise(
#     `Shura` = n()
#   )
# 
# int_per_school.tool7.cbe <- clean_data.tool7.report$data |>
#   filter(Sample_Type == "CBE") |>
#   group_by(Site_Visit_ID, EMIS_School_ID_CBE_KEY) |>
#   summarise(
#     `Shura` = n()
#   )
# 
# int_per_school.tool8 <- clean_data.tool8.report$data |>
#   group_by(Site_Visit_ID, EMIS_School_ID_CBE_KEY) |>
#   summarise(
#     `Class` = n()
#   )
# 
# int_per_school.tool9 <- clean_data.tool9.report$data |>
#   group_by(Site_Visit_ID, IP_Name) |>
#   summarise(
#     `IP` = n()
#   )
# 
# summary_ps <- int_per_school.tool1 |>
#   full_join(int_per_school.tool2 |> select(-EMIS_School_ID_CBE_KEY), by = "Site_Visit_ID") |>
#   full_join(int_per_school.tool3 |> select(-EMIS_School_ID_CBE_KEY), by = "Site_Visit_ID") |>
#   # full_join(int_per_school.tool4 |> select(-EMIS_School_ID_CBE_KEY), by = "Site_Visit_ID") |>
#   full_join(int_per_school.tool4, by = "Site_Visit_ID") |>
#   full_join(int_per_school.tool5 |> select(-EMIS_School_ID_CBE_KEY), by = "Site_Visit_ID") |>
#   full_join(int_per_school.tool6.ps |> select(-EMIS_School_ID_CBE_KEY), by = "Site_Visit_ID") |>
#   full_join(int_per_school.tool7.ps |> select(-EMIS_School_ID_CBE_KEY), by = "Site_Visit_ID") |>
#   select(-EMIS_School_ID_CBE_KEY)
# 
# summary_ps = bind_rows(
#   summary_ps,
#   apply(summary_ps[2:ncol(summary_ps)], MARGIN = 2, FUN = sum , na.rm = T)
# )
# 
# summary_ps$Site_Visit_ID[nrow(summary_ps)] <- "Total"
# 
# summary_ps[is.na(summary_ps)] <- 0
# 
# summary_cbe <- int_per_school.tool6.cbe |>
#   full_join(int_per_school.tool7.cbe |> select(-EMIS_School_ID_CBE_KEY), by = "Site_Visit_ID") |>
#   full_join(int_per_school.tool8 |> select(-EMIS_School_ID_CBE_KEY), by = "Site_Visit_ID") |>
#   full_join(int_per_school.tool9, by = "Site_Visit_ID") |>
#   select(-EMIS_School_ID_CBE_KEY, -IP_Name)
# 
# summary_cbe = bind_rows(
#   summary_cbe,
#   apply(summary_cbe[2:ncol(summary_cbe)], MARGIN = 2, FUN = sum , na.rm = T)
# ) 
# 
# summary_cbe$Site_Visit_ID[nrow(summary_cbe)] <- "Total"
# 
# summary_cbe[is.na(summary_cbe)] <- 0
# 
# # Export the outputs
# write.xlsx(summary_ps, paste0("./output/summary/EERA_R2_Public_School_Total_number_of_interviews_summary_", Sys.Date(),".xlsx"))
# write.xlsx(summary_cbe, paste0("./output/summary/EERA_R2_CBE_Total_number_of_interviews_summary_", Sys.Date(),".xlsx"))

write.xlsx(clean_data.tool0.report, paste0(output_data_path, "cleaned_dfs/unsterilized/for_report/Tool0_EERA_R2_Public_School_Data_Entry_Tool_For_Reporting_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool1.report, paste0(output_data_path, "cleaned_dfs/unsterilized/for_report/Tool1_EERA_R2_Public_School_Headmaster_Interview_For_Reporting_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool2.report, paste0(output_data_path, "cleaned_dfs/unsterilized/for_report/Tool2_EERA_R2_Public_School_Light_Tool_For_Reporting_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool3.report, paste0(output_data_path, "cleaned_dfs/unsterilized/for_report/Tool3_EERA_R2_Public_School_Student_Document_Headcount_For_Reporting_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool4.report, paste0(output_data_path, "cleaned_dfs/unsterilized/for_report/Tool4_EERA_R2_Public_School_Teacher_Tool_For_Reporting_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool5.report, paste0(output_data_path, "cleaned_dfs/unsterilized/for_report/Tool5_EERA_R2_Public_School_WASH_Observation_For_Reporting_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool6.report, paste0(output_data_path, "cleaned_dfs/unsterilized/for_report/Tool6_EERA_R2_Public_School_Parent_Tool_For_Reporting_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool7.report, paste0(output_data_path, "cleaned_dfs/unsterilized/for_report/Tool7_EERA_R2_Public_School_Shura_Tool_For_Reporting_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool8.report, paste0(output_data_path, "cleaned_dfs/unsterilized/for_report/Tool8_EERA_R2_CBE_Class_Level_Tool_For_Reporting_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool9.report, paste0(output_data_path, "cleaned_dfs/unsterilized/for_report/Tool9_EERA_R2_CBE_IP_Level_Tool_For_Reporting_", Sys.Date(),".xlsx"))


# Removing PIIs
# source("./R/anonymize_data.R")
# 
# write.xlsx(clean_data.tool1.report_anonym, paste0(output_data_path, "cleaned_dfs/sterilized/for_report/Tool1_EERA_R2_Public_School_Headmaster_Interview_For_Reporting_Anonymized_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool2.report_anonym, paste0(output_data_path, "cleaned_dfs/sterilized/for_report/Tool2_EERA_R2_Public_School_Light_Tool_For_Reporting_Anonymized_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool3.report_anonym, paste0(output_data_path, "cleaned_dfs/sterilized/for_report/Tool3_EERA_R2_Public_School_Student_Headcount_For_Reporting_Anonymized_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool4.report_anonym, paste0(output_data_path, "cleaned_dfs/sterilized/for_report/Tool4_EERA_R2_Public_School_Teacher_Tool_For_Reportin_Anonymizedg_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool5.report_anonym, paste0(output_data_path, "cleaned_dfs/sterilized/for_report/Tool5_EERA_R2_Public_School_WASH_Observation_For_Reporting_Anonymized_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool6.report_anonym, paste0(output_data_path, "cleaned_dfs/sterilized/for_report/Tool6_EERA_R2_Public_School_Parent_Tool_For_Reporting_Anonymized_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool7.report_anonym, paste0(output_data_path, "cleaned_dfs/sterilized/for_report/Tool7_EERA_R2_Public_School_Shura_Tool_For_Reporting_Anonymized_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool8.report_anonym, paste0(output_data_path, "cleaned_dfs/sterilized/for_report/Tool8_EERA_R2_CBE_Class_Level_Tool_For_Reporting_Anonymized_", Sys.Date(),".xlsx"))
# write.xlsx(clean_data.tool9.report_anonym, paste0(output_data_path, "cleaned_dfs/sterilized/for_report/Tool9_EERA_R2_CBE_IP_Level_Tool_For_Reporting_Anonymized_", Sys.Date(),".xlsx"))

# remove extra objects from environment  
# rm(list = 
#      c(ls(pattern = ".report$")
#        )
#    )

rm(tool1_path, 
   tool2_path,
   tool3_path,
   tool4_path,
   tool5_path,
   tool6_path,
   tool7_path,
   tool8_path,
   tool9_path)
