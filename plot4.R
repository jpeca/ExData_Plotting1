# Read file
# Read only portion of file 66637:69517 (correspond to 01-02-2007 to 02-02-2007) to data frame
headRw <- scan("household_power_consumption.txt", what="character", nlines=1, sep=";", quiet=TRUE)
pw_cons <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?", skip=66636, nrow=2880, col.names=headRw)
pw_cons$datetime <- strptime(paste(pw_cons$Date, pw_cons$Time), format= "%d/%m/%Y %H:%M:%S")
#Constructing plot 4
par(mfcol=c(2,2))    ##set layout
par(mar=c(4.1,4.1,2,2))  ##set margins
par(font.lab=2)      ## set font for label
# First plot 
plot(pw_cons$datetime, pw_cons$Global_active_power, type="l", ylab="Global Active Power", xlab="")
# Second plot 
with (pw_cons, {
  plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  points(datetime, Sub_metering_2, type="l", col="red")
  points(datetime, Sub_metering_3, type="l", col="blue")
}) 
legend ("topright", legend = c("Sub_metering_1    ","Sub_metering_2      ", "Sub_metering_3    ") , lty="solid", 
        col=c("black","red","blue"), 
        inset=0.001, box.col =NA, cex = 0.7)
# Third plot
with (pw_cons,  plot(datetime, Voltage, type="l"))
# Fouth plot
with (pw_cons,  plot(datetime, Global_reactive_power, type="l"))
#Copy plot to png file
dev.copy(png, file="plot4.png",  width = 480, height = 480)
dev.off() ## Close png file device