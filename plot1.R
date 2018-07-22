library(data.table)

powerdf <- data.table::fread("household_power_consumption.txt", na.strings = "?")
powerdf$Date <- as.Date(powerdf$Date, format="%d/%m/%Y")
powerdf_subset <- subset(powerdf, (Date >= "2007-02-01") & (Date <= "2007-02-02"))

png("plot1.png", width=480, height= 480)

hist(powerdf_subset$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power")

dev.off()