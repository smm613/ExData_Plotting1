### The R code in this file reads in the data and creates the fourth plot

library(ggplot2)
library(lubridate)

data1 <- read.table("household_power_consumption.txt", na.strings="?", 
                    sep=";",header=T)

### Select two days 2/1/2007 and 2/2/2007 and format date and time
data2 <- subset(data1,data1$Date=="1/2/2007" | data1$Date=="2/2/2007")

## Create and format the datetime variable (dtime)
data2$dt.time <- paste(data2$Date, data2$Time)
data2$dtime <- dmy_hms(data2$dt.time)
#class(data2$dt.time)
data2$day <- wday(data2$dtime, label=T)

### Create and save plot4 using combination of basic plot and ggplot
png(file="plot4.png")
par(mfrow=c(2,2), mar=c(3.5,4,1,2), oma=c(0,0,0,0))    #mar=c(3,4,1,2)
plot(data2$dtime,data2$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
plot(data2$dtime,data2$Voltage,type="l",xlab="",
     ylab="Voltage")
title(xlab="datetime",line=2, cex.lab=1)
pushViewport(viewport(layout = grid.layout(2,2)))
print(g, vp=vplayout(2,1))
plot.new()
plot(data2$dtime,data2$Global_reactive_power,type="l",xlab="",
     ylab="Global_reactive_power")
title(xlab="datetime",line=2, cex.lab=1)
dev.off()