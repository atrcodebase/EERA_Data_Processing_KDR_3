# Tool 1 ----------------------------------------------------------------------
clean_data.tool1$data <- update_series_cols(
  data = clean_data.tool1$data, 
  tool = kobo_tool.tool1$survey, 
  question_separator = "_")

clean_data.tool1$Support_Respondents <- update_series_cols(
  data = clean_data.tool1$Support_Respondents, 
  tool = kobo_tool.tool1$survey, 
  question_separator = "_")

clean_data.tool1$School_Operationality <- update_series_cols(
  data = clean_data.tool1$School_Operationality,
  tool = kobo_tool.tool1$survey, 
  question_separator = "_")

clean_data.tool1$Shifts_Detail <- update_series_cols(
  data = clean_data.tool1$Shifts_Detail,
  tool = kobo_tool.tool1$survey, 
  question_separator = "_")

clean_data.tool1$Headmasters <- update_series_cols(
  data = clean_data.tool1$Headmasters,
  tool = kobo_tool.tool1$survey, 
  question_separator = "_")

clean_data.tool1$Weekly_Class_Schedule <- update_series_cols(
  data = clean_data.tool1$Weekly_Class_Schedule,
  tool = kobo_tool.tool1$survey, 
  question_separator = "_")

clean_data.tool1$Weekly_Class_Schedule_New <- update_series_cols(
  data = clean_data.tool1$Weekly_Class_Schedule_New,
  tool = kobo_tool.tool1$survey, 
  question_separator = "_")

clean_data.tool1$Subjects_Detail <- update_series_cols(
  data = clean_data.tool1$Subjects_Detail,
  tool = kobo_tool.tool1$survey, 
  question_separator = "_")

clean_data.tool1$Education_Quality <- update_series_cols(
  data = clean_data.tool1$Education_Quality,
  tool = kobo_tool.tool1$survey, 
  question_separator = "_")


# Tool 2 ----------------------------------------------------------------------
clean_data.tool2$data <- update_series_cols(
  data = clean_data.tool2$data, 
  tool = kobo_tool.tool2$survey, 
  question_separator = "_")

clean_data.tool2$Support_Respondents <- update_series_cols(
  data = clean_data.tool2$Support_Respondents, 
  tool = kobo_tool.tool2$survey, 
  question_separator = "_")

clean_data.tool2$School_Operationality <- update_series_cols(
  data = clean_data.tool2$School_Operationality, 
  tool = kobo_tool.tool2$survey, 
  question_separator = "_")

clean_data.tool2$Shifts_Detail <- update_series_cols(
  data = clean_data.tool2$Shifts_Detail, 
  tool = kobo_tool.tool2$survey, 
  question_separator = "_")

clean_data.tool2$Headmasters <- update_series_cols(
  data = clean_data.tool2$Headmasters, 
  tool = kobo_tool.tool2$survey, 
  question_separator = "_")

clean_data.tool2$Public_Stationary_Kit_Group <- update_series_cols(
  data = clean_data.tool2$Public_Stationary_Kit_Group, 
  tool = kobo_tool.tool2$survey, 
  question_separator = "_")

clean_data.tool2$Teachers_Pack_Group <- update_series_cols(
  data = clean_data.tool2$Teachers_Pack_Group, 
  tool = kobo_tool.tool2$survey, 
  question_separator = "_")

clean_data.tool2$Students_Pack_Group <- update_series_cols(
  data = clean_data.tool2$Students_Pack_Group, 
  tool = kobo_tool.tool2$survey, 
  question_separator = "_")


# Tool 3 ----------------------------------------------------------------------
clean_data.tool3[] <- lapply(clean_data.tool3, \(xdf) update_series_cols(data = xdf, tool = kobo_tool.tool3$survey, question_separator = "_"))

# clean_data.tool3$data <- update_series_cols(data = clean_data.tool3$data, 
#                                             tool = kobo_tool.tool3$survey, 
#                                             question_separator = "_")
# 
# 
# clean_data.tool3$Support_Respondents <- update_series_cols(data = clean_data.tool3$Support_Respondents, 
#                                             tool = kobo_tool.tool3$survey, 
#                                             question_separator = "_")
# 
# clean_data.tool3$Grade_Details <- update_series_cols(data = clean_data.tool3$Grade_Details, 
#                                             tool = kobo_tool.tool3$survey, 
#                                             question_separator = "_")
# 
# clean_data.tool3$Todays_Attendance_Detail <- update_series_cols(data = clean_data.tool3$Todays_Attendance_Detail, 
#                                                      tool = kobo_tool.tool3$survey, 
#                                                      question_separator = "_")
# 
# clean_data.tool3$LastWeek_Attendance_Detail <- update_series_cols(data = clean_data.tool3$LastWeek_Attendance_Detail, 
#                                                                 tool = kobo_tool.tool3$survey, 
#                                                                 question_separator = "_")
# 
# clean_data.tool3$Student_Headcount <- update_series_cols(data = clean_data.tool3$Student_Headcount, 
#                                                                   tool = kobo_tool.tool3$survey, 
#                                                                   question_separator = "_")
# 
# clean_data.tool3$Tool3_Grades_Repeat <- update_series_cols(data = clean_data.tool3$Tool3_Grades_Repeat, 
#                                                          tool = kobo_tool.tool3$survey, 
#                                                          question_separator = "_")

# Tool 4 ---------------------------------------------------------------------- 
clean_data.tool4[] <- lapply(clean_data.tool4, \(xdf) update_series_cols(xdf, kobo_tool.tool4$survey, "_"))

# clean_data.tool4$data <- update_series_cols(data = clean_data.tool4$data,
#                                             tool = kobo_tool.tool4$survey,
#                                             question_separator = "_")
# 
# clean_data.tool4$Additional_Subjects <- update_series_cols(data = clean_data.tool4$Additional_Subjects,
#                                             tool = kobo_tool.tool4$survey,
#                                             question_separator = "_")
# 
# clean_data.tool4$Subjects_taught_by_this_teacher <- update_series_cols(data = clean_data.tool4$Subjects_taught_by_this_teacher,
#                                                            tool = kobo_tool.tool4$survey,
#                                                            question_separator = "_")
# 
# clean_data.tool4$Subjects_Not_Being_Taught <- update_series_cols(data = clean_data.tool4$Subjects_Not_Being_Taught, 
#                                                                  tool = kobo_tool.tool4$survey, 
#                                                                  question_separator = "_")


# Tool 5 ----------------------------------------------------------------------
clean_data.tool5[] <- lapply(clean_data.tool5, \(xdf) update_series_cols(xdf, kobo_tool.tool5$survey, "_"))

# clean_data.tool5$data <- update_series_cols(data = clean_data.tool5$data, 
#                                             tool = kobo_tool.tool5$survey, 
#                                             question_separator = "_")
# 
# clean_data.tool5$Under_Construction_Toilets <- update_series_cols(data = clean_data.tool5$Under_Construction_Toilets, 
#                                             tool = kobo_tool.tool5$survey, 
#                                             question_separator = "_")
# 
# clean_data.tool5$Useable_Toilets <- update_series_cols(data = clean_data.tool5$Useable_Toilets, 
#                                             tool = kobo_tool.tool5$survey, 
#                                             question_separator = "_")
# 
# clean_data.tool5$Non_Useable_Toilets <- update_series_cols(data = clean_data.tool5$Non_Useable_Toilets, 
#                                             tool = kobo_tool.tool5$survey, 
#                                             question_separator = "_")


# Tool 6 ----------------------------------------------------------------------
clean_data.tool6[] <- lapply(clean_data.tool6, \(xdf) update_series_cols(xdf, kobo_tool.tool6$survey, "_"))
# clean_data.tool6$data <- update_series_cols(data = clean_data.tool6$data, 
#                                             tool = kobo_tool.tool6$survey, 
#                                             question_separator = "_")
# 
# clean_data.tool6$Subjects_Added <- update_series_cols(data = clean_data.tool6$Subjects_Added, 
#                                             tool = kobo_tool.tool6$survey, 
#                                             question_separator = "_")



# Tool 7 ----------------------------------------------------------------------
clean_data.tool7[] <- lapply(clean_data.tool7, \(xdf) update_series_cols(xdf, kobo_tool.tool7$survey, "_"))
# 
# clean_data.tool7$data <- update_series_cols(data = clean_data.tool7$data, 
#                                             tool = kobo_tool.tool7$survey, 
#                                             question_separator = "_")
# 
# clean_data.tool7$C6_list_members <- update_series_cols(data = clean_data.tool7$C6_list_members, 
#                                             tool = kobo_tool.tool7$survey, 
#                                             question_separator = "_")
# 
# clean_data.tool7$Subjects_Added <- update_series_cols(data = clean_data.tool7$Subjects_Added, 
#                                                        tool = kobo_tool.tool7$survey, 
#                                                        question_separator = "_")


# removing extra elements from the environment
rm(list = c(objects(pattern = ".sm_vars$")))



