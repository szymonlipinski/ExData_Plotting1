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

png(width=480, height=480, filename="plot1.png")
hist(
    data$Global_active_power,
    main="Global Active Power",
    ylab="Frequency",
    xlab="Global Active Power (kilowatts)",
    col="red"
)

dev.off()
cat_green("plot1.png ready")