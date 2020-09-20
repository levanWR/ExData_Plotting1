data_main<-read.csv("household_power_consumption.txt", header = TRUE, sep=";")
#after main dataset
data1111<-cbind(data_main$Date, data_main$Time, data_main$Global_active_power, data_main$Sub_metering_1, data_main$Sub_metering_2, data_main$Sub_metering_3, data_main$Voltage, data_main$Global_reactive_power)
data1111<-data.frame(data1111)
colnames(data1111)<-c(colnames(data_main)[1],colnames(data_main)[2], colnames(data_main)[3], colnames(data_main)[7],colnames(data_main)[8],colnames(data_main)[9],colnames(data_main)[5],colnames(data_main)[4])
data2222<-subset(data1111, data1111$Date %in% c("1/2/2007","2/2/2007"))
data2222$Global_active_power<-as.numeric(data2222$Global_active_power)
data2222$Date<-as.Date(data2222$Date,tryFormats = c("%d-%m-%Y", "%d/%m/%Y"),
                      optional = FALSE)
test<-paste(data2222$Date, data2222$Time)
data2222$datetime<-as.POSIXct(test)
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(data22$Global_active_power~data22$datetime, type="l", xlab="", ylab = "Global Active Power")

plot(data2222$Voltage~data2222$datetime,type="l",  ylab = "Voltage", xlab="datetime")

plot(data222$Sub_metering_1~data222$datetime, type="l", xlab="", ylab="Energy sub metering")
lines(data222$Sub_metering_2~data222$datetime, col="Red")
lines(data222$Sub_metering_3~data222$datetime, col="Blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue" ), lty = 1, lwd=1  )

plot(data2222$Global_reactive_power~data2222$datetime, type="l", ylab = "Global_reactive_power", xlab="datetime")
dev.off()