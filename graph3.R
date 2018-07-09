setwd("D:/R programming/Coursera Project")
file2<-"D:/R programming/Coursera Project/Project 2/household_power_consumption.txt"
## reading the file 
household3<-read.table(file2,header = TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
##subsetting the household data set
household_3<-household3[household3$Date %in% c("1/2/2007","2/2/2007"),]
household_3
head(household_3)
##combining date and time
dateandtime<-strptime(paste(household_3$Date,household_3$Time,sep=""),"%d/%m/%Y %H:%M:%S")
head(dateandtime)
globalactivepower<-as.numeric(household_3$Global_active_power)
submetering1<-as.numeric(household_3$Sub_metering_1)
submetering2<-as.numeric(household_3$Sub_metering_2)
submetering3<-as.numeric(household_3$Sub_metering_3)
##opening the graphic file
png("graph3.png",width=480,height = 480)
plot(dateandtime,submetering1,type="l",ylab="Energy Submetering",xlab="")
lines(dateandtime,submetering2,type="l",col="red")
lines(dateandtime,submetering3,type="l",col="blue")
legend("topright",c("Submetering1,Submetering2,Submetering3"),lty=1,col=c("black","red","blue"))
dev.off()
