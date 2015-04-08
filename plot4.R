Data.PowerConsumptiop <- read.table("household_power_consumption.txt",header=T,sep=";",colClasses=c("character","character","double","double","double","double","double","double","numeric"),na.strings="?")
Data.PowerConsumptiop$DateTime = paste(Data.PowerConsumptiop$Date, Data.PowerConsumptiop$Time)
Data.PowerConsumptiop$DateTime = as.POSIXlt(Data.PowerConsumptiop$DateTime,format="%d/%m/%Y %H:%M:%S")
Data.PowerConsumptiop$Date = NULL
Data.PowerConsumptiop$Time = NULL

Power.Df <- subset(Data.PowerConsumptiop,DateTime$year==107 & DateTime$mon==1 & (DateTime$mday==1 | DateTime$mday==2))

png("plot4.png", width=480, height=480, units="px",bg = "transparent")
par(mfrow=c(2,2))
plot(x=(Power.Df$DateTime),y=Power.Df$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(x=(Power.Df$DateTime),y=Power.Df$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(x=(Power.Df$DateTime),y=Power.Df$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(x=(Power.Df$DateTime),y=Power.Df$Sub_metering_2,col="red")
lines(x=(Power.Df$DateTime),y=Power.Df$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.4)

plot(Power.Df$DateTime, Power.Df$Global_reactive_power, type = "l", main = "", xlab = "datetime", ylab='Global_reactive_power')

dev.off()