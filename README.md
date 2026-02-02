# Predicting Sleep Quality Using CART Models in R

This project applies Classification and Regression Trees (CART) to predict sleep quality using demographic, lifestyle, and health-related variables. The aim is to explore which factors are most influential in sleep quality classification and to evaluate model performance using cross-validation and test data.

## Data

The dataset was obtained from Kaggle and contains individual-level information including age, occupation, blood pressure, physical activity, stress levels, and sleep quality.

Preprocessing steps included:
- Converting categorical variables to factors
- Grouping rare occupation categories
- Splitting blood pressure measurements into systolic and diastolic components
- Handling missing values
- Splitting the data into training and test sets

## Methods 

A classification tree was fitted using the `rpart` package. Model complexity was controlled using the complexity parameter (CP), selected via cross-validated error minimisation. The final model was evaluated on a held-out test set using confusion matrices and classification accuracy.

## Results 

The CART model with all occupations achieved the highest accuracy, however was deemed to be less generalisable on a test set with a wider range of occupations. 
Thus, the grouped occupations model, with a 0.911 accuracy was preferred, and predicted sleep duration, stress level, and age to be the most influential predictors. 
The pruned tree reduced accuracy to 0.88, however may be more accessible and improve interpretability.

## Reproducability 
1. Clone the repository 
2. Run scripts in the following order:
  - 'Processing.R'
  - 'Training.R'
  - 'Predicting.R'
  - 'Optimising.R'
3. Outputs (models, figures, and results) will be saved automatically  

## Packages Used

- tidyverse
- rpart
- rpart.plot
- caret

## Author

Madeline Luvaul  
Bachelor of Science (Mathematics and Statistics), University of Melbourne
