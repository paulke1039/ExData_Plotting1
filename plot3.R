#
# Course 4: Exploratory Data Analysis
# Project 1: Electric Power Consumption
# Plot 3
#
# Clear out environment and read in the data into 'power'
rm(list = ls())
power <- read.table("./data/household_power_consumption.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = F)

#Convert the Date field into Date class
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#Take a subset based on rows from Feb. 1, 2007 to Feb. 2, 2007 only.
subpower <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Get some memory back by removing the large dataset.
rm(power)

#Convert Date and Time into Date/Time class
subpower$DateTime <- strptime(paste(subpower$Date, subpower$Time), "%Y-%m-%d %H:%M:%S")
subpower$DateTime <- as.POSIXct(subpower$DateTime)

#Generate Plot 3
with(subpower, {
  plot(Sub_metering_1~DateTime, col='Black', type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save as PNG
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
