### merge information from main sheet to child-sheets  --------------------------------------------------------------------


# Tool 1 ------------------------------------------------------------------
clean_data.tool1$data <- clean_data.tool1$data |>
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")

clean_data.tool1$Support_Respondents <- clean_data.tool1$Support_Respondents |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$School_Operationality <- clean_data.tool1$School_Operationality |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$Shifts_Detail <- clean_data.tool1$Shifts_Detail |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$Headmasters <- clean_data.tool1$Headmasters |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$Weekly_Class_Schedule <- clean_data.tool1$Weekly_Class_Schedule |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$Weekly_Class_Schedule_New <- clean_data.tool1$Weekly_Class_Schedule_New |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$Subjects_Detail <- clean_data.tool1$Subjects_Detail |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$Education_Quality <- clean_data.tool1$Education_Quality |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())


clean_data.tool1$Relevant_photos <- clean_data.tool1$Relevant_photos |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |> 
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

# Tool 2 ------------------------------------------------------------------
clean_data.tool2$data <- clean_data.tool2$data |>
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")

clean_data.tool2$Support_Respondents <- clean_data.tool2$Support_Respondents |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool2$School_Operationality <- clean_data.tool2$School_Operationality |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool2$Shifts_Detail <- clean_data.tool2$Shifts_Detail |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool2$Headmasters <- clean_data.tool2$Headmasters |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool2$Attendance_Sheet_Photos <- clean_data.tool2$Attendance_Sheet_Photos |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool2$Public_Stationary_Kit_Group <- clean_data.tool2$Public_Stationary_Kit_Group |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool2$Teachers_Pack_Group <- clean_data.tool2$Teachers_Pack_Group |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool2$Students_Pack_Group <- clean_data.tool2$Students_Pack_Group |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool2$Relevant_photos <- clean_data.tool2$Relevant_photos |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())


# Tool 3 ------------------------------------------------------------------
clean_data.tool3$data <- clean_data.tool3$data |>
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")


clean_data.tool3$Support_Respondents <- clean_data.tool3$Support_Respondents |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool3$Grade_Details <- clean_data.tool3$Grade_Details |>
  left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool3$Todays_Attendance_Detail <- clean_data.tool3$Todays_Attendance_Detail |>
  left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool3$Student_Headcount <- clean_data.tool3$Student_Headcount |>
  left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool3$Tool3_Grades_Repeat <- clean_data.tool3$Tool3_Grades_Repeat |>
  left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool3$Relevant_photos <- clean_data.tool3$Relevant_photos |>
  left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())


# Tool 4 ------------------------------------------------------------------
clean_data.tool4$data <- clean_data.tool4$data |>
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")

clean_data.tool4$Additional_Subjects <- clean_data.tool4$Additional_Subjects |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool4$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool4$Subjects_taught_by_this_teacher <- clean_data.tool4$Subjects_taught_by_this_teacher |>
  left_join(select(clean_data.tool4$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool4$Subjects_Not_Being_Taught <- clean_data.tool4$Subjects_Not_Being_Taught |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool4$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool4$Relevant_photos <- clean_data.tool4$Relevant_photos |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool4$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())


# Tool 5 ------------------------------------------------------------------
clean_data.tool5$data <- clean_data.tool5$data |>
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")

clean_data.tool5$Under_Construction_Toilets <- clean_data.tool5$Under_Construction_Toilets |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool5$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool5$Useable_Toilets <- clean_data.tool5$Useable_Toilets |>
  left_join(select(clean_data.tool5$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool5$Non_Useable_Toilets <- clean_data.tool5$Non_Useable_Toilets |>
  left_join(select(clean_data.tool5$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool5$Relevant_photos <- clean_data.tool5$Relevant_photos |>
  left_join(select(clean_data.tool5$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())


# Tool 6 ------------------------------------------------------------------
clean_data.tool6$data <- clean_data.tool6$data |>
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")

clean_data.tool6$Subjects_Added <- clean_data.tool6$Subjects_Added |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool6$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool6$Relevant_photos <- clean_data.tool6$Relevant_photos |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool6$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

# Tool 7 ------------------------------------------------------------------
clean_data.tool7$data <- clean_data.tool7$data |>
  left_join(qa_sheet_ps |> select(KEY, qa_log_status = qa_status), by = "KEY")

clean_data.tool7$Subjects_Added <- clean_data.tool7$Subjects_Added |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool7$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool7$Relevant_photos <- clean_data.tool7$Relevant_photos |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool7$data, any_of(meta_cols), KEY, qa_log_status), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())
