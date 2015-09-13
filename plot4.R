setwd("C:\Users\james\Desktop\Coursera\4.Exploratory Data Analysis\assignment 1")

#====================read data set

powerdata <- read.table('household_power_consumption.txt',sep=';',header=TRUE)
#head(powerdata)

#subset data for 2 days 2007-02-01 and 2007-02-02
dayonedat <- powerdata[powerdata[,1] == '1/2/2007',]
daytwodat <- powerdata[powerdata[,1] == '2/2/2007',]
#remove missing values with NA

dayonedat[dayonedat=='?']=NA
daytwodat[daytwodat=='?']=NA

#remove NA's
dayonedat.good <- dayonedat[complete.cases(dayonedat),]
daytwodat.good <- daytwodat[complete.cases(daytwodat),]
twodaydat <- rbind(dayonedat.good,daytwodat.good)

#datesDates <- twodaydat$Date
Times <- twodaydat$Time
dates.and.times <- strptime(paste(Dates,Times, sep=" "), "%d/%m/%Y %H:%M:%S")
xdat=dates.and.times

png(filename = "plot4.png",width = 480, height = 480)
  par(mfrow = c(2, 2))
  
  #TLH plot
  ydat1=as.numeric(as.character(twodaydat$Global_active_power))
  plot(xdat,ydat1,type="l",main='',ylab='Global Active Power (Kilowatts)',xlab='')
  #=================================
  #TRH plot
  ydat3=as.numeric(as.character(twodaydat$Voltage))
  plot(xdat,ydat3,type="l",main='',ylab='Voltage',xlab='Datetime')
  #=================================
  #BLH plot
  ydat21=as.numeric(as.character(twodaydat$Sub_metering_1))
  ydat22=as.numeric(as.character(twodaydat$Sub_metering_2))
  ydat23=as.numeric(as.character(twodaydat$Sub_metering_3))
  
  plot(xdat,ydat21,type="l",main='',ylab='Energy Sub metering',xlab='')
  lines(xdat,ydat22,type="l",col='red')
  lines(xdat,ydat23,type="l",col='blue')
  legend("topright", pch = 1, col = c("black","blue", "red"), 
         legend = c("sub_metering_1", "sub_metering_2","sub_metering_3"))
  #=================================
  #BRH plot
  ydat4=as.numeric(as.character(twodaydat$Global_reactive_power))
  plot(xdat,ydat4,type="l",main='',ylab='Global_reactive_power',xlab='Datetime')
dev.off()