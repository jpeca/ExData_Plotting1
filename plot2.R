# Read file
# Read only portion of file 66637:69517 (correspond to 01-02-2007 to 02-02-2007) to data frame
headRw <- scan("household_power_consumption.txt", what="character", nlines=1, sep=";", quiet=TRUE)
pw_cons <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?", skip=66636, nrow=2880, col.names=headRw)
pw_cons$datetime <- strptime(paste(pw_cons$Date, pw_cons$Time), format= "%d/%m/%Y %H:%M:%S")
#Constructing plot 2
par(mfcol=c(1,1))      ## set layout
par(mar=c(3,4.2,2,2))  ## set margins
par(font.lab=2)        ## set font for label
with( pw_cons, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", cex.lab=0.9))
#Copy plot to png file
dev.copy(png, file="plot2.png",  width = 480, height = 480)
dev.off() ## Close png file device