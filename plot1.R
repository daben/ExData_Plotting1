
# Read data
df <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
# Select subset of interest
df <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
# Open PNG device, 480x480
png("plot1.png", height=480, width=480)
# Draw histogram
hist(df$Global_active_power, col='red',
     xlab='Global Active Power (kilowatts)',
     main='Global Active Power')
# Close device
dev.off()
