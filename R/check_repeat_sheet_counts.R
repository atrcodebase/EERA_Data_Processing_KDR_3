# to compare the counts between supposed counts (based on main sheet) and rows in child sheet
source("R/compare_row_counts.R")

# to count select multiple's selected choices
count_sm_selected_choices <- function(df, question) {
  sm.binaries <- names(df)[grepl(paste0("^", question, "_\\d"), names(df), ignore.case = T)]
  data.frame(
    supposed_row_count = apply(df[sm.binaries], 1, sum, na.rm = T),
    KEY = df$KEY
  )
}


# Changed the supposed_row_count value from COUNT column in data sets to column define in the tool repeat-count - 131223
repeat_sheet_issues <- plyr::rbind.fill(
  # Tool 1
  plyr::rbind.fill(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, KEY, supposed_row_count = C11),
      child_df = clean_data.tool1$Support_Respondents,
      child_sheet_name = "Support_Respondents"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C11"),
    
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, KEY, supposed_row_count = School_rep),
      child_df = clean_data.tool1$School_Operationality,
      child_sheet_name = "School_Operationality"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "School_rep"),
    
    # 3
    compare_row_counts(
      supposed_count_df = count_sm_selected_choices(clean_data.tool1$data, "C14A1"),
      child_df = clean_data.tool1$Shifts_Detail,
      child_sheet_name = "Shifts_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C14A1"),

    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, KEY, supposed_row_count = C15),
      child_df = clean_data.tool1$Headmasters,
      child_sheet_name = "Headmasters"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C15"),
    
    # 5
    clean_data.tool1$data |>
      mutate(supposed_row_count = 2) |>
      filter(F1 == "1") |>
      left_join(
        clean_data.tool1$Weekly_Class_Schedule |>
          group_by(KEY = PARENT_KEY) |>
          summarise(current_row_count = n()) , by = "KEY") |>
      filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
      mutate(
        issue = case_when(
          is.na(current_row_count) ~ "There is at least 2 missing row for the logged KEY in Weekly_Class_Schedule sheet",
          TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Weekly_Class_Schedule sheet")
        ),
        sheet_name = "Weekly_Class_Schedule",
        Row_count_column_name = "",
        Row_count_from_tab = "data"
      ) |>
      select(
        PARENT_KEY = KEY,
        issue,
        supposed_row_count,
        current_row_count,
        sheet_name,
        Row_count_column_name,
        Row_count_from_tab
      ),
    
    # 6
    clean_data.tool1$data |>
      mutate(supposed_row_count = 2) |>
      filter(F1 == "1") |>
      left_join(
        clean_data.tool1$Weekly_Class_Schedule_New |>
          group_by(KEY = PARENT_KEY) |>
          summarise(current_row_count = n()) , by = "KEY") |>
      filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
      mutate(
        issue = case_when(
          is.na(current_row_count) ~ "There is at least 2 missing row for the logged KEY in Weekly_Class_Schedule_New sheet",
          TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Weekly_Class_Schedule_New sheet")
        ),
        sheet_name = "Weekly_Class_Schedule_New",
        Row_count_column_name = "",
        Row_count_from_tab = "data"
      ) |>
      select(
        PARENT_KEY = KEY,
        issue,
        supposed_row_count,
        current_row_count,
        sheet_name,
        Row_count_column_name,
        Row_count_from_tab
      ),

    # 5
    compare_row_counts(
      supposed_count_df = clean_data.tool1$data |>
        mutate(supposed_row_count = 30) |> 
        select(supposed_row_count, KEY),
      child_df = clean_data.tool1$Subjects_Detail,
      child_sheet_name = "Subjects_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = ""),
  
    # 6
    compare_row_counts(
      supposed_count_df = clean_data.tool1$data |>
        mutate(supposed_row_count = 9) |> 
        select(supposed_row_count, KEY),
      child_df = clean_data.tool1$Education_Quality,
      child_sheet_name = "Education_Quality"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "")
  ) |>
    mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School"),

  
  # Tool 2
  plyr::rbind.fill(
    # 1 
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data, KEY, supposed_row_count = D8),
      child_df = clean_data.tool2$Support_Respondents,
      child_sheet_name = "Support_Respondents"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "D8"),
    
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data, KEY, supposed_row_count = School_rep),
      child_df = clean_data.tool2$School_Operationality,
      child_sheet_name = "School_Operationality"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "School_rep"),
    
    # 3
    compare_row_counts(
      supposed_count_df = count_sm_selected_choices(clean_data.tool2$data, "C14A1"),
      child_df = clean_data.tool2$Shifts_Detail,
      child_sheet_name = "Shifts_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C14A1"),
    
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data, KEY, supposed_row_count = C15A),
      child_df = clean_data.tool2$Headmasters,
      child_sheet_name = "Headmasters"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C15A"),
    
    
    clean_data.tool2$data |>
      filter(G2 == 1) |>
      mutate(supposed_row_count = 1) |>
      left_join(
        clean_data.tool2$Attendance_Sheet_Photos |>
          group_by(KEY = PARENT_KEY) |>
          summarise(current_row_count = n()) , by = "KEY") |>
      filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
      mutate(
        issue = case_when(
          is.na(current_row_count) ~ "There is at least 1 missing row for the logged KEY in Attendance_Sheet_Photos sheet",
          TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Attendance_Sheet_Photos sheet")
        ),
        sheet_name = "Attendance_Sheet_Photos",
        Row_count_column_name = "",
        Row_count_from_tab = "data"
      ) |>
      select(
        PARENT_KEY = KEY,
        issue,
        supposed_row_count,
        current_row_count,
        sheet_name,
        Row_count_column_name,
        Row_count_from_tab
      ),
    
    # 5
    compare_row_counts(
      supposed_count_df = clean_data.tool2$data |> filter(H1 == 1 & H5_8888 != 1) |> mutate(H5_value_count = case_when(
        is.na(H5) | str_trim(H5) == "" ~ 0,
        TRUE ~ (str_count(H5, " ") + 1)
      )) |> 
      select(supposed_row_count = H5_value_count, KEY),
      child_df = clean_data.tool2$Public_Stationary_Kit_Group,
      child_sheet_name = "Public_Stationary_Kit_Group"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "H5"),
    
    # 6
    compare_row_counts(
      supposed_count_df = clean_data.tool2$data |> filter(i1 == 1) |> mutate(i5_value_count = case_when(
        is.na(i5) | str_trim(i5) == "" ~ 0,
        TRUE ~ (str_count(i5, " ") + 1)
      )) |>
        select(supposed_row_count = i5_value_count, KEY),
      child_df = clean_data.tool2$Teachers_Pack_Group,
      child_sheet_name = "Teachers_Pack_Group"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "i5"),
    
    # 7
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data |> filter(J1 == 1 & J5_8888 != 1) |> mutate(J5_value_count = case_when(
        is.na(J5) | str_trim(J5) == "" ~ 0,
        TRUE ~ (str_count(J5, " ") + 1)
      )), 
      supposed_row_count = J5_value_count, KEY),
      child_df = clean_data.tool2$Students_Pack_Group,
      child_sheet_name = "Students_Pack_Group"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "J5")
    
  ) |>
    mutate(tool = "Tool 2 - Light", Sample_Type = "Public School"),
  
  # Tool 3
  plyr::rbind.fill(
    # 1 
    compare_row_counts(
      supposed_count_df = clean_data.tool3$data |> select(KEY, supposed_row_count = B9),
      child_df = clean_data.tool3$Support_Respondents,
      child_sheet_name = "Support_Respondents"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "B9"),
    
    # 2 
    compare_row_counts(
      supposed_count_df = clean_data.tool3$data |> select(KEY, supposed_row_count = C9),
      child_df = clean_data.tool3$Grade_Details,
      child_sheet_name = "Grade_Details"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C9"),
    
    # 3
    compare_row_counts(
      supposed_count_df = clean_data.tool3$data |> select(KEY, supposed_row_count = C9),
      child_df = clean_data.tool3$Todays_Attendance_Detail,
      child_sheet_name = "Todays_Attendance_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C9"),
    
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data |> mutate(E1_value_count = case_when(
        is.na(E1) | str_trim(E1) == "" ~ 0,
        TRUE ~ (str_count(E1, " ") + 1)
      )), 
      supposed_row_count = E1_value_count, KEY),
      child_df = clean_data.tool3$Student_Headcount,
      child_sheet_name = "Student_Headcount"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "E1"), 
    
    # 5
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data |> mutate(Tool3_Grades_value_count = case_when(
        is.na(Tool3_Grades) | str_trim(Tool3_Grades) == "" ~ 0,
        TRUE ~ (str_count(Tool3_Grades, " ") + 1)
      )), 
      supposed_row_count = Tool3_Grades_value_count, KEY),
      child_df = clean_data.tool3$Tool3_Grades_Repeat,
      child_sheet_name = "Tool3_Grades_Repeat"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Tool3_Grades")
  ) |>
    mutate(tool = "Tool 3 - Headcount", Sample_Type = "Public School"),
  
  # Tool 4
  plyr::rbind.fill(
    # 1
    compare_row_counts(
      supposed_count_df = clean_data.tool4$data |> filter(F2 == 1) |> select(KEY, supposed_row_count = F2_N),
      child_df = clean_data.tool4$Additional_Subjects,
      child_sheet_name = "Additional_Subjects"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "F2_N"),
    
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool4$data |> mutate(D9_value_count = case_when(
        is.na(D9) | str_trim(D9) == "" ~ 0,
        TRUE ~ (str_count(D9, " ") + 1)
      )), 
      supposed_row_count = D9_value_count, KEY),
      child_df = clean_data.tool4$Subjects_taught_by_this_teacher,
      child_sheet_name = "Subjects_taught_by_this_teacher"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "D9"),
    
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool4$data |> filter(F11 == 1 & F12_Subjects_Not_Being_Taught_8888 != 1) |> mutate(F12_Subjects_Not_Being_Taught_value_count = case_when(
        is.na(F12_Subjects_Not_Being_Taught) | str_trim(F12_Subjects_Not_Being_Taught) == "" ~ 0,
        TRUE ~ (str_count(F12_Subjects_Not_Being_Taught, " ") + 1)
      )), 
      supposed_row_count = F12_Subjects_Not_Being_Taught_value_count, KEY),
      child_df = clean_data.tool4$Subjects_Not_Being_Taught,
      child_sheet_name = "Subjects_Not_Being_Taught"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "F12_Subjects_Not_Being_Taught")
    
  ) |>
    mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School"),
  
  # Tool 5
  # 1 - Does not have repeat count in the tool - note (<b>Please go to previous page and take at least two photos of toilets under construction.)
  plyr::rbind.fill(
    clean_data.tool5$data |>
      mutate(supposed_row_count = 2) |>
      filter(C5 == 4) |>
      left_join(
        clean_data.tool5$Under_Construction_Toilets |>
          group_by(KEY = PARENT_KEY) |>
          summarise(current_row_count = n()) , by = "KEY") |>
      filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
      mutate(
        issue = case_when(
          is.na(current_row_count) ~ "There is at least 2 missing row for the logged KEY in Under_Construction_Toilets sheet",
          TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Under_Construction_Toilets sheet")
        ),
        sheet_name = "Under_Construction_Toilets",
        Row_count_column_name = "",
        Row_count_from_tab = "data"
      ) |>
      select(
        PARENT_KEY = KEY,
        issue,
        supposed_row_count,
        current_row_count,
        sheet_name,
        Row_count_column_name,
        Row_count_from_tab
      ),
    # 2 - Does not have repeat count in the tool - note (<b>Please go to previous page and take at least two photos of useable toilets.)
    clean_data.tool5$data |>
      mutate(supposed_row_count = 2) |>
      filter(C9_4 > 0 | C9_5 > 0 | C9_6 > 0) |>
      left_join(
        clean_data.tool5$Useable_Toilets |>
          group_by(KEY = PARENT_KEY) |>
          summarise(current_row_count = n()) , by = "KEY") |>
      filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
      mutate(
        issue = case_when(
          is.na(current_row_count) ~ "There is at least 2 missing row for the logged KEY in Useable_Toilets sheet",
          TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Useable_Toilets sheet")
        ),
        sheet_name = "Useable_Toilets",
        Row_count_column_name = "",
        Row_count_from_tab = "data"
      ) |>
      select(
        PARENT_KEY = KEY,
        issue,
        supposed_row_count,
        current_row_count,
        sheet_name,
        Row_count_column_name,
        Row_count_from_tab
      ),
    # 3 - Does not have repeat count in the tool - note (<b>Please go to previous page and take a photo of Non_Useable toilets.)
    clean_data.tool5$data |>
      mutate(supposed_row_count = 2) |>
      filter(C9_7 > 0 | C9_8 > 0 | C9_9 > 0) |>
      left_join(
        clean_data.tool5$Non_Useable_Toilets |>
          group_by(KEY = PARENT_KEY) |>
          summarise(current_row_count = n()) , by = "KEY") |>
      filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
      mutate(
        issue = case_when(
          is.na(current_row_count) ~ "There is at least 2 missing row for the logged KEY in Non_Useable_Toilets sheet",
          TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Non_Useable_Toilets sheet")
        ),
        sheet_name = "Non_Useable_Toilets",
        Row_count_column_name = "",
        Row_count_from_tab = "data"
      ) |>
      select(
        PARENT_KEY = KEY,
        issue,
        supposed_row_count,
        current_row_count,
        sheet_name,
        Row_count_column_name,
        Row_count_from_tab
      )) |> 
    mutate(tool = "Tool 5 - WASH", Sample_Type = "Public School"),
  
  # Tool 6
  plyr::rbind.fill(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool6$data, KEY, supposed_row_count = D4_N),
      child_df = clean_data.tool6$Subjects_Added,
      child_sheet_name = "Subjects_Added"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "D4_N")
  ) |>
    left_join(select(clean_data.tool6$data, KEY, Sample_Type), by = c("PARENT_KEY" = "KEY")) |>
    mutate(tool = "Tool 6 - Parent"),
  
  # Tool 7
  plyr::rbind.fill(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool7$data, KEY, supposed_row_count = E4_N),
      child_df = clean_data.tool7$Subjects_Added,
      child_sheet_name = "Subjects_Added"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "E4_N")
  ) |>
    left_join(select(clean_data.tool7$data, KEY, Sample_Type), by = c("PARENT_KEY" = "KEY")) |>
    mutate(tool = "Tool 7 - Shura")
)


# Remove Unnecessary Objects from Environment --------------------------------------------------------------
rm(list = c("count_sm_selected_choices", "compare_row_counts"))
