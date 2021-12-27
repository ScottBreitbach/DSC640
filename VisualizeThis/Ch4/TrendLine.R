# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/VisualizeThis/Ch4/")

# Load Data
unemployment <- 
  read.csv("http://datasets.flowingdata.com/unemployment-rate-1948-2010.csv", 
           sep = ",", 
           header = TRUE)

head(unemployment)

# Create a plain scatter plot
plot(1:length(unemployment$Value), unemployment$Value)

# # Add linear regression
# ?plot()
# lm(1:length(unemployment$Value) ~ unemployment$Value)

# Add a LOESS curve
scatter.smooth(x = 1:length(unemployment$Value), y = unemployment$Value)

# Adjust how fitted the curve is
scatter.smooth(x = 1:length(unemployment$Value), y = unemployment$Value, 
               ylim = c(0, 11), degree = 2, col = "#CCCCCC", span = 0.5)

