plot2 <- function(directory) {
        
        filepath <- paste(directory, "/household_power_consumption.txt", sep="")
        frame <- read.table(filepath, header = TRUE, sep=";", colClass = c(rep("character",9)))
        
        index <- dim(frame)[1]
        small_table <- subset(frame, frame$Date=='1/2/2007' | frame$Date=='2/2/2007')   
        
        png(file = 'plot2.png', width = 480, height =480)
        
        time_line <- paste(small_table$Date, small_table$Time,sep="")
        Newtime <- strptime(time_line, "%d/%m/%Y %H:%M:%S")
        plot(Newtime, small_table$Global_active_power, type="l", xlab="", ylab="Global Active Power (killowatts)")
        
        dev.off()
}