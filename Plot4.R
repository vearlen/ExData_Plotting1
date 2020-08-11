#download data and unzip----------------
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "ExData.zip", method = "curl")
unzip("ExData.zip")
#import file into R
household_power_consumption <- read.csv("household_power_consumption.txt", 
                                        sep=";", na.strings="?")


# subset data -------------------------------------------------------------
library(dplyr)

house_sub <- household_power_consumption %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007") 

house_sub$DateTime <- strptime(paste(house_sub$Date, house_sub$Time), 
                               format="%d/%m/%Y %H:%M:%S")

# Plot 4 ------------------------------------------------------------------
png("Plot4.png")
par(mfrow = c(2,2)) 
plot(as.POSIXct(paste(house_sub$Date,house_sub$Time), format = "%d/%m/%Y %H:%M:%S"),
     house_sub$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")
plot(as.POSIXct(paste(house_sub$Date,house_sub$Time), format = "%d/%m/%Y %H:%M:%S"),
     house_sub$Voltage, type = "l",
     xlab = "", ylab = "Voltage")
plot(as.POSIXct(paste(house_sub$Date,house_sub$Time), format = "%d/%m/%Y %H:%M:%S"),
     house_sub$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
points(as.POSIXct(paste(house_sub$Date,house_sub$Time), format = "%d/%m/%Y %H:%M:%S"),
       house_sub$Sub_metering_2, type = "l", col = "red",
       xlab = "", ylab = "Energy sub metering")
points(as.POSIXct(paste(house_sub$Date,house_sub$Time), format = "%d/%m/%Y %H:%M:%S"),
       house_sub$Sub_metering_3, type = "l", col = "blue",
       xlab = "", ylab = "Energy sub metering")
legend("topright",lwd = 2,lty = 1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), bty = "n",cex = .9)
plot(as.POSIXct(paste(house_sub$Date,house_sub$Time), format = "%d/%m/%Y %H:%M:%S"),
     house_sub$Global_reactive_power, type = "l",
     xlab = "", ylab = "Global_reactive_power")

dev.off()