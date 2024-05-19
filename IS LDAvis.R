install.packages("LDAvis")
# Load necessary libraries
install.packages("topicmodels")
library(topicmodels)
library(LDAvis)

# Load necessary libraries
install.packages("readr")
library(readr)
library(LDAvis)

# Load necessary library
library(readr)

# Set working directory
setwd('/Users/fredstrawberry/R1/IS2')

# Read CSV files
theta <- read_csv('theta.csv')
phi <- read_csv('phi.csv')


# Load necessary library
library(readr)

# Replace NA values with 0
phi[is.na(phi)] <- 0
theta[is.na(theta)] <- 0

# Normalize the rows to sum to 1
phi <- sweep(phi, 1, rowSums(phi), "/")
theta <- sweep(theta, 1, rowSums(theta), "/")

# Load necessary library
library(LDAvis)

# Prepare data for LDAvis
json <- createJSON(phi = as.matrix(phi),
                   theta = as.matrix(theta),
                   doc.length = rowSums(theta),
                   vocab = colnames(phi),
                   term.frequency = colSums(phi))


serVis(json, out.dir = getwd(), open.browser = FALSE, selfcontained = TRUE)

# Visualize
serVis(json)

# Save LDAvis to HTML
serVis(json, out.dir = getwd(), open.browser = FALSE)
