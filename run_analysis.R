# The purpose of this script (...project) is to demonstrate collecting, 
# data, working with the data to create a clean a data set. 

# The goal is to prepare tidy data that can be used for later analysis.

# This script does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.

# Refer to XXXXX for the last part of this exercise in git hub.


# The first step is to set up R and download the download the source data.

setwd("C:/Users/Geo/R projects/Coursera/")

# Create new folder if not already created

if(!file.exists("data")){
    
    dir.create("data")
    
    # Download and unzip the data file
    # This extracts the UCI HAR Dataset folder
    
    fileUrl <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    
    download.file(fileUrl, destfile = "gacdass2.zip")
    
    unzip ("gacdass2.zip", exdir = ".")
    
    
}

print(getwd())


# Read in the six files from the test and train folders
# test = subject_test.txt, X_test.txt, y_test.txt
# train = subject_train.txt, X_train.txt, y_train.txt
# header = False as there are no column headings in the files


# load packages to manipulate data

library(dplyr)
#library(tidyr, libpath)


# Read in data

subject_test <- tbl_df(read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE))

X_test <- tbl_df(read.table("UCI HAR Dataset/test/x_test.txt", header = FALSE))

y_test <- tbl_df(read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE))


subject_train <- tbl_df(read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE))

X_train <- tbl_df(read.table("UCI HAR Dataset/train/x_train.txt", header = FALSE))

y_train <- tbl_df(read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE))


# Merge data frames

subject_data <- bind_rows(subject_test, subject_train)

# X data
features_data <- bind_rows(X_test, X_train)

 # Y data
activity_data <- bind_rows(y_test, y_train)


# Give meaningful column names and subset features by mean and standard deviation
colnames(subject_data) <- "Subjects"

colnames(activity_data ) <- "Activity"

colnames(feature_labels) <- cbind("Rownum","Feature")



feature_labels <- tbl_df(read.table("UCI HAR Dataset/features.txt", header = FALSE))

feature_labels <- feature_labels %>% select(Feature)

names(features_data)<- feature_labels$Feature #Maps feature labels to feature data set

sub_features_data <- features_data[,grepl("mean\\(\\)|std\\(\\)", colnames(features_data))]



# Combine to create one data set

subject_data <- arrange(subject_data, Subjects)

activity_data <- arrange(activity_data, Activity)


combined_data <- bind_cols(combine_subject_activity, sub_features_data)


#make the activity numbers descriptive 

combined_data$Activity <- as.character(combined_data$Activity)
combined_data$Activity[combined_data$Activity == 1] <- "Walking"
combined_data$Activity[combined_data$Activity == 2] <- "Walking Upstairs"
combined_data$Activity[combined_data$Activity == 3] <- "Walking Downstairs"
combined_data$Activity[combined_data$Activity == 4] <- "Sitting"
combined_data$Activity[combined_data$Activity == 5] <- "Standing"
combined_data$Activity[combined_data$Activity == 6] <- "Laying"
combined_data$Activity <- as.factor(combined_data$Activity)


# Make descriptive names
names(combined_data)<-gsub("^t", "time", names(combined_data))
names(combined_data)<-gsub("^f", "frequency", names(combined_data))
names(combined_data)<-gsub("Acc", "Accelerometer", names(combined_data))
names(combined_data)<-gsub("Gyro", "Gyroscope", names(combined_data))
names(combined_data)<-gsub("Mag", "Magnitude", names(combined_data))
names(combined_data)<-gsub("BodyBody", "Body", names(combined_data))


# Create independent tidy data set with the average of each variable for each activity and each subject based on the data above.
combined_data2<-aggregate(. ~Subjects + Activity, combined_data, mean)
combined_data2<-combined_data2[order(combined_data2$Subjects,combined_data2$Activity),]
write.table(combined_data2, file = "tidydata.txt",row.name=FALSE)
