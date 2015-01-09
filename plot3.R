## read and subset the data

powerdata <- read.csv("household_power_consumption.txt",na.strings="?",quote="",sep=";")
powersub <- subset(powerdata,Date == '1/2/2007' | Date == '2/2/2007')

#open the device, write the graph to it, close the device

png(file="plot3.png")

timeline <- strptime(paste(powersub$Date,' ',powersub$Time),"%d/%m/%Y %H:%M:%S")

plot(timeline,powersub$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")

points(timeline,powersub$Sub_metering_1,type="l")
points(timeline,powersub$Sub_metering_2,type="l",col="red")
points(timeline,powersub$Sub_metering_3,type="l",col="blue")

legend("topright", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lty=1)

dev.off()
