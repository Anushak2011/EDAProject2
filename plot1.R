#Read PM2.5 Emissions Data & Source Classification Code Table
NEI <- readRDS("summarySCC_PM25.rds")

SCC <- readRDS("Source_Classification_Code.rds")
aggData<-with (NEI,aggregate(NEI[,'Emissions'],by=list(year), sum, na.rm=TRUE))
names(aggData) <- c('Year', 'TotEmission')

png(filename='figure/plot1.png', width=480, height=480, units='px')
#Plot aggregated data of total emissions for all years
plot(aggData, type="l", xlab="Year", ylab="Total PM2.5 Emmision From All Sources Between 1999-2008", 
     col="dark blue", xaxt="n", main="Total Emissions (tons)")
#x-axis shows the year
axis(1, at=as.integer(aggData$Year), las=1)
dev.off()
