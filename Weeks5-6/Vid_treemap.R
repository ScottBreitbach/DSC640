# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Weeks5-6/")


unempDF <- read.csv("unemployement-rate-1948-2010.csv")
expenDF <- read.csv("expenditures.csv")


head(unempDF)
tail(unempDF)
head(expenDF)
tail(expenDF)

install.packages("treemap")
library(treemap)

# ?tmPlot # Deprected, replaced by treemap()
treemap(dtf = unempDF, 
        index = c("Year"),
        vSize = c("Value"),
        vColor = c("Period"))

