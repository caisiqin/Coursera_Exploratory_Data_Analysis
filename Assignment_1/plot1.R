## Course 4 Exploratory Data Analysis
## Assignment: Course Project 1
## Siqin Cai

## Load data
mydata = read.table(file = "household_power_consumption.txt",
                    header = TRUE,sep = ";",stringsAsFactors=FALSE,dec = ".")

## Selected data,  using data from the dates 2007-02-01 and 2007-02-02
selected.data <- subset(mydata, mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007")

## Hist
png("plot1.png", width=480, height=480)
hist(as.numeric(selected.data$Global_active_power),
     col = "red",main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
