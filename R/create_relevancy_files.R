library(atRfunctions)

# Read the tools ---------------------------------------------------------------
tool1 <- read_excel("./input/tools/Tool 1_EERA School Indepth Visit_Principal Interview_R2.xlsx") %>%  mutate(name = trimws(name))
tool2 <- read_excel("./input/tools/Tool 2_EERA School Light Tool_R2.xlsx") %>%  mutate(name = trimws(name))
tool3 <- read_excel("./input/tools/Tool 3_EERA School Student Documents and Headcount Monitoring_R2.xlsx") %>%  mutate(name = trimws(name))
tool4 <- read_excel("./input/tools/Tool 4_EERA School Teacher Interview_R2.xlsx") %>%  mutate(name = trimws(name))
tool5 <- read_excel("./input/tools/Tool 5_EERA School WASH Monitoring_R2.xlsx") %>%  mutate(name = trimws(name))
tool6 <- read_excel("./input/tools/Tool 6_EERA School_CBE Student Parent Interview_R2.xlsx") %>%  mutate(name = trimws(name))
tool7 <- read_excel("./input/tools/Tool 7_EERA School_CBE Shura Member Interview_R2.xlsx") %>%  mutate(name = trimws(name))
tool8 <- read_excel("./input/tools/Tool 8_EERA CBE_Teacher Interview_R2.xlsx") %>%  mutate(name = trimws(name))
tool9 <- read_excel("./input/tools/Tool 9_EERA CBE_IP Interview_R2.xlsx") %>%  mutate(name = trimws(name))

# Create the relevancy Files ---------------------------------------------------
relevancy_file1 <- create_relevancy_file(tool1, c('A32', 'B19', 'F2', 'F4', 'J24', 'L2', 'Please_Add_Any_Relevant_Photo', 'Surveyor_Comments',
                                                  'A32_Caption', 'B19_Caption', 'F2_Caption', 'F4_Caption', 'J24_Caption', 'L2_Caption', "Please_Add_Any_Relevant_Photo_caption"))

relevancy_file2 <- create_relevancy_file(tool2, c('C14_Audio', 'Surveyor_Comments', 'B5', 'Photo_closure_1', 'Photo_closure_2', 'G6', 'H15', 'H15_Not_In_Use','i15', 'i15_Not_In_Use',
                                                  'J15', 'J15_Not_In_Use', 'Please_Add_Any_Relevant_Photo', 'B5_Caption', 'Photo_closure_1_Caption', 'Photo_closure_2_Caption',
                                                  'G6_Caption',  'H15_Caption',  'H15_Not_In_Use_Caption', 'i15_Caption', 'i15_Not_In_Use_Caption', 'J15_Caption' , 'J15_Not_In_Use_Caption',
                                                  'Please_Add_Any_Relevant_Photo_caption'))

relevancy_file3 <- create_relevancy_file(tool3, c('No_Please_Explain', 'Surveyor_Comments', 'C1A2', 'D4', 'D4_2', 'D8', 'D8_2', 'E2', 'E2_2', 'Please_Add_Any_Relevant_Photo',
                                                  'C1A2_Caption', 'D4_Caption', 'D4_2_Caption', 'D8_Caption', 'D8_2_Caption', 'E2_Caption', 'E2_2_Caption', 'Please_Add_Any_Relevant_Photo_caption'))

relevancy_file4 <- create_relevancy_file(tool4, c('Surveyor_Comments', 'Please_Add_Any_Relevant_Photo', 'Please_Add_Any_Relevant_Photo_caption'))

relevancy_file5 <- create_relevancy_file(tool5, c('C5_Other_Audio', 'C7_Other_Audio', 'Surveyor_Comments', 'C3', 'Under_Construction_Toilet_Photo', 'Useable_Toilet_Photo', 'Non_Useable_Toilet_Photo',
                                                  'C11', 'Please_Add_Any_Relevant_Photo', 'C3_Caption', 'Under_Construction_Toilet_Photo_Caption', 'Useable_Toilet_Photo_Caption',
                                                  'Non_Useable_Toilet_Photo_Caption', 'C11_1_Caption', 'Please_Add_Any_Relevant_Photo_caption'))

relevancy_file6 <- create_relevancy_file(tool6, c('Surveyor_Comments'))

relevancy_file7 <- create_relevancy_file(tool7, c( 'Surveyor_Comments', 'C10_image', 'C10_image_Caption'))

relevancy_file8 <- create_relevancy_file(tool8, c('Surveyor_Comments', 'B5', 'B5_2', 'E22_Photo1', 'E22_Photo2', 'E22_Photo3', 'J4_Students_Enrolment_Book_Photo', 'O10', 'O10_Not_In_Use',
                                                  'Q10', 'Q10_Not_In_Use', 'S10', 'S10_Not_In_Use', 'W15', 'W18', 'W21', 'X6', 'Please_Add_Any_Relevant_Photo', 'B5_Caption', 'B5_2_Caption',
                                                  'E22_Photo1_Caption', 'E22_Photo2_Caption', 'E22_Photo3_Caption', 'J4_Students_Enrolment_Book_Photo_Caption', 'O10_Caption' ,
                                                  'O10_Not_In_Use_Caption' , 'Q10_Caption' , 'Q10_Not_In_Use_Caption' , 'S10_Caption' , 'S10_Not_In_Use_Caption' , 'W15_Caption' ,'W18_Caption' ,'W21_Caption' ,
                                                  'X6_Caption' , 'Please_Add_Any_Relevant_Photo_caption'))


relevancy_file9 <- create_relevancy_file(tool9, c('A15_Audio', 'Surveyor_Comments', 'A7_Photo1', 'A7_Photo2_QA_Photo', 'B2_Photo', 'B6_Logbook_Photo', 'Please_Add_Any_Relevant_Photo',
                                                  'A7_Photo1_Caption', 'A7_Photo2_QA_Photo_Caption', 'B2_Photo_Caption' , 'B6_Logbook_Photo_Caption' , 'Please_Add_Any_Relevant_Photo_caption'))

# Export outputs ---------------------------------------------------------------
write.xlsx(relevancy_file1, "./input/relevancy_files/relevancy_file_tool1.xlsx")
write.xlsx(relevancy_file2, "./input/relevancy_files/relevancy_file_tool2.xlsx")
write.xlsx(relevancy_file3, "./input/relevancy_files/relevancy_file_tool3.xlsx")
write.xlsx(relevancy_file4, "./input/relevancy_files/relevancy_file_tool4.xlsx")
write.xlsx(relevancy_file5, "./input/relevancy_files/relevancy_file_tool5.xlsx")
write.xlsx(relevancy_file6, "./input/relevancy_files/relevancy_file_tool6.xlsx")
write.xlsx(relevancy_file7, "./input/relevancy_files/relevancy_file_tool7.xlsx")
write.xlsx(relevancy_file8, "./input/relevancy_files/relevancy_file_tool8.xlsx")
write.xlsx(relevancy_file9, "./input/relevancy_files/relevancy_file_tool9.xlsx")
