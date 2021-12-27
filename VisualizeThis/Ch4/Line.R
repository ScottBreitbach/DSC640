# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/VisualizeThis/Ch4/")

# Load Data
population <- 
  read.csv("http://datasets.flowingdata.com/world-population.csv", 
           sep = ",", 
           header = TRUE)

head(population)

# Specify some parameters and plot a line chart
plot(population$Year, population$Population, type = "l", 
     ylim = c(0, 7000000000), xlab = "Year", ylab = "Population")
