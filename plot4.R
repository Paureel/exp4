#read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#merge the two dataset
df3 = merge(NEI, SCC, by.x="SCC", by.y="SCC")
#search for the words and save the subset which contains it
df4 <- df3[grep("Coal", df3$SCC.Level.Four), ]
df4 <- df4[grep("Comb", df4$SCC.Level.One), ]
unused <- droplevels(df4$EI.Sector)
levels(df4$EI.Sector) <- unused
#group the data and plot it
sol4 <- tapply(df4$Emissions, df4$year, sum)
barplot(sol4, main="Total coal combustion related pollutant emissions", xlab="Year", ylab="Total tons emitted")


dev.copy(png,'plot4.png')
dev.off()