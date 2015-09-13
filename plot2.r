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

#plot data
Dates <- twodaydat$Date
Times <- twodaydat$Time
dates.and.times <- strptime(paste(Dates,Times, sep=" "), "%d/%m/%Y %H:%M:%S")
xdat=dates.and.times
ydat=as.numeric(as.character(twodaydat$Global_active_power))

#open device creat plot and close device
png(filename = "plot2.png",width = 480, height = 480)
plot(xdat,ydat,type="l",main='',ylab='Global Active Power (Kilowatts)',xlab='')
dev.off()

