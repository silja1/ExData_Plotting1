
library(dplyr)

#on initial calculation
#memory in MB
#round(2075259*9*8/2^{20},2)
#yes I have enough memory
#data<-read.table("household_power_consumption.txt",sep=";",header=T)
#data$Date<-as.Date(as.character(data$Date),format="%d/%m/%Y")
#row in initial file
#data$row<-as.integer(row.names(data))

#find rows with relevant dates
#data2<-data%>%
#  filter(Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))%>%
#  summarize(min=min(row),n=n())
#min row: 66637
#n: 2880

#read data
#assumption - yiu have downloaded and unzipped the file to the wrking directory
data<-read.table("household_power_consumption.txt",sep=";",header=F,skip=66637,nrows=2880)

data_n<-read.table("household_power_consumption.txt",sep=";",header=T,nrows=10)
names(data)<-names(data_n)
data$DateTime<-strptime(paste0(as.character(data$Date)," ",as.character(data$Time)),format="%d/%m/%Y %H:%M:%S")

#make plot
png(file = "Plot1.png", width = 480, height = 480)
with(data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()


