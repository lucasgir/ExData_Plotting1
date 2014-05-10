## Reading the file
household <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

#Converting houshold$Date to R date format
household$Date <- as.Date(household$Date,"%d/%m/%Y") 

#Subsetting to the two days of interest
household <- household[household$Date == "2007-02-01" | household$Date == "2007-02-02",]

#Converting houshold$Time to R time format
household$Time <- strptime(paste(household$Date, household$Time,sep=" "),"%Y-%m-%d %H:%M:%S")

#setting the device to the png we want to generate
png(filename="plot2.png",width=480,height=480)

#Building the plot with times as x and global active power as y
#Type of the plot is lines, x label is empty and y label is Global Active Power (kilowatts)"
plot(household$Time, household$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")

#closing the device
dev.off()