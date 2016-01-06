#Read the data provided as part of the Course project 1
data = read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

#Filter the data to retain the required rows
data1 <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Concatenate the Data and Time parameters
date_time <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Retain the column for which the chart is to be plotted
globalActivePower <- as.numeric(data1$Global_active_power)

subMetering1 <- as.numeric(data1$Sub_metering_1)
subMetering2 <- as.numeric(data1$Sub_metering_2)
subMetering3 <- as.numeric(data1$Sub_metering_3)

#set device type
png("plot3.png", width=480, height=480)

#plot chart
plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")

#Put legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Turn off the device
dev.off()
