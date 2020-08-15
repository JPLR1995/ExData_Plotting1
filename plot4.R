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
## Setting the graphic device to produce 4 graphics
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))
## Creating first line graph
plot(x = datahousehold$DateTime,
     y = datahousehold$Global_active_power,
     ylab = "Global Active Power",
     type = "l",
     xlab = "")
## Creating second line graph
plot(x = datahousehold$DateTime,
     y = datahousehold$Voltage,
     ylab = "Voltage",
     type = "l",
     xlab = "datetime")
## Creating third line graph
plot(x = datahousehold$DateTime,
     y = datahousehold$Sub_metering_1,
     type = "n",
     xlab = "",
     ylab = "Energy sub metering")
points(x = datahousehold$DateTime,
       y = datahousehold$Sub_metering_1,
       col = "black",
       type = "l")
points(x = datahousehold$DateTime,
       y = datahousehold$Sub_metering_2,
       col = "red",
       type = "l")
points(x = datahousehold$DateTime,
       y = datahousehold$Sub_metering_3,
       col = "blue",
       type = "l")
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
## Creating fourth line graph
plot(x = datahousehold$DateTime,
     y = datahousehold$Global_reactive_power,
     ylab = "Global_reactive_power",
     type = "l",
     xlab = "datetime")
## Coping it to a .png file
dev.copy(png, file = "plot4.png")
dev.off()