NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalByYear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=totalByYear$Emissions, names.arg=totalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()
