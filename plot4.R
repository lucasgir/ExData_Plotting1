## Reading the file
household <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

#Converting houshold$Date to R date format
household$Date <- as.Date(household$Date,"%d/%m/%Y") 

#Subsetting to the two days of interest
household <- household[household$Date == "2007-02-01" | household$Date == "2007-02-02",]

#Converting houshold$Time to R time format
household$Time <- strptime(paste(household$Date, household$Time,sep=" "),"%Y-%m-%d %H:%M:%S")

#setting the device to the png we want to generate
png(filename="plot4.png",width=480,height=480)

#Creating a base for 4 plotes (2 rows and 2 cols)
par(mfrow = c(2,2))
     {
        #plot2
        plot(household$Time, household$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power")
        #new plot voltage per datetime
        plot(household$Time, household$Voltage, type="l", xlab="datetime", ylab ="Voltage")
        #plot3 with additional argument bty="n" in the legend to not display the border around the legend
        #and cex=0.9 to downsize the legend
        plot(household$Time, household$Sub_metering_1, type="l", xlab ="", ylab = "Energy sub metering")
        lines(household$Time, household$Sub_metering_2, col="red")
        lines(household$Time, household$Sub_metering_3, col="blue")
        legend("topright", lty=1, bty="n", cex=0.9, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        #new plot Global_reactive_power per datetime
        plot(household$Time, household$Global_reactive_power, type="l", xlab="datetime", ylab ="Global_reactive_power")
}

#closing the device
dev.off()