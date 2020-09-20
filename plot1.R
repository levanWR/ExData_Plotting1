data_main<-read.csv("household_power_consumption.txt", header = TRUE, sep=";")
#after main dataset
data1<-cbind(data_main$Date, data_main$Time,data_main$Global_active_power)
data1<-data.frame(data1)
colnames(data1)<-c(colnames(data_main)[1],colnames(data_main)[2], colnames(data_main)[3])
data2<-subset(data1, data1$Date %in% c("1/2/2007","2/2/2007"))
data2$Global_active_power<-as.numeric(data2$Global_active_power)
data2$Date<-as.Date(data2$Date)
data2$Time<-as.POSIXct(data2$Time, format="%H:%M:%OS")
png("plot1.png", width = 480, height = 480)
hist(data2$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.off()


