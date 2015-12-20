# The purpose of this script (...project) is to demonstrate collecting, 
# data, working with the data to create a clean a data set. 

# The goal is to prepare tidy data that can be used for later analysis.

# This script does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 


# The first step is to set up R and download the download the source data.

wd <- setwd("C:/Users/Geo/R projects/Coursera")


# Create new folder if not already created

if(!file.exists("data")){
    
    dir.create("data")
    
}


# Download and unzip the data file
# This extracts the UCI HAR Dataset folder

fileUrl <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile = "./data/gacdass2.zip")

unzip ("./data/gacdass2.zip", exdir = "./data")

