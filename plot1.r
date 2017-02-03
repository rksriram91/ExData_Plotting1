library(sqldf)
dataFile <- "./data/household_power_consumption.txt"
power_consumption <- read.csv.sql(dataFile, sql = "select * from file where Date ='1/2/2007' or Date='2/2/2007'", eol = "\n",sep=";") # reading data based on a condition

#str(power_consumption)
globalActivePower <- as.numeric(power_consumption$Global_active_power)
png("plot1.png", width=480, height=480) #png graphics device
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()