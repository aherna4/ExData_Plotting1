# Exploratory Data Analysis Course Project 1 
# Plot 2
library(dplyr)

# read in and filter the data
hpc_data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
data <- hpc_data %>%
        filter(Date == "1/2/2007" | Date == "2/2/2007")

# transform date and time columns into POSIXct
data$new_date <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# initiate device
png(filename = "plot2.png", width = 480, height = 480)

plot(data$new_date, data$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

# turn off current device
dev.off()
