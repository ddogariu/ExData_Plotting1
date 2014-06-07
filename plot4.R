setInternet2(TRUE)
url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="power.zip",mode="wb")
#unzip the downloade archive
unzip("power.zip")
#to see the files in the archive:
unzip("power.zip",list=TRUE)
# read the data from the file
pdata <- read.csv("household_power_consumption.txt", na.string="?", sep=";")
# subset the data with the nedeed values
pdata <- pdata[(pdata$Date=="1/2/2007" | pdata$Date=="2/2/2007"),]

##Plot4
pdata$DateTime <- strptime(paste(pdata$Date, pdata$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480, bg="transparent")
par(mfrow=c(2,2))
plot(pdata$DateTime, pdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(pdata$DateTime, pdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(pdata$DateTime,pdata$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(pdata$DateTime,pdata$Sub_metering_2,type="l",col="red")
lines(pdata$DateTime,pdata$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),bty = "n")
plot(pdata$DateTime, pdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()