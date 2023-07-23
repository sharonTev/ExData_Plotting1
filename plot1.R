setwd("C:/Users/sharonha.WISMAIN/Box/courses/Coursera - Data analysis/Assignment1")
house_hold = "household_power_consumption.txt"
data <- read.table(house_hold, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
globalActivePower <- as.numeric(subData$Global_active_power)
# plot histogram and save graph as PNG file with width and hight of 480
png("plot1.png", width=480, height=480, units="px")
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# close of PNG file
dev.off()

