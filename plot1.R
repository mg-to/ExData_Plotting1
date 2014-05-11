library(sqldf)
selection <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
ifile<-"household_power_consumption.txt"
data <- read.csv2.sql(ifile,selection)
datetime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
# first plot 
png(file="plot1.png")
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
