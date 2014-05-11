library(sqldf)
selection <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
ifile<-"household_power_consumption.txt"
data <- read.csv2.sql(ifile,selection)
datetime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
# second plot 
Sys.setlocale("LC_TIME", "C")
png(file="plot2.png")
plot(datetime,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
