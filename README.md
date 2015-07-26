---
title: "README"
output: html_document
---

*The script requires `dplyr` package installed.* 
*To run use `source('$YOUR_PATH/run_analysis.R')`*  
*The final dataset will be displayed.*  
"run_analysis.R" creates a tidy wide dataset which contains
the average of each variable for each activity and each subject. The script
consists of the following steps:  
1. Check if the archive "getdata-projectfiles-UCI HAR Dataset.zip" already
exists in the working directory or if the unpacked directory exists. If no, then
the archive is downloaded and unpacked.  
2. Create the datasets for "train" and "test" and bind them together (as
required in step 1).  
3. Filter the resulting dataset by preserving only those columns which
contain mean() or std() functions, i.e. meanFreq() is not included (as
required in step 2).  
4. For each activity, replace activity label with activity name from the file "activity_labels.txt" (as required in step 3).  
5. Label the variables as "Subject", "Activity", and a list
of features from the "features.txt" file (as required in step 1);
the characters "()" and "-" are
removed from the feature names as they may cause problems with R code.  
6. Group the resulting dataset "data" by Sybject and Activity, then calculate
the mean values of each feature for these groups. The outcome is a dataframe
"data_means" with 180 rows and 68 columns (66 variables).  
7. View the dataframes "data" and "data_means".  

