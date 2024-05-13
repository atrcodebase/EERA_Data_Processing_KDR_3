## Turn values to Lables -------------------------------------------------------
# Tool 2
clean_data.tool2$Public_Stationary_Kit_Group <- clean_data.tool2$Public_Stationary_Kit_Group |>
  mutate(
    H9_Yes = as.character(H9_Yes),
    H9_Yes = case_when(
      H9_Yes == "9999" ~ "Don't wish to respond",
      H9_Yes == "8888" ~ "I don't know",
      TRUE ~ H9_Yes
    )
  )

# clean_data.tool2$Students_Pack_Group <- clean_data.tool2$Students_Pack_Group |>
#   mutate(
#     J9_Yes = as.character(J9_Yes),
#     J9_Yes = case_when(
#       J9_Yes == "9999" ~ "Don't with to respond",
#       J9_Yes == "8888" ~ "I don't know",
#       TRUE ~ J9_Yes
#     )
#   )

#  Tool 3
clean_data.tool3$Student_Headcount <- clean_data.tool3$Student_Headcount |>
  mutate(
    E3_Total_Students = as.character(E3_Total_Students),
    E3_Total_Students = case_when(
      E3_Total_Students == "8888" ~ "I don't know",
      TRUE ~ E3_Total_Students
    ),
    
    E3_Regularly_Present = as.character(E3_Regularly_Present),
    E3_Regularly_Present = case_when(
      E3_Regularly_Present == "8888" ~ "I don't know",
      TRUE ~ E3_Regularly_Present
    ),
    
    E3_Permanently_Absent = as.character(E3_Permanently_Absent),
    E3_Permanently_Absent = case_when(
      E3_Permanently_Absent == "8888" ~ "I don't know",
      TRUE ~ E3_Permanently_Absent
    )
  )

# # Tool 4
# 
# 
# # Tool 5
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
clean_data.tool6$data <- clean_data.tool6$data |> 
  mutate(
    B6 = as.character(B6),
    B6 = case_when(
      B6 == "9999" ~ "Don't wish to respond",
      B6 == "8888" ~ "I don't know",
      TRUE ~ B6
    )
  )


# # Tool 8
# clean_data.tool8_for_client$data <- clean_data.tool8_for_client$data |>
#   mutate(
#     J2 = as.character(J2),
#     J2 = case_when(
#       J2 == 0 ~ "Not applicable/No Male Student",
#       TRUE ~ J2
#     ),
#     
#     J3 = as.character(J3),
#     J3 = case_when(
#       J3 == 0 ~ "Not applicable/No Female Student",
#       TRUE ~ J3
#     ),
#     
#     N4 = as.character(N4),
#     N4 = case_when(
#       N4 == "9999" ~ "Don't wish to respond",
#       N4 == "8888" ~ "I don't know",
#       TRUE ~ N4
#     ),
#     
#     P4 = as.character(P4),
#     P4 = case_when(
#       P4 == "9999" ~ "Don't wish to respond",
#       P4 == "8888" ~ "I don't know",
#       TRUE ~ P4
#     ),
#     
#     R4 = as.character(R4),
#     R4 = case_when(
#       R4 == "9999" ~ "Don't wish to respond",
#       R4 == "8888" ~ "I don't know",
#       TRUE ~ R4
#     ),
#   )


# clean_data.tool8_for_client$Section_2_4_Student_Ages <- clean_data.tool8_for_client$Section_2_4_Student_Ages |>
#   mutate(
#     K1 = as.character(K1),
#     K1 = case_when(
#       K1 == "9999" ~ "Don't wish to respond",
#       K1 == "8888" ~ "I don't know",
#       TRUE ~ K1
#     ),
#     
#     K2 = as.character(K2),
#     K2 = case_when(
#       K2 == "9999" ~ "Don't wish to respond",
#       K2 == "8888" ~ "I don't know",
#       TRUE ~ K2
#     )
#   )

# clean_data.tool8_for_client$Classroom_Materials <- clean_data.tool8_for_client$Classroom_Materials |>
#   mutate(
#     O4 = as.character(O4),
#     O4 = case_when(
#       O4 == "9999" ~ "Don't wish to respond",
#       O4 == "8888" ~ "I don't know",
#       TRUE ~ O4
#     )
#   )
# 
# clean_data.tool8_for_client$Teacher_Kit <- clean_data.tool8_for_client$Teacher_Kit |>
#   mutate(
#     Q4 = as.character(Q4),
#     Q4 = case_when(
#       Q4 == "9999" ~ "Don't wish to respond",
#       Q4 == "8888" ~ "I don't know",
#       TRUE ~ Q4
#     )
#   )
# 
# clean_data.tool8_for_client$Student_Kit <- clean_data.tool8_for_client$Student_Kit |>
#   mutate(
#     S4 = as.character(S4),
#     S4 = case_when(
#       S4 == "9999" ~ "Don't wish to respond",
#       S4 == "8888" ~ "I don't know",
#       TRUE ~ S4
#     )
#   )
# 
# clean_data.tool8_for_client$V_list_of_all_members <- clean_data.tool8_for_client$V_list_of_all_members |>
#   mutate(
#     V_Male_Member = as.character(V_Male_Member),
#     V_Male_Member = case_when(
#       V_Male_Member == "9999" ~ "Don't wish to respond",
#       V_Male_Member == "8888" ~ "I don't know",
#       TRUE ~ V_Male_Member
#     ),
#     
#     V_Female_Member = as.character(V_Female_Member),
#     V_Female_Member = case_when(
#       V_Female_Member == "9999" ~ "Don't wish to respond",
#       V_Female_Member == "8888" ~ "I don't know",
#       TRUE ~ V_Female_Member
#     )
#   )


# # Tool 9
# clean_data.tool9_for_client$data <- clean_data.tool9_for_client$data |>
#   mutate(
#     A12_Female_Numbers = as.character(A12_Female_Numbers),
#     A12_Female_Numbers = case_when(
#       A12_Female_Numbers == "9999" ~ "Don't wish to respond",
#       A12_Female_Numbers == "8888" ~ "I don't know",
#       TRUE ~ A12_Female_Numbers
#     ),
#     
#     A12_Male_Numbers = as.character(A12_Male_Numbers),
#     A12_Male_Numbers = case_when(
#       A12_Male_Numbers == "9999" ~ "Don't wish to respond",
#       A12_Male_Numbers == "8888" ~ "I don't know",
#       TRUE ~ A12_Male_Numbers
#     ),
#     
#     A14_Female_Numbers = as.character(A14_Female_Numbers),
#     A14_Female_Numbers = case_when(
#       A14_Female_Numbers == "9999" ~ "Don't wish to respond",
#       A14_Female_Numbers == "8888" ~ "I don't know",
#       TRUE ~ A14_Female_Numbers
#     ),
#     
#     A14_Male_Numbers = as.character(A14_Male_Numbers),
#     A14_Male_Numbers = case_when(
#       A14_Male_Numbers == "9999" ~ "Don't wish to respond",
#       A14_Male_Numbers == "8888" ~ "I don't know",
#       TRUE ~ A14_Male_Numbers
#     )
#   )


