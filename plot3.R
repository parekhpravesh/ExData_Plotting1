# Set working directory and read the data set
# Replace "?" with NA while reading the data set

setwd("E:/Coursera/Exploratory Data Analysis/ExData_Plotting1")
ori_data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = c("?"))

# Subset the data based on the given dates
data <- subset(ori_data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert date and time into objects and append to df
# This step is not really required
temp <- paste(data$Date, data$Time)
date_c <- as.Date(data$Date)
time_c <- strptime(temp, format='%d/%m/%Y %H:%M:%S')
df <- cbind(data, date_c, time_c)

# Find number of values for Thursday and Friday
# This will be useful to mark the ticks on x axis
val_thu <- length(df$Global_active_power[weekdays(df$time_c)=='Thursday'])
val_fri <- length(df$Global_active_power[weekdays(df$time_c)=='Friday'])


# This section is for visualization only
plot(df$Sub_metering_1, type = 'l', xaxt = 'n', xlab = '', ylab = 'Energy sub metering', col = "black")
lines(df$Sub_metering_2, type = 'l', col = "red")
lines(df$Sub_metering_3, type = 'l', col = 'blue')
axis(1, at=c(0, val_thu, (val_thu+val_fri)), labels=c('Thu', 'Fri', 'Sat'))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c(colnames(df[7:9])))

# Save plot as PNG file of 480x480
png(filename="plot3.png", width = 480, height = 480)
plot(df$Sub_metering_1, type = 'l', xaxt = 'n', xlab = '', ylab = 'Energy sub metering', col = "black")
lines(df$Sub_metering_2, type = 'l', col = "red")
lines(df$Sub_metering_3, type = 'l', col = 'blue')
axis(1, at=c(0, val_thu, (val_thu+val_fri)), labels=c('Thu', 'Fri', 'Sat'))
legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c(colnames(df[7:9])))
dev.off()