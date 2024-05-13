# source("R/functions/check_relevancy_rule.R")

join_dfs <- function(df1, df2){
  return(df1 %>% 
           mutate(KEY_join=str_split_fixed(PARENT_KEY, "/", 2)[,1]) %>% # In case PARENT_KEY belongs to another child sheet
           left_join(df2, by = c("KEY_join" = "KEY")) %>% select(-KEY_join))
} 

# Cloning df
clean_data.tool1_joined <- clean_data.tool1
clean_data.tool2_joined <- clean_data.tool2
clean_data.tool3_joined <- clean_data.tool3
clean_data.tool4_joined <- clean_data.tool4
clean_data.tool5_joined <- clean_data.tool5
clean_data.tool6_joined <- clean_data.tool6
clean_data.tool7_joined <- clean_data.tool7


# joining DFs to be able to check the relevancy failure in child s -------------
# Tool 1
clean_data.tool1_joined$Support_Respondents <- join_dfs(clean_data.tool1$Support_Respondents, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$School_Operationality <- join_dfs(clean_data.tool1$School_Operationality, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Shifts_Detail <- join_dfs(clean_data.tool1$Shifts_Detail, clean_data.tool1$data)
clean_data.tool1_joined$Headmasters <- join_dfs(clean_data.tool1$Headmasters, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Weekly_Class_Schedule <- join_dfs(clean_data.tool1$Weekly_Class_Schedule, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Weekly_Class_Schedule_New <- join_dfs(clean_data.tool1$Weekly_Class_Schedule_New, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Subjects_Detail <- join_dfs(clean_data.tool1$Subjects_Detail, clean_data.tool1$data) |> select(!any_of(meta_cols))
clean_data.tool1_joined$Education_Quality <- join_dfs(clean_data.tool1$Education_Quality, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Relevant_photos <- join_dfs(clean_data.tool1$Relevant_photos, clean_data.tool1$data |> select(!any_of(meta_cols)))
length(clean_data.tool1_joined)


# Tool 2
clean_data.tool2_joined$Support_Respondents<- join_dfs(clean_data.tool2$Support_Respondents, clean_data.tool2$data |> select(!any_of(meta_cols)))
clean_data.tool2_joined$School_Operationality<- join_dfs(clean_data.tool2$School_Operationality, clean_data.tool2$data) |> select(!any_of(meta_cols))
clean_data.tool2_joined$Shifts_Detail<- join_dfs(clean_data.tool2$Shifts_Detail, clean_data.tool2$data) |> select(!any_of(meta_cols))
clean_data.tool2_joined$Headmasters<- join_dfs(clean_data.tool2$Headmasters, clean_data.tool2$data) |> select(!any_of(meta_cols))
clean_data.tool2_joined$Attendance_Sheet_Photos<- join_dfs(clean_data.tool2$Attendance_Sheet_Photos, clean_data.tool2$data) |> select(!any_of(meta_cols))
clean_data.tool2_joined$Public_Stationary_Kit_Group<- join_dfs(clean_data.tool2$Public_Stationary_Kit_Group, clean_data.tool2$data) |> select(!any_of(meta_cols))
clean_data.tool2_joined$Teachers_Pack_Group<- join_dfs(clean_data.tool2$Teachers_Pack_Group, clean_data.tool2$data |> select(!any_of(meta_cols)))
clean_data.tool2_joined$Students_Pack_Group<- join_dfs(clean_data.tool2$Students_Pack_Group, clean_data.tool2$data |> select(!any_of(meta_cols)))
clean_data.tool2_joined$Relevant_photos<- join_dfs(clean_data.tool2$Relevant_photos, clean_data.tool2$data |> select(!any_of(meta_cols)))
length(clean_data.tool2_joined)


# Tool 3
clean_data.tool3_joined$Support_Respondents <- join_dfs(clean_data.tool3$Support_Respondents, clean_data.tool3$data |> select(!any_of(meta_cols)))
clean_data.tool3_joined$Grade_Details <- join_dfs(clean_data.tool3$Grade_Details, clean_data.tool3$data |> select(!any_of(meta_cols)))
clean_data.tool3_joined$Todays_Attendance_Detail <- join_dfs(clean_data.tool3$Todays_Attendance_Detail, clean_data.tool3$data |> select(!any_of(meta_cols)))
clean_data.tool3_joined$Student_Headcount <- join_dfs(clean_data.tool3$Student_Headcount, clean_data.tool3$data |> select(!any_of(meta_cols)))
clean_data.tool3_joined$Tool3_Grades_Repeat <- join_dfs(clean_data.tool3$Tool3_Grades_Repeat, clean_data.tool3$data |> select(!any_of(meta_cols)))
clean_data.tool3_joined$Relevant_photos <- join_dfs(clean_data.tool3$Relevant_photos, clean_data.tool3$data |> select(!any_of(meta_cols)))
length(clean_data.tool3_joined)

# Tool 4
clean_data.tool4_joined$Subjects_Not_Being_Taught <- join_dfs(clean_data.tool4$Additional_Subjects, clean_data.tool4$data |> select(!any_of(meta_cols)))
clean_data.tool4_joined$Subjects_taught_by_this_teacher <- join_dfs(clean_data.tool4$Subjects_taught_by_this_teacher, clean_data.tool4$data |> select(!any_of(meta_cols)))
clean_data.tool4_joined$Subjects_Not_Being_Taught <- join_dfs(clean_data.tool4$Subjects_Not_Being_Taught, clean_data.tool4$data |> select(!any_of(meta_cols)))
clean_data.tool4_joined$Relevant_photos <- join_dfs(clean_data.tool4$Relevant_photos, clean_data.tool4$data |> select(!any_of(meta_cols)))
length(clean_data.tool4_joined)

# Tool 5
clean_data.tool5_joined$Under_Construction_Toilets <- join_dfs(clean_data.tool5$Under_Construction_Toilets, clean_data.tool5$data |> select(!any_of(meta_cols)))
clean_data.tool5_joined$Useable_Toilets <- join_dfs(clean_data.tool5$Useable_Toilets, clean_data.tool5$data |> select(!any_of(meta_cols)))
clean_data.tool5_joined$Non_Useable_Toilets <- join_dfs(clean_data.tool5$Non_Useable_Toilets, clean_data.tool5$data |> select(!any_of(meta_cols)))
clean_data.tool5_joined$Relevant_photos <- join_dfs(clean_data.tool5$Relevant_photos, clean_data.tool5$data |> select(!any_of(meta_cols)))
length(clean_data.tool5_joined)

# Tool 6
clean_data.tool6_joined$Subjects_Added <- join_dfs(clean_data.tool6$Subjects_Added, clean_data.tool6$data |> select(!any_of(meta_cols)))
clean_data.tool6_joined$Relevant_photos <- join_dfs(clean_data.tool6$Relevant_photos, clean_data.tool6$data |> select(!any_of(meta_cols)))


# Tool 7
clean_data.tool7_joined$Subjects_Added <- join_dfs(clean_data.tool7$Subjects_Added, clean_data.tool7$data |> select(!any_of(meta_cols)))
clean_data.tool7_joined$Relevant_photos <- join_dfs(clean_data.tool7$Relevant_photos, clean_data.tool7$data |> select(!any_of(meta_cols)))


# listing the required questions -----------------------------------------------
tool1.notrequired_questions <- kobo_tool.tool1$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool2.notrequired_questions <- kobo_tool.tool2$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool3.notrequired_questions <- kobo_tool.tool3$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool4.notrequired_questions <- kobo_tool.tool4$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool5.notrequired_questions <- kobo_tool.tool5$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool6.notrequired_questions <- kobo_tool.tool6$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool7.notrequired_questions <- kobo_tool.tool7$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)

# checking the relevancy issues ------------------------------------------------
relevancy_issues <- data.frame(question = vector())
# Tool 1
tool1_names <- unique(relevancy_file.tool1$sheet)
for (sheet in tool1_names) {
  relevancy_issues <- plyr::rbind.fill(
    relevancy_issues, 
    check_relevancy_rules(data = clean_data.tool1_joined[[sheet]],  
                          tool_relevancy = relevancy_file.tool1, 
                          sheet_name = sheet)
  ) |> 
    mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School") |>
    filter(!question %in% tool1.notrequired_questions)
}

# Tool 2
tool2_names <- unique(relevancy_file.tool2$sheet)
for (sheet in tool2_names) {
  temp <- check_relevancy_rules(data = clean_data.tool2_joined[[sheet]],  
                                tool_relevancy = relevancy_file.tool2, 
                                sheet_name = sheet) |> 
    mutate(tool = "Tool 2 - Light", Sample_Type = "Public School")
  
  if(nrow(temp) > 0){
    relevancy_issues <- plyr::rbind.fill(
      relevancy_issues, 
      temp |>
        filter(!question %in% tool2.notrequired_questions)
    )
  }
  temp <- NULL
}

# Tool 3
tool3_names <- unique(relevancy_file.tool3$sheet)
for (sheet in tool3_names) {
  temp <- check_relevancy_rules(data = clean_data.tool3_joined[[sheet]],  
                                tool_relevancy = relevancy_file.tool3, 
                                sheet_name = sheet) |> 
    mutate(tool = "Tool 3 - Headcount", Sample_Type = "Public School")
  
  if(nrow(temp) > 0){
    relevancy_issues <- plyr::rbind.fill(
      relevancy_issues, 
      temp |>
        filter(!question %in% tool3.notrequired_questions)
    )
  }
  temp <- NULL
}

# Tool 4
tool4_names <- unique(relevancy_file.tool4$sheet)
for (sheet in tool4_names) {
  temp <- check_relevancy_rules(data = clean_data.tool4_joined[[sheet]],  
                                tool_relevancy = relevancy_file.tool4, 
                                sheet_name = sheet) |> 
    mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School")
  
  if(nrow(temp) > 0){
    relevancy_issues <- plyr::rbind.fill(
      relevancy_issues, 
      temp |>
        filter(!question %in% tool4.notrequired_questions)
    )
  }
  temp <- NULL
}

# Tool 5
tool5_names <- unique(relevancy_file.tool5$sheet)
for (sheet in tool5_names) {
  temp <- check_relevancy_rules(data = clean_data.tool5_joined[[sheet]],  
                                tool_relevancy = relevancy_file.tool5, 
                                sheet_name = sheet) |> 
    mutate(tool = "Tool 5 - WASH", Sample_Type = "Public School")
  
  if(nrow(temp) > 0){
    relevancy_issues <- plyr::rbind.fill(
      relevancy_issues, 
      temp |>
        filter(!question %in% tool5.notrequired_questions)
    )
  }
  temp <- NULL
}

# Tool 6
temp <- rbind(
  check_relevancy_rules(clean_data.tool6_joined$data, relevancy_file.tool6, sheet_name="data"),
  check_relevancy_rules(clean_data.tool6_joined$Subjects_Added, relevancy_file.tool6, sheet_name="Subjects_Added")
) |>
  mutate(tool = "Tool 6 - Parent", KEY_join = str_sub(KEY, 1, 41)) |>
  left_join(select(clean_data.tool6_joined$data, KEY, Sample_Type), by = c("KEY_join"="KEY")) %>%
  select(everything(), tool, Sample_Type, -KEY_join)

if(nrow(temp) > 0){
  relevancy_issues <- plyr::rbind.fill(
    relevancy_issues, 
    temp |>
      filter(!question %in% tool6.notrequired_questions)
  )
}

temp <- NULL

# Tool 7
temp <- rbind(
  check_relevancy_rules(clean_data.tool7_joined$data, relevancy_file.tool7, sheet_name="data"),
  check_relevancy_rules(clean_data.tool7_joined$Subjects_Added, relevancy_file.tool7, sheet_name="Subjects_Added")
) |> 
  mutate(tool = "Tool 7 - Shura", KEY_join = str_sub(KEY, 1, 41)) |>
  left_join(select(clean_data.tool7_joined$data, KEY, Sample_Type), by = c("KEY_join"="KEY")) %>%
  select(everything(), tool, Sample_Type, -KEY_join)

if(nrow(temp) > 0){
  relevancy_issues <- plyr::rbind.fill(
    relevancy_issues,
    temp |>
      filter(!question %in% tool7.notrequired_questions)
  )
}  

temp <- NULL



if(nrow(relevancy_issues) > 0){
  relevancy_issues <- relevancy_issues %>% 
    mutate(Key=str_split_fixed(KEY, "/", 2)[,1]) %>% 
    relocate(Key, .after = KEY)
}

# removing extra elements from the environment
rm(list = c("join_dfs",
            ls(pattern = "_joined$"),
            ls(pattern = "notrequired_questions$")
))
