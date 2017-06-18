
library(dplyr)
#read data
#assumption - yiu have downloaded and unzipped the file to the wrking directory
data<-read.table("household_power_consumption.txt",sep=";",header=F,skip=66637,nrows=2880)
data_n<-read.table("household_power_consumption.txt",sep=";",header=T,nrows=10)
names(data)<-names(data_n)
data$DateTime<-strptime(paste0(as.character(data$Date)," ",as.character(data$Time)),format="%d/%m/%Y %H:%M:%S")

#make plot
png(file = "Plot3.png", width = 480, height = 480)
Sys.setlocale("LC_TIME","English")

with(data,plot(DateTime,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(data,lines(DateTime,Sub_metering_1))
with(data,lines(DateTime,Sub_metering_2,col="red"))
with(data,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"),col=c("black","red","blue"),lty=1)


dev.off()
