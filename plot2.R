# full dataset
epc_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', 
                     stringsAsFactors=FALSE, na.strings = '?', dec='.')

# subset: data from the dates 2007-02-01 and 2007-02-02
epc_subSet <- subset(epc_full, subset=(Date %in% c("1/2/2007","2/2/2007")))

## Convert globalActivePower
datetime <- strptime(paste(epc_subSet$Date, epc_subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_active_power <- as.numeric(epc_subSet$Global_active_power)

## Plot png
png("plot2.png", width=480, height=480)
plot(datetime, Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()