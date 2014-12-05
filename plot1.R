install.packages("sqldf")
library(sqldf)

a <- read.csv.sql("household_power_consumption.txt",sep=";")
a$Date <- as.Date(a$Date, format=("%d/%m/%Y"))
b <- which(a$Date=="2007-02-01"|a$Date=="2007-02-02")
c <- subset(a[b,])
Realtime <- strptime(paste(c$Date, c$Time), format="%Y-%m-%d %H:%M:%S")
c$Realtime <- Realtime

png(filename="plot1.png")
hist(c$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()