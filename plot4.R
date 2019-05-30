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


png(width=480, height=480, filename="plot4.png")

par(mfrow=c(2,2))

# 1st plot
plot(
    data$DateTime,
    data$Global_active_power,
    ylab="Global Active Power",
    xlab="",
    type="n"
)

lines(
    data$DateTime,
    data$Global_active_power
)

# 2nd plot
plot(
    data$DateTime,
    data$Voltage,
    ylab="Voltage",
    xlab="datetime",
    type="n"
)

lines(
    data$DateTime,
    data$Voltage
)

# 3rd plot

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
    lty=c(1, 1, 1),
    bty="n"
)

# 4th plot
plot(
    data$DateTime,
    data$Global_reactive_power,
    ylab="Global_reactive_power",
    xlab="datetime",
    type="n"
)

lines(
    data$DateTime,
    data$Global_reactive_power
)


dev.off()
cat_green("plot4.png ready")