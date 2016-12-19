## load in r packages
library("reshape2")
library("stringr")
library("plyr")
library("dplyr")
library("tidyr")
library("data.table")

## Read in data files
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
data_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
activities_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
data_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
activities_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

## Create vector to translate activity codes in to descriptive variables
activities_names <- c("1" = "WALKING" , "2" = "WALKING_UPSTAIRS" , "3" = "WALKING_DOWNSTAIRS" , "4" = "SITTING" , "5" = "STANDING" , "6" = "LAYING")

## Process test files to create merged test file

## Rename activities codes with desriptive labels
activities_test$V1 <- factor(activities_names[str_sub(activities_test$V1)], levels = activities_names)
## Rename data file columns with features  
names(data_test) <- features$V2
## rename subject column
names(subject_test) <- c("subject")
## rename activities column
names(activities_test) <- c("activity")
## merge test files
merged_test <- cbind(subject_test, activities_test, data_test)

## Process train files to create merged train file

## Rename activities codes with descriptive labels
activities_train$V1 <- factor(activities_names[str_sub(activities_train$V1)], levels = activities_names)
## Rename data file columns with features  
names(data_train) <- features$V2
## rename subject column
names(subject_train) <- c("subject")
## rename activities column
names(activities_train) <- c("activity")
## merge train files
merged_train <- cbind(subject_train, activities_train, data_train)

## Combine merged test and train file rows
merged_test_train <- rbind(merged_test , merged_train)

## Process merged file to create a tidy dataset
## Melt file to put observations in rows
inprocess <- melt(merged_test_train, id=c("subject", "activity"))

## Select only mean and std obdervations based on "mean" and "std" strings in features: 
inprocess_mean_subset <- inprocess[grep("mean", inprocess$variable), ]
inprocess_std_subset <- inprocess[grep("std", inprocess$variable), ]

## Combine mean and std subsets into one file
merged_mean_std <- rbind(inprocess_mean_subset , inprocess_std_subset)

## Step 4: rename columns to be more descriptive, arrange file by subject, activity, and feature)
merged_mean_std <- rename(merged_mean_std, feature = variable , measure = value)

## This is my "narrow" tidy data set
tidy_merged_file <- arrange(merged_mean_std, subject, activity, feature)
head(tidy_merged_file)

## Step 5 create new data set with the average of each variable for each activity and each subject
grouped_data <- group_by(tidy_merged_file, subject, activity, feature)
tidy_average_data <- summarize(grouped_data, measure = mean(measure, na.rm=TRUE))
tidy_average_data <- rename(tidy_average_data, average = measure)

## This is my "averages" tidy dataset
head(tidy_average_data)

## Submission file
## write.table(tidy_average_data, file = "./tidy_averages.txt", row.name=FALSE)
