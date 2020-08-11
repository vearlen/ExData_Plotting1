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

# Plot 1 ------------------------------------------------------------------

png("Plot1.png")
hist(house_sub$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")
dev.off()