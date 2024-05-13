source("./R/functions/convert_numbers_to_date.R")

date_time_cols <- c("SubmissionDate", "starttime", "endtime")

raw_data.tool1$data <- convert_to_date_time(raw_data.tool1$data, date_time_cols)
raw_data.tool2$data <- convert_to_date_time(raw_data.tool2$data, date_time_cols)
raw_data.tool3$data <- convert_to_date_time(raw_data.tool3$data, date_time_cols)
raw_data.tool4$data <- convert_to_date_time(raw_data.tool4$data, date_time_cols)
raw_data.tool5$data <- convert_to_date_time(raw_data.tool5$data, date_time_cols)
raw_data.tool6$data <- convert_to_date_time(raw_data.tool6$data, date_time_cols)
raw_data.tool7$data <- convert_to_date_time(raw_data.tool7$data, date_time_cols)

raw_data.tool2$data <- convert_to_date(raw_data.tool2$data, 'G4')
raw_data.tool3$Todays_Attendance_Detail <- convert_to_date(raw_data.tool3$Todays_Attendance_Detail, 'D2')
