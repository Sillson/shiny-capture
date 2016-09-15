###
runData = read.csv("dump.csv")
runData$count_date <- as.Date(runData$count_date)