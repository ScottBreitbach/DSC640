# Set Working Directory
setwd("C:/Users/micha/OneDrive/Documents/GitHub/DSC640/VisualizeThis/Ch4/")

# Load Data
hotdogs <- 
  read.csv('http://datasets.flowingdata.com/hot-dog-places.csv', 
           sep=',', 
           header = TRUE)

head(hotdogs)

# Rename headers
names(hotdogs) <- c("2000", "2001", "2002", "2003", "2004", "2005", 
                    "2006", "2007", "2008", "2009", "2010")

head(hotdogs)

# Convert df to a matrix
hd_matrix <- as.matrix(hotdogs)

# Pass data into barplot()
barplot(hd_matrix)

# Add some plot parameters
barplot(hd_matrix, border = NA, space = 0.25, ylim = c(0, 200), 
        xlab = "Year", ylab = "Hot dogs and buns (HDBs) eaten", 
        main = "Hot Dog Eating Contest Results, 1980-2010")

