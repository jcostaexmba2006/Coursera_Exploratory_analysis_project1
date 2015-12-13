## PLOT 3 
#load libraries
library(graphics)
library(grDevices)
#load data
data<- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, 
                  header = TRUE, na.strings = "?", dec = ".", comment.char = "")
#select data
subsetdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

#coerce to datetime
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plotting 
globalActivePower <- as.numeric(subsetdata$Global_active_power)
SubMetering1<- as.numeric(subsetdata$Sub_metering_1)
SubMetering2<- as.numeric(subsetdata$Sub_metering_2)
SubMetering3<- as.numeric(subsetdata$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(datetime, SubMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime,SubMetering2,col="red")
lines(datetime,SubMetering3,col="blue")
legend("topright",c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),lty=1,col = c("black","red","blue"))
dev.off()