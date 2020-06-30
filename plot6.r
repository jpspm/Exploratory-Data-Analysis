NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
subsNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
totalByYear<- aggregate(Emissions ~ year+fips, subsNEI, sum)
totalByYear$fips[totalByYear$fips=="24510"] <- "Baltimore, MD"
totalByYear$fips[totalByYear$fips=="06037"] <- "Los Angeles, CA"
library(ggplot2)
png("plot6.png", width=1040, height=480)
gplot<- ggplot(totalByYear, aes(factor(year), Emissions))
gplot<-gplot+ facet_grid(. ~ fips)+geom_bar(stat = "identity")+xlab("Years")+ylab("Emission")+ggtitle("Total emission from ON-Road vehicle in Baltimore, MD x Los Angeles, CA from 1999 to 2008'")
print(gplot)
dev.off()
