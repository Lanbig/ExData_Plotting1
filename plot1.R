# Read data from file.
Data.PowerConsumptiop <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")

# Data and time 
Data.PowerConsumptiop$DateTime = paste(Data.PowerConsumptiop$Date, Data.PowerConsumptiop$Time)
Data.PowerConsumptiop$DateTime = as.POSIXlt(Data.PowerConsumptiop$DateTime,format="%d/%m/%Y %H:%M:%S")
Data.PowerConsumptiop$Date = NULL
Data.PowerConsumptiop$Time = NULL

# Using data from the dates 2007-02-01 and 2007-02-02
Power.Df <- subset(Data.PowerConsumptiop,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

# Start PNG device
png(filename='plot1.png', width=480, height=480, units="px",bg = "transparent")

# Plot
hist(Power.Df$Global_active_power, main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', col='red')

# Stop device
dev.off()