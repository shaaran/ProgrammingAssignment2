Data was loaded from files "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
subject.txt is for 30 members. Subjects activity_labels.txt is 1-6 numbers for 6 activities. The activities of each
 subject in training and test is stored in y_train.txt or y_test, respectively. Oberservations of each subject in each activity is stored in x_train.txt or y_train.txt. 
 Names of each variables are stored in features.txt, with features_info.txt to explain readme.txt.
"data_mean_std" gives the mean of disdescriptive names for activities were assigned by a for loop, without changing object name (still "data_mean_std")
tidy data was generated with melt and dcast functions, and was named "tidy_data_set". 
