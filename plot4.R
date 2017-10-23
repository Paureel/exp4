NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
df3 = merge(NEI, SCC, by.x="SCC", by.y="SCC")
df4 <- df3[grep("Coal", df3$EI.Sector), ]
unused <- droplevels(df4$EI.Sector)
levels(df4$EI.Sector) <- unused
sol4 <- tapply(df4$Emissions, df4$year, sum)
barplot(sol4, main="Total coal combustion related pollutant emissions", xlab="Year", ylab="Total tons emitted")