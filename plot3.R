data_main<-read.csv("household_power_consumption.txt", header = TRUE, sep=";")
#after main dataset
data111<-cbind(data_main$Date, data_main$Time, data_main$Global_active_power, data_main$Sub_metering_1, data_main$Sub_metering_2, data_main$Sub_metering_3)
data111<-data.frame(data111)
colnames(data111)<-c(colnames(data_main)[1],colnames(data_main)[2], colnames(data_main)[3], colnames(data_main)[7],colnames(data_main)[8],colnames(data_main)[9])
data222<-subset(data111, data111$Date %in% c("1/2/2007","2/2/2007"))
data222$Global_active_power<-as.numeric(data222$Global_active_power)
data222$Date<-as.Date(data222$Date,tryFormats = c("%d-%m-%Y", "%d/%m/%Y"),
                     optional = FALSE)
test<-paste(data222$Date, data222$Time)
data222$datetime<-as.POSIXct(test)
png("plot3.png", width = 480, height = 480)
plot(data222$Sub_metering_1~data222$datetime, type="l", xlab="", ylab="Energy sub metering")
lines(data222$Sub_metering_2~data222$datetime, col="Red")
lines(data222$Sub_metering_3~data222$datetime, col="Blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue" ), lty = 1, lwd=1  )
dev.off()

  