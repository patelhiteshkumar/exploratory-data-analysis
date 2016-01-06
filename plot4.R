#Read the data provided as part of the course project 1
data = read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

#Filter the data to retain the required rows
data1 <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Concatenate the Data and Time parameters
date_time <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Retain the column for which the chart is to be plotted
globalActivePower <- as.numeric(data1$Global_active_power)
globalReactivePower <- as.numeric(data1$Global_reactive_power)
voltage <- as.numeric(data1$Voltage)
subMetering1 <- as.numeric(data1$Sub_metering_1)
subMetering2 <- as.numeric(data1$Sub_metering_2)
subMetering3 <- as.numeric(data1$Sub_metering_3)

#set device type
png("plot4.png", width=480, height=480)

#Define the no. of rows and columns
par(mfrow = c(2, 2))

#plot the chart1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#plot chart2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#plot chart3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

#Put the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#plot chart4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

#Turn off the device
dev.off()
