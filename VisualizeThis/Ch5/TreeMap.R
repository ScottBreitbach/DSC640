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
