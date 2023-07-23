setwd("C:/Users/sharonha.WISMAIN/Box/courses/Coursera - Data analysis/Assignment1")
house_hold_power= "household_power_consumption.txt"

# read file with separated by ";" 
data = read.table(house_hold_power, header=TRUE, sep=";", 
                  col.names =c("date", "time", "globalActivePower",
                               "globalReactivePower", "voltage","globalIntensity",
                               "subMetering1", "subMetering2", "subMetering3"),
                  colClasses = c("character", "character", rep("numeric",7) ), na.strings="?")

data$date = as.Date(data$date, format="%d/%m/%Y")
# Keep observations for 2007-02-01 and 2007-02-02
data = subset(data,subset=(data$date >= as.Date("2007-02-01") & data$date<=as.Date("2007-02-02")))

png("plot2.png", 480, 480, units="px")
datetime=data$globalActivePower
plot(datetime, type="l",xaxt="n",ylab="Global Active Power (kilowatts)",xlab="")
axis(1, at=c(1, as.integer(nrow(data)/2), nrow(data)), labels=c("Thu", "Fri", "Sat"))
# close of PNG file
dev.off()
