ad <- read.table("data.txt", header=TRUE, sep=';',header=TRUE, na.strings="?",stringsAsFactors=FALSE,nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
ad$Date <- as.Date(ad$Date, format="%d/%m/%Y")
data <- subset(ad, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(ad)

td <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(td)

with(data, {plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="Days of Week") lines(Sub_metering_2~Datetime,col='Red') lines(Sub_metering_3~Datetime,col='Blue')})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
