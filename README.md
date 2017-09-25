The run_analysis.R program merges two data sets called  train and  test to a combined data set. Then it cleans the data set by addressing this 5 parts. 

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In the R scrip the aboved quetions are addressed and they marked by part 1 to part 5. 
Each part of code is clearly commented that the reader could follow the logic. 

The pre requirment for this project are as follow: 

Make sure you have "reshape2" , "data.table" and "plyr" packages. 
IF you do not have them then download them by typeing these two commands in the R Console
install.packages("data.table"), install.packages("reshape2") and install.packages("plyr").

In the Rscrip library(reshape2),  library(data.table) and library(plyr) give you access to these three library.
We should type library(reshape2) first otherwise the data.table objects are masked from ‘package:reshape2’. 

