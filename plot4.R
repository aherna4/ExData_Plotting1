# Exploratory Data Analysis Course Project 1 
# Plot 4
library(dplyr)

# read in and filter the data
hpc_data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
data <- hpc_data %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007")

# transform date and time columns into POSIXct
data$new_date <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# initite device
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# topleft plot
plot(data$new_date, data$Global_active_power, 
     xlab = "",
     ylab = "Global Active Power",
     type = "l"
)

# topright plot
plot(data$new_date, data$Voltage, 
     xlab = "datetime",
     ylab = "Voltage",
     type = "l"
)

# bottomleft plot
data$new_date <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
plot(data$new_date, data$Sub_metering_1, 
     xlab = "",
     ylab = "Energy sub metering",
     type = "l",
     col = "gray0")
points(data$new_date, data$Sub_metering_2, type = "l", col = "red")
points(data$new_date, data$Sub_metering_3, type = "l", col = "blue")
legend("topright",  
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("gray0", "red", "blue"), 
       lty = 1,
       cex = 0.9,
       bty = "n")

# bottomright plot
plot(data$new_date, data$Global_reactive_power, 
     xlab = "datetime",
     ylab = "Global reactive Power",
     type = "l"
)

# turn off current device
dev.off()
