#Importing the data
dataset <- read.csv('Salary_Data.csv')

#In this case Years of Experience is the indepedent variable and salary the dependent variable
#install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

#Writing the regression function
regressor <- lm (formula = Salary ~ YearsExperience,
                data = training_set)
                

#Predicting the test data set
y_pred <- predict(regressor, newdata =  test_set)


#Visualising the results for the training dataset
# install.packages('ggplot2')
library(ggplot2)

ggplot() +
  geom_point(aes( x = training_set$YearsExperience, y = training_set$Salary ),
             colour ='red') +
  geom_line(aes( x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), 
            colour = 'blue') +
  ggtitle('Years of Experience vs Salary (Training Data Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

#Visualising the results for the tess dataset
ggplot() +
  geom_point(aes( x = test_set$YearsExperience, y = test_set$Salary ),
             colour ='red') +
  geom_line(aes( x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), 
            colour = 'blue') +
  ggtitle('Years of Experience vs Salary (Test Data Set)') +
  xlab('Years of Experience') +
  ylab('Salary')

  

