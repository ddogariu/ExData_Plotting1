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

##Plot1 
png("plot1.png", width=480, height=480, bg="transparent")
hist(pdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()