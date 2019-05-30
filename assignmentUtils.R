#
# The common code for the assignment to download the data file, parse it,
# and filter it
#
# author: Szymon Lipiński
#
source("utils.R")
data.url  <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
data.zip.path <- 'data.csv.zip'

download_file(data.url, data.zip.path, unzip=TRUE)
data <- read_delim(
    "household_power_consumption.txt",
    ";",
    col_types = list(
        col_date(format = "%d/%m/%Y"),
        col_time(),
        col_double(),
        col_double(),
        col_double(),
        col_double(),
        col_double(),
        col_double(),
        col_double()),
    na = c("?"),
    progress = FALSE
) %>% filter(Date %in% as.Date(c("2007-02-01", "2007-02-02")))