Data.PowerConsumptiop <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
Data.PowerConsumptiop$DateTime = paste(Data.PowerConsumptiop$Date, Data.PowerConsumptiop$Time)
Data.PowerConsumptiop$DateTime = as.POSIXlt(Data.PowerConsumptiop$DateTime,format="%d/%m/%Y %H:%M:%S")
Data.PowerConsumptiop$Date = NULL
Data.PowerConsumptiop$Time = NULL

Power.Df <- subset(Data.PowerConsumptiop,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

# Open png device
png(filename='plot3.png', width=480, height=480, units="px",bg = "transparent")

# Plot
plot(Power.Df$DateTime, Power.Df$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(Power.Df$DateTime, Power.Df$Sub_metering_2, col='red')
lines(Power.Df$DateTime, Power.Df$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')

# Turn off device
dev.off()