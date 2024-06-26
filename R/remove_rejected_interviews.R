# removing deleted and pilot interviews -----------------------------------

# Tool 1 - Headmaster
clean_data.tool1$data <- clean_data.tool1$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps & as.Date(starttime) < as.Date(data_collection_end_date))
clean_data.tool1$Support_Respondents <- clean_data.tool1$Support_Respondents %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$School_Operationality <- clean_data.tool1$School_Operationality %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Shifts_Detail <- clean_data.tool1$Shifts_Detail %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Headmasters <- clean_data.tool1$Headmasters %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Weekly_Class_Schedule <- clean_data.tool1$Weekly_Class_Schedule %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Weekly_Class_Schedule_New <- clean_data.tool1$Weekly_Class_Schedule_New %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Subjects_Detail <- clean_data.tool1$Subjects_Detail %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Education_Quality <- clean_data.tool1$Education_Quality %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Relevant_photos <- clean_data.tool1$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)

# Tool 2 - Light
clean_data.tool2$data <- clean_data.tool2$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps & as.Date(starttime) < as.Date(data_collection_end_date))
clean_data.tool2$Support_Respondents <- clean_data.tool2$Support_Respondents %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2$School_Operationality <- clean_data.tool2$School_Operationality %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2$Shifts_Detail <- clean_data.tool2$Shifts_Detail %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2$Headmasters <- clean_data.tool2$Headmasters %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2$Attendance_Sheet_Photos <- clean_data.tool2$Attendance_Sheet_Photos %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2$Public_Stationary_Kit_Group <- clean_data.tool2$Public_Stationary_Kit_Group %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2$Teachers_Pack_Group <- clean_data.tool2$Teachers_Pack_Group %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2$Students_Pack_Group <- clean_data.tool2$Students_Pack_Group %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2$Relevant_photos <- clean_data.tool2$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 3 - Headcount
clean_data.tool3$data <- clean_data.tool3$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps & as.Date(starttime) < as.Date(data_collection_end_date))
clean_data.tool3$Support_Respondents <- clean_data.tool3$Support_Respondents %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3$Grade_Details <- clean_data.tool3$Grade_Details %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3$Todays_Attendance_Detail <- clean_data.tool3$Todays_Attendance_Detail %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3$Student_Headcount <- clean_data.tool3$Student_Headcount %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3$Tool3_Grades_Repeat <- clean_data.tool3$Tool3_Grades_Repeat %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3$Relevant_photos <- clean_data.tool3$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 4 - Teacher
clean_data.tool4$data <- clean_data.tool4$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps & as.Date(starttime) < as.Date(data_collection_end_date))
clean_data.tool4$Additional_Subjects <- clean_data.tool4$Additional_Subjects %>% filter(PARENT_KEY %in% clean_data.tool4$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool4$Subjects_taught_by_this_teacher <- clean_data.tool4$Subjects_taught_by_this_teacher %>% filter(PARENT_KEY %in% clean_data.tool4$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool4$Subjects_Not_Being_Taught <- clean_data.tool4$Subjects_Not_Being_Taught %>% filter(PARENT_KEY %in% clean_data.tool4$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool4$Relevant_photos <- clean_data.tool4$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool4$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 5 - WASH
clean_data.tool5$data <- clean_data.tool5$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps & as.Date(starttime) < as.Date(data_collection_end_date))
clean_data.tool5$Under_Construction_Toilets <- clean_data.tool5$Under_Construction_Toilets %>% filter(PARENT_KEY %in% clean_data.tool5$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool5$Useable_Toilets <- clean_data.tool5$Useable_Toilets %>% filter(PARENT_KEY %in% clean_data.tool5$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool5$Non_Useable_Toilets <- clean_data.tool5$Non_Useable_Toilets %>% filter(PARENT_KEY %in% clean_data.tool5$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool5$Relevant_photos <- clean_data.tool5$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool5$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 6 - Parent
clean_data.tool6$data <- clean_data.tool6$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps & as.Date(starttime) < as.Date(data_collection_end_date))
clean_data.tool6$Subjects_Added <- clean_data.tool6$Subjects_Added %>% filter(PARENT_KEY %in% clean_data.tool6$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool6$Relevant_photos <- clean_data.tool6$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool6$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 7 - SHURA
clean_data.tool7$data <- clean_data.tool7$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps & as.Date(starttime) < as.Date(data_collection_end_date))
clean_data.tool7$Subjects_Added <- clean_data.tool7$Subjects_Added %>% filter(PARENT_KEY %in% clean_data.tool7$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool7$Relevant_photos <- clean_data.tool7$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool7$data$KEY & !KEY %in% deleted_keys_ps)

