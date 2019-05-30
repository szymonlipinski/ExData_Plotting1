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

png(width=480, height=480, filename="plot3.png")
plot(
    data$DateTime,
    data$Sub_metering_1,
    ylab="Energy sub metering",
    xlab="",
    type="n"
)

lines(
    data$DateTime,
    data$Sub_metering_1
)

lines(
    data$DateTime,
    data$Sub_metering_2,
    col="red"
)

lines(
    data$DateTime,
    data$Sub_metering_3,
    col="blue"
)

legend(
    "topright",
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    col=c("black", "red", "blue"),
    lty=c(1, 1, 1)
)
dev.off()
cat_green("plot3.png ready")