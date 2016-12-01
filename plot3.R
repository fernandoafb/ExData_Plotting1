dataset <- read.csv(file = "household_power_consumption.txt", sep = ";", 
                    colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric",
                                   "numeric", "numeric", "numeric"), na.strings = "?")
dataset$Date <- as.Date(x = dataset$Date, format = "%d/%m/%Y")
dataset <- subset(dataset, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
dataset$datetime <- as.POSIXct(paste(dataset$Date, dataset$Time))

png("plot3.png", width = 480, height = 480)
with(dataset, plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(dataset, lines(datetime, Sub_metering_1, col = "black"))
with(dataset, lines(datetime, Sub_metering_2, col = "red"))
with(dataset, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, lwd = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"))
dev.off()