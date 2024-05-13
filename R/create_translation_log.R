source("R/functions/missing_translation_function.R")

handle_translation = function(df_list){
  return(lapply(df_list, missing_translation_func) |> do.call(what = rbind))
}

# Find missing translations to add in the translation log -----------------
missing_translations <- bind_rows(
  handle_translation(clean_data.tool1) |> mutate(tool = "Tool 1 - Headmaster"),
  handle_translation(clean_data.tool2) |> mutate(tool = "Tool 2 - Light"),
  handle_translation(clean_data.tool3) |> mutate(tool = "Tool 3 - Headcount"),
  handle_translation(clean_data.tool4) |> mutate(tool = "Tool 4 - Teacher"),
  handle_translation(clean_data.tool5) |> mutate(tool = "Tool 5 - WASH Observation"),
  handle_translation(clean_data.tool6) |> mutate(tool = "Tool 6 - Parent"),
  handle_translation(clean_data.tool7) |> mutate(tool = "Tool 7 - Shura")
)

need_translation <- c(
  # Tool 1:
  "Interviewee_Respondent_Type_Other", "B6_Other", "B7_Other", "B7_1", "B7_2", "B9_Other", "C2_Other", "C4_Other",
  "C4_1_Other", "District_SV", "C12A3_Other", "C13A3_Other", "F16", "H2_Other", "H3_Other", "I7_Other", "I8_Other",
  "J2_Other", "J5_Other", "J7_Other", "J9_Other", "J10_Other", "J13_Other", "J15_Other", "J17_Other", "J19_Other",
  "J21_Other", "K3_Other", "K4_Other", "Survey_Language_Other",
  
  # Tool 2:
  "B4_Other", "Interviewee_Respondent_Type_Other", "C7_Other", "C11_Other", "C12_Other", "D2_Other", "D4_Other",
  "D4_1_Other", "D59_Other", "D10_2_Other", "C13A3_Other", "E3_Other", "E4_Other", "E7_Other", "E8_Other", "H2_Other",
  "H5_Other", "H8_Other", "H11_Other", "H14_Other", "H16_Other", "i2_Other", "i5_Other", "i8_Other", "i11_Other",
  "i14_Other", "i16_Other", "J2_Other", "J5_Other", "J8_Other", "J11_Other", "J14_Other", "J16_Other", "Survey_Language_Other",
  
  # Tool 3
  "Interviewee_Respondent_Type_Other", "B2_Other", "B10A3_Other", "C2_Other", "C3_Other", "C5_Other", "C6_Other", "C7_Other", "C10", "Survey_Language_Other",
  
  # Tool 4
  "D1_Other", "D3_Other", "D5_Other", "D6_Other", "D6_IP_Name", "D9_Other", "E27_Other", "F2_Subject_Name", "F5_Other",
  "F13_Other", "F16_Other", "F17_Other", "G2_Other", "G3_Other", "G6_Other", "H5_Other", "H7_Other", "Survey_Language_Other",
  
  # Tool 5
  "C7_Other", "Survey_Language_Other",
  
  # Tool 6
  "B5_Other", "D3_Other", "D4_Other", "D5_Subject_Name", "D10_Other", "D11_Other", "D13_Other", "D14_Other", "E3_Other",
  "F2_Other", "F4_Other", "F5_Other", "F13_2_Other", "F13_3_Other", "Survey_Language_Other",
  
  # Tool 7
  "B6_Other", "C0_Other", "C2_1_Other", "C2_2_Other", "C3_Other", "C4_Other", "C5_Other", "C8_Other", "C9_Other", "C11_Other",
  "C12_Other", "C14_Other", "C14_A", "C19_Other", "C23_Other", "C25_Other", "C27_Other", "E2_Other", "E3_Other", "E4_Subject_Name",
  "E9_Other", "E10_Other", "E12_Other", "E13_Other", "F2_Other", "G2_Other", "Survey_Language_Other"
) |> unique()

missing_translations <- missing_translations |>
  filter(question_name %in% need_translation)

not_missing_translations <-  missing_translations |>
  filter(!question_name %in% need_translation) |> distinct(question_name, tool)


# double check unlogged translations --------------------------------------
# handle_unlogged_values = function(df_list, need_translation){
#   return(lapply(df_list, log_translation_cols, need_translation) |> do.call(what = rbind))
# }


# un_logged_values <- bind_rows(
#   handle_unlogged_values(clean_data.tool1, need_translation) |> mutate(tool = "Tool 1 - Headmaster"),
#   handle_unlogged_values(clean_data.tool2, need_translation) |> mutate(tool = "Tool 2 - Light"),
#   handle_unlogged_values(clean_data.tool3, need_translation) |> mutate(tool = "Tool 3 - Headcount"),
#   handle_unlogged_values(clean_data.tool4, need_translation) |> mutate(tool = "Tool 4 - Teacher"),
#   handle_unlogged_values(clean_data.tool5, need_translation) |> mutate(tool = "Tool 5 - WASH Observation"),
#   handle_unlogged_values(clean_data.tool6, need_translation) |> mutate(tool = "Tool 6 - Parent"),
#   handle_unlogged_values(clean_data.tool7, need_translation) |> mutate(tool = "Tool 7 - Shura")
# )

# to double check in case of any untranslated but English phrased value
# un_logged_values <- un_logged_values |> 
#   anti_join(missing_translations, by = c("KEY", "tool", "question_name"))


# to be removed from environment ------------------------------------------
remove(missing_translation_func)
remove(log_translation_cols)
remove(need_translation)
