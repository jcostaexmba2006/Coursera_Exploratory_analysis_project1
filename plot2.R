## PLOT 2 
#load libraries
library(graphics)
library(grDevices)
library(lubridate)
#load data
data<- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, 
                  header = TRUE, na.strings = "?", dec = ".", comment.char = "")
#select data
subsetdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#coerce to datetime
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plotting 
globalActivePower <- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
