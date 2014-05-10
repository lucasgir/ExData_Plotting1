## Reading the file
household <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

#Converting houshold$Date to R date format
household$Date <- as.Date(household$Date,"%d/%m/%Y") 

#Subsetting to the two days of interest
household <- household[household$Date == "2007-02-01" | household$Date == "2007-02-02",]

#setting the device to the png we want to generate
png(filename="plot1.png",width=480,height=480)

#Building the histogram, defining the color of the bar to red, and the main title and x axis label
hist(household$Global_active_power, col = "red", main = "Global Active Power", xlab ="Global Active Powers (kilowatts)")

#closing the device
dev.off()