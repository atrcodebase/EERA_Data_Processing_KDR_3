### attach value labels
# source("R/functions/labeler_function.R")

# Cloning df
clean_data.tool1_ulabeled <- clean_data.tool1
clean_data.tool2_ulabeled <- clean_data.tool2
clean_data.tool3_ulabeled <- clean_data.tool3
clean_data.tool4_ulabeled <- clean_data.tool4
clean_data.tool5_ulabeled <- clean_data.tool5
clean_data.tool6_ulabeled <- clean_data.tool6
clean_data.tool7_ulabeled <- clean_data.tool7

tool1_path = "./input/tools/Tool 1.EERA Public School - Headmaster_Principle Interview - V3.xlsx"
tool2_path = "./input/tools/Tool 2.EERA Public School - Light Tool - V3.xlsx"
tool3_path = "./input/tools/Tool 3.EERA Public School - Student Document & Headcount - V3.xlsx"
tool4_path = "./input/tools/Tool 4.EERA Public School - Teacher Tool - V3.xlsx"
tool5_path = "./input/tools/Tool 5.EERA Public School - WASH Observation - V3.xlsx"
tool6_path = "./input/tools/Tool 6.EERA Public School- Parent Tool - V3.xlsx"
tool7_path = "./input/tools/Tool 7.EERA Public School - Shura Tool - V3.xlsx"



handle_labeler = function (df_list, tool_path){
  return(
    df_list |> lapply(\(df) labeler(data = df, tool = tool_path, survey_label = "label", choice_lable = "label"))
  )
}

# tool1
clean_data.tool1[] <- clean_data.tool1 |> handle_labeler(tool1_path)
clean_data.tool2[] <- clean_data.tool2 |> handle_labeler(tool2_path)
clean_data.tool3[] <- clean_data.tool3 |> handle_labeler(tool3_path)
clean_data.tool4[] <- clean_data.tool4 |> handle_labeler(tool4_path)
clean_data.tool5[] <- clean_data.tool5 |> handle_labeler(tool5_path)
clean_data.tool6[] <- clean_data.tool6 |> handle_labeler(tool6_path)
clean_data.tool7[] <- clean_data.tool7 |> handle_labeler(tool7_path)
# 
# # Tool 0 ------------------------------------------------------------------
# clean_data.tool0$data <- labeler(
#   data = clean_data.tool0$data, 
#   tool = tool0_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool0$Tool3_Classes <- labeler(
#   data = clean_data.tool0$Tool3_Classes, 
#   tool = tool0_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool0$Tool3_T3_Classes_LW <- labeler(
#   data = clean_data.tool0$Tool3_T3_Classes_LW, 
#   tool = tool0_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool0$Tool3_T2_Classes_VD <- labeler(
#   data = clean_data.tool0$Tool3_T2_Classes_VD, 
#   tool = tool0_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool0$Tool1_Timetable_Year <- labeler(
#   data = clean_data.tool0$Tool1_Timetable_Year, 
#   tool = tool0_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool0$Tool1_Timetable1_Repeat <- labeler(
#   data = clean_data.tool0$Tool1_Timetable1_Repeat, 
#   tool = tool0_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool0$Tool1_Timetable2_Repeat <- labeler(
#   data = clean_data.tool0$Tool1_Timetable2_Repeat, 
#   tool = tool0_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool0$Tool1_Timetable3_Repeat <- labeler(
#   data = clean_data.tool0$Tool1_Timetable3_Repeat, 
#   tool = tool0_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool0$Tool1_Timetable4_Repeat <- labeler(
#   data = clean_data.tool0$Tool1_Timetable4_Repeat, 
#   tool = tool0_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool0$Tool3_Grades_Repeat <- labeler(
#   data = clean_data.tool0$Tool3_Grades_Repeat, 
#   tool = tool0_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Tool 1 ------------------------------------------------------------------
# clean_data.tool1$data <- labeler(
#   data = clean_data.tool1$data, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1$Support_Respondents <- labeler(
#   data = clean_data.tool1$Support_Respondents, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1$School_Operationality <- labeler(
#   data = clean_data.tool1$School_Operationality, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1$School_Operationality_Other_... <- labeler(
#   data = clean_data.tool1$School_Operationality_Other_..., 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1$Shifts_Detail <- labeler(
#   data = clean_data.tool1$Shifts_Detail, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1$Other_Shifts_Detail <- labeler(
#   data = clean_data.tool1$Other_Shifts_Detail, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1$Headmasters <- labeler(
#   data = clean_data.tool1$Headmasters, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1$Weekly_Schedule_Old <- labeler(
#   data = clean_data.tool1$Weekly_Schedule_Old, 
#   tool = tool1_path, 
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1$Weekly_Schedule_New <- labeler(
#   data = clean_data.tool1$Weekly_Schedule_New, 
#   tool = tool1_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1$Subjects_Detail <- labeler(
#   data = clean_data.tool1$Subjects_Detail, 
#   tool = tool1_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1$Additional_Subjects <- labeler(
#   data = clean_data.tool1$Additional_Subjects, 
#   tool = tool1_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1$Education_Quality <- labeler(
#   data = clean_data.tool1$Education_Quality, 
#   tool = tool1_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool1$Relevant_photos <- labeler(
#   data = clean_data.tool1$Relevant_photos, 
#   tool = tool1_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# 
# # Tool 2 ------------------------------------------------------------------
# clean_data.tool2$data <- labeler(
#   data = clean_data.tool2$data, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool2$Support_Respondents <- labeler(
#   data = clean_data.tool2$Support_Respondents, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool2$Attendance_Sheet_Photos <- labeler(
#   data = clean_data.tool2$Attendance_Sheet_Photos, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool2$Public_Stationary_Kit_Group <- labeler(
#   data = clean_data.tool2$Public_Stationary_Kit_Group, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool2$Teachers_Pack_Group <- labeler(
#   data = clean_data.tool2$Teachers_Pack_Group, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool2$Students_Pack_Group <- labeler(
#   data = clean_data.tool2$Students_Pack_Group, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool2$Relevant_photos <- labeler(
#   data = clean_data.tool2$Relevant_photos, 
#   tool = tool2_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Tool 3 ------------------------------------------------------------------
# clean_data.tool3$data <- labeler(
#   data = clean_data.tool3$data, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3$Support_Respondents <- labeler(
#   data = clean_data.tool3$Support_Respondents, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3$Grade_Details <- labeler(
#   data = clean_data.tool3$Grade_Details, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3$Todays_Attendance_Detail <- labeler(
#   data = clean_data.tool3$Todays_Attendance_Detail, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3$LastWeek_Attendance_Detail <- labeler(
#   data = clean_data.tool3$LastWeek_Attendance_Detail, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3$Student_Headcount <- labeler(
#   data = clean_data.tool3$Student_Headcount, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3$Tool3_Grades_Repeat <- labeler(
#   data = clean_data.tool3$Tool3_Grades_Repeat, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool3$Relevant_photos <- labeler(
#   data = clean_data.tool3$Relevant_photos, 
#   tool = tool3_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# 
# # Tool 4 ------------------------------------------------------------------
# clean_data.tool4$data <- labeler(
#   data = clean_data.tool4$data, 
#   tool = tool4_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool4$Additional_Subjects <- labeler(
#   data = clean_data.tool4$Additional_Subjects, 
#   tool = tool4_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool4$Subjects_taught_by_this_teacher <- labeler(
#   data = clean_data.tool4$Subjects_taught_by_this_teacher, 
#   tool = tool4_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool4$Subjects_Not_Being_Taught <- labeler(
#   data = clean_data.tool4$Subjects_Not_Being_Taught, 
#   tool = tool4_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool4$Relevant_photos <- labeler(
#   data = clean_data.tool4$Relevant_photos, 
#   tool = tool4_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Tool 5 ------------------------------------------------------------------
# clean_data.tool5$data <- labeler(
#   data = clean_data.tool5$data, 
#   tool = tool5_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool5$Under_Construction_Toilets <- labeler(
#   data = clean_data.tool5$Under_Construction_Toilets, 
#   tool = tool5_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool5$Useable_Toilets <- labeler(
#   data = clean_data.tool5$Useable_Toilets, 
#   tool = tool5_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool5$Non_Useable_Toilets <- labeler(
#   data = clean_data.tool5$Non_Useable_Toilets, 
#   tool = tool5_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool5$Relevant_photos <- labeler(
#   data = clean_data.tool5$Relevant_photos, 
#   tool = tool5_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Tool 6 ------------------------------------------------------------------
# clean_data.tool6$data <- labeler(
#   data = clean_data.tool6$data, 
#   tool = tool6_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool6$Subjects_Added <- labeler(
#   data = clean_data.tool6$Subjects_Added, 
#   tool = tool6_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Tool 7 ------------------------------------------------------------------
# clean_data.tool7$data <- labeler(
#   data = clean_data.tool7$data, 
#   tool = tool7_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool7$C6_list_members <- labeler(
#   data = clean_data.tool7$C6_list_members, 
#   tool = tool7_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool7$Subjects_Added <- labeler(
#   data = clean_data.tool7$Subjects_Added, 
#   tool = tool7_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Tool 8 ------------------------------------------------------------------
# clean_data.tool8$data <- labeler(
#   data = clean_data.tool8$data, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8$Classes <- labeler(
#   data = clean_data.tool8$Classes, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8$Adults_At_The_CBE <- labeler(
#   data = clean_data.tool8$Adults_At_The_CBE, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8$Section_2_2_3_Attendance_Rec... <- labeler(
#   data = clean_data.tool8$Section_2_2_3_Attendance_Rec..., 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8$Section_2_2_4_Headcount <- labeler(
#   data = clean_data.tool8$Section_2_2_4_Headcount, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8$Students_Enrolment_Book <- labeler(
#   data = clean_data.tool8$Students_Enrolment_Book, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8$Section_2_4_Student_Ages <- labeler(
#   data = clean_data.tool8$Section_2_4_Student_Ages, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8$Classroom_Materials <- labeler(
#   data = clean_data.tool8$Classroom_Materials, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8$Teacher_Kit <- labeler(
#   data = clean_data.tool8$Teacher_Kit, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8$Student_Kit <- labeler(
#   data = clean_data.tool8$Student_Kit, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8$V_list_of_all_members <- labeler(
#   data = clean_data.tool8$V_list_of_all_members, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8$Subjects_Added <- labeler(
#   data = clean_data.tool8$Subjects_Added, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool8$Relevant_photos <- labeler(
#   data = clean_data.tool8$Relevant_photos, 
#   tool = tool8_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# # Tool 9 ------------------------------------------------------------------
# clean_data.tool9$data <- labeler(
#   data = clean_data.tool9$data, 
#   tool = tool9_path,
#   survey_label = "label",
#   choice_lable = "label")
# 
# clean_data.tool9$Relevant_photos <- labeler(
#   data = clean_data.tool9$Relevant_photos, 
#   tool = tool9_path,
#   survey_label = "label",
#   choice_lable = "label")

# remove extra objects from environment  
rm(
   tool1_path, 
   tool2_path,
   tool3_path,
   tool4_path,
   tool5_path,
   tool6_path,
   tool7_path,
   handle_labeler)
