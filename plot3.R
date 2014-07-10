### The R code in this file reads in the data and creates the third plot

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

### Third plot using ggplot
png("plot3.png", width=480, height=480)
ggplot(data2,aes(dtime)) +
        scale_color_manual("",values=c("black","red","blue")) +
        geom_line(aes(y=Sub_metering_1, color="Sub_metering_1")) +
        geom_line(aes(y=Sub_metering_2, color="Sub_metering_2")) +
        geom_line(aes(y=Sub_metering_3, color="Sub_metering_3")) +
        ylab("Energy sub metering") +
        xlab("") +
        theme_bw() +
        theme(legend.position=c(.885,.925),legend.title=element_blank(),
              panel.grid.major.x=element_blank(),panel.grid.minor.x=element_blank(),
              panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank(),
              legend.background=element_rect(color="grey",fill="white"),
              legend.key=element_rect(fill=NA,color="white")) +
        scale_x_datetime(labels=c("Thu","","Fri","","Sat")
        )
dev.off()