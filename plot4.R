library(data.table)

# Extract data from txt file
powerdf <- data.table::fread("household_power_consumption.txt", na.strings = "?")
powerdf$Date <- as.Date(powerdf$Date, format="%d/%m/%Y")
# Extract data between 2007-02-01 and 2007-02-02 only
powerdf_subset <- subset(powerdf, (Date >= "2007-02-01") & (Date <= "2007-02-02"))
# Create new DateTime column
powerdf_subset$DateTime <- as.POSIXct(paste(powerdf_subset$Date, powerdf_subset$Time))

# Create png file, plot and save plot into png file
png("plot4.png", width=480, height= 480)

par(mfcol=c(2,2))

# Top-left plot
plot(powerdf_subset$DateTime, powerdf_subset$Global_active_power,
     xlab="", ylab = "Global Active Power", type="l")

# Bottom-left plot
plot(powerdf_subset$DateTime, powerdf_subset$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering", col="black")
lines(powerdf_subset$DateTime, powerdf_subset$Sub_metering_2, type="l", col="red")
lines(powerdf_subset$DateTime, powerdf_subset$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty="n", cex=.9)

# Top-right plot
plot(powerdf_subset$DateTime, powerdf_subset$Voltage,
     xlab = "dateime", ylab = "Voltage", type="l")

# Bottom-right plot
plot(powerdf_subset$DateTime, powerdf_subset$Global_reactive_power,
     xlab = "dateime", ylab = "Global_reactive_power", type="l")

dev.off()