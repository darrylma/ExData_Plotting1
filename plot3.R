library(data.table)

powerdf <- data.table::fread("household_power_consumption.txt", na.strings = "?")
powerdf$Date <- as.Date(powerdf$Date, format="%d/%m/%Y")
powerdf_subset <- subset(powerdf, (Date >= "2007-02-01") & (Date <= "2007-02-02"))
powerdf_subset$DateTime <- as.POSIXct(paste(powerdf_subset$Date, powerdf_subset$Time))

png("plot3.png", width=480, height= 480)

plot(powerdf_subset$DateTime, powerdf_subset$Sub_metering_1, type="l", 
     ylab="Energy sub metering", col="black")
lines(powerdf_subset$DateTime, powerdf_subset$Sub_metering_2, type="l", col="red")
lines(powerdf_subset$DateTime, powerdf_subset$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()