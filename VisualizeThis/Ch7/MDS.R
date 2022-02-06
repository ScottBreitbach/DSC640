# Load data
url <- "http://datasets.flowingdata.com/education.csv"
education <- read.csv(url, header = TRUE)


# Figure out how far each state should be from each other
ed.dis <- dist(education[,2:7])
ed.dis # a series of matrices

# get x-y coordinates for each state
ed.mds <- cmdscale(ed.dis)
ed.mds

# store these values in x and y variables
x <- ed.mds[,1]
y <- ed.mds[,2]
plot(x, y)

# add labels
plot(x, y, type='n')
text(x, y, labels = education$state)


plot(x, y, type='n')
text(x, y, labels = education$state, col = reading_colors)

plot(x, y, type='n')
text(x, y, labels = education$state, col = dropout_colors)


## Model-based clustering
# used to identify clusters in your MDS plot

# Load library
library(mclust)

# fit
ed.mclust <- Mclust(ed.mds)
# plot
plot(ed.mclust, data = ed.mds)
