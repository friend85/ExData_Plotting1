# Exploratory Data Analysis: Project 1, plot 2

# Read the data (assuming the data is in the working directory)
houseEnergy <- read.table("household_power_consumption.txt",header=TRUE,stringsAsFactor=FALSE,sep=";")

# Get only for 2007-02-01 and 2007-02-02
houseEnergy <- houseEnergy[houseEnergy[,1]=="1/2/2007"| houseEnergy[,1]=="2/2/2007",]

# Get only Global_active_power (col 3), date (col 1) and time (col 2)
plot2x <- strptime(paste(houseEnergy[,1],houseEnergy[,2]), format="%d/%m/%Y %H:%M:%S")
plot2y <- houseEnergy[,3]

# plot the histogram on a png file.
png("plot2.png")
plot(plot2x,plot2y, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()