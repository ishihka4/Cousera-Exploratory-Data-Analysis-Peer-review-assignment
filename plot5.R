# extract "Mobile Vehicles" from SCC
SCCmove <-SCC[grepl("Mobile", SCC$EI.Sector, ignore.case = T),]
SCCmove <-SCCmove[grepl("Vehicles", SCCmove$EI.Sector, ignore.case = T),]

# extract "Mobile Vehicles" from NEI in Baltimore
NEImove <- NEI[NEI$SCC %in% SCCmove$SCC,]
NEImoveBal <- subset(NEImove, fips == "24510")

# draw a plot
PM2.5Bal <- aggregate(Emissions~year, data = NEImoveBal, sum)
plot(Emissions~year, data = PM2.5Bal, type="b", col = "blue", main = "Trend of total PM2.5 from motor vehicle in Baltimore")

# copy the plot to a PNG file.
dev.copy(png, file = "plot5.png")
dev.off()