houseHoldPowerCons <- read.table("F:././RProgData/household_power_consumption.txt", sep = ";", colClasses=c("character", "character", rep("numeric",7)), col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), na.strings = "?", skip = 1)
dataSet <- houseHoldPowerCons[grepl("^1/2/2007|^2/2/2007", houseHoldPowerCons$Date), ]
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(strptime(paste(dataSet$Date, dataSet$Time), "%d/%m/%Y %H:%M:%S"), dataSet$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type ="l")
plot(strptime(paste(dataSet$Date, dataSet$Time), "%d/%m/%Y %H:%M:%S"), dataSet$Voltage, xlab = "dateTime", ylab = "Voltage", type = "l")
plot(strptime(paste(dataSet$Date, dataSet$Time), "%d/%m/%Y %H:%M:%S"), dataSet$Sub_metering_1, xlab="", ylab = "Energy sub metering", type ="l")
lines(strptime(paste(dataSet$Date, dataSet$Time), "%d/%m/%Y %H:%M:%S"), dataSet$Sub_metering_2, col = "red")
lines(strptime(paste(dataSet$Date, dataSet$Time), "%d/%m/%Y %H:%M:%S"), dataSet$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
plot(strptime(paste(dataSet$Date, dataSet$Time), "%d/%m/%Y %H:%M:%S"), dataSet$Global_reactive_power, xlab = "dateTime", ylab = "Global_reactive_power", type = "l")
dev.off()