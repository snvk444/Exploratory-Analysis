setwd("C:/Users/Venkata/Desktop/Info Folder/Couresra_R/Course4-Exploratory_Analysis/Assignment1")

data_1 <- read.csv("household_power_consumption.txt",header=T, sep=';', na.strings="?", 
                   nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_1$Date <- as.Date(data_1$Date, format="%d/%m/%Y")

## Subsetting the data
data1 <- subset(data_1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## Plot 1
par(mar = c(4,4,1,1))
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()