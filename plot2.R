#
# Course 4: Exploratory Data Analysis
# Project 1: Electric Power Consumption
# Plot 2
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

#Generate Plot 2
plot(subpower$Global_active_power ~ subpower$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#Save as PNG
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
