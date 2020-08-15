## Reading data from working directory
fileName <- "household_power_consumption.txt"
dataNames <- names(read.table(fileName, nrow = 1, header = TRUE, sep=";"))
datahousehold <- read.table(fileName,
                            na.strings = "?",
                            sep = ";",
                            header = FALSE,
                            col.names = dataNames,
                            skip = grep("^[1,2]/2/2007", readLines(fileName)) - 1,
                            nrow = 2879)
## Setting a new column with dates and hours
library(lubridate)
datahousehold$DateTime <- ymd_hms(paste(datahousehold$Date, datahousehold$Time))
## Creating the line graph
plot(x = datahousehold$DateTime,
     y = datahousehold$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     type = "l",
     xlab = "")
## Coping it to a .png file
dev.copy(png, file = "plot2.png")
dev.off()