source("downloadArchive.R")

# Read data for the NEI & SCC
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimoreNEI <- NEI[NEI$fips=="24510",]
# sum the Baltimore emissions data by year to aggregate
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(
  aggTotalsBaltimore$Emissions,
  names.arg=aggTotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From all Baltimore City Sources"
)

dev.off()
