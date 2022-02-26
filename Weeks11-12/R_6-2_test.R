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
# summary(educadf)
# mean(educadf$Reading)
# educadf[educadf['State'] == 'Nebraska']
# 
# 
# b_colors <- c("#4f3674", "#8867b8", "#9d82c5")
# names(b_colors) <- c('Ok', 'Good', 'Excellent')
# 
# ggplot() +
#   geom_bar(educadf, aes(x = State, y = Reading, fill = Reading), stat = 'identity', position = 'stack')
# 
# ggplot() +
#   geom_bar(data = head(educadf), 
#            aes(x = State, y = Reading), 
#            fill = 'black', width = 0.2, stat = 'identity')
# 
# names(educadf)
# head(educadf, 10)

# https://kgilds.rbind.io/post/bullet-chart-attempt/
library(ggplot2)

fake.data <- data.frame(measure=letters[1:10],
                        value=rpois(10,5),
                        mean=rpois(10,5),
                        target=rpois(10,7) )
head(fake.data)

p <- ggplot(fake.data, aes(value, measure) )

p <- ggplot(fake.data, aes(measure, value) )
p <- p + geom_col(fill="grey", width=0.5)
p <- p + geom_col(aes(measure, mean), width=0.2)
p <- p + geom_point(aes(measure, target), colour="red")
p <- p + geom_errorbar(aes(y = target,x = measure, ymin = target,ymax
                           = target), width = .45)
p <- p + coord_flip()
p


eduSummary <- read.csv("education_summary.csv")

# Rename first column
names(eduSummary)[1] <- 'Category'

head(eduSummary)


ggplot(eduSummary, aes(Category, Average)) +
  geom_col(fill="#bfaed9", width = 0.5) +
  geom_col(fill=color, aes(Category, Actual), width = 0.2) +
  geom_errorbar(aes(y = Max, x = Category, 
                    ymin = Max, ymax = Max), 
                width = 0.45) +
  coord_flip() +
  ggtitle('Nebraska SAT Scores Compared to US Average and Max Score') +
  labs(x="Subject", y="SAT Score")


names(eduSummary)



## WORDCLOUD
library(wordcloud)

a <- c("test", "one", "two")

typeof(a)
a

b <- sample(seq(0,1,0.1), length(a), replace = TRUE)
b

wordcloud(a,b)
wordcloud(a)

library(tm)
# install.packages("tm")

b <- read.delim("compiled_words.txt", sep = "\t")
b

wordcloud(b)

library(wordcloud2)
# install.packages("wordcloud2")

wordcloud2(data=b)
head(demoFreq)

wordcloud2(demoFreq)

