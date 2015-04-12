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

# This part of code is for visualization only
# Plot Global active power frequency chart
# Setting x axis manually
hist(df$Global_active_power, xaxt = 'n', ylim = c(0,1200), col = 'red', border = 'black', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
axis(side=1, at=seq(0,6, 2), labels=seq(0,6,2))

# Save plot as PNG file of 480x480
png(filename="plot1.png", width = 480, height = 480)
hist(df$Global_active_power, xaxt = 'n', ylim = c(0,1200), col = 'red', border = 'black', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
axis(side=1, at=seq(0,6, 2), labels=seq(0,6,2))
dev.off()