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


# Create new folder if not already created

if(!file.exists("data")){
    
    setwd("C:/Users/Geo/R projects/Coursera/")
    
    dir.create("data")
    
    setwd("C:/Users/Geo/R projects/Coursera/data")
    
    
}else {
    
    setwd("C:/Users/Geo/R projects/Coursera/data")
    
    }

print(getwd())

# Download and unzip the data file
# This extracts the UCI HAR Dataset folder

fileUrl <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile = "gacdass2.zip")

unzip ("gacdass2.zip", exdir = ".")


# Read in the six files from the test and train folders
# test = subject_test.txt, X_test.txt, y_test.txt
# train = subject_train.txt, X_train.txt, y_train.txt

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = TRUE)
X_test <- read.table("UCI HAR Dataset/test/x_test.txt", header = TRUE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = TRUE)


subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = TRUE)
X_train <- read.table("UCI HAR Dataset/train/x_train.txt", header = TRUE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = TRUE)


# Assign column headings as not in source text file
