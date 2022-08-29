# create a function to calculate total PM25 each year for Baltimore City. 
PMyearBal <- function(x){
  subyearBal <- subset(NEI, NEI$year==x & fips=="24510")
  sum(subyearBal$Emissions)
}

totalPMBal <- data.frame(yaer=c(1999,2002,2005,2008), PM2.5_Baltimore=c(PMyearBal(1999),PMyearBal(2002),PMyearBal(2005),PMyearBal(2008)))

plot(totalPMBal$yaer,totalPMBal$PM2.5_Baltimore, type="b", xlab = "year", ylab = "Total Emissions in Baltimore", main = "Trend of Total Emissions PM2.5 in Baltimore", lwd=2,xlim = c(1998,2009), ylim = c(1600,3600), col="blue")

# copy the histogram to a PNG file.
dev.copy(png, file = "plot2.png")
dev.off()