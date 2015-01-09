## read in data file, ; separated
consumption = read.csv("household_power_consumption.txt", sep=";", na.strings="?")

## parse text date into date column
consumption$XDate = as.Date(consumption$Date, "%d/%m/%Y")

## parse text date and time into DateTime column
consumption$DateTime = strptime(paste(consumption$Date,consumption$Time, sep= " "), "%d/%m/%Y %H:%M:%S")

## filter into first two days in Feb 2007
consumptionX = consumption[consumption$XDate=="2007-02-01" | consumption$XDate=="2007-02-02" ,]

## set output to plot2.png
png(filename="plot2.png", width=480, height=480)

## plot line
plot(consumptionX$DateTime, consumptionX$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l", lty=1, lwd=1, col="black")

## stop saving to png
dev.off()
