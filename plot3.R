# create a function to calculate total PM25 each year for Baltimore City. 
PMyearBal <- function(x,y){
  subyearBal <- subset(NEI, year==x & fips=="24510" & type=="y") 
  sum(subyearBal$Emissions)
}

# x=c(1999,2002,2005,2008), y=c("POINT", "NONPOINT", "ON-ROAD", "NON-ROAD")

for (i in 1:16) {
  y <- data.frame(year=a, type=b, value=c)
  a = rep(c(1999,2002,2005,2008),each=4)
  b = rep(c("POINT", "NONPOINT", "ON-ROAD", "NON-ROAD"), 4)
  c = rep(NA,16)
  x[i] = PMyearBal(a[i], b[i])
  y$value = x
  }

# create a plot with ggplot2
g <- ggplot(y, aes(year, value, color = type)) 
g + geom_line() + geom_point() + labs(y= "Total PM2.5 in Baltimore", title = "Trend of PM2.5 with type of source in Baltimore")

# copy the histogram to a PNG file.
dev.copy(png, file = "plot3.png")
dev.off()

# for (i in 1:4) {
#   y <- rep(NA, 4)
#   a = c(1999,2002,2005,2008)
#   x[i] = PMyearBal(a[i], "POINT")
#   y = x
# }
# for (i in 1:4) {
#   y <- rep(NA, 4)
#   a = c(1999,2002,2005,2008)
#   x[i] = PMyearBal(a[i], "NONPOINT")
#   y = x
# }