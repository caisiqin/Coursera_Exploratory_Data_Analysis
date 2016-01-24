## Course 4 Exploratory Data Analysis
## Assignment: Course Project 1
## Siqin Cai

## Load data
mydata = read.table(file = "household_power_consumption.txt",
                    header = TRUE,sep = ";",stringsAsFactors=FALSE,dec = ".")

## Selected data,  using data from the dates 2007-02-01 and 2007-02-02
selected.data <- subset(mydata, mydata$Date == "1/2/2007" | mydata$Date == "2/2/2007")

## set x as Data + Time
x <- strptime(paste(selected.data$Date, selected.data$Time, sep = " "),
              "%d/%m/%Y %H:%M:%S")
## set GAP/VTG/GRP/subM as numeric
GAP <- as.numeric(selected.data$Global_active_power)
VTG <- as.numeric(selected.data$Voltage)
GRP <- as.numeric(selected.data$Global_reactive_power)
subM1 <- as.numeric(selected.data$Sub_metering_1)
subM2 <- as.numeric(selected.data$Sub_metering_2)
subM3 <- as.numeric(selected.data$Sub_metering_3)

## plot 
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(x, GAP, type="l", xlab="", ylab="Global Active Power")
plot(x, VTG, type="l", xlab="datetime", ylab="Voltage")
plot(x, subM1, type="l", xlab="", ylab="Energy sub metering")
lines(x, subM2, type="l", col="red")
lines(x, subM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"),bty ="o")
plot(x, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

