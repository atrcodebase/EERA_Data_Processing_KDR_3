options(scipen = 999)

sm_variables <- bind_rows(
  # kobo_tool.tool0$survey |> filter(grepl("select_multiple", type)) |> select(name),
  kobo_tool.tool1$survey |> filter(grepl("select_multiple", type)) |> select(name),
  kobo_tool.tool2$survey |> filter(grepl("select_multiple", type)) |> select(name),
  kobo_tool.tool3$survey |> filter(grepl("select_multiple", type)) |> select(name),
  kobo_tool.tool4$survey |> filter(grepl("select_multiple", type)) |> select(name),
  kobo_tool.tool5$survey |> filter(grepl("select_multiple", type)) |> select(name),
  kobo_tool.tool6$survey |> filter(grepl("select_multiple", type)) |> select(name),
  kobo_tool.tool7$survey |> filter(grepl("select_multiple", type)) |> select(name),
  # kobo_tool.tool8$survey |> filter(grepl("select_multiple", type)) |> select(name),
  # kobo_tool.tool9$survey |> filter(grepl("select_multiple", type)) |> select(name)
) |> pull(name)


check_logs_for_df <- function(cleaning_log, df, tool_name, deleted_keys) {
  # Log issues in all the sheets
  for(sheet in names(df)){
    question_names <- names(df[[sheet]]) # All Columns
    keys <- df[[sheet]][["KEY"]] # Keys
    
    # Flag if question or key is not in dataset
    tool_sheet_indexes <- (cleaning_log$tool %in% tool_name & cleaning_log$Tab_Name %in% sheet) # Logs for the current tool and sheet
    cleaning_log$issue[tool_sheet_indexes & cleaning_log$question %notin% question_names] <- "Question can't be found in the given sheet"
    cleaning_log$issue[tool_sheet_indexes & cleaning_log$KEY %notin% keys] <- "KEY can't be found in the given sheet"
  }
  return(cleaning_log)
}

# form names
# form_names <- c()
form_names <- unique(correction_log$tool) |> na.omit()
form_names

# Reviewing the correction log ------------------------------------------------- Public School
# Identify correction log's issue
correction_log_issues <- correction_log |>
  # Remove the filter for the last runs
  # filter(!is.na(KEY) & !is.na(question)) |>
  mutate(
    issue = case_when(
      # general checks
      is.na(KEY) | KEY == "" ~ "KEY can't be null, please provide the correct KEY.",
      is.na(question) | question == "" ~ "Question name can't be null, please provide the correct question name.",
      is.na(tool) | tool == "" ~ "Tool name can't be null, please provide the correct tool name.",
      is.na(Tab_Name) | Tab_Name == "" ~ "Tab/Sheet name can't be null, please provide the correct Tab name.",
      !tool %in% form_names ~ "Wrong tool name, please provide the correct tool name.", # Not necessary
      tool == "Tool 1 - Headmaster" & !Tab_Name %in% names(raw_data.tool1) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 2 - Light" & !Tab_Name %in% names(raw_data.tool2) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 3 - Headcount" & !Tab_Name %in% names(raw_data.tool3) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 4 - Teacher" & !Tab_Name %in% names(raw_data.tool4) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 5 - WASH" & !Tab_Name %in% names(raw_data.tool5) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 6 - Parent" & !Tab_Name %in% names(raw_data.tool6) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 7 - Shura" & !Tab_Name %in% names(raw_data.tool7) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      # tool == "Tool 0 - Data Entry" & !Tab_Name %in% names(raw_data.tool0) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      duplicated(paste0(KEY, question), fromLast = T) | duplicated(paste0(KEY, question), fromLast = F) ~ "Duplicate log records, please solve the duplication.",
      TRUE ~ NA_character_
    ),
    new_value = case_when(
      question %in% sm_variables ~ str_replace_all(new_value, "-|,|  | - ", " ") %>% str_squish(), # Unify the separator in SM questions
      TRUE ~ str_squish(new_value)
    ),
    # Sample_Type = "Public School"
  ) |> 
  select(KEY, question, old_value, new_value, issue, tool, Tab_Name, Sample_Type)

# Log incorrect sheet name and UUIDs
# correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool0, tool_name = "Tool 0 - Data Entry", deleted_keys = deleted_keys_ps)
correction_log_issues <- correction_log_issues |> check_logs_for_df(df = raw_data.tool1, tool_name = "Tool 1 - Headmaster", deleted_keys = deleted_keys_ps)
correction_log_issues <- correction_log_issues |> check_logs_for_df(df = raw_data.tool2, tool_name = "Tool 2 - Light", deleted_keys = deleted_keys_ps)
correction_log_issues <- correction_log_issues |> check_logs_for_df(df = raw_data.tool3, tool_name = "Tool 3 - Headcount", deleted_keys = deleted_keys_ps)
correction_log_issues <- correction_log_issues |> check_logs_for_df(df = raw_data.tool4, tool_name = "Tool 4 - Teacher", deleted_keys = deleted_keys_ps)
correction_log_issues <- correction_log_issues |> check_logs_for_df(df = raw_data.tool5, tool_name = "Tool 5 - WASH", deleted_keys = deleted_keys_ps)
correction_log_issues <- correction_log_issues |> check_logs_for_df(df = raw_data.tool6, tool_name = "Tool 6 - Parent", deleted_keys = c(deleted_keys_ps, deleted_keys_cbe))
correction_log_issues <- correction_log_issues |> check_logs_for_df(df = raw_data.tool7, tool_name = "Tool 7 - Shura", deleted_keys = c(deleted_keys_ps, deleted_keys_cbe))

## Correction Log ready to apply
correction_log_ready <- correction_log_issues |>
  filter(is.na(issue))

## Correction Log issues
correction_log_issues <- correction_log_issues |>
  filter(!is.na(issue)) |>
  arrange(KEY, question)


# splitting the correction log file into public and CBE
correction_log_ready_ps <- correction_log_ready |> filter(Sample_Type == "Public School")
correction_log_ready_cbe <- correction_log_ready |> filter(Sample_Type == "CBE")

correction_log_issues_ps <- correction_log_issues |> filter(Sample_Type == "Public School")
correction_log_issues_cbe <- correction_log_issues |> filter(Sample_Type == "CBE")

# Clone Sheets for log apply verification -------------------------------------
# clean_data.tool0 <- raw_data.tool0
clean_data.tool1 <- raw_data.tool1
clean_data.tool2 <- raw_data.tool2
clean_data.tool3 <- raw_data.tool3
clean_data.tool4 <- raw_data.tool4
clean_data.tool5 <- raw_data.tool5
clean_data.tool6 <- raw_data.tool6
clean_data.tool7 <- raw_data.tool7
# clean_data.tool8 <- raw_data.tool8
# clean_data.tool9 <- raw_data.tool9

# Apply logs -------------------------------------------------------------------
# Tool 0
# for(sheet in names(clean_data.tool0)){
#   # Apply Log
#   clean_data.tool0[[sheet]] <- apply_log(data=clean_data.tool0[[sheet]], log = filter(correction_log_ready_ps, tool == "Tool - Data Entry" & Tab_Name == sheet))
# }


handle_apply_log = function(df_list, log_df, tool_name){
  for (sheet in names(df_list)) {
    log_df_temp = log_df[log_df$tool == tool_name & log_df$Tab_Name == sheet, ]
    df_list[[sheet]] <- apply_log(df_list[[sheet]], log_df_temp)
  }
  
  return(df_list)
}

# Tool 1
tool_name <- "Tool 1 - Headmaster"
if (any(correction_log_ready_ps$tool == tool_name)) {

  clean_data.tool1 <- handle_apply_log(clean_data.tool1, correction_log_ready_ps, tool_name)
  
  # clean_data.tool1$data <- raw_data.tool1$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  # clean_data.tool1$Support_Respondents <- raw_data.tool1$Support_Respondents |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Support_Respondents"))
  # clean_data.tool1$School_Operationality <- raw_data.tool1$School_Operationality |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "School_Operationality"))
  # clean_data.tool1$School_Operationality_Other_... <- raw_data.tool1$School_Operationality_Other_... |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "School_Operationality_Other_..."))
  # clean_data.tool1$Shifts_Detail <- raw_data.tool1$Shifts_Detail |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Shifts_Detail"))
  # clean_data.tool1$Other_Shifts_Detail <- raw_data.tool1$Other_Shifts_Detail |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Other_Shifts_Detail")) 
  # clean_data.tool1$Headmasters <- raw_data.tool1$Headmasters |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Headmasters"))
  # clean_data.tool1$Weekly_Schedule_Old <- raw_data.tool1$Weekly_Schedule_Old |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Weekly_Schedule_Old"))
  # clean_data.tool1$Weekly_Schedule_New <- raw_data.tool1$Weekly_Schedule_New |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Weekly_Schedule_New")) 
  # clean_data.tool1$Subjects_Detail <- raw_data.tool1$Subjects_Detail |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_Detail"))
  # clean_data.tool1$Additional_Subjects <- raw_data.tool1$Additional_Subjects |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Additional_Subjects"))
  # clean_data.tool1$Education_Quality <- raw_data.tool1$Education_Quality |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Education_Quality"))
  # clean_data.tool1$Relevant_photos <- raw_data.tool1$Relevant_photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
}

# Tool 2
tool_name <- "Tool 2 - Light"
if (any(correction_log_ready_ps$tool == tool_name)) {
  clean_data.tool2 <- handle_apply_log(clean_data.tool2, correction_log_ready_ps, tool_name)
  
  # clean_data.tool2$data <- raw_data.tool2$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  # clean_data.tool2$Support_Respondents <- raw_data.tool2$Support_Respondents |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Support_Respondents"))
  # clean_data.tool2$Attendance_Sheet_Photos <- raw_data.tool2$Attendance_Sheet_Photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Attendance_Sheet_Photos"))
  # clean_data.tool2$Public_Stationary_Kit_Group <- raw_data.tool2$Public_Stationary_Kit_Group |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Public_Stationary_Kit_Group"))
  # clean_data.tool2$Teachers_Pack_Group <- raw_data.tool2$Teachers_Pack_Group |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Teachers_Pack_Group"))
  # clean_data.tool2$Students_Pack_Group <- raw_data.tool2$Students_Pack_Group |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Students_Pack_Group"))
  # clean_data.tool2$Relevant_photos <- raw_data.tool2$Relevant_photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
}

# Tool 3
tool_name <- "Tool 3 - Headcount"
if (any(correction_log_ready_ps$tool == tool_name)) {
  clean_data.tool3 <- handle_apply_log(clean_data.tool3, correction_log_ready_ps, tool_name)
  
  # clean_data.tool3$data <- raw_data.tool3$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  # clean_data.tool3$Support_Respondents <- raw_data.tool3$Support_Respondents |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Support_Respondents"))
  # clean_data.tool3$Grade_Details <- raw_data.tool3$Grade_Details |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Grade_Details"))
  # clean_data.tool3$Todays_Attendance_Detail <- raw_data.tool3$Todays_Attendance_Detail |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Todays_Attendance_Detail"))
  # clean_data.tool3$LastWeek_Attendance_Detail <- raw_data.tool3$LastWeek_Attendance_Detail |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "LastWeek_Attendance_Detail"))
  # clean_data.tool3$Student_Headcount <- raw_data.tool3$Student_Headcount |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Student_Headcount"))
  # clean_data.tool3$Tool3_Grades_Repeat <- raw_data.tool3$Tool3_Grades_Repeat |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Tool3_Grades_Repeat"))
  # clean_data.tool3$Relevant_photos <- raw_data.tool3$Relevant_photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
}

# Tool 4
tool_name <- "Tool 4 - Teacher"
if (any(correction_log_ready_ps$tool == tool_name)) {
  clean_data.tool4 <- handle_apply_log(clean_data.tool4, correction_log_ready_ps, tool_name)

  # clean_data.tool4$data <- raw_data.tool4$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  # clean_data.tool4$Additional_Subjects <- raw_data.tool4$Additional_Subjects |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Additional_Subjects"))
  # clean_data.tool4$Subjects_taught_by_this_teacher <- raw_data.tool4$Subjects_taught_by_this_teacher |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_taught_by_this_teacher"))
  # clean_data.tool4$Subjects_Not_Being_Taught <- raw_data.tool4$Subjects_Not_Being_Taught |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_Not_Being_Taught"))
  # clean_data.tool4$Relevant_photos <- raw_data.tool4$Relevant_photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
}

# Tool 5
tool_name <- "Tool 5 - WASH"
if (any(correction_log_ready_ps$tool == tool_name)) {
  clean_data.tool5 <- handle_apply_log(clean_data.tool5, correction_log_ready_ps, tool_name)

#   clean_data.tool5$data <- raw_data.tool5$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
#   clean_data.tool5$Under_Construction_Toilets <- raw_data.tool5$Under_Construction_Toilets |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Under_Construction_Toilets"))
#   clean_data.tool5$Useable_Toilets <- raw_data.tool5$Useable_Toilets |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Useable_Toilets"))
#   clean_data.tool5$Non_Useable_Toilets <- raw_data.tool5$Non_Useable_Toilets |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Non_Useable_Toilets"))
#   clean_data.tool5$Relevant_photos <- raw_data.tool5$Relevant_photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
}

# Tool 6
tool_name <- "Tool 6 - Parent"
if (any(correction_log_ready_ps$tool == tool_name)) {
  clean_data.tool6 <- handle_apply_log(clean_data.tool6, correction_log_ready_ps, tool_name)
  
  # clean_data.tool6$data <- raw_data.tool6$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  # clean_data.tool6$Subjects_Added <- raw_data.tool6$Subjects_Added |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))
}

if (any(correction_log_ready_cbe$tool == tool_name)) {
  clean_data.tool6 <- handle_apply_log(clean_data.tool6, correction_log_ready_cbe, tool_name)
  
  # clean_data.tool6$data <- clean_data.tool6$data |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "data"))
  # clean_data.tool6$Subjects_Added <- clean_data.tool6$Subjects_Added |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))
}

# Tool 7
tool_name <- "Tool 7 - Shura"
if (any(correction_log_ready_ps$tool == tool_name)) {
  clean_data.tool7 <- handle_apply_log(clean_data.tool7, correction_log_ready_ps, tool_name)
  
  # clean_data.tool7$data <- raw_data.tool7$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  # clean_data.tool7$C6_list_members <- raw_data.tool7$C6_list_members |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "C6_list_members"))
  # clean_data.tool7$Subjects_Added <- raw_data.tool7$Subjects_Added |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))
}

if (any(correction_log_ready_cbe$tool == tool_name)) {
  clean_data.tool7 <- handle_apply_log(clean_data.tool7, correction_log_ready_cbe, tool_name)
  
  # clean_data.tool7$data <- clean_data.tool7$data |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "data"))
  # clean_data.tool7$C6_list_members <- clean_data.tool7$C6_list_members |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "C6_list_members"))
  # clean_data.tool7$Subjects_Added <- clean_data.tool7$Subjects_Added |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))
}


# Correction Log apply check --------------------------------------------------
message("Verifying Correction log, please wait!")

clean_df_list = clean_data.tool7
raw_df_list = raw_data.tool7
sheet = names(clean_df_list)[2]


handle_compare_dt = function(clean_df_list, raw_df_list, tool_name){
  result_df <- data.frame()
  for (sheet in names(clean_df_list)) {
    result_df <- rbind(
      result_df,
      compare_dt(clean_df_list[[sheet]], raw_df_list[[sheet]], unique_id_df1 = "KEY", unique_id_df2 = "KEY") |>
        mutate(tool = tool_name, Tab_Name = sheet)
    )
  }
  
  return(result_df)
}

# Update the compare_df function in atrFunctions
correction_log_discrep <- rbind(
  # Tool 1
  handle_compare_dt(clean_data.tool1, raw_data.tool1, "Tool 1 - Headmaster"),
  
  # compare_dt(clean_data.tool1$data, raw_data.tool1$data, unique_id_df1 = "KEY", unique_id_df2 = "KEY") |>
  #   mutate(tool = "Tool 1 - Headmaster", Tab_Name = "data"),
  # 
  # compare_dt(clean_data.tool1$Support_Respondents, raw_data.tool1$Support_Respondents) |>
  #   mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Support_Respondents"),
  # 
  # compare_dt(clean_data.tool1$School_Operationality, raw_data.tool1$School_Operationality) |>
  #   mutate(tool = "Tool 1 - Headmaster", Tab_Name = "School_Operationality"),
  # 
  # compare_dt(clean_data.tool1$School_Operationality_Other_..., raw_data.tool1$School_Operationality_Other_...) |>
  #   mutate(tool = "Tool 1 - Headmaster", Tab_Name = "School_Operationality_Other_..."),
  # 
  # compare_dt(clean_data.tool1$Shifts_Detail, raw_data.tool1$Shifts_Detail) |>
  #   mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Shifts_Detail"),
  # 
  # compare_dt(clean_data.tool1$Other_Shifts_Detail, raw_data.tool1$Other_Shifts_Detail) |>
  #   mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Other_Shifts_Detail"),
  # 
  # compare_dt(clean_data.tool1$Headmasters, raw_data.tool1$Headmasters) |>
  #   mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Headmasters"),
  # 
  # compare_dt(clean_data.tool1$Weekly_Schedule_Old, raw_data.tool1$Weekly_Schedule_Old) |>
  #   mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Weekly_Schedule_Old"),
  # 
  # compare_dt(clean_data.tool1$Weekly_Schedule_New, raw_data.tool1$Weekly_Schedule_New) |>
  #   mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Weekly_Schedule_New"),
  # 
  # compare_dt(clean_data.tool1$Subjects_Detail, raw_data.tool1$Subjects_Detail) |>
  #   mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Subjects_Detail"),
  # 
  # compare_dt(clean_data.tool1$Additional_Subjects, raw_data.tool1$Additional_Subjects) |>
  #   mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Additional_Subjects"),
  # 
  # compare_dt(clean_data.tool1$Education_Quality, raw_data.tool1$Education_Quality) |>
  #   mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Education_Quality"),
  # 
  # compare_dt(clean_data.tool1$Relevant_photos, raw_data.tool1$Relevant_photos) |>
  #   mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Relevant_photos"),

  
  # Tool 2
  handle_compare_dt(clean_data.tool2, raw_data.tool2, "Tool 2 - Light"),
  
  # compare_dt(clean_data.tool2$data, raw_data.tool2$data) |>
  #   mutate(tool = "Tool 2 - Light", Tab_Name = "data"),
  # 
  # compare_dt(clean_data.tool2$Support_Respondents, raw_data.tool2$Support_Respondents) |>
  #   mutate(tool = "Tool 2 - Light", Tab_Name = "Support_Respondents"),
  # 
  # compare_dt(clean_data.tool2$Attendance_Sheet_Photos, raw_data.tool2$Attendance_Sheet_Photos) |>
  #   mutate(tool = "Tool 2 - Light", Tab_Name = "Attendance_Sheet_Photos"),
  # 
  # compare_dt(clean_data.tool2$Public_Stationary_Kit_Group, raw_data.tool2$Public_Stationary_Kit_Group) |>
  #   mutate(tool = "Tool 2 - Light", Tab_Name = "Public_Stationary_Kit_Group"),
  # 
  # compare_dt(clean_data.tool2$Teachers_Pack_Group, raw_data.tool2$Teachers_Pack_Group) |>
  #   mutate(tool = "Tool 2 - Light", Tab_Name = "Teachers_Pack_Group"),
  # 
  # compare_dt(clean_data.tool2$Students_Pack_Group, raw_data.tool2$Students_Pack_Group) |>
  #   mutate(tool = "Tool 2 - Light", Tab_Name = "Students_Pack_Group"),
  # 
  # compare_dt(clean_data.tool2$Relevant_photos, raw_data.tool2$Relevant_photos) |>
  #   mutate(tool = "Tool 2 - Light", Tab_Name = "Relevant_photos"),
  
  
  # Tool 3
  handle_compare_dt(clean_data.tool3, raw_data.tool3, "Tool 3 - Headcount"),
  
  # compare_dt(clean_data.tool3$data, raw_data.tool3$data) |>
  #   mutate(tool = "Tool 3 - Headcount", Tab_Name = "data"),
  # 
  # compare_dt(clean_data.tool3$Support_Respondents, raw_data.tool3$Support_Respondents) |>
  #   mutate(tool = "Tool 3 - Headcount", Tab_Name = "Support_Respondents"),
  # 
  # compare_dt(clean_data.tool3$Grade_Details, raw_data.tool3$Grade_Details) |>
  #   mutate(tool = "Tool 3 - Headcount", Tab_Name = "Grade_Details"),
  # 
  # compare_dt(clean_data.tool3$Todays_Attendance_Detail, raw_data.tool3$Todays_Attendance_Detail) |>
  #   mutate(tool = "Tool 3 - Headcount", Tab_Name = "Todays_Attendance_Detail"),
  # 
  # compare_dt(clean_data.tool3$LastWeek_Attendance_Detail, raw_data.tool3$LastWeek_Attendance_Detail) |>
  #   mutate(tool = "Tool 3 - Headcount", Tab_Name = "LastWeek_Attendance_Detail"),
  # 
  # compare_dt(clean_data.tool3$Student_Headcount, raw_data.tool3$Student_Headcount) |>
  #   mutate(tool = "Tool 3 - Headcount", Tab_Name = "Student_Headcount"),
  # 
  # compare_dt(clean_data.tool3$Tool3_Grades_Repeat, raw_data.tool3$Tool3_Grades_Repeat) |>
  #   mutate(tool = "Tool 3 - Headcount", Tab_Name = "Tool3_Grades_Repeat"),
  # 
  # compare_dt(clean_data.tool3$Relevant_photos, raw_data.tool3$Relevant_photos) |>
  #   mutate(tool = "Tool 3 - Headcount", Tab_Name = "Relevant_photos"),
  
  
  # Tool 4
  handle_compare_dt(clean_data.tool4, raw_data.tool4, "Tool 4 - Teacher"),
  
  # compare_dt(clean_data.tool4$data, raw_data.tool4$data) |>
  #   mutate(tool = "Tool 4 - Teacher", Tab_Name = "data"),
  # 
  # compare_dt(clean_data.tool4$Additional_Subjects, raw_data.tool4$Additional_Subjects) |>
  #   mutate(tool = "Tool 4 - Teacher", Tab_Name = "Additional_Subjects"),
  # 
  # compare_dt(clean_data.tool4$Subjects_taught_by_this_teacher, raw_data.tool4$Subjects_taught_by_this_teacher) |>
  #   mutate(tool = "Tool 4 - Teacher", Tab_Name = "Subjects_taught_by_this_teacher"),
  # 
  # compare_dt(clean_data.tool4$Subjects_Not_Being_Taught, raw_data.tool4$Subjects_Not_Being_Taught) |>
  #   mutate(tool = "Tool 4 - Teacher", Tab_Name = "Subjects_Not_Being_Taught"),
  # 
  # compare_dt(clean_data.tool4$Relevant_photos, raw_data.tool4$Relevant_photos) |>
  #   mutate(tool = "Tool 4 - Teacher", Tab_Name = "Relevant_photos"),
  
  # Tool 5
  handle_compare_dt(clean_data.tool5, raw_data.tool5, "Tool 5 - WASH"),
  
  # compare_dt(clean_data.tool5$data, raw_data.tool5$data) |>
  #   mutate(tool = "Tool 5 - WASH", Tab_Name = "data"),
  # 
  # compare_dt(clean_data.tool5$Under_Construction_Toilets, raw_data.tool5$Under_Construction_Toilets) |>
  #   mutate(tool = "Tool 5 - WASH", Tab_Name = "Under_Construction_Toilets"),
  # 
  # compare_dt(clean_data.tool5$Useable_Toilets, raw_data.tool5$Useable_Toilets) |>
  #   mutate(tool = "Tool 5 - WASH", Tab_Name = "Useable_Toilets"),
  # 
  # compare_dt(clean_data.tool5$Non_Useable_Toilets, raw_data.tool5$Non_Useable_Toilets) |>
  #   mutate(tool = "Tool 5 - WASH", Tab_Name = "Non_Useable_Toilets"),
  # 
  # compare_dt(clean_data.tool5$Relevant_photos, raw_data.tool5$Relevant_photos) |>
  #   mutate(tool = "Tool 5 - WASH", Tab_Name = "Relevant_photos"),
  
  # Tool 6
  handle_compare_dt(clean_data.tool6, raw_data.tool6, "Tool 6 - Parent"),
  
  # compare_dt(clean_data.tool6$data, raw_data.tool6$data) |>
  #   mutate(tool = "Tool 6 - Parent", Tab_Name = "data"),
  # 
  # compare_dt(clean_data.tool6$Subjects_Added, raw_data.tool6$Subjects_Added) |>
  #   mutate(tool = "Tool 6 - Parent", Tab_Name = "Subjects_Added"),
  
  # Tool 7
  handle_compare_dt(clean_data.tool7, raw_data.tool7, "Tool 7 - Shura")
  
  # compare_dt(clean_data.tool7$data, raw_data.tool7$data) |>
  #   mutate(tool = "Tool 7 - Shura", Tab_Name = "data"),
  # 
  # compare_dt(clean_data.tool7$C6_list_members, raw_data.tool7$C6_list_members) |>
  #   mutate(tool = "Tool 7 - Shura", Tab_Name = "C6_list_members"),
  # 
  # compare_dt(clean_data.tool7$Subjects_Added, raw_data.tool7$Subjects_Added) |>
  #   mutate(tool = "Tool 7 - Shura", Tab_Name = "Subjects_Added"),
  
  # Tool 8
  # compare_dt(clean_data.tool8$data, raw_data.tool8$data) |>
  #   mutate(tool = "Tool 8 - Class", Tab_Name = "data"),
  # 
  # compare_dt(clean_data.tool8$Classes, raw_data.tool8$Classes) |>
  #   mutate(tool = "Tool 8 - Class", Tab_Name = "Classes"),
  # 
  # compare_dt(clean_data.tool8$Adults_At_The_CBE, raw_data.tool8$Adults_At_The_CBE) |>
  #   mutate(tool = "Tool 8 - Class", Tab_Name = "Adults_At_The_CBE"),
  # 
  # compare_dt(clean_data.tool8$Section_2_2_3_Attendance_Rec..., raw_data.tool8$Section_2_2_3_Attendance_Rec...) |>
  #   mutate(tool = "Tool 8 - Class", Tab_Name = "Section_2_2_3_Attendance_Rec..."),
  # 
  # compare_dt(clean_data.tool8$Section_2_2_4_Headcount, raw_data.tool8$Section_2_2_4_Headcount) |>
  #   mutate(tool = "Tool 8 - Class", Tab_Name = "Section_2_2_4_Headcount"),
  # 
  # compare_dt(clean_data.tool8$Students_Enrolment_Book, raw_data.tool8$Students_Enrolment_Book) |>
  #   mutate(tool = "Tool 8 - Class", Tab_Name = "Students_Enrolment_Book"),
  # 
  # compare_dt(clean_data.tool8$Section_2_4_Student_Ages, raw_data.tool8$Section_2_4_Student_Ages) |>
  #   mutate(tool = "Tool 8 - Class", Tab_Name = "Section_2_4_Student_Ages"),
  # 
  # compare_dt(clean_data.tool8$Classroom_Materials, raw_data.tool8$Classroom_Materials) |>
  #   mutate(tool = "Tool 8 - Class", Tab_Name = "Classroom_Materials"),
  # 
  # compare_dt(clean_data.tool8$Teacher_Kit, raw_data.tool8$Teacher_Kit) |>
  #   mutate(tool = "Tool 8 - Class", Tab_Name = "Teacher_Kit"),
  # 
  # compare_dt(clean_data.tool8$Student_Kit, raw_data.tool8$Student_Kit) |>
  #   mutate(tool = "Tool 8 - Class", Tab_Name = "Student_Kit"),
  # 
  # compare_dt(clean_data.tool8$V_list_of_all_members, raw_data.tool8$V_list_of_all_members) |>
  #   mutate(tool = "Tool 8 - Class", Tab_Name = "V_list_of_all_members"),
  # 
  # compare_dt(clean_data.tool8$Subjects_Added, raw_data.tool8$Subjects_Added) |>
  #   mutate(tool = "Tool 8 - Class", Tab_Name = "Subjects_Added"),
  # 
  # compare_dt(clean_data.tool8$Relevant_photos, raw_data.tool8$Relevant_photos) |>
  #   mutate(tool = "Tool 8 - Class", Tab_Name = "Relevant_photos"),
  # 
  # # Tool 9
  # compare_dt(clean_data.tool9$data, raw_data.tool9$data) |>
  #   mutate(tool = "Tool 9 - IP", Tab_Name = "data"),
  # 
  # compare_dt(clean_data.tool9$Relevant_photos, raw_data.tool9$Relevant_photos) |>
  #   mutate(tool = "Tool 9 - IP", Tab_Name = "Relevant_photos")
) %>% 
  mutate(KEY_join = paste0(KEY, question, old_value, tool, Tab_Name))

# # Data Entry tool
# for(sheet in names(clean_data.tool0)){
#   # Compare
#   correction_log_discrep <- rbind(
#     correction_log_discrep,
#     compare_dt(clean_data.tool0[[sheet]], raw_data.tool0[[sheet]]) |>
#       mutate(tool="Tool - Data Entry", Tab_Name = sheet)
#   )
# }

# Exclude the correction logs
required_cols <- c("KEY", "question", "old_value", "new_value", "tool", "Tab_Name")
correction_log_discrep <- correction_log_discrep |> 
  select(all_of(c(required_cols,"KEY_join"))) |>
  anti_join(bind_rows(correction_log_ready_ps, 
                      correction_log_ready_cbe) |>
              mutate(KEY_join = paste0(KEY, question, new_value, tool, Tab_Name))
            , by = "KEY_join") |>
  left_join(bind_rows(correction_log_ready_ps, correction_log_ready_cbe) |> # Join Sample Type
              select(KEY, question, Tab_Name, Sample_Type), by = c("KEY", "question", "Tab_Name")) |> 
  mutate(issue = "The new_value is not applied correctly, plz check if new_value is consistent with the question!") |>
  select(-KEY_join)

# Join with Correction log issues
correction_log_discrep <- rbind( 
  correction_log_discrep,
  correction_log_issues_ps |>
    select(all_of(required_cols), Sample_Type, "issue"),
  correction_log_issues_cbe |>
    select(all_of(required_cols), Sample_Type, "issue")
)

# Removing extra objects -------------------------------------------------------
rm(list = c("correction_log_issues_ps", "correction_log_issues_cbe",
            "correction_log_ready_ps", "correction_log_ready_cbe", 
            "tool_name", "check_logs_for_df"))
