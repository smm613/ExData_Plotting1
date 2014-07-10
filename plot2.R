### The R code in this file reads in the data and creates the second plot

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

### Second plot
png("plot2a.png", width=480, height=480)
plot(data2$dtime,data2$Global_active_power,type="l",xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()