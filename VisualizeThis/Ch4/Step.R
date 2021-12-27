# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/VisualizeThis/Ch4/")

# Load Data
postage <- 
  read.csv("http://datasets.flowingdata.com/us-postage.csv", 
           sep = ",", 
           header = TRUE)

postage

# Create a step chart
plot(postage$Year, postage$Price, type = "s")

# Specify some paramaters for the chart
plot(postage$Year, postage$Price, type = "s", 
     main = "US Postage Rates for Letters, First Ounce, 1991-2010", 
     xlab = "Year", ylab = "Postage Rate ($USD)")

