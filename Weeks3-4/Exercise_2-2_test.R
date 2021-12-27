# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Weeks3-4/")

# Load libraries
library('readxl')

# Load Data
popDF <- read_excel("world-population.xlsm")

head(popDF)

# Plot a line chart
plot(popDF$Year, popDF$Population, type = 'l', ylim = c(0, 7e9),
     xlab = 'Year', ylab = 'Population (billions)', 
     main = "World Population by Year")

# Plot a step chart
plot(popDF$Year, popDF$Population, type = 's', ylim = c(0, 7e9),
     xlab = 'Year', ylab = 'Population (billions)', 
     main = "World Population by Year")
