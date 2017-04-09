df <- read.table('data/household_power_consumption.txt',header = TRUE, sep=';',na.strings = '?',stringsAsFactors = FALSE, colClasses = c('character', 'character', rep('numeric',7)))
df <- subset(df, Date %in% c('1/2/2007','2/2/2007'))
df$DateTime <- strptime(paste0(df$Date,df$Time), format ='%d/%m/%Y %H:%M:%S')

png ('plot3.png', width= 480, height = 480)
with(df, plot(c(rep(DateTime,3)), c(Sub_metering_1,Sub_metering_2,Sub_metering_3), 
              type = 'n', xlab = '', ylab = 'Energy sub metering'))
with(df, points(DateTime,Sub_metering_1, type = 'l', col = 'black'))
with(df, points(DateTime,Sub_metering_2, type = 'l', col = 'red'))
with(df, points(DateTime,Sub_metering_3, type = 'l', col = 'blue'))
legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty = 1, col = c('black','red','blue'))
dev.off()