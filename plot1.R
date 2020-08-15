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
hist(datahousehold$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frecuency")
dev.copy(png, file = "plot1.png")
dev.off()