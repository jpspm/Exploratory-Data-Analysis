NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
subsNEI<- NEI[NEI$fips=="24510", ]
totalByYearinBCandtype <- aggregate(Emissions ~ year+type, subsNEI, sum)
#library(ggplot2)
png("plot3.png", width=640, height=480)
gplot<- ggplot(totalByYearinBCandtype, aes(x = year, y=Emissions, color = type))
gplot<-gplot+geom_line()+xlab("Years")+ylab("Emission")+ggtitle("Total pm2.5 emission per year in Baltimore city")
print(gplot)
dev.off()