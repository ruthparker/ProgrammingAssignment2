## read and subset the data

powerdata <- read.csv("household_power_consumption.txt",na.strings="?",quote="",sep=";")
powersub <- subset(powerdata,Date == '1/2/2007' | Date == '2/2/2007')

#open the device, write the graph to it, close the device

png(file="plot2.png")

plot(strptime(paste(powersub$Date,' ',powersub$Time),"%d/%m/%Y %H:%M:%S"),
     powersub$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
