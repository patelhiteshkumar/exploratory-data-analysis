#Read the data provided
data = read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

#Filter the data to retain the required rows
data1 <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Retain the column for which the histogram is to be plotted
globalActivePower <- as.numeric(data1$Global_active_power)

#set device type
png("plot1.png", width=480, height=480)

#plot histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Turn off the device
dev.off()

