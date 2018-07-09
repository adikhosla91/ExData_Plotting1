getwd()
setwd("D:/R programming/Coursera Project")
## reading the file location from the system
file<-"D:/R programming/Coursera Project/Project 2/household_power_consumption.txt" 
household<-read.table(file,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".") ## loding the household data into R
head(household)
## subsetting the data based on date 1/2/2007 and 2/2/2017
household_1<-household[household$Date %in% c("1/2/2007","2/2/2017"),]
head(household_1)                       
## subsetting the data to global active power
globalActivepower<-as.numeric(household_1$Global_active_power)
dev.cur()
##opening png data file and setting the width and height of the plot
png("graph1.png",width = 480,height = 480)
##plotting the histogram 
hist(globalActivepower,main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency",col="red")
dev.off()## closing the graphic device
