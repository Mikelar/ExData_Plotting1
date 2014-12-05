install.packages("sqldf")
library(sqldf)

a <- read.csv.sql("household_power_consumption.txt",sep=";")
a$Date <- as.Date(a$Date, format=("%d/%m/%Y"))
b <- which(a$Date=="2007-02-01"|a$Date=="2007-02-02")
c <- subset(a[b,])
Realtime <- strptime(paste(c$Date, c$Time), format="%Y-%m-%d %H:%M:%S")
c$Realtime <- Realtime

Sys.setlocale("LC_TIME", "English")

png(filename="plot2.png")
plot(c$Realtime, c$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()