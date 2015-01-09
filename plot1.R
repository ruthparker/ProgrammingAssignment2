## read and subset the data

powerdata <- read.csv("household_power_consumption.txt",na.strings="?",quote="",sep=";")
powersub <- subset(powerdata,Date == '1/2/2007' | Date == '2/2/2007')

#open the device, write the graph to it, close the device

png(file="plot1.png")

hist(powersub$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")

dev.off()
