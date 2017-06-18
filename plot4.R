
library(dplyr)
#read data
#assumption - yiu have downloaded and unzipped the file to the wrking directory
data<-read.table("household_power_consumption.txt",sep=";",header=F,skip=66637,nrows=2880)
data_n<-read.table("household_power_consumption.txt",sep=";",header=T,nrows=10)
names(data)<-names(data_n)
data$DateTime<-strptime(paste0(as.character(data$Date)," ",as.character(data$Time)),format="%d/%m/%Y %H:%M:%S")


#make plot
png(file = "Plot4.png", width = 480, height = 480)
Sys.setlocale("LC_TIME","English")

par(mfrow=c(2,2))
#graph1
with(data,plot(DateTime,Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab=""))
with(data,lines(DateTime,Global_active_power))

#graph2
with(data,plot(DateTime,Voltage,type="n",ylab="Voltage",xlab="datetime"))
with(data,lines(DateTime,Voltage))

#graph3
with(data,plot(DateTime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(data,lines(DateTime,Sub_metering_1))
with(data,lines(DateTime,Sub_metering_2,col="red"))
with(data,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"),col=c("black","red","blue"),lty=1,
       cex = 0.9,bg="transparent",bty = "n")

#graph4
with(data,plot(DateTime,Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime"))
with(data,lines(DateTime,Global_reactive_power))

dev.off()

?legend