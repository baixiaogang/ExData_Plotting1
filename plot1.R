plot1 <- function(directory) {
        #directory is the folder name holding the .txt data
        
        filepath <- paste(directory, "/household_power_consumption.txt", sep="")
        frame <- read.table(filepath, header = TRUE, sep=";", colClass = c(rep("character",9)))
        
        index <- dim(frame)[1]
        small_table <- subset(frame, frame$Date=='1/2/2007' | frame$Date=='2/2/2007')   
        
        png(file = 'plot1.png', width = 480, height =480)
        hist(as.numeric(small_table$Global_active_power), xlab="Global Power Consumption (killowatts)", main="Global Active Power", col="red")
        
        dev.off()
}