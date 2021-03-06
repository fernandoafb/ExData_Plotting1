dataset <- read.csv(file = "household_power_consumption.txt", sep = ";", 
                    colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric",
                                   "numeric", "numeric", "numeric"), na.strings = "?")
dataset$Date <- as.Date(x = dataset$Date, format = "%d/%m/%Y")
dataset <- subset(dataset, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
dataset$datetime <- as.POSIXct(paste(dataset$Date, dataset$Time))

png("plot1.png", width = 480, height = 480)
hist(dataset$Global_active_power, 
     main = "Global Active Power", 
     col = "red", 
     xlab = "Global Active Power (kilowatts)")
dev.off()