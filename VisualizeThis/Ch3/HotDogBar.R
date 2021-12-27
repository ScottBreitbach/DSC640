# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/VisualizeThis/Ch3/")

# Load Data
hotdogs <- 
  read.csv('http://datasets.flowingdata.com/hot-dog-contest-winners.csv', 
           sep=',', 
           header = TRUE)

head(hotdogs)

hotdogs$Dogs.eaten

# Plot number of dogs eaten
barplot(hotdogs$Dogs.eaten)

#  Add year names
barplot(hotdogs$Dogs.eaten, names.arg = hotdogs$Year)

# Add axis labels, change borders, change colors
barplot(hotdogs$Dogs.eaten, names.arg = hotdogs$Year, col = 'red', 
        border = NA, xlab = 'Year', ylab = 'Hot dogs and buns (HBD) eaten')

# Highlight the years that the US won the contest
fill_colors <- c()
for ( i in 1:length(hotdogs$Country) ) {
  if (hotdogs$Country[i] == "United States") {
    fill_colors <- c(fill_colors, "#821122")
  } else {
    fill_colors <- c(fill_colors, "#cccccc")
  }
}
fill_colors

# Pass the fill colors to the bar plot
barplot(hotdogs$Dogs.eaten, names.arg = hotdogs$Year, col = fill_colors, 
        border = NA, xlab = 'Year', ylab = 'Hot dogs and buns (HBD) eaten')

# Highlight the years that a record was broken
fill_colors <- c()
for ( i in 1:length(hotdogs$New.record) ) {
  if (hotdogs$New.record[i] == 1) {
    fill_colors <- c(fill_colors, "#821122")
  } else {
    fill_colors <- c(fill_colors, "#cccccc")
  }
}
fill_colors

# Pass the fill colors to the bar plot
barplot(hotdogs$Dogs.eaten, names.arg = hotdogs$Year, col = fill_colors, 
        border = NA, xlab = 'Year', ylab = 'Hot dogs and buns (HBD) eaten')

# Play around with spacing and title
barplot(hotdogs$Dogs.eaten, names.arg = hotdogs$Year, col = fill_colors, 
        border = NA, space = 0.3, xlab = 'Year', 
        ylab = 'Hot dogs and buns (HBD) eaten')
title(main = "Nathan's Hot Dog Eating Contest Results, 1980-2010", cex.main = 2)






