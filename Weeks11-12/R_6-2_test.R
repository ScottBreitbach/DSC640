# ## DISTRIBUTION ##
# 
# dataURL <- "http://datasets.flowingdata.com/birth-rate.csv"
# 
# # Load data
# birth <- read.csv(dataURL)

# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Weeks11-12/")

# Load libraries
library(ggplot2)
library(reshape2)
library(gdata)

# Set color to Bellevue purple
color = "#4f3674"

# Load data
birthdf <- read.csv('birth-rate.csv')
educadf <- read.csv('education.csv')

summary(birthdf$X1980)
head(educadf)

# # Histogram in base R
# hist(birthdf$X1980)
# hist(birthdf$X1980, breaks = 20)


## HISTOGRAM

# Plot histogram
# ggplot(birthdf, aes(x=X1980)) +
#   geom_histogram()
# 
# ggplot(birthdf, aes(x=X1980)) +
#   geom_histogram(binwidth = 2)

ggplot(birthdf, aes(x=X1980)) +
  geom_histogram(binwidth = 2, fill=color, color="#e9ecef", alpha=0.8) +
  xlim(0,60) +
  ggtitle('Global Birth Rate Distribution, 1980') +
  labs(x="Live Births per 1000 Population", y="Count")
  

## BOX PLOT

# # Plot box plot
# ggplot(educadf, aes(x=reading)) +
#   geom_boxplot(fill=color, alpha=0.8)
# 
# 
# head(educadf[,1:4])

names(educadf)

# Rename relevant columns to Title Case
# # https://stackoverflow.com/questions/7531868/how-to-rename-a-single-column-in-a-data-frame
# library(gdata)
# educadf <- rename.vars(educadf, from = c("reading", "math", "writing"),
#                        to = c("Reading", "Math", "Writing"))
# https://www.geeksforgeeks.org/convert-first-letter-of-every-word-to-uppercase-in-r-programming-str_to_title-function/?ref=lbp
library(stringr)
names(educadf) <- str_to_title(names(educadf))

head(educadf)

# Remove United States due to averages
educadf <- educadf[educadf$State != "United States",]

# # Remove Washington, DC due to outliers
# crimeDF <- crimeDF[crimeDF$state != "District of Columbia",]
# # And remove United States due to averages
# crimeDF <- crimeDF[crimeDF$state != "United States",]
# 
# 
# educadf[educadf$State != "United States",]

head(educadf)

# Reformat education data
# https://www.statmethods.net/management/reshape.html
library(reshape2)
edumelt <- melt(educadf[,1:4], id="state")

head(edumelt)

# Save reformatted data as CSV for use elsewhere
write.csv(edumelt, "education_melted.csv", row.names = FALSE)

# Make Box plot
ggplot(edumelt, aes(x=variable, y=value)) +
  geom_boxplot(fill=color, alpha=0.8) +
  ggtitle('Distribution of SAT Scores in the United States') +
  labs(x="Subject", y="SAT Score")


## BULLET CHART


# 
summary(educadf)
mean(educadf$Reading)
educadf[educadf['State'] == 'Nebraska']


b_colors <- c("#4f3674", "#8867b8", "#9d82c5")
names(b_colors) <- c('Ok', 'Good', 'Excellent')

ggplot() +
  geom_bar(educadf, aes(x = State, y = Reading, fill = Reading), stat = 'identity', position = 'stack')

ggplot() +
  geom_bar(data = head(educadf), 
           aes(x = State, y = Reading), 
           fill = 'black', width = 0.2, stat = 'identity')

names(educadf)
head(educadf, 10)



