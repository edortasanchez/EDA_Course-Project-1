# full dataset
epc_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', 
                     stringsAsFactors=FALSE, na.strings = '?', dec='.')

# subset: data from the dates 2007-02-01 and 2007-02-02
epc_subSet <- subset(epc_full, subset=(Date %in% c("1/2/2007","2/2/2007")))

## Convert globalActivePower
datetime <- strptime(paste(epc_subSet$Date, epc_subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(epc_subSet$Global_active_power)
subMetering1 <- as.numeric(epc_subSet$Sub_metering_1)
subMetering2 <- as.numeric(epc_subSet$Sub_metering_2)
subMetering3 <- as.numeric(epc_subSet$Sub_metering_3)

## Plot png
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()