# run_analysis.R  Coursera Data Science CH3 Project Wearable computing

setwd("C:/Users/SusanToshiba/Documents/R/CourseraDataScience/Project-CH3")
# setwd() # to your working directory

# Background information http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/ 
# Original source of data http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# data for project https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Project objectives
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
# download data from zipped file  
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./data")){dir.create("./data")}
if(!file.exists("./data/temp.zip")){download.file(fileUrl,destfile="./data/temp.zip")}
#######  extract zip into a directory called UCI-HAR-Dataset


# Packages
library(data.table)  
library(dplyr) 

## 1. Merge the training and the test sets 
train <- fread("UCI-HAR-Dataset/train/X_train.txt")
test <- fread("UCI-HAR-Dataset/test/X_test.txt")

dataSet <- merge(train,test,all=TRUE)

# remove unused data to conserve memory
rm(train, test)


## 2. Extract the mean and standard deviation for each measurement
featureName <- read.table("UCI-HAR-Dataset/features.txt")
colnames(dataSet) <- as.character(featureName$V2)

selectIndex <- grep('(mean|std)\\(\\)',featureName$V2)
dataSet <- subset(dataSet, select=selectIndex)


## 4. Label the data set with descriptive variable names
colnames(dataSet) <- gsub("mean\\(\\)", "Mean", colnames(dataSet)) 
colnames(dataSet) <- gsub("std\\(\\)", "Std", colnames(dataSet)) 
colnames(dataSet) <- gsub("^t", "Time", colnames(dataSet)) 
colnames(dataSet) <- gsub("^f", "Frequency", colnames(dataSet)) 
colnames(dataSet) <- gsub("BodyBody", "Body", colnames(dataSet))
#View(colnames(dataSet))


## 3. Give descriptive activity names to name the activities in the data set
train <- fread("UCI-HAR-Dataset/train/y_train.txt")
test <- fread("UCI-HAR-Dataset/test/y_test.txt")
label <- fread("UCI-HAR-Dataset/activity_labels.txt")

activity <- rbind(train,test)

rm(train, test)

# use activity labels to name activities
activity$V1 <- factor(activity$V1,levels = label$V1, labels = label$V2)

# bind to the dataset
dataSet <- cbind(Activity = activity, dataSet)


## 5. An independent tidy data set with the average of each variable for each activity and each subject
#  add column to pair subject with observations
train <- fread("UCI-HAR-Dataset/train/subject_train.txt")
test <- fread("UCI-HAR-Dataset/test/subject_test.txt")

subject <- rbind(train,test)
rm(train, test)
subject$V1 <- factor(subject$V1)

# bind to the dataset
dataSet <- cbind(Subject = subject, dataSet)

# calculate the means of all columns by subject and activity 
dataAve <- dataSet %>%
    group_by(Subject.V1,Activity.V1) %>%
    summarise_all(funs(mean))

# write the dataset to a file
fwrite(dataAve, file = "tidyData.csv")
# View(dataAve)
