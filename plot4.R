## read and subset the data

powerdata <- read.csv("household_power_consumption.txt",na.strings="?",quote="",sep=";")
powersub <- subset(powerdata,Date == '1/2/2007' | Date == '2/2/2007')

#open the device, write the graphs to it, close the device

png(file="plot4.png")

par(mfrow = c(2,2))
timeline <- strptime(paste(powersub$Date,' ',powersub$Time),"%d/%m/%Y %H:%M:%S")

with (powersub, {
    # global_active_power
    plot(timeline,Global_active_power,type="l",xlab="",ylab="Global Active Power")
    # voltage
    plot(timeline,Voltage,type="l",xlab="datetime")
    # sub-metering
    plot(timeline,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    points(timeline,Sub_metering_1,type="l")
    points(timeline,Sub_metering_2,type="l",col="red")
    points(timeline,Sub_metering_3,type="l",col="blue")
    legend("topright", lty=1, bty="n", 
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    # global reactive power
    plot(timeline,Global_reactive_power,type="l",xlab="datetime")
})

dev.off()
