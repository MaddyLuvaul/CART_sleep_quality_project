# Predicting sleep quality outcomes, using two different models

# Model tree and table of predicted results for grouped occupations
pred.tree.groupedocc = predict(fit.tree.groupedocc, data.test.groupedocc, type = "class")
table(pred.tree.groupedocc, Sleep.Quality.test)
fit.tree.groupedocc$variable.importance # Sleep duration, stress level, and age are most important


# Model tree and table of predicted results for all occupations
pred.tree.allocc = predict(fit.tree.allocc, data.test.allocc, type = "class")
table(pred.tree.allocc, Sleep.Quality.test)
fit.tree.allocc$variable.importance # Sleep duration, stress level, and occupation are most important

# Data frames of predicted vs actual values
df.grouped <- data.frame(Actual = Sleep.Quality.test, Predicted = pred.tree.groupedocc)
df.all <- data.frame(Actual = Sleep.Quality.test, Predicted = pred.tree.allocc)

# Using caret library for confusion matrix statistics
conf.grouped <- confusionMatrix(pred.tree.groupedocc, Sleep.Quality.test)
conf.all <- confusionMatrix(pred.tree.allocc, Sleep.Quality.test)

# All occupations model has higher accuracy than grouped, however may be less accurate on more diverse testing data

