plot2<-function()
{
  data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c("?"),colClasses=c("character","character",rep("numeric",7)))
  data<-data[which(data$IIDate=="1/2/2007"|data$IIDate=="2/2/2007"|(data$IIDate=="3/2/2007"&data$Time=="00:00:00")),]
  Time<-strptime(paste(data[,1],data[,2],sep=" ") ,"%d/%m/%Y %R")
  png("plot2.png", width = 480, height = 480)
  plot(Time,data$Global_active_power,type="l",xlab=" ",ylab="Global Acrive Power (kilowatts)")
  dev.off()
}