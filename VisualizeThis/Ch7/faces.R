## Get ready b/c this is weird as shit

# Load library
# install.packages('aplpack')
library(aplpack)


# Load data set
bball <- read.csv("http://datasets.flowingdata.com/ppg2008.csv", header = TRUE)


# Make some Chernoff faces
faces(bball[,2:16], ncolors = 0)


# Put names to faces
faces(bball[,2:16], ncolors = 0, labels = bball$Name)
# Fix label size
faces(bball[,2:16], ncolors = 0, labels = bball$Name, cex = 1)

?faces

# Santas
faces(bball[,2:16], ncolors = 0, labels = bball$Name, face.type = 2)

