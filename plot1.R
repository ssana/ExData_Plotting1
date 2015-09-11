houseHoldPowerCons <- read.table("F:././RProgData/household_power_consumption.txt", sep = ";", colClasses=c("character", "character", rep("numeric",7)), col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), na.strings = "?", skip = 1)
dataSet <- houseHoldPowerCons[grepl("^1/2/2007|^2/2/2007", houseHoldPowerCons$Date), ]
dataSet <- dataSet[!is.na(dataSet$Global_active_power), ]
png("plot1.png", width = 480, height = 480)
hist(dataSet$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")
dev.off()
