# Organization:   ATR
# Date:           Apr 2024
# Script:         EERA Data Processing (KDR Round 3)
# Author:         ATR Data Management Department

# Load required packages -------------------------------------------------------
rm(list = ls())
if(!require(tidyverse)) install.packages("tidyverse")
if(!require(googlesheets4)) install.packages("googlesheets4")
if(!require(openxlsx)) install.packages("openxlsx")
if(!require(readxl)) install.packages("readxl")
if(!require(readxl)) install.packages("janitor")
if(!require(remotes)) install.packages("remotes")
if(!require(atRfunctions)) remotes::install_github("atrcodebase/atRfunctions")
`%notin%` <- Negate(`%in%`)

list_file_paths <- function(dir_path, cur_name_pattern, desired_name_pattern = "tool\\1"){
  list.files(dir_path, full.names = T) %>% .[!grepl("/\\~\\$", .)] |> as.list() %>% setNames(gsub(cur_name_pattern, desired_name_pattern, .))
}


# Declaring Global Variables ---------------------------------------------------
data_collection_start_date_ps = as.Date("14.04.2024", format("%d.%m.%Y"))
data_collection_end_date = as.Date("16.05.2024",  format("%d.%m.%Y"))
# DC_start_date.CBE = as.Date("06.04.2024", format("%d.%m.%Y"))
qa_sheet_url_ps = "https://docs.google.com/spreadsheets/d/1h90Z42H3V8SVKdfoywKc-x8o8m2Xr1JbhrEWykQOHVw/edit"

output_data_path = "output/"
sample_files_path = "input/sample_files/"

raw_data_path = list_file_paths("input/raw_data/", ".*Tool (\\d).*")
kobo_tools_path = list_file_paths("input/tools/", ".*Tool (\\d).*")
relevancy_files_path = list_file_paths("input/relevancy_files/", ".*tool(\\d).*")

meta_cols <- c("Site_Visit_ID", "EMIS_School_ID_CBE_KEY", "School_CBE_Name", "IP_Name", "Region", "Province", "District", "Area_Type", "Type_Of_School_CBE_Based_On_The_Sample", "School_CBE_Gender_Based_On_The_Sample", "School_Type_SV", "School_Gender_SV")
meta_cols.qa_sheet <- c(Visit_ID = "Site_Visit_ID", "School Code", "Sample_Type", Survey_Date = "SubmissionDate", Region = "Region", "KEY")

# Read inputs --------------------------------------------------------------
# Data sets
raw_data.tool1 = read_xlsx_sheets(raw_data_path$tool1)
raw_data.tool2 = read_xlsx_sheets(raw_data_path$tool2)
raw_data.tool3 = read_xlsx_sheets(raw_data_path$tool3)
raw_data.tool4 = read_xlsx_sheets(raw_data_path$tool4)
raw_data.tool5 = read_xlsx_sheets(raw_data_path$tool5)
raw_data.tool6 = read_xlsx_sheets(raw_data_path$tool6)
raw_data.tool7 = read_xlsx_sheets(raw_data_path$tool7)


# Tools
kobo_tool.tool1 = read_xlsx_sheets(kobo_tools_path$tool1)
kobo_tool.tool2 = read_xlsx_sheets(kobo_tools_path$tool2)
kobo_tool.tool3 = read_xlsx_sheets(kobo_tools_path$tool3)
kobo_tool.tool4 = read_xlsx_sheets(kobo_tools_path$tool4)
kobo_tool.tool5 = read_xlsx_sheets(kobo_tools_path$tool5)
kobo_tool.tool6 = read_xlsx_sheets(kobo_tools_path$tool6)
kobo_tool.tool7 = read_xlsx_sheets(kobo_tools_path$tool7)


relevancy_file.tool1 = read_xlsx_sheets(relevancy_files_path$tool1)
relevancy_file.tool2 = read_xlsx_sheets(relevancy_files_path$tool2)
relevancy_file.tool3 = read_xlsx_sheets(relevancy_files_path$tool3)
relevancy_file.tool4 = read_xlsx_sheets(relevancy_files_path$tool4)
relevancy_file.tool5 = read_xlsx_sheets(relevancy_files_path$tool5)
relevancy_file.tool6 = read_xlsx_sheets(relevancy_files_path$tool6)
relevancy_file.tool7 = read_xlsx_sheets(relevancy_files_path$tool7)


# Read QA log from Google sheet ------------------------------------------------
qa_sheet = read_sheet(qa_sheet_url_ps, sheet = "QA_Log") |> filter(Province == "Kandahar")
# To select the user to authenticate
2

correction_log = plyr::rbind.fill(
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Headmaster") |> mutate_all(as.character) |> mutate(tool = "Tool 1 - Headmaster"),
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Light") |> mutate_all(as.character) |> mutate(tool = "Tool 2 - Light"),
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Headcount") |> mutate_all(as.character) |> mutate(tool = "Tool 3 - Headcount"),
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Teacher") |> mutate_all(as.character) |> mutate(tool = "Tool 4 - Teacher"),
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log WASH") |> mutate_all(as.character) |> mutate(tool = "Tool 5 - WASH"),
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Parent") |> mutate_all(as.character) |> mutate(tool = "Tool 6 - Parent"),
  read_sheet(qa_sheet_url_ps, sheet = "Correction _Log Shura") |> mutate_all(as.character) |> mutate(tool = "Tool 7 - Shura")
) |> 
  filter(Province == "Kandahar")

# Turn NULL values to NA for old and new value columns
correction_log <- correction_log %>% 
  mutate(
    New_Value = case_when(
      is.null(New_Value) | New_Value == "NULL" ~ NA_character_,
      TRUE ~ New_Value
    ),
    
    old_value = case_when(
      is.null(old_value) | old_value == "NULL" ~ NA_character_,
      TRUE ~ old_value
    ),
    
    Sample_Type = if_else(is.na(Sample_Type), "Public School", Sample_Type)
  ) %>% 
  # Exclude if Unique_key, question, new value, and old value combo is NA
  filter(!(is.na(KEY_Unique) & is.na(Question) & is.na(New_Value) & is.na(old_value))) |> 
  select(-KEY) |> 
  rename(
    # KEY = "Key",
    KEY = "KEY_Unique",
    question = "Question",
    new_value = "New_Value"
  )

# Remove extra object
# rm(correction_log)

deletion_log <- read_sheet(qa_sheet_url_ps, sheet = "To be removed from dataset") |> 
  filter(Province == "Kandahar", !is.na(KEY_Unique))

qa_sheet <- qa_sheet |>
  rename(
    qa_status = "QA Status",
    tool = `Tool`) |>
  mutate(
    qa_status = toupper(qa_status), 
    qa_status = case_when(
      is.na(qa_status) ~ "PENDING",
      TRUE ~ qa_status
    )
  )

table(qa_sheet$qa_status, qa_sheet$tool, useNA = "always") %>% 
  addmargins(2)

# splitting the QA log's sheet
qa_sheet_ps = filter(qa_sheet, Sample_Type == "Public School")

# Prepare Data sets - Public School --------------------------------------------
# Extract Approved Interviews
approved_keys_ps = qa_sheet_ps |> 
  filter(qa_status %in% c("APPROVED", "APPROVED (EXCEL CHECK ONLY)")) |> 
  pull(KEY) |> unique()

length(approved_keys_ps) == length(which(qa_sheet_ps$qa_status %in% c("APPROVED", "APPROVED (EXCEL CHECK ONLY)")))

# Extract deleted KEYs to be removed from data sets
deleted_keys_ps = deletion_log |> filter(Sample_Type == "Public School") |> pull(KEY_Unique)

# To be added to the data sets -------------------------------------------- DONE
source("R/tobe_added_to_datasets.R")

# convert numeric dates to date and time formats -------------------------------
source("R/convert_numbers_to_date_time.R")
 
# Apply correction log ------------------------------------------------ 
if(nrow(correction_log) > 0) source("R/apply_correction_log.R")


# Merge meta data from main sheet to repeating groups --------------------------
source("R/main_sheet_to_repeat_sheets.R")


# Remove the rejected and pilot interviews -------------------------------------
source("R/remove_rejected_interviews.R")


# Check repeat sheet count ---------------------------------------------
source("R/check_repeat_sheet_counts.R")


# missing translations (for QA)--------------------------------------------
source("R/create_translation_log.R")


# Check relevancy rules ---------------------------------------------------
source("R/check_relevancies.R")


# Update select multiple binary variables ---------------------------------
source("R/fix_select_multiple_questions.R")


# Check select multiple variables --------------------------------------
source("R/check_select_multiple_questions.R")


# re-calculate the calculated variables and compare any changes not applied - NOT
source("R/calculate_cols_check.R")


# Check the responses with the tool --------------------------------------------
source("R/compare_df_values_with_tool.R")


# attach value labels  ---------------------------------------------------------
source("R/attach_labels.R")


# Logical inconsistencies ------------------------------------------------- NOT
source("R/logical_checks.R")


# prepare data sets to export  -------------------------------------------- 
## remove extra columns
source("R/remove_extra_columns.R")


# attach labels to calculates cols ---------------------------------------- 
source("R/attach_calculate_label.R")

# t1_sample <- read_xlsx_sheets("./output/cleaned_dfs/sterilized/labeled/Sample/QA/EERA_R3_KDR_Tool1_Public_School_Headmaster_Sample.xlsx")
# t2_sample <- read_xlsx_sheets("./output/cleaned_dfs/sterilized/labeled/Sample/QA/EERA_R3_KDR_Tool2_Public_School_Light_Sample.xlsx")
# t3_sample <- read_xlsx_sheets("./output/cleaned_dfs/sterilized/labeled/Sample/QA/EERA_R3_KDR_Tool3_Public_School_Headcount_Sample.xlsx")
# t4_sample <- read_xlsx_sheets("./output/cleaned_dfs/sterilized/labeled/Sample/QA/EERA_R3_KDR_Tool4_Public_School_Teacher_Sample.xlsx")
# t5_sample <- read_xlsx_sheets("./output/cleaned_dfs/sterilized/labeled/Sample/QA/EERA_R3_KDR_Tool5_Public_School_WASH_Sample.xlsx")
# t6_sample <- read_xlsx_sheets("./output/cleaned_dfs/sterilized/labeled/Sample/QA/EERA_R3_KDR_Tool6_Public_School_&_CBE_Parent_Sample.xlsx")
# t7_sample <- read_xlsx_sheets("./output/cleaned_dfs/sterilized/labeled/Sample/QA/EERA_R3_KDR_Tool7_Public_School_&_CBE_Shura_Sample.xlsx")
# 
# df1 <- clean_data.tool7_for_client
# df2 <- t7_sample
# 
# length(df1) == length(df2)
# # names(df1)
# # sheet = "Support_Respondents"
# for(sheet in names(df1)){
#   # print(names(df1[[sheet]][!names(df1[[sheet]]) %in% names(df2[[sheet]])]))
#   print(names(df2[[sheet]][!names(df2[[sheet]]) %in% names(df1[[sheet]])]))
# }



# export sample dfs -------------------------------------------------------
# source("R/adhoc_scripts/sample_dfs.R")


# change 7777, 8888, 9999 to Labels  -------------------------------------- DONE
source("R/recode_to_na.R")


# export data sets and issues ---------------------------------------------
source("R/export_outputs.R")
