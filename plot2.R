compdata <- read.table("data.txt",  sep=';',header=TRUE, na.strings="?", check.names=FALSE, nrows=2075259,  stringsAsFactors=FALSE, comment.char="", quote='\"')
compdata$Date <- as.Date(compdata$Date, format="%d/%m/%Y")

data <- subset(compdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(compdata)

td <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(td)

plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="Days Of Week")
dev.copy(png,  height=480, width=480, file="plot2.png")
dev.off()