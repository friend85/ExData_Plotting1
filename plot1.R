# Exploratory Data Analysis: Project 1, plot 1

# Read the data (assuming the data is in the working directory)
houseEnergy <- read.table("household_power_consumption.txt",header=TRUE,stringsAsFactor=FALSE,sep=";")

# Get only for 2007-02-01 and 2007-02-02
houseEnergy <- houseEnergy[houseEnergy[,1]=="1/2/2007"| houseEnergy[,1]=="2/2/2007",]

# Get only Global_active_power (col 3)
plot1data <- as.numeric(houseEnergy[,3])

# plot the histogram on a png file.
png("plot1.png")
hist(plot1data, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()