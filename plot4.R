
total <- read.table("data.txt",nrows=2075259, na.strings="?",  check.names=F,header=TRUE, stringsAsFactors=F, comment.char="",  sep=';',quote='\"')
total$Date <- as.Date(total$Date, format="%d/%m/%Y")

data <- subset(total, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(total)

dnt<- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(dnt)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  
  plot(Global_active_power~Datetime, type="l",  ylab="Global Active Power (kilowatts)", xlab="Days of Week")
  plot(Voltage~Datetime, type="l",  ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="Days of weeks")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="datetime")
  
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()  