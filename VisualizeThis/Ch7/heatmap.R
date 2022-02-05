
# Load data
bball <- read.csv("http://datasets.flowingdata.com/ppg2008.csv", header = TRUE)

head(bball)
bball[1:5,]


# Sort by field goal percentage
bball_by_fgp <- bball[order(bball$FGP, decreasing = TRUE),]

head(bball_by_fgp)


# Reverse order on points per game
bball <- bball[order(bball$PTS, decreasing = FALSE),]

head(bball)


# set row names to player name
row.names(bball) <- bball$Name
head(bball)

bball <- bball[,2:20]
head(bball)


# Store data as a matrix for heatmap
bball_matrix <- data.matrix(bball)


# Make a heatmap
bball_heatmap <- heatmap(bball_matrix, Rowv = NA, Colv = NA,
                         col = cm.colors(256),  # sets colors to cyan / magenta
                         scale = 'column', margins = c(5,10))

# Pick a different color scheme
bball_heatmap <- heatmap(bball_matrix, Rowv = NA, Colv = NA,
                         col = heat.colors(256),  # sets colors to red / yellow
                         scale = 'column', margins = c(5,10))

cm.colors(10) # an array of 10 colors ranging from cyan to magenta

# Set your own color scheme
red_colors <- c('#ffd3cd', '#ffc4bc', '#ffb5ab', '#ffa69a', '#ff9789', 
                '#ff8978', '#ff7a67', '#ff6b56', '#ff5c45', '#ff4d34')
bball_heatmap <- heatmap(bball_matrix, Rowv = NA, Colv = NA,
                         col = red_colors,  # sets colors to assigned colors
                         scale = 'column', margins = c(5,10))

?cm.colors


# Load ColorBrewer library
library(RColorBrewer)
?brewer.pal

# Create a heatmap using ColorBrewer
bball_heatmap <- heatmap(bball_matrix, Rowv = NA, Colv = NA,
                         col = brewer.pal(9, "Blues"),  # 9 shades of blue
                         scale = 'column', margins = c(5,10))



