plot1<-function()
{
  data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c("?"),colClasses=c("character","character",rep("numeric",7)))
  data<-data[which(data$IIDate=="1/2/2007"|data$IIDate=="2/2/2007"|(data$IIDate=="3/2/2007"&data$Time=="00:00:00")),]
  png("plot1.png", width = 480, height = 480)
  hist(data$Global_active_power,col="red",xlab="Global Active power (kilowatts)",main="Global Active power")
  dev.off()
}