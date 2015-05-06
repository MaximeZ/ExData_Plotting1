plot4<-function()
{
  data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings=c("?"),colClasses=c("character","character",rep("numeric",7)))
  data<-data[which(data$IIDate=="1/2/2007"|data$IIDate=="2/2/2007"|(data$IIDate=="3/2/2007"&data$Time=="00:00:00")),]
  Time<-strptime(paste(data[,1],data[,2],sep=" ") ,"%d/%m/%Y %R")
  png("plot4.png", width = 480, height = 480)
  par(mfrow = c(2, 2)) 
  plot(Time,data$Global_active_power,type="l",xlab=" ",ylab="Global Acrive Power")
  plot(Time,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
  plot(Time,data$Sub_metering_1,type="l",xlab=" ",ylab="Energy sub metering")
  lines(Time,data$Sub_metering_2,type="l",col="red")
  lines(Time,data$Sub_metering_3,type="l",col="blue")
  legend("topright", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty="n")
  plot(Time,data$Global_reactive_power,type="l",xlab="datetime ",ylab="Global_reacrive_power")
  dev.off()
}