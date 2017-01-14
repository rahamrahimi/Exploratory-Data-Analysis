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
plot(Power$DateTime, Power$Sub_metering_1, type='l', ylab="Energy sub metering", xlab="")
lines(Power$DateTime, Power$Sub_metering_2, type='l', col="red")
lines(Power$DateTime, Power$Sub_metering_3, type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                    lty=c(1,1,1)
                    ,col=c("black","red","blue"))
dev.copy(png,"plot3.png")
dev.off()