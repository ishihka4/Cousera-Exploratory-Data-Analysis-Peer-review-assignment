# create a function to calculate total PM25 each year. 
PMyear <- function(x){
  subyear <- subset(NEI, NEI$year==x)
  sum(subyear$Emissions)
}

totalPM <- data.frame(yaer=c(1999,2002,2005,2008), PM2.5=c(PMyear(1999),PMyear(2002),PMyear(2005),PMyear(2008)))

plot(totalPM$yaer,totalPM$PM2.5, type="b", xlab = "year", ylab = "Total Emissions", main = "Trend of Total Emissions PM2.5", lwd=2,xlim = c(1998,2009), ylim = c(3e+6,8e+6))

# copy the histogram to a PNG file.
dev.copy(png, file = "plot1.png")
dev.off()