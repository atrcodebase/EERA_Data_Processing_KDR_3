source("R/functions/check_sm_so_questions_value.R")

to_be_excluded_questions = c("Province_filter", "Surveyor_Name", "Site_Visit_ID", "Sample_Type")

handle_wrong_choices_check = function (df_list, xls.survey, xls.choices) {
  sheet_names = names(df_list)
  return(
    mapply(
      FUN = \(df, sheet_name) if(nrow(df) > 0) check_so_sm_questions(df = df, kobotool.survey = xls.survey, kobotool.choices = xls.choices) |> mutate(sheet = sheet_name),
      df_list, sheet_names
      ) |>
      do.call(what = rbind)
  )
}

wrong_choices_result <- rbind(
  # Tool 1
  handle_wrong_choices_check(clean_data.tool1, kobo_tool.tool1$survey, kobo_tool.tool1$choices) |> 
    mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School"),
  
  # Tool 2
  handle_wrong_choices_check(clean_data.tool2, kobo_tool.tool2$survey, kobo_tool.tool2$choices) |> 
    mutate(tool = "Tool 2 - Light", Sample_Type = "Public School"),

  # Tool 3  
  handle_wrong_choices_check(clean_data.tool3, kobo_tool.tool3$survey, kobo_tool.tool3$choices) |> 
    mutate(tool = "Tool 3 - Headcount", Sample_Type = "Public School"),
  
  # Tool 4
  handle_wrong_choices_check(clean_data.tool4, kobo_tool.tool4$survey, kobo_tool.tool4$choices) |> 
    mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School"),
  
  # Tool 5
  handle_wrong_choices_check(clean_data.tool5, kobo_tool.tool5$survey, kobo_tool.tool5$choices) |> 
    mutate(tool = "Tool 5 - WASH Observation", Sample_Type = "Public School"),
  
  # Tool 6
  handle_wrong_choices_check(clean_data.tool6, kobo_tool.tool6$survey, kobo_tool.tool6$choices) |> 
    mutate(tool = "Tool 6 - Parent", Sample_Type = ""),
  
  # Tool 7
  handle_wrong_choices_check(clean_data.tool7, kobo_tool.tool7$survey, kobo_tool.tool7$choices) |> 
    mutate(tool = "Tool 7 - Shura", Sample_Type = "")
) |> 
  rename(old_value = invalid_opts) |> 
  filter(!question_name %in% to_be_excluded_questions)


 
# wrong_choices_result <- rbind(
#   # Tool 0
#   rbind(
#     check_so_sm_questions(
#       df = select(clean_data.tool0$data, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool0$survey,
#       kobotool.choices = kobo_tool.tool0$choices) |>
#       mutate(Sheet = "data"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool0$Tool3_Classes, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool0$survey,
#       kobotool.choices = kobo_tool.tool0$choices) |>
#       mutate(Sheet = "Tool3_Classes"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool0$Tool3_T3_Classes_LW, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool0$survey,
#       kobotool.choices = kobo_tool.tool0$choices) |>
#       mutate(Sheet = "Tool3_T3_Classes_LW"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool0$Tool3_T2_Classes_VD, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool0$survey,
#       kobotool.choices = kobo_tool.tool0$choices) |>
#       mutate(Sheet = "Tool3_T2_Classes_VD"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool0$Tool1_Timetable_Year, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool0$survey,
#       kobotool.choices = kobo_tool.tool0$choices) |>
#       mutate(Sheet = "Tool1_Timetable_Year"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool0$Tool1_Timetable1_Repeat, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool0$survey,
#       kobotool.choices = kobo_tool.tool0$choices) |>
#       mutate(Sheet = "Tool1_Timetable1_Repeat"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool0$Tool1_Timetable2_Repeat, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool0$survey,
#       kobotool.choices = kobo_tool.tool0$choices) |>
#       mutate(Sheet = "Tool1_Timetable2_Repeat"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool0$Tool1_Timetable3_Repeat, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool0$survey,
#       kobotool.choices = kobo_tool.tool0$choices) |>
#       mutate(Sheet = "Tool1_Timetable3_Repeat"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool0$Tool1_Timetable4_Repeat, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool0$survey,
#       kobotool.choices = kobo_tool.tool0$choices) |>
#       mutate(Sheet = "Tool1_Timetable4_Repeat"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool0$Tool3_Grades_Repeat, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool0$survey,
#       kobotool.choices = kobo_tool.tool0$choices) |>
#       mutate(Sheet = "Tool3_Grades_Repeat")
#     
#   ) |>
#     mutate(tool = "Tool Data Entry", Sample_Type = ""),
#   
#   # Tool 1
#   rbind(
#     check_so_sm_questions(
#       df = select(clean_data.tool1$data, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool1$survey,
#       kobotool.choices = kobo_tool.tool1$choices) |>
#       mutate(Sheet = "data"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool1$Support_Respondents, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool1$survey,
#       kobotool.choices = kobo_tool.tool1$choices) |>
#       mutate(Sheet = "Support_Respondents"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool1$School_Operationality, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool1$survey,
#       kobotool.choices = kobo_tool.tool1$choices) |>
#       mutate(Sheet = "School_Operationality"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool1$School_Operationality_Other_..., !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool1$survey,
#       kobotool.choices = kobo_tool.tool1$choices) |>
#       mutate(Sheet = "School_Operationality_Other_..."),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool1$Shifts_Detail, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool1$survey,
#       kobotool.choices = kobo_tool.tool1$choices) |>
#       mutate(Sheet = "Shifts_Detail"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool1$Other_Shifts_Detail, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool1$survey,
#       kobotool.choices = kobo_tool.tool1$choices) |>
#       mutate(Sheet = "Other_Shifts_Detail"),
# 
#   check_so_sm_questions(
#     df = select(clean_data.tool1$Headmasters, !any_of(to_be_excluded_questions)),
#     kobotool.survey = kobo_tool.tool1$survey,
#     kobotool.choices = kobo_tool.tool1$choices) |>
#     mutate(Sheet = "Headmasters"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool1$Weekly_Schedule_Old, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool1$survey,
#       kobotool.choices = kobo_tool.tool1$choices) |>
#       mutate(Sheet = "Weekly_Schedule_Old"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool1$Weekly_Schedule_New, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool1$survey,
#       kobotool.choices = kobo_tool.tool1$choices) |>
#       mutate(Sheet = "Weekly_Schedule_New"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool1$Additional_Subjects, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool1$survey,
#       kobotool.choices = kobo_tool.tool1$choices) |>
#       mutate(Sheet = "Additional_Subjects"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool1$Subjects_Detail, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool1$survey,
#       kobotool.choices = kobo_tool.tool1$choices) |>
#       mutate(Sheet = "Subjects_Detail"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool1$Education_Quality, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool1$survey,
#       kobotool.choices = kobo_tool.tool1$choices) |>
#       mutate(Sheet = "Education_Quality"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool1$Relevant_photos, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool1$survey,
#       kobotool.choices = kobo_tool.tool1$choices) |>
#       mutate(Sheet = "Relevant_photos")
# 
#   ) |>
#     mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School"),
#   
#   # Tool 2
#   rbind(
#     check_so_sm_questions(
#       df = select(clean_data.tool2$data, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool2$survey,
#       kobotool.choices = kobo_tool.tool2$choices) |>
#       mutate(Sheet = "data"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool2$Support_Respondents, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool2$survey,
#       kobotool.choices = kobo_tool.tool2$choices) |>
#       mutate(Sheet = "Support_Respondents"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool2$Attendance_Sheet_Photos, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool2$survey,
#       kobotool.choices = kobo_tool.tool2$choices) |>
#       mutate(Sheet = "Attendance_Sheet_Photos"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool2$Public_Stationary_Kit_Group, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool2$survey,
#       kobotool.choices = kobo_tool.tool2$choices) |>
#       mutate(Sheet = "Public_Stationary_Kit_Group"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool2$Teachers_Pack_Group, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool2$survey,
#       kobotool.choices = kobo_tool.tool2$choices) |>
#       mutate(Sheet = "Teachers_Pack_Group"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool2$Students_Pack_Group, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool2$survey,
#       kobotool.choices = kobo_tool.tool2$choices) |>
#       mutate(Sheet = "Students_Pack_Group"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool2$Relevant_photos, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool2$survey,
#       kobotool.choices = kobo_tool.tool2$choices) |>
#       mutate(Sheet = "Relevant_photos")
#   ) |>
#     mutate(tool = "Tool 2 - Light", Sample_Type = "Public School"),
# 
#   # Tool 3
#   rbind(
#     check_so_sm_questions(
#       df = select(clean_data.tool3$data, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool3$survey,
#       kobotool.choices = kobo_tool.tool3$choices) |>
#       mutate(Sheet = "data"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool3$Support_Respondents, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool3$survey,
#       kobotool.choices = kobo_tool.tool3$choices) |>
#       mutate(Sheet = "Support_Respondents"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool3$Grade_Details, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool3$survey,
#       kobotool.choices = kobo_tool.tool3$choices) |>
#       mutate(Sheet = "Grade_Details"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool3$Todays_Attendance_Detail, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool3$survey,
#       kobotool.choices = kobo_tool.tool3$choices) |>
#       mutate(Sheet = "Todays_Attendance_Detail"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool3$LastWeek_Attendance_Detail, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool3$survey,
#       kobotool.choices = kobo_tool.tool3$choices) |>
#       mutate(Sheet = "LastWeek_Attendance_Detail"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool3$Student_Headcount, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool3$survey,
#       kobotool.choices = kobo_tool.tool3$choices) |>
#       mutate(Sheet = "Student_Headcount"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool3$Tool3_Grades_Repeat, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool3$survey,
#       kobotool.choices = kobo_tool.tool3$choices) |>
#       mutate(Sheet = "Tool3_Grades_Repeat"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool3$Relevant_photos, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool3$survey,
#       kobotool.choices = kobo_tool.tool3$choices) |>
#       mutate(Sheet = "Relevant_photos")
#   ) |>
#     mutate(tool = "Tool 3 - Headcount", Sample_Type = "Public School"),
# 
#   # Tool 4
#   rbind(
#     check_so_sm_questions(
#       df = select(clean_data.tool4$data, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool4$survey,
#       kobotool.choices = kobo_tool.tool4$choices) |>
#       mutate(Sheet = "data"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool4$Additional_Subjects, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool4$survey,
#       kobotool.choices = kobo_tool.tool4$choices) |>
#       mutate(Sheet = "Additional_Subjects"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool4$Subjects_taught_by_this_teacher, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool4$survey,
#       kobotool.choices = kobo_tool.tool4$choices) |>
#       mutate(Sheet = "Subjects_taught_by_this_teacher"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool4$Subjects_Not_Being_Taught, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool4$survey,
#       kobotool.choices = kobo_tool.tool4$choices) |>
#       mutate(Sheet = "Subjects_Not_Being_Taught"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool4$Relevant_photos, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool4$survey,
#       kobotool.choices = kobo_tool.tool4$choices) |>
#       mutate(Sheet = "Relevant_photos")
#   ) |>
#     mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School"),
# 
#   # Tool 5
#   rbind(
#     check_so_sm_questions(
#       df = select(clean_data.tool5$data, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool5$survey,
#       kobotool.choices = kobo_tool.tool5$choices) |>
#       mutate(Sheet = "data"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool5$Under_Construction_Toilets, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool5$survey,
#       kobotool.choices = kobo_tool.tool5$choices) |>
#       mutate(Sheet = "Under_Construction_Toilets"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool5$Useable_Toilets, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool5$survey,
#       kobotool.choices = kobo_tool.tool5$choices) |>
#       mutate(Sheet = "Useable_Toilets"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool5$Non_Useable_Toilets, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool5$survey,
#       kobotool.choices = kobo_tool.tool5$choices) |>
#       mutate(Sheet = "Non_Useable_Toilets"),
# 
#     check_so_sm_questions(
#       df = select(clean_data.tool5$Relevant_photos, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool5$survey,
#       kobotool.choices = kobo_tool.tool5$choices) |>
#       mutate(Sheet = "Relevant_photos")
# 
#   ) |>
#     mutate(tool = "Tool 5 - WASH", Sample_Type = "Public School"),
#   
#   # Tool 6
#   rbind(
#     check_so_sm_questions(
#       df = select(clean_data.tool6$data, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool6$survey,
#       kobotool.choices = kobo_tool.tool6$choices) |> 
#       mutate(Sheet = "data") |>
#       left_join(clean_data.tool6$data |> select(KEY, Sample_Type), by = c("uuid" = "KEY")),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool6$Subjects_Added, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool6$survey,
#       kobotool.choices = kobo_tool.tool6$choices) |> 
#       mutate(Sheet = "Subjects_Added") |>
#       left_join(clean_data.tool6$data |> select(KEY, Sample_Type) , by = c("uuid" = "KEY"))
#   ) |> 
#     mutate(tool = "Tool 6 - Parent"),
#   
#   # Tool 7
#   rbind(
#     check_so_sm_questions(
#       df = select(clean_data.tool7$data, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool7$survey,
#       kobotool.choices = kobo_tool.tool7$choices) |> 
#       mutate(Sheet = "data") |>
#       left_join(clean_data.tool7$data |> select(KEY, Sample_Type), by = c("uuid" = "KEY")),
#     
#     # check_so_sm_questions(
#     #   df = select(clean_data.tool7$C6_list_members, !any_of(to_be_excluded_questions)),
#     #   kobotool.survey = kobo_tool.tool7$survey,
#     #   kobotool.choices = kobo_tool.tool7$choices) |>
#     #   mutate(Sheet = "C6_list_members") |>
#     #   left_join(clean_data.tool6$C6_list_members |> select(KEY, Sample_Type), by = c("uuid" = "KEY")),
#     # 
#     check_so_sm_questions(
#       df = select(clean_data.tool7$Subjects_Added, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool7$survey,
#       kobotool.choices = kobo_tool.tool7$choices) |> 
#       mutate(Sheet = "Subjects_Added") |>
#       left_join(clean_data.tool7$data |> select(KEY, Sample_Type), by = c("uuid" = "KEY"))
#   ) |> 
#     mutate(tool = "Tool 7 - Shura"),
#   
#   # Tool 8
#   rbind(
#     check_so_sm_questions(
#       df = select(clean_data.tool8$data, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool8$survey,
#       kobotool.choices = kobo_tool.tool8$choices) |> 
#       mutate(Sheet = "data"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool8$Classes, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool8$survey,
#       kobotool.choices = kobo_tool.tool8$choices) |> 
#       mutate(Sheet = "Classes"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool8$Adults_At_The_CBE, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool8$survey,
#       kobotool.choices = kobo_tool.tool8$choices) |> 
#       mutate(Sheet = "Adults_At_The_CBE"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool8$Section_2_2_3_Attendance_Rec..., !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool8$survey,
#       kobotool.choices = kobo_tool.tool8$choices) |> 
#       mutate(Sheet = "Section_2_2_3_Attendance_Rec..."),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool8$Section_2_2_4_Headcount, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool8$survey,
#       kobotool.choices = kobo_tool.tool8$choices) |> 
#       mutate(Sheet = "Section_2_2_4_Headcount"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool8$Students_Enrolment_Book, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool8$survey,
#       kobotool.choices = kobo_tool.tool8$choices) |> 
#       mutate(Sheet = "Students_Enrolment_Book"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool8$Section_2_4_Student_Ages, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool8$survey,
#       kobotool.choices = kobo_tool.tool8$choices) |> 
#       mutate(Sheet = "Section_2_4_Student_Ages"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool8$Classroom_Materials, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool8$survey,
#       kobotool.choices = kobo_tool.tool8$choices) |> 
#       mutate(Sheet = "Classroom_Materials"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool8$Teacher_Kit, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool8$survey,
#       kobotool.choices = kobo_tool.tool8$choices) |> 
#       mutate(Sheet = "Teacher_Kit"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool8$Student_Kit, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool8$survey,
#       kobotool.choices = kobo_tool.tool8$choices) |> 
#       mutate(Sheet = "Student_Kit"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool8$V_list_of_all_members, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool8$survey,
#       kobotool.choices = kobo_tool.tool8$choices) |> 
#       mutate(Sheet = "V_list_of_all_members"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool8$Subjects_Added, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool8$survey,
#       kobotool.choices = kobo_tool.tool8$choices) |> 
#       mutate(Sheet = "Subjects_Added"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool8$Relevant_photos, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool8$survey,
#       kobotool.choices = kobo_tool.tool8$choices) |> 
#       mutate(Sheet = "Relevant_photos")
#   ) |> 
#     mutate(tool = "Tool 8 - Class", Sample_Type = "CBE"),
#   
#   # Tool 9
#   rbind(
#     check_so_sm_questions(
#       df = select(clean_data.tool9$data, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool9$survey,
#       kobotool.choices = kobo_tool.tool9$choices) |> 
#       mutate(Sheet = "data"),
#     
#     check_so_sm_questions(
#       df = select(clean_data.tool9$Relevant_photos, !any_of(to_be_excluded_questions)),
#       kobotool.survey = kobo_tool.tool9$survey,
#       kobotool.choices = kobo_tool.tool9$choices) |> 
#       mutate(Sheet = "Relevant_photos")
#     
#   ) |> 
#     mutate(tool = "Tool 9 - IP", Sample_Type = "CBE")
# )

# names(wrong_choices_result)[names(wrong_choices_result) == "invalid_opts"] = "old_value"


# removing extra elements from the environment
rm(list = c("check_so_sm_questions", "handle_wrong_choices_check"))
