#
# The common code for downloading the file, parsing, and filter it
# is in the assignmentUtils.R.
#
# author: Szymon Lipiński

source("utils.R")
source("assignmentUtils.R")

install_package("crayon")
install_package("tidyverse")

library(crayon)
library(tidyverse)

clear()

# We need an additional column for the data set, it should have both Date
# and Time columns combined:

data <- mutate(
    data,
    DateTime=as.POSIXct(paste(data$Date,data$Time),
                        format = "%Y-%m-%d %H:%M"))

png(width=480, height=480, filename="plot2.png")
plot(
    data$DateTime,
    data$Global_active_power,
    ylab="Global Active Power (kilowatts)",
    xlab="",
    type="n"
)

lines(
    data$DateTime,
    data$Global_active_power
)

dev.off()
cat_green("plot2.png ready")