## PLOT 4 
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
globalActivePower <- as.numeric(subsetdata$Global_active_power)
GlobalReactivePower<-as.numeric(subsetdata$Global_rective_power)
SubMetering1<- as.numeric(subsetdata$Sub_metering_1)
SubMetering2<- as.numeric(subsetdata$Sub_metering_2)
SubMetering3<- as.numeric(subsetdata$Sub_metering_3)
Voltage<- as.numeric(subsetdata$Voltage)

#plotting 
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#plot 1 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#plot 2
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
#plot 3
plot(datetime, SubMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime,SubMetering2,col="red")
lines(datetime,SubMetering3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#plot 4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
