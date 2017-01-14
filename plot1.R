Url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(Url, destfile="power.zip")
unzip(zipfile="power.zip")
power <- read.table("household_power_consumption.txt", sep = ";", na.strings=c("?", ""), header=TRUE, stringsAsFactors=FALSE)
power$DateTime<-paste(power$Date, power$Time)
power$DateTime<-strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")
str(power)
start<-which(power$DateTime==strptime("2007-02-01", "%Y-%m-%d"))
end<-which(power$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))
Power <- power[start:end,]
hist(Power$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", col="red")
dev.copy(png,"plot1.png")
dev.off()


