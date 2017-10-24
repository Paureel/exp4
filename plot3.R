library(plyr)
library(ggplot2)
#read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset the data to include only the baltimor City region
sub <- subset(NEI, fips == "24510")
groupColumns = c("year","type")
dataColumns = "Emissions"
#group and plot the data
res = ddply(sub, groupColumns, function(x) colSums(x[dataColumns]))
res$year <- as.factor(res$year)
g <- ggplot(res, aes(year, Emissions)) +   
  geom_bar(aes(fill = type), position = "dodge", stat="identity")

g
dev.copy(png,'plot3.png')
dev.off()