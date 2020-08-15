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
## Creating the histogram
hist(datahousehold$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frecuency")
## Coping it to a .png file
dev.copy(png, file = "plot1.png")
dev.off()