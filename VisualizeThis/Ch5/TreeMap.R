# Load data
posts <- read.csv("http://datasets.flowingdata.com/post-data.txt")

# Preview data
posts[1:5,]
head(posts)
dim(posts)

# Load libraries
# install.packages("portfolio")
library(portfolio)

# Plot TreeMap
map.market(id = posts$id, 
           area = posts$views, 
           group = posts$category, 
           color = posts$comments, 
           main = "FlowingData Map")

# ======================== # 

# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/Weeks5-6/")

# Load data
unempDF <- read.csv("unemployement-rate-1948-2010.csv")
expenDF <- read.csv("expenditures.csv")

head(unempDF)
tail(unempDF)
head(expenDF)
tail(expenDF)

unique(unempDF$Series.id)   #   1 (series id)
unique(unempDF$Year)        #  63 (Years)
unique(unempDF$Period)      #  12 (months)
unique(unempDF$Value)       #  78 (amount)

unique(expenDF$year)        #  25 (Years)
unique(expenDF$category)    #  14 (expenditure types)
unique(expenDF$expenditure) # 332 (amount)
unique(expenDF$sex)         #   1 (binary)

# length(unique(expenDF$sex))

map.market(id = expenDF$year, 
           area = expenDF$expenditure,
           group = expenDF$category,
           color = expenDF$expenditure)

library(treemap)

?treemap()
treemap(dtf = expenDF, 
        index = c("category", "year"),
        vSize = "expenditure")#,
        # vColor = "expenditure")#, main = "Expenditure Types by Year")
        # lab = c(TRUE, TRUE), 
treemap(dtf = expenDF,
        index = c("year", "category"),
        vSize = "expenditure")
treemap(dtf = expenDF, 
        index = c("category", "year"),
        vSize = "expenditure",
        vColor = "expenditure", type = "value",
        title = "Expenditure Types by Year")


## R-graph-gallery.com walkthrough

# Treemap
treemap(expenDF,
        index = "category",
        vSize = "expenditure",
        type = "index")

# Treemap with subgroups
treemap(expenDF,
        index = c("category", "year"),
        vSize = "expenditure",
        type = "index")

# Customize your R treemap
treemap(expenDF,
        index = c("category", "year"),
        vSize = "expenditure",
        type = "index",
        palette = "Set1",
        title = "Annual Expenditures by Expense Type",
        
        fontsize.labels = c(15, 10),   # Label size by level
        fontcolor.labels = c("white", "dark blue"),
        fontface.labels = c(2,1),      # 2: bold, 1: normal
        bg.labels = c("transparent"),  # Label background
        align.labels = list(           # Label locations
                c("center", "center"),
                c("right", "bottom")),
        overlap.labels = 0.5,          # Label overlap tolerance
        inflate.labels = FALSE,        # Increase label to size of box
        
        border.col = c("black", "dark gray"), # Color of borders
        border.lwds = c(3,1)           # Line width of borders
)

help(treemap)












