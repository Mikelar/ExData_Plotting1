install.packages("sqldf")
library(sqldf)

a <- read.csv.sql("household_power_consumption.txt",sep=";")
a$Date <- as.Date(a$Date, format=("%d/%m/%Y"))
b <- which(a$Date=="2007-02-01"|a$Date=="2007-02-02")
c <- subset(a[b,])
Realtime <- strptime(paste(c$Date, c$Time), format="%Y-%m-%d %H:%M:%S")
c$Realtime <- Realtime

Sys.setlocale("LC_TIME", "English")

png(filename="plot3.png")
plot(c$Realtime, c$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(c$Realtime, c$Sub_metering_1)
lines(c$Realtime, c$Sub_metering_2, col="red")
lines(c$Realtime, c$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()