# Training data 

set.seed(234)

# Parition data into training and testing, with a ~70/30 split 
train = sample(1:nrow(data), 250)
data.train = data[train,]
data.test = data[-train,]

# True sleep quality of testing population to use for comparison later
Sleep.Quality.test = data$Quality.of.Sleep[-train]

# Separate into grouped occupations and all occupations for testing tree 
# interperability and prevent multicollinearity
data.train.groupedocc <- data.train %>% select(-Occupation)
data.train.allocc <- data.train %>% select(-Occupation.grouped)
data.test.groupedocc <- data.test %>% select(-Occupation)
data.test.allocc <- data.test %>% select(-Occupation.grouped)

# Fit the classification tree, using cp of 0.008 
fit.tree.allocc = rpart(Quality.of.Sleep ~ ., data = data.train.allocc, method = "class", cp = 0.008)
rpart.plot(fit.tree.allocc)
fit.tree.groupedocc = rpart(Quality.of.Sleep ~ ., data = data.train.groupedocc, method = "class", cp = 0.008)
rpart.plot(fit.tree.groupedocc)

# Grouping occupations is prefferred as only occupations "Doctor" and "Teacher" 
# are considered at high-risk of reduced sleep quality