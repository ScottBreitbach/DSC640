# Load libraries
library(ggplot2)
# library(dplyr)

# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Weeks5-6/")

# Load data
unempDF <- read.csv("unemployment_cleaned.csv")
expenDF <- read.csv("expenditures.csv")

head(expenDF)
str(expenDF)

# Convert column to datetime data type
# expenDF$year <- as.Date(expenDF$year, format = "%Y")

ggplot(expenDF, aes(x=year, y=expenditure, fill=category)) + 
  geom_area() + 
  theme_minimal() +
  labs(y="Expenditure ($USD)", x="Year") +
  ggtitle("Expenditure Categories Over Time")








