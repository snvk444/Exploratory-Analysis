data1 <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, quote='\"')
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

data <- subset(data1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2))
par(mar = c(4,4,1,1))
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

plot(data$Voltage~data$Datetime, type="l",
     ylab="Voltage", xlab="")

plot(datetime,data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="", ylim = range(10,20,30,40))
lines(datetime, data$Sub_metering_2, type="l", col="red")
lines(datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(data$Global_reactive_power~data$Datetime, type="l",
     ylab="Global reactive Power (kilowatts)", xlab="")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()