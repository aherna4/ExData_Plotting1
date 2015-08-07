# Exploratory Data Analysis Course Project 1 
# Plot 1 
library(dplyr)

# read in and filter the data
hpc_data <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE)
data <- hpc_data %>%
        filter(Date == "1/2/2007" | Date == "2/2/2007")

# initiate device
png(filename = "plot1.png", width = 480, height = 480)

hist(as.numeric(data$Global_active_power), 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red"
)

# turn off current device
dev.off()