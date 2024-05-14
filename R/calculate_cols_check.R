Coalesce = function(var) ifelse(is.na(var), 0, var)

# create the necessary columns --------------------------------------------

# Tool 1
clean_data.tool1$data <- clean_data.tool1$data |> 
  mutate(
    # Type_Of_School_Sample_Value
    Type_Of_School_Sample_Value.re_calc = case_when(
      Type_Of_School_CBE_Based_On_The_Sample == "Primary" ~ 1,
      Type_Of_School_CBE_Based_On_The_Sample == "Secondary" ~ 2,
      Type_Of_School_CBE_Based_On_The_Sample == "Higher Secondary" ~ 3,
      TRUE ~ NA_real_
    ),
    # School_Type_Final
    School_Type_Final.re_calc = case_when(
      A30 == 1 ~ as.character(Type_Of_School_Sample_Value),
      A30 == 0 | A30 == 2 ~ as.character(School_Type_SV),
      TRUE ~ "3"
    ),
    # School_indx
    School_indx.re_calc = case_when(
      School_Type_Final == 3 ~ "1 2 3 4 5 6 7 8 9 10 11 12",
      School_Type_Final == 2 ~ "1 2 3 4 5 6 7 8 9",
      School_Type_Final == 1 ~ "1 2 3 4 5 6",
      TRUE ~ NA_character_
    ),
    School_rep.re_calc = ifelse(!is.na(School_indx),as.integer(str_count(School_indx," ")+1),School_rep)
  )

# Tool 2 
clean_data.tool2$data <- clean_data.tool2$data |>
  mutate(
    School_indx.re_calc = case_when(
      School_Type_SV == 3 ~ "1 2 3 4 5 6 7 8 9 10 11 12",
      School_Type_SV == 2 ~ "1 2 3 4 5 6 7 8 9",
      School_Type_SV == 1 ~ "1 2 3 4 5 6",
      TRUE ~ ""
    ),
    
    School_rep.re_calc = str_count(School_indx.re_calc, " ") + 1
  )


# compare the calculated values before and after logs replaced ----------------
calculate_issues <- plyr::rbind.fill(

  # Tool 1 
  clean_data.tool1$data |> 
    filter(Type_Of_School_Sample_Value != Type_Of_School_Sample_Value.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Type_Of_School_Sample_Value",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = Type_Of_School_Sample_Value,
           new_value = Type_Of_School_Sample_Value.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$data |> 
    filter(School_Type_Final != School_Type_Final.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="School_Type_Final",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = School_Type_Final,
           new_value = School_Type_Final.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$data |> 
    filter(School_indx != School_indx.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="school_indx",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = School_indx,
           new_value = School_indx.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$data |> 
    filter(School_rep != School_rep.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="School_rep",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = School_rep,
           new_value = School_rep.re_calc, issue, tool, sheet, KEY),
  
  # Tool 2
  clean_data.tool2$data |> 
    filter(School_indx != School_indx.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="School_indx",
      tool = "Tool 2 - Light",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = School_indx,
           new_value = School_indx.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool2$data |> 
    filter(School_rep != School_rep.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="School_rep",
      tool = "Tool 2 - Light",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = School_rep,
           new_value = School_rep.re_calc, issue, tool, sheet, KEY)
  
)


# remove extra indicators that were created in above -------------------------------
clean_data.tool1$data <- clean_data.tool1$data |> select(-ends_with(".re_calc"))
clean_data.tool2$data <- clean_data.tool2$data |> select(-ends_with(".re_calc"))
clean_data.tool3$data <- clean_data.tool3$data |> select(-ends_with(".re_calc"))
clean_data.tool5$data <- clean_data.tool5$data |> select(-ends_with(".re_calc"))
