data_main<-read.csv("household_power_consumption.txt", header = TRUE, sep=";")
#after main dataset
data11<-cbind(data_main$Date, data_main$Time, data_main$Global_active_power)
data11<-data.frame(data11)
colnames(data11)<-c(colnames(data_main)[1],colnames(data_main)[2], colnames(data_main)[3])
data22<-subset(data11, data11$Date %in% c("1/2/2007","2/2/2007"))
data22$Global_active_power<-as.numeric(data22$Global_active_power)
data22$Date<-as.Date(data22$Date,tryFormats = c("%d-%m-%Y", "%d/%m/%Y"),
        optional = FALSE)
test<-paste(data22$Date, data22$Time)
data22$datetime<-as.POSIXct(test)
png("plot2.png", width = 480, height = 480)
plot(data22$Global_active_power~data22$datetime, type="l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()