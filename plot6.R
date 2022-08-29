# extract "Mobile Vehicles" from SCC
SCCmove <-SCC[grepl("Mobile", SCC$EI.Sector, ignore.case = T),]
SCCmove <-SCCmove[grepl("Vehicles", SCCmove$EI.Sector, ignore.case = T),]

# extract "Mobile Vehicles" from NEI in Baltimore
NEImove <- NEI[NEI$SCC %in% SCCmove$SCC,]
NEImoveBal <- subset(NEImove, fips == "24510")
# extract "Mobile Vehicles" from NEI in California
NEImove <- NEI[NEI$SCC %in% SCCmove$SCC,]
NEImoveCal <- subset(NEImove, fips == "06037")

# draw a plot
PM2.5Bal <- aggregate(Emissions~year, data = NEImoveBal, sum)
PM2.5Cal <- aggregate(Emissions~year, data = NEImoveCal, sum)
PM2.5merge <- rbind(PM2.5Bal, PM2.5Cal)
State <- rep(c("Baltimore", "California"), each=4)
PM2.5merge <- mutate(PM2.5merge, State)

g <- ggplot(PM2.5merge, aes(year, Emissions, color = State))
g+geom_line()+geom_point()+labs(title = "Comparison of motor vehicle sourced PM2.5")

# copy the plot to a PNG file.
dev.copy(png, file = "plot5.png")
dev.off()