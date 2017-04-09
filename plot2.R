df <- read.table('data/household_power_consumption.txt',header = TRUE, sep=';',na.strings = '?',stringsAsFactors = FALSE, colClasses = c('character', 'character', rep('numeric',7)))
df <- subset(df, Date %in% c('1/2/2007','2/2/2007'))
df$DateTime <- strptime(paste0(df$Date,df$Time), format ='%d/%m/%Y %H:%M:%S')

png ('plot2.png', width= 480, height = 480)
with(df, plot(DateTime,Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)'))
dev.off()