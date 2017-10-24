#read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset the data to include only the baltimor City region
sub <- subset(NEI, fips == "24510")
#plot the total pollutant value
sol2 <- tapply(sub$Emissions, sub$year, sum)
barplot(sol2, main="Total pollutant emission in Baltimore City", xlab="Year", ylab="Total tons emitted")
