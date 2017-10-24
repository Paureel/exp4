#read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#merge the two dataset
df3 = merge(NEI, SCC, by.x="SCC", by.y="SCC")
#search for the words and save the subset which contains it
df4 <- df3[grep("Vehicle", df3$SCC.Level.Two), ]
unused <- droplevels(df4$Short.Name)
levels(df4$Short.Name) <- unused
#Filter the data for Baltimore City region
df4 <- subset(df4, fips == "24510")
#group the data and plot it
sol4 <- tapply(df4$Emissions, df4$year, sum)
barplot(sol4, main="Total motor vehicle related pollutant emissions", xlab="Year", ylab="Total tons emitted")