# Load libraries
library(ggplot2)

# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Weeks5-6/")

# Load data
unempDF <- read.csv("unemployment_cleaned.csv")
expenDF <- read.csv("expenditures.csv")

head(unempDF)
tail(unempDF)

# Convert column to datetime data type
unempDF$MoYr <- as.Date(unempDF$MoYr, format = "%Y-%m-%d")

str(unempDF)

# Plot Area Chart
ggplot(unempDF,
       aes(x=MoYr, y=Value)) + 
  geom_area()


# Plot Area Chart
ggplot(unempDF, aes(x=MoYr, y=Value)) + 
  geom_area(fill="blue", alpha=0.5) +
  geom_line(color="blue", size=0.5) + 
  theme_minimal() +
  labs(y="Unemployment Level", x="Year") +
  ggtitle("Unemployment Over Time") +
  scale_x_date(date_labels="%Y", breaks = "10 years")

  
  
