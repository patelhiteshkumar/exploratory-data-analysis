#Read the data provided
data = read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

#Filter the data to retain the required rows
data1 <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Concatenate the Data and Time parameters
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Retain the column for which the chart is to be plotted
globalActivePower <- as.numeric(data1$Global_active_power)

#set device type
png("plot2.png", width=480, height=480)

#plot chart
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Turn off the device
dev.off()

