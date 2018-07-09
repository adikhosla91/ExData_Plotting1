setwd("D:/R programming/Coursera Project")
file2<-"D:/R programming/Coursera Project/Project 2/household_power_consumption.txt"
## reading the file 
household4<-read.table(file2,header = TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
##subsetting the household data set
household_4<-household3[household3$Date %in% c("1/2/2007","2/2/2007"),]
household_4
head(household_4)
##combining date and time
dateandtime<-strptime(paste(household_4$Date,household_4$Time,sep=""),"%d/%m/%Y %H:%M:%S")
head(dateandtime)
globalactivepower<-as.numeric(household_4$Global_active_power)
globalreactivepower<-as.numeric(household_4$Global_reactive_power)
voltage<-as.numeric(household_4$Voltage)
submetering1<-as.numeric(household_4$Sub_metering_1)
submetering2<-as.numeric(household_4$Sub_metering_2)
submetering3<-as.numeric(household_4$Sub_metering_3)
##opening the graphic device
png("graph4.png",width=480,height = 480)
## making the plot
par(mfrow=c(2,2))
plot(dateandtime,globalactivepower,type="l",ylab="Global Active Power",xlab="")
plot(dateandtime,voltage,type="l",ylab="Voltage",xlab="dateandtime")
plot(dateandtime,submetering1,type="l",ylab="Energy Submetering",xlab="")
lines(dateandtime,submetering2,type="l",col="red")
lines(dateandtime,submetering3,type="l",col="blue")
legend("topright",c("Submetering1","Submetering2","Submetering3"),lty=1,col=c("black","red","blue"))
plot(dateandtime,globalreactivepower,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()## closing the graphic device
