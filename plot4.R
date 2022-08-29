# Extract "coal" from NEI
SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T),]
NEIcoal<-NEI[NEI$SCC %in% SCCcoal$SCC,]

# create a function to calculate total PM25 each year. 
PMyear <- function(x){
  subyear <- subset(NEIcoal, year==x)
  sum(subyear$Emissions)
}

totalPM <- data.frame(year=c(1999,2002,2005,2008), PM2.5=c(PMyear(1999),PMyear(2002),PMyear(2005),PMyear(2008)))

# draw a plot with ggplot2
g <- ggplot(totalPM, aes(year, PM2.5))
g+geom_point()+geom_line()+labs(y="Total PM2.5 in the US", title = "Coal combustion-related sources changed in the US")

# copy the plot to a PNG file.
dev.copy(png, file = "plot4.png")
dev.off()