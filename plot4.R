plot4 <- function(directory) {
        
        filepath <- paste(directory, "/household_power_consumption.txt", sep="")
        frame <- read.table(filepath, header = TRUE, sep=";", colClass = c(rep("character",9)))
        
        index <- dim(frame)[1]
        small_table <- subset(frame, frame$Date=='1/2/2007' | frame$Date=='2/2/2007')   
        
        time_line <- paste(small_table$Date, small_table$Time,sep="")
        Newtime <- strptime(time_line, "%d/%m/%Y %H:%M:%S")
        
        png(file = 'plot4.png', width = 480, height =480)
        par(mfrow=c(2,2))
        #(1,1)
        hist(as.numeric(small_table$Global_active_power), xlab="Global Power Consumption (killowatts)", main="Global Active Power", col="red")
        
        #(1,2)
        plot(Newtime, small_table$Voltage, type="l", xlab="datetime", ylab="Voltage")
        
        #(2,1)
        plot(Newtime, small_table$Sub_metering_1, type="l", xlab="", ylab="Global Active Power (killowatts)", col='grey')
        lines(Newtime, small_table$Sub_metering_2, col="red")
        lines(Newtime, small_table$Sub_metering_3, col="blue")
        legend('topright', legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                      col=c("grey","red","blue"), lwd=1, cex=1, bty="n")
        
        #(2,2)
        plot(Newtime, small_table$Global_reactive_power, type="l", xlab="datetime")
        
        dev.off()
}