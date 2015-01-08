## read in data file, ; separated
consumption = read.csv("household_power_consumption.txt", sep=";", na.strings="?")

## parse text date into date column
consumption$XDate = as.Date(consumption$Date, "%d/%m/%Y")

## parse text date and time into DateTime column
consumption$DateTime = strptime(paste(consumption$Date,consumption$Time, sep= " "), "%d/%m/%Y %H:%M:%S")

## filter into first two days in Feb 2007
consumptionX = consumption[consumption$XDate=="2007-02-01" | consumption$XDate=="2007-02-02" ,]

## set output to plot1.png
png(filename="plot1.png", width=480, height=480)

## show histogram
hist(consumptionX$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

## stop saving to png
dev.off()
