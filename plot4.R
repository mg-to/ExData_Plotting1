library(sqldf)
selection <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
ifile<-"household_power_consumption.txt"
data <- read.csv2.sql(ifile,selection)
datetime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
# fourth plot 
png(file="plot4.png")
par(mfrow=c(2,2))
#
plot(datetime,data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
#
plot(datetime,data$Voltage,type="l",ylab="Voltage")
#
plot(datetime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(datetime,data$Sub_metering_3,col="blue",lty=1,type="l")
points(datetime,data$Sub_metering_2,col="red",lty=1,type="l")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n" )
#
plot(datetime,data$Global_reactive_power,type="l",ylab="Global_reactive_power")
dev.off()
