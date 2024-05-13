tool1 <- read_excel("./input/tools/Tool 1.EERA Public School - Headmaster_Principle Interview - V3.xlsx") %>%  mutate(name = trimws(name))
tool2 <- read_excel("./input/tools/Tool 2.EERA Public School - Light Tool - V3.xlsx") %>%  mutate(name = trimws(name))
tool3 <- read_excel("./input/tools/Tool 3.EERA Public School - Student Document & Headcount - V3.xlsx") %>%  mutate(name = trimws(name))
tool4 <- read_excel("./input/tools/Tool 4.EERA Public School - Teacher Tool - V3.xlsx") %>%  mutate(name = trimws(name))
tool5 <- read_excel("./input/tools/Tool 5.EERA Public School - WASH Observation - V3.xlsx") %>%  mutate(name = trimws(name))
tool6 <- read_excel("./input/tools/Tool 6.EERA Public School- Parent Tool - V3.xlsx") %>%  mutate(name = trimws(name))
tool7 <- read_excel("./input/tools/Tool 7.EERA Public School - Shura Tool - V3.xlsx") %>%  mutate(name = trimws(name))

relevancy_file_tool <- list(
  tool1 = create_relevancy_file(tool1, pull(tool1[which(endsWith(tool1$name, "_Translation") | endsWith(tool1$name, "_QA") | endsWith(tool1$name, "_caption") | endsWith(tool1$name, "_Caption") |
                                                                           endsWith(tool1$name, "_Caption")), "name"])),
  tool2 = create_relevancy_file(tool2, pull(tool2[which(endsWith(tool2$name, "_Translation") | endsWith(tool2$name, "_QA") | endsWith(tool2$name, "_caption") | endsWith(tool2$name, "_Caption") |
                                                                           endsWith(tool2$name, "_Caption")), "name"])),
  tool3 = create_relevancy_file(tool3, pull(tool3[which(endsWith(tool3$name, "_Translation") | endsWith(tool3$name, "_QA") | endsWith(tool3$name, "_caption") | endsWith(tool3$name, "_Caption") |
                                                                           endsWith(tool3$name, "_Caption")), "name"])),
  tool4 = create_relevancy_file(tool4, pull(tool4[which(endsWith(tool4$name, "_Translation") | endsWith(tool4$name, "_QA") | endsWith(tool4$name, "_caption") | endsWith(tool4$name, "_Caption") |
                                                                           endsWith(tool4$name, "_Caption")), "name"])),
  tool5 = create_relevancy_file(tool5, pull(tool5[which(endsWith(tool5$name, "_Translation") | endsWith(tool5$name, "_QA") | endsWith(tool5$name, "_caption") | endsWith(tool5$name, "_Caption") |
                                                                           endsWith(tool5$name, "_Caption")), "name"])),
  tool6 = create_relevancy_file(tool6, pull(tool6[which(endsWith(tool6$name, "_Translation") | endsWith(tool6$name, "_QA") | endsWith(tool6$name, "_caption") | endsWith(tool6$name, "_Caption") |
                                                                           endsWith(tool6$name, "_Caption")), "name"])),
  tool7 = create_relevancy_file(tool7, pull(tool7[which(endsWith(tool7$name, "_Translation") | endsWith(tool7$name, "_QA") | endsWith(tool7$name, "_caption") | endsWith(tool7$name, "_Caption") |
                                                                           endsWith(tool7$name, "_Caption")), "name"]))
)

x <- function (df, df_name) write.xlsx(df, paste0("input/relevancy_files/relevancy_file_", df_name, ".xlsx"))

mapply(x, relevancy_file_tool, names(relevancy_file_tool))
