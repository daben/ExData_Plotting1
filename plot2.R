
# Read data
df <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
# Select subset of interest
df <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
# Parse datetime
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
# Open PNG device, 480x480
png("plot2.png", height=480, width=480)
# Plot time series
plot(df$DateTime, df$Global_active_power, pch=NA, xlab='', ylab='Global Active Power (kilowatts)')
lines(df$DateTime, df$Global_active_power)
# Close device
dev.off()
