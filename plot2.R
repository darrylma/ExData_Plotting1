library(data.table)

powerdf <- data.table::fread("household_power_consumption.txt", na.strings = "?")
powerdf$Date <- as.Date(powerdf$Date, format="%d/%m/%Y")
powerdf_subset <- subset(powerdf, (Date >= "2007-02-01") & (Date <= "2007-02-02"))
powerdf_subset$DateTime <- as.POSIXct(paste(powerdf_subset$Date, powerdf_subset$Time))

png("plot2.png", width=480, height= 480)

plot(powerdf_subset$DateTime, powerdf_subset$Global_active_power,
     ylab = "Global Active Power (kilowatts)", type="l")

dev.off()