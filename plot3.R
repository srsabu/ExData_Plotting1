## read in data file, ; separated
consumption = read.csv("household_power_consumption.txt", sep=";", na.strings="?")

## parse text date into date column
consumption$XDate = as.Date(consumption$Date, "%d/%m/%Y")

## parse text date and time into DateTime column
consumption$DateTime = strptime(paste(consumption$Date,consumption$Time, sep= " "), "%d/%m/%Y %H:%M:%S")

## filter into first two days in Feb 2007
consumptionX = consumption[consumption$XDate=="2007-02-01" | consumption$XDate=="2007-02-02" ,]

## set output to plot3.png
png(filename="plot3.png", width=480, height=480)

## plot lines
plot(consumptionX$DateTime, consumptionX$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", lty=1, lwd=1, col="black")
lines(consumptionX$DateTime, consumptionX$Sub_metering_2, type="l", lty=1, col="red")
lines(consumptionX$DateTime, consumptionX$Sub_metering_3, type="l", lty=1, col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

## stop saving to png
dev.off()
