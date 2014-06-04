# Exploratory Data Analysis: Project 1, plot 4

# Read the data (assuming the data is in the working directory)
houseEnergy <- read.table("household_power_consumption.txt",header=TRUE,stringsAsFactor=FALSE,sep=";")

# Get only for 2007-02-01 and 2007-02-02
houseEnergy <- houseEnergy[houseEnergy[,1]=="1/2/2007"| houseEnergy[,1]=="2/2/2007",]

# Get only Global_active_power (col 3), Global_reactive_power (col 4), 
# voltage (col 5), sub meterings (cols 7,8,9), date/time (col 1,2).
dateInfo <- strptime(paste(houseEnergy[,1],houseEnergy[,2]), format="%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(houseEnergy[,3])
globalReactivePower <- as.numeric(houseEnergy[,4])
voltage <- as.numeric(houseEnergy[,5])
Sub_metering_1 <- as.numeric(houseEnergy[,7])
Sub_metering_2 <- as.numeric(houseEnergy[,8])
Sub_metering_3 <- as.numeric(houseEnergy[,9])

# plot the histogram on a png file.
png("plot4.png")
par(mfrow=c(2,2))
plot(dateInfo, globalActivePower, xlab="", ylab="Global Active Power", type="l")
plot(dateInfo, voltage, xlab="datetime", ylab="Voltage", type="l")
plot(dateInfo,Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(dateInfo,Sub_metering_2, col="red")
lines(dateInfo,Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(dateInfo, globalReactivePower, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()