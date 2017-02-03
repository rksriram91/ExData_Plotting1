library(sqldf)
dataFile <- "./data/household_power_consumption.txt"
power_consumption <- read.csv.sql(dataFile, sql = "select * from file where Date ='1/2/2007' or Date='2/2/2007'", eol = "\n",sep=";") # reading data based on a condition

#str(power_consumption)
datetime <- strptime(paste(power_consumption$Date, power_consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(power_consumption$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")#type=1 plots lines (http://www.dummies.com/programming/r/how-to-create-different-plot-types-in-r/)
dev.off()