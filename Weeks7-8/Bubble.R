# Load libraries
library(ggplot2)
library(dplyr)

# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Weeks7-8/")

# Load the data
crimeDF <- read.csv("crimerates-by-state-2005.csv")

head(crimeDF)
color = "#4f3674"

# Remove Washington, DC b/c outlier
crimeDF <- crimeDF[crimeDF$state != "District of Columbia",]
# And remove United States b/c averages
crimeDF <- crimeDF[crimeDF$state != "United States",]

# Make a bubble plot
ggplot(crimeDF, aes(x=murder, y=burglary, size=population)) +
  geom_point(alpha=0.7, col=color) +
  scale_size(range=c(0.1,24), name="Population") +
  theme_gray() +
  labs(x="Murders", y="Burglaries") +
  ggtitle("Murders vs Burglaries in the United States")


