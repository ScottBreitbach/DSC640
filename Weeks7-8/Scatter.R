# Load libraries
library(ggplot2)

# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Weeks7-8/")

# Load the data
crimeDF <- read.csv("crimerates-by-state-2005.csv")

head(crimeDF)
# Set dot color to Bellevue purple
color = "#4f3674"

# Scatterplot: murder v burglary
plot(crimeDF$murder, crimeDF$burglary)

# Remove Washington, DC b/c outlier
crimeDF <- crimeDF[crimeDF$state != "District of Columbia",]
# And remove United States b/c averages
crimeDF <- crimeDF[crimeDF$state != "United States",]

# Scatterplot: murder v burglary
ggplot(crimeDF, aes(x=murder, y=burglary)) +
  geom_point()

ggplot(crimeDF, aes(x=murder, y=burglary)) +
  geom_point(col=color) +
  theme_gray() +
  labs(x="Murders", y="Burglaries") +
  ggtitle("Murders vs Burglaries in the United States")




