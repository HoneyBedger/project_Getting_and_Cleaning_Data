## Download .zip archive (if it's not already there and there's no unpacked
## folder yet)
if(!file.exists("./UCI HAR Dataset") &
   !file.exists("./getdata-projectfiles-UCI HAR Dataset.zip")){
      fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileUrl,
                    destfile = "getdata-projectfiles-UCI HAR Dataset.zip")
}

## Unpack the archive if it's not unpacked already 
if(!file.exists("./UCI HAR Dataset")) {
      unzip("getdata-projectfiles-UCI HAR Dataset.zip", exdir = ".")
}

## Create the datasets for "train" and "test" and bind them together (step 1)
features <- read.table("./UCI HAR Dataset/features.txt", header = F,
                       colClasses = c("integer", "character"),
                       col.names = c("No.", "Name"))
## Rename the variables (remove "()" and "-")
features$Name <- sub("\\-", ".", features$Name)
features$Name <- sub("\\()", "", features$Name)
features$Name <- sub("\\-", ".", features$Name)  ## not a typo: does not replace
                                                 ## all "-"s from the first run

train_data <- cbind(as.integer(readLines
                          ("./UCI HAR Dataset/train/subject_train.txt")),
               as.integer(readLines("./UCI HAR Dataset/train/y_train.txt")),
               read.table("./UCI HAR Dataset/train/X_train.txt",
                          header = FALSE, colClasses = "numeric"))
## Label variables (step 4)
names(train_data) <- c("Subject", "Activity", features$Name)  

test_data <- cbind(as.integer(readLines
                              ("./UCI HAR Dataset/test/subject_test.txt")),
                   as.integer(readLines("./UCI HAR Dataset/test/y_test.txt")),
                   read.table("./UCI HAR Dataset/test/X_test.txt",
                              header = FALSE, colClasses = "numeric"))
## Label variables (again) (step 4)
names(test_data) <- c("Subject", "Activity", features$Name)

data <- rbind(train_data, test_data)

## Now that the original set id made, extract only the measurements
##  on the mean and standard deviation for each measurement  (step 2)

## logical vector "use": true if a name in "names(data)" contains
## either mean or std; "meanFreq" is not included.
## And, of course, preserve the Subject and Activity columns
use <- grepl("Subject|Activity|mean|std", names(data)) & 
      !grepl("meanFreq", names(data)) 
data <- data[,use]

## Replace activity lables with activity names  (step 3)
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = F,
                         colClasses = c("integer", "character"),
                         col.names = c("No.", "Name"))

data <- merge(data, activities, by.x = "Activity", by.y = "No.", sort = F)
data$Activity <- data$Name
data <- data[,1:(ncol(data)-1)]


## Create an independent data set with the average of each variable for
##  each activity and each subject.

library(dplyr)
data_grouped <- group_by(data, Subject, Activity)
means_for <- names(data_grouped)[3:ncol(data_grouped)]
summarize_by <- lapply(means_for ,function(x) substitute(mean(x),
                                                         list(x=as.name(x))))
data_means <- as.data.frame(
      do.call(summarise, c(list(.data = data_grouped), summarize_by)))


## View the result
View(data_means)

