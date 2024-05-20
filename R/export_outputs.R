# Exporting unsterilized version of clean datasets -----------------------------
write.xlsx(clean_data.tool1, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool1_EERA_KDR_Public_School_Headmaster_Interview_cleaned_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool2, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool2_EERA_KDR_Public_School_Light_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool3, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool3_EERA_KDR_Public_School_Student_Document_Headcount_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool4, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool4_EERA_KDR_Public_School_Teacher_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool5, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool5_EERA_KDR_Public_School_WASH_Observation_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool6, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool6_EERA_KDR_Public_School_Parent_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool7, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool7_EERA_KDR_Public_School_Shura_Tool_", Sys.Date(),".xlsx"))

# Exporting unsterilized version of clean datasets -----------------------------
write.xlsx(clean_data.tool1_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool1_EERA_KDR_Public_School_Headmaster_Interview_cleaned_Unlabeled__", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool2_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool2_EERA_KDR_Public_School_Light_Tool_Unlabeled__", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool3_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool3_EERA_KDR_Public_School_Student_Document_Headcount_Unlabeled__", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool4_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool4_EERA_KDR_Public_School_Teacher_Tool_Unlabeled__", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool5_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool5_EERA_KDR_Public_School_WASH_Observation_Unlabeled__", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool6_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool6_EERA_KDR_Public_School_Parent_Tool_Unlabeled__", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool7_for_client_ulabeled, paste0(output_data_path, "cleaned_dfs/sterilized/unlabled/Tool7_EERA_KDR_Public_School_Shura_Tool_Unlabeled__", Sys.Date(),".xlsx"))

# Exporting for client version of clean datasets -------------------------------
write.xlsx(clean_data.tool1_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool1_EERA_KDR_Public_School_Headmaster_Interview_cleaned_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool2_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool2_EERA_KDR_Public_School_Light_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool3_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool3_EERA_KDR_Public_School_Student_Document_Headcount_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool4_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool4_EERA_KDR_Public_School_Teacher_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool5_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool5_EERA_KDR_Public_School_WASH_Observation_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool6_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool6_EERA_KDR_Public_School_Parent_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool7_for_client, paste0(output_data_path, "cleaned_dfs/sterilized/labeled/Tool7_EERA_KDR_Public_School_Shura_Tool_", Sys.Date(),".xlsx"))


# file.edit("./R/sample_dfs.R")

# Export other outputs ---------------------------------------------------------
# export issues in data sets
if (nrow(correction_log_discrep) > 0){
  
  write.xlsx(correction_log_discrep, paste0(output_data_path, "issues/correction_log_issues/correction_log_issues_", Sys.Date(),".xlsx"))
}

if (nrow(repeat_sheet_issues) > 0){
  write.xlsx(repeat_sheet_issues, paste0(output_data_path, "issues/repeat_sheet_issues/repeat_sheet_issues_", Sys.Date(),".xlsx"))
}

if (nrow(missing_translations) > 0) write.xlsx(missing_translations, paste0(output_data_path, "issues/untranslated_values/untranslated_values_", Sys.Date(),".xlsx"))
# if (nrow(un_logged_values) > 0) write.xlsx(un_logged_values, paste0(output_data_path, "issues/harmonization/harmonization_", Sys.Date(),".xlsx"))


if (nrow(relevancy_issues) > 0) write.xlsx(relevancy_issues, paste0(output_data_path, "issues/relevancy_checks/relevancy_issues_", Sys.Date(),".xlsx"))

sm_question_issues_dfs = list(
  # "NA issues in select_multiple" = sm_na_issues,
  "parent_series_inconsistencies" = sm_check_result
)

if (nrow(sm_check_result) > 0){
  write.xlsx(sm_question_issues_dfs, paste0(output_data_path, "issues/sm_issues/sm_check_result_", Sys.Date(),".xlsx"))
}

if (nrow(wrong_choices_result) > 0){
  write.xlsx(wrong_choices_result, paste0(output_data_path, "issues/wrong_choices/wrong_choices_result_", Sys.Date(),".xlsx"))
}

if (nrow(calculate_issues) > 0){
  write.xlsx(calculate_issues, paste0(output_data_path, "issues/calculate_issues/calculate_issues_", Sys.Date(),".xlsx"))
}

if (nrow(Logic_check_result) > 0){
  write.xlsx(Logic_check_result, paste0(output_data_path, "issues/logic_checks/logic_checks_", Sys.Date(),".xlsx"))
}

