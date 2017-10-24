#read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#merge the two dataset
df3 = merge(NEI, SCC, by.x="SCC", by.y="SCC")
#search for the words and save the subset which contains it
df4 <- df3[grep("Vehicle", df3$SCC.Level.Two), ]
unused <- droplevels(df4$Short.Name)
levels(df4$Short.Name) <- unused
#Filter the data for different regions
balti <- subset(df4, fips == "24510")
cal <- subset(df4, fips == "06037")
#group the data and plot it
sol.balti <- tapply(balti$Emissions, balti$year, sum)
sol.cal <- tapply(cal$Emissions, cal$year, sum)
par(mfrow=c(1,2))
barplot(sol.balti, main="Total motor vehicle related pollutant emissions in Baltimore", xlab="Year", ylab="Total tons emitted")
barplot(sol.cal, main="Total motor vehicle related pollutant emissions in California", xlab="Year", ylab="Total tons emitted")
