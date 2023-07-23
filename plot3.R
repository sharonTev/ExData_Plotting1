setwd("C:/Users/sharonha.WISMAIN/Box/courses/Coursera - Data analysis/Assignment1")
house_hold_power = "household_power_consumption.txt"
data = read.table(house_hold_power, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#the part of data needed

data_needed = data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Sys.setlocale("LC_TIME", "English")
date_time = strptime(paste(data_needed$Date, data_needed$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower = as.numeric(data_needed$Global_active_power)

subMetering1 = as.numeric(data_needed$Sub_metering_1)
subMetering2 = as.numeric(data_needed$Sub_metering_2)
subMetering3 = as.numeric(data_needed$Sub_metering_3)
#plot_save
png("plot3.png", width=480, height=480)
plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subMetering2, type="l", col="red")
lines(date_time, subMetering3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
