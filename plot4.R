
# Read data
df <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
# Select subset of interest
df <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
# Parse datetime
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
# Open PNG device, 480x480
png("plot4.png", height=480, width=480)

# Multiplot 2x2
par(mfrow=c(2,2))

# Plot time series
plot(df$DateTime, df$Global_active_power, pch=NA, xlab='', ylab='Global Active Power')
lines(df$DateTime, df$Global_active_power)
# Voltage
plot(df$DateTime, df$Voltage, ylab='Voltage', xlab='datetime', pch=NA)
lines(df$DateTime, df$Voltage)

# Plot time series
plot(df$DateTime, df$Sub_metering_1, pch=NA, xlab='', ylab='Energy sub metering')
lines(df$DateTime, df$Sub_metering_1, col='black')
lines(df$DateTime, df$Sub_metering_2, col='red')
lines(df$DateTime, df$Sub_metering_3, col='blue')
# Add a legend
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=c(1,1,1), col=c('black', 'red', 'blue'))

# Reactive power
plot(df$DateTime, df$Global_reactive_power, xlab='datetime', pch=NA)
lines(df$DateTime, df$Global_reactive_power)


# Close device
dev.off()
