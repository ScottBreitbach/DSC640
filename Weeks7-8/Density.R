# Load libraries
library(ggplot2)
library(dplyr)

# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Weeks7-8/")

# Load the data
birthDF <- read.csv("birth-rate.csv")

head(birthDF)
color = "#4f3674"

# Make a density plot
ggplot(birthDF, aes(x=X1980)) +
  geom_density(fill=color, color=color, alpha=0.8) +
  xlim(0,65) +
  theme_gray() +
  labs(x="Live Births per 1,000 Population", y="Density") +
  ggtitle("Global Distribution of Birth Rates in 1980")

summary(birthDF$X1980)

head(birthDF)


# Remove null values
b1980 <- birthDF$X1980[!is.na(birthDF$X1980)]

# Pass to density function
d1980 <- density(b1980)

d1980

plot(d1980)

## DISTRIBUTION ##

dataURL <- "http://datasets.flowingdata.com/birth-rate.csv"

# Load data
birth <- read.csv(dataURL)

# # Create a histogram
# hist(birth$X2008)
# # Decrease to 5 breaks
# hist(birth$X2008, breaks = 5)
# # Increase to 20 breaks
# hist(birth$X2008, breaks = 20)
# 
# # Get some summary stats
# summary(birth$X2008)

# Create a density plot using `density()` function
# Note: can't have any Null values, so remove those first
b08 <- birth$X2008[!is.na(birth$X2008)]
# pass to density function
d08 <- density(b08)
d08
d08$x
# 
# # Write to a text file, just for fun
# # Set Working Directory
# setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/VisualizeThis/Ch6/")
# # Put coordinates in a data frame
# d08DF <- data.frame(d08$x, d08$y)
# # Save to text file
# write.table(d08DF, "birthDensity2008.txt", sep = "\t")
# write.table(d08DF, "birthDensity2008csv.txt", sep = ",", row.names = FALSE)
# # Now you can load the data in another program!

# Back to our previously scheduled density plot
plot(d08)
# Make a filled density plot
plot(d08, type = "n")   # "n" for no plotting
polygon(d08, col = "#821122", border = "#cccccc")

# Now plot the density plot over the histogram
library(lattice)
histogram(birth$X2008, breaks = 10)
lines(d08)  # for some reason this isn't adding the density plot

