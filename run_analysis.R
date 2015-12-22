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
# Bits added will need to update above


libpath <- .libPaths("d:/R/packages")

library(dplyr, libpath)
library(tidyr, libpath)

#These data sets hold the subject and the results
subject_test <- read.table("C:/Users/lapinsma/Downloads/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("C:/Users/lapinsma/Downloads/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C:/Users/lapinsma/Downloads/UCI HAR Dataset/test/y_test.txt")


# These data sets hold training labels against each subject?
subject_train <- read.table("C:/Users/lapinsma/Downloads/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("C:/Users/lapinsma/Downloads/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/lapinsma/Downloads/UCI HAR Dataset/train/y_train.txt")

# Get activity label

activity_label <- read.table("C:/Users/lapinsma/Downloads/UCI HAR Dataset/activity_labels.txt")

# subset to get second column only

# First give meaningful col headings

colnames(activity_label ) <- cbind("Rownum","Activity_label")

Activity_col <- activity_label %>% select(Activity_label)



#Add features as colnames across x_test and x_train Use dplyr and tidyr to do this.

features <- read.table("C:/Users/lapinsma/Downloads/UCI HAR Dataset/features.txt")




# Change subject_test and train column headings



# Reshape features dataframe using tidyr
# First give meaningful col headings

colnames(features) <- cbind("Rownum","Feature")

# Subset to get second row only

feature_col <- features %>% select(Feature)




# Merge the test data

# Merge the train data




ncol(features)
  

dim(subject_test)
dim(x_test)
dim(y_test)


dim(subject_train)
dim(x_train)
dim(y_train)

dim(features)

str(subject_test)
str(x_test)
str(y_test)

ncol(x_test)

min(subject_test)

colnames(subject_test) <- "Subjects"
