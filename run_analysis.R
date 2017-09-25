
# load the reshape2 package

library(reshape2)

# load the data.table package

library(data.table)

## Part 1: Merges the test and train sets to create one data set


# read the training data general data into the data set


features        <- read.table("C:/Users/Tahir/Documents/Rcourse/cleaningData/UCI HAR Dataset/features.txt")
activity_Label  <- read.table("C:/Users/Tahir/Documents/Rcourse/cleaningData/UCI HAR Dataset//activity_labels.txt")

subject_train <- read.table("C:/Users/Tahir/Documents/Rcourse/cleaningData/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("C:/Users/Tahir/Documents/Rcourse/cleaningData/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/Tahir/Documents/Rcourse/cleaningData/UCI HAR Dataset/train/y_train.txt")



#Assign column names to the above data.

colnames(activity_Label)<- c("activityId","activityType")
colnames(subject_train) <- "subId"
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityId"



# read the test set into the data set

subject_test <- read.table("C:/Users/Tahir/Documents/Rcourse/cleaningData/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("C:/Users/Tahir/Documents/Rcourse/cleaningData/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C:/Users/Tahir/Documents/Rcourse/cleaningData/UCI HAR Dataset/test/y_test.txt")

# Assign column names for test data set

colnames(activity_Label)<- c("activityId","activityType")
colnames(subject_test) <- "subId"
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityId"


#combining training Data

train_data <- cbind(y_train,subject_train,x_train)

#combining test Data
test_data <- cbind(y_test,subject_test,x_test)

# combine training data and test data into one dataset

combined <- rbind(train_data, test_data)


# part 2: Extracts only the measurements on the mean and standard deviation for each measurement.


data_mean_std <-combined[,grepl("mean|std|subject|activityId",colnames(combined))]

# part 3: Uses descriptive activity names to name the activities in the data set

# load the plyr package

library(plyr)

data_mean_std <- join(data_mean_std, activity_Label, by = "activityId", match = "first")

data_mean_std <-data_mean_std[,-1]

#part 4: Appropriately labels the data set with descriptive variable names.

#Remove parentheses

names(data_mean_std) <- gsub("\\(|\\)", "", names(data_mean_std), perl  = TRUE)


# Get the column names and make them unique
names(data_mean_std) <- make.names(names(data_mean_std))


#add descriptive names

names(data_mean_std) <- gsub("std", "Std", names(data_mean_std))
names(data_mean_std) <- gsub("Acc", "Acceleration", names(data_mean_std))
names(data_mean_std) <- gsub("^t", "Time", names(data_mean_std))
names(data_mean_std) <- gsub("Mag", "Magnitude", names(data_mean_std))
names(data_mean_std) <- gsub("^f", "Frequency", names(data_mean_std))
names(data_mean_std) <- gsub("mean", "Mean", names(data_mean_std))
names(data_mean_std) <- gsub("Freq", "Frequency", names(data_mean_std))
names(data_mean_std) <- gsub("BodyBody", "Body", names(data_mean_std))



#write.table(data_mean_std="tidy_data.txt")

#part 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)


melted_data <- melt(data_mean_std, c("subject","activity"))
average_tidy_data <- dcast(melted_data, subject + activityId ~ variable, mean)





write.table(data_mean_std, file="tidy.txt", row.names=FALSE, col.names=TRUE, sep="\t", quote=TRUE)

