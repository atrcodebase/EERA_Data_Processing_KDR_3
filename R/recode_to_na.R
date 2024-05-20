# source("R/functions/to_na_function.R")

## Turn values to Lables -------------------------------------------------------
# Tool 1


# Tool 2
clean_data.tool2_for_client$Public_Stationary_Kit_Group <- clean_data.tool2_for_client$Public_Stationary_Kit_Group |>
  mutate(
    H9_Yes = as.character(H9_Yes),
    H9_Yes = case_when(
      H9_Yes == "9999" ~ "Don't wish to respond",
      H9_Yes == "8888" ~ "I don't know",
      TRUE ~ H9_Yes
    )
  )

# Tool 3


# Tool 4


# Tool 5
# clean_data.tool5_for_client$data <- clean_data.tool5_for_client$data |>
#   mutate(
#     C6_Male = as.character(C6_Male),
#     C6_Female = as.character(C6_Female),
#     C6_Unisex = as.character(C6_Unisex),
#     
#     C6_Male = case_when(
#       C6_Male == "777" ~ "Not Applicable",
#       TRUE ~ C6_Male
#     ),
#     
#     C6_Female = case_when(
#       C6_Female == "777" ~ "Not Applicable",
#       TRUE ~ C6_Female
#     ),
#     
#     C6_Unisex = case_when(
#       C6_Unisex == "777" ~ "Not Applicable",
#       TRUE ~ C6_Unisex
#     )
#   )

# Tool 6
clean_data.tool6_for_client$data <- clean_data.tool6_for_client$data |> 
  mutate(
    B6 = as.character(B6),
    B6 = case_when(
      B6 == "9999" ~ "Don't wish to respond",
      B6 == "8888" ~ "I don't know",
      TRUE ~ B6
    )
  )

# Tool 7

# clean_data.tool7_for_client$data <- clean_data.tool7_for_client$data |>
#   mutate(
#     C6_Number = as.character(C6_Number),
#     C6_Number = case_when(
#       C6_Number == "9999" ~ "Don't wish to respond",
#       C6_Number == "8888" ~ "I don't know",
#       TRUE ~ C6_Number
#     )
#   )


