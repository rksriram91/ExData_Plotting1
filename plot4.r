library(sqldf)
dataFile <- "./data/household_power_consumption.txt"
power_consumption <- read.csv.sql(dataFile, sql = "select * from file where Date ='1/2/2007' or Date='2/2/2007'", eol = "\n",sep=";") # reading data based on a condition

#str(power_consumption)
datetime <- strptime(paste(power_consumption$Date, power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(power_consumption$Global_active_power)
globalReactivePower <- as.numeric(power_consumption$Global_reactive_power)
voltage <- as.numeric(power_consumption$Voltage)
subMetering1 <- as.numeric(power_consumption$Sub_metering_1)
subMetering2 <- as.numeric(power_consumption$Sub_metering_2)
subMetering3 <- as.numeric(power_consumption$Sub_metering_3)

#plot
png("plot4.png", width=480, height=480)#png graphics driver
par(mfrow = c(2, 2)) #spltting graphics window into 2 rows and 2cols

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")#col should correspondinglt be given incol parameter

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")#

dev.off()