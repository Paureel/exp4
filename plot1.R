#read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#plot the total pollutant value
sol1 <- tapply(NEI$Emissions, NEI$year, sum)
barplot(sol1, main="Total pollutant emission", xlab="Year", ylab="Total tons emitted")
