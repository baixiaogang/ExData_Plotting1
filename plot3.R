plot3 <- function(directory) {
        
        filepath <- paste(directory, "/household_power_consumption.txt", sep="")
        frame <- read.table(filepath, header = TRUE, sep=";", colClass = c(rep("character",9)))
        
        index <- dim(frame)[1]
        small_table <- subset(frame, frame$Date=='1/2/2007' | frame$Date=='2/2/2007')   
        
        time_line <- paste(small_table$Date, small_table$Time,sep="")
        Newtime <- strptime(time_line, "%d/%m/%Y %H:%M:%S")
        
        png(file = 'plot3.png', width = 480, height =480)
        
        plot(Newtime, small_table$Sub_metering_1, type="l", xlab="", ylab="Global Active Power (killowatts)", col='grey')
        lines(Newtime, small_table$Sub_metering_2, col="red")
        lines(Newtime, small_table$Sub_metering_3, col="blue")
        legend('topright', legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                      col=c("grey","red","blue"), lwd=1, cex=1)
        
        dev.off()
}