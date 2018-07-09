getwd()
setwd("D:/R programming/Coursera Project")
file1<-"D:/R programming/Coursera Project/Project 2/household_power_consumption.txt"
##reading the data file
household1<-read.table(file1,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
##subsetting the data 
household_2<-household1[household1$Date %in% c("1/2/2007","2/2/2007"),]
head(household_2)
## merging date and time variable
dateandtime<-strptime(paste(household_2$Date,household_2$Time, sep=""),"%d/%m/%Y %H:%M:%S")
head(dateandtime)
globactivepower<-as.numeric(household_2$Global_active_power)
##opening png graphic device
png("graph2.png",height=480,width=480)
##plotting the graph
plot(dateandtime,globactivepower,type="l",ylab="Global Active Power(kilowatts)")
dev.off()## closing the current graphic device
