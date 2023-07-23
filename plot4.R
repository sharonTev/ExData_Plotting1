setwd("C:/Users/sharonha.WISMAIN/Box/courses/Coursera - Data analysis/Assignment1")
house_hold_power = "household_power_consumption.txt"
data = read.table(house_hold_power, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#the part of data needed
data_needed = data[data$Date %in% c("1/2/2007","2/2/2007") ,]

date_time <- strptime(paste(data_needed $Date, data_needed $Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


png("plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2)) 
globalActivePower <- as.numeric(data_needed $Global_active_power)
globalReactivePower <- as.numeric(data_needed $Global_reactive_power)
voltage <- as.numeric(data_needed $Voltage)
subMetering1 <- as.numeric(data_needed $Sub_metering_1)
subMetering2 <- as.numeric(data_needed $Sub_metering_2)
subMetering3 <- as.numeric(data_needed $Sub_metering_3)

plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(date_time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
