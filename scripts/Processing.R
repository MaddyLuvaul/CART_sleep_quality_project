# Cleaning and processing data 

# Load libraries 
library(rpart)
library(rpart.plot)

# Read data 
raw_data <- read.csv("data/raw/Sleep_health_and_lifestyle_dataset.csv")

# Make copy of data 
data <- raw_data

# Change sleep quality from integer to factor 
data$Quality.of.Sleep = as.factor(data$Quality.of.Sleep)

# Remove Person ID column 
data <- data[,-1]

# Possible improvement to lump rare occupations into Other category
data <- data %>%
  mutate(
    Occupation.grouped = fct_lump_n(Occupation, n = 5)
)

# Separate blood pressure into systolic and diastolic 
data <- data %>% separate(Blood.Pressure, into = c("systolic.bp", "diastolic.bp"), sep = "/", convert = TRUE)

# Check for missing values 
colMeans(is.na(data))




