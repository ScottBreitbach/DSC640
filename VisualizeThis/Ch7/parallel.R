## Parallel Coordinates

# Load data
url <- "http://datasets.flowingdata.com/education.csv"
education <- read.csv(url, header = TRUE)

education[1:10,]

# Load library
library(lattice)


# Create parallel coordinates plot
parallel(education)   # deprecated
parallelplot(education)

# Flip on axis
parallelplot(education, horizontal.axis=FALSE)

# Remove state column & change colors to black
parallelplot(education[,2:7], horizontal.axis=FALSE, col = '#000000')


summary(education) # median for reading is 523
# set colors for each state by greater or less than median reading score
reading_colors <- c()
for (i in 1:length(education$state)) {
  
  if(education$reading[i] > 523) {
    col <- '#000000'
  } else {
    col <- '#bdbdbd'
  }
  reading_colors <- c(reading_colors, col)
}

# Pass the colors in to the parallel function
parallelplot(education[,2:7], horizontal.axis=FALSE, col = reading_colors)


# set colors based on dropout rates
dropout_colors <- c()
for (i in 1:length(education$state)) {
  
  if(education$dropout_rate[i] > 5.3) {
    col <- '#000000'
  } else {
    col <- '#bdbdbd'
  }
  dropout_colors <- c(dropout_colors, col)
}

# Pass the colors in to the parallel function
parallelplot(education[,2:7], horizontal.axis=FALSE, col = dropout_colors)



