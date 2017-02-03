library(sqldf)
dataFile <- "./data/household_power_consumption.txt"
power_consumption <- read.csv.sql(dataFile, sql = "select * from file where Date ='1/2/2007' or Date='2/2/2007'", eol = "\n",sep=";") # reading data based on a condition

#converting x and y columns to numeric to plot
datetime <- strptime(paste(power_consumption$Date, power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(power_consumption$Global_active_power)
subMetering1 <- as.numeric(power_consumption$Sub_metering_1)
subMetering2 <- as.numeric(power_consumption$Sub_metering_2)
subMetering3 <- as.numeric(power_consumption$Sub_metering_3)
#plot
png("plot3.png", width=480, height=480) #png graphics device
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()