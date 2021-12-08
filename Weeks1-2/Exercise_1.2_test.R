# Load libraries
library('readxl')
library('ggplot2')

# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Weeks1-2/")

# Load DataFrames
dogDF <- read_excel("hotdog-contest-winners.xlsm")
thanksObama <- read_excel("obama-approval-ratings.xls")

head(dogDF)

# Add column combining year and winner
dogDF$YearWinner <- paste(dogDF$Winner, dogDF$Year)

dogDF$`New record` <- as.integer(dogDF$`New record`)

## BAR CHART
### To Do: ###
# Get in correct order 
# Label chart / axes 
# Save to file
bar <- ggplot(data=dogDF, aes(x=Year, y=`Dogs eaten`, fill=`New record`)) 
bar + geom_bar(stat = "identity") + coord_flip() + 
  theme(legend.text = element_blank()) + 
  ggtitle("Number of Hotdogs Eaten by Winner") + 
  labs(y="Year", x="Hotdogs") + 
  labs(fill="New Record")
  

head(dogDF)

## STACKED BAR CHART
# Load library
library(reshape2)

# Melt data set into proper format for plotting
meltObama <- melt(thanksObama)
head(meltObama)

ggplot(meltObama, aes(x=Issue, y=value, fill=variable)) + 
  geom_bar(stat="identity") + coord_flip() + 
  ggtitle("Obama's Approval Ratings by Issue") + 
  labs(y="Percent of Response", x="Political Issue") + 
  labs(fill="Response")


# condition <- rep()
# 
# stBar <- ggplot(data = thanksObama, aes(x=Issue))
# stBar + geom_bar(aes(fill=))
# 
# matrixObama <- as.matrix(thanksObama)
# barplot(matrixObama)
# barplot(thanksObama$Issue)
# 
# tranObama <- t(thanksObama)
# matTranObama <- as.matrix(tranObama)
# barplot(matTranObama)
# head(matTranObama)
# 
# ggplot(thanksObama, aes(x=))

# c(Approve, Disapprove, None)


## PIE CHART
# head(dogDF)
# ggplot(dogDF, aes(x=factor(1), fill=Country)) + 
#   coord_polar("y", start=0)
# 
# dogDF$Country

mytable <- table(dogDF$Country, dnn = list("Country"))
lbls <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels = lbls, 
    main = "Hotdog Eating Competition: Wins by Country")



# DONUT CHART
# Compute percentages
winsDF <- as.data.frame(mytable, responseName = "Wins")
winsDF

winsDF$fraction <- winsDF$Wins / sum(winsDF$Wins)
winsDF

# Compute the cumulative percentages
winsDF$ymax <- cumsum(winsDF$fraction)
winsDF

# Compute the bottom of each rectangle
winsDF$ymin <- c(0, head(winsDF$ymax, n=-1))
winsDF

# Compute label position
winsDF$labelPosition <- (winsDF$ymax + winsDF$ymin) / 2
winsDF

# Make the plot
ggplot(winsDF, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=Country)) + 
  geom_rect() + 
  geom_text(x=3.5, aes(y=labelPosition, label=Wins), size=5) +
  coord_polar(theta = 'y') +
  xlim(c(2, 4)) +
  theme_void() +
  ggtitle("Hotdog Eating Competition: Wins by Country")

winsDF



# mytable$fraction <- mytable/sum(mytable)

#===============================#
### TEST STUFF ###
# create a dataset
specie <- c(rep("sorgho" , 3) , rep("poacee" , 3) , rep("banana" , 3) , rep("triticum" , 3) )
condition <- rep(c("normal" , "stress" , "Nitrogen") , 4)
value <- abs(rnorm(12 , 0 , 15))
data <- data.frame(specie,condition,value)
head(data)


library(reshape2)

test <- melt(thanksObama)
head(test)

ggplot(test, aes(x=Issue, y=value, fill = variable)) + 
  geom_bar(stat = "identity") + coord_flip()
