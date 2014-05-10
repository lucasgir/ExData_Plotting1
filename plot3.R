## Reading the file
household <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

#Converting houshold$Date to R date format
household$Date <- as.Date(household$Date,"%d/%m/%Y") 

#Subsetting to the two days of interest
household <- household[household$Date == "2007-02-01" | household$Date == "2007-02-02",]

#Converting houshold$Time to R time format
household$Time <- strptime(paste(household$Date, household$Time,sep=" "),"%Y-%m-%d %H:%M:%S")

#setting the device to the png we want to generate
png(filename="plot3.png",width=480,height=480)

#Building the plot with times as x and sub_mettering 1 as y
#Type of the plot is lines, x label is empty and y label is "Energy sub metering"
plot(household$Time, household$Sub_metering_1, type="l", xlab ="", ylab = "Energy sub metering")

#adding a red line for sub metering 2
lines(household$Time, household$Sub_metering_2, col="red")

#adding a blue line for sub metering 3
lines(household$Time, household$Sub_metering_3, col="blue")

#adding the legend in the top right corner with appropriate color and label
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#closing the device
dev.off()