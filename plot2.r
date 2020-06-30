NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
subsNEI<- NEI[NEI$fips=="24510", ]
totalByYear <- aggregate(Emissions ~ year, subsNEI, sum)
png('plot2.png')
with(totalByYear, barplot(height = Emissions, names.arg = year, xlab = "Years", ylab = "Total emission", main = "Total Pm2.5 emission per year in Baltimore City"))
dev.off()
