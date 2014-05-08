# Read file
# Read full file - not in use - find rows to load
# pw_cons <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")
# pw_cons$Date1 <- as.Date(pw_cons$Date, format = "%d/%m/%Y")
# pw_cons <- subset(pw_cons, Date1 >= as.Date("2007-02-01") & Date1 <= as.Date("2007-02-02") )
#
# Read only portion of file 66637:69517 (correspond to 01-02-2007 to 02-02-2007) to data frame
headRw <- scan("household_power_consumption.txt", what="character", nlines=1, sep=";", quiet=TRUE)
pw_cons <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?", skip=66636, nrow=2880, col.names=headRw)
pw_cons$datetime <- strptime(paste(pw_cons$Date, pw_cons$Time), format= "%d/%m/%Y %H:%M:%S")
#Constructing plot 1
par(mfcol=c(1,1))    ## set layout
par(mar=c(4.2,4.2,2,2))  ## set margins
par(font.lab=1)      ## set font for label
hist(pw_cons$Global_active_power, xlab="Global Active Power (kilowats)", main="Global Active Power", col ="red")
#Copy plot to png file
dev.copy(png, file="plot1.png",  width = 480, height = 480)
dev.off() ## Close png file device