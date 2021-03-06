NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
subsNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
totalByYear<- aggregate(Emissions ~ year, subsNEI, sum)
library(ggplot2)
png("plot5.png", width=640, height=480)
gplot<- ggplot(totalByYear, aes(factor(year), Emissions))
gplot<-gplot+geom_bar(stat = "identity")+xlab("Years")+ylab("Emission")+ggtitle("Total emission from ON-Road vehicle in Baltimore city, Mariland from 1999 to 2008'")
print(gplot)
dev.off()
