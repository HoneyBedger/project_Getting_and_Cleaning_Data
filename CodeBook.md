---
title: "CodeBook"
output: html_document
---

##Transformations of the data
Original dataset "Human Activity Recognition Using Smartphones Dataset
Version 1.0" was modified in the following way:  
+ The files "X_train.txt", "y_train.txt", and "subject_train.txt" from the
"train" folder were read indo R using `readLines` and `read.table` functions,
then combined to form the "train_data" dataframe. The features from
"features.txt" file were imported with `read.table` function; special characters
()" and "-" were removed from the names; these feature names were used to name
the variables in the "train_data" dataframe. The same procedure was applied to
the files in the "test" folder to create "test_data" dataframe.  
+ Dataframes "train_data" and "test_data" were combined by raw (with `rbind`) to
obtain "data" dataframe.  
* Only the variables containing "mean" and "std", but not "meanFreq" in their
names were extracted by applying `grepl` function.  
* The names of the activities were read from the "activity_labels.txt" with
`read.table` function. These were merged with the "data" dataframe by
activity label, the column with activity labels was then replaced with the
column containing activity names ("Activity").  
* With function `group_by` from `dplyr` package the resulting dataframe was
grouped by Subject and Activity. Function `summarize` was applied inside a
`do.call` construct to summarize values of each feature into mean values
for the groups. The result is a new dataframe "data_means".  
* The dataframe "data_means" (180 by 68, i.e. 180 observations of 66 variables) is displayed with `View` function.  
  
***
  
##Data Dictionary
01. Subject: (1 to 30), identifier of a subject who performed an activity.  
02. Activity: name of the activity:  
          WALKING  
          WALKING_UPSTAIRS  
          WALKING_DOWNSTAIRS  
          SITTING  
          STANDING  
          LAYING  
03 through 68: mean values of the corresponding functions in the brackets
               for groups by Subject and Activity;
               "t" in the names of the functions indicates the time domain,
               "f" indicates the frequency domain.
03. mean(tBodyAcc.meanX): mean of the Mean value for the body acceleration
along Xaxis.  
04. mean(tBodyAcc.meanY): mean of the Mean value for the body acceleration
along Yaxis.  
05. mean(tBodyAcc.meanZ): mean of the Mean value for the body acceleration
along Zaxis.    
06. mean(tBodyAcc.stdX): mean of the Standard deviation value for the body acceleration along Xaxis.    
07. mean(tBodyAcc.stdY): mean of the Standard deviation value for the body acceleration along Yaxis.  
08. mean(tBodyAcc.stdZ): mean of the Standard deviation value for the body acceleration along Zaxis.  
09. mean(tGravityAcc.meanX): mean of the Mean value for the gravity acceleration along Xaxis.  
10. mean(tGravityAcc.meanY): mean of the Mean value for the gravity acceleration along Yaxis.  
11. mean(tGravityAcc.meanZ): mean of the Mean value for the gravity acceleration along Zaxis.  
12. mean(tGravityAcc.stdX): mean of the Standard deviation value for the gravity acceleration along Xaxis.  
13. mean(tGravityAcc.stdY): mean of the Standard deviation value for the gravity acceleration along Yaxis.  
14. mean(tGravityAcc.stdZ): mean of the Standard deviation value for the gravity acceleration along Zaxis.  
15. mean(tBodyAccJerk.meanX): mean of the Mean value of the Jerk signal for the body acceleration (from accelerometer) along Xaxis.  
16. mean(tBodyAccJerk.meanY): mean of the Mean value of the Jerk signal for the body acceleration (from accelerometer) along Yaxis.  
17. mean(tBodyAccJerk.meanZ): mean of the Mean value of the Jerk signal for the body acceleration (from accelerometer) along Zaxis.  
18. mean(tBodyAccJerk.stdX): mean of the Standard deviation value of the Jerk signal for the body acceleration (from accelerometer) along Xaxis.  
19. mean(tBodyAccJerk.stdY): mean of the Standard deviation value of the Jerk signal for the body acceleration (from accelerometer) along Yaxis.  
20. mean(tBodyAccJerk.stdZ): mean of the Standard deviation value of the Jerk signal for the body acceleration (from accelerometer) along Zaxis.  
21. mean(tBodyGyro.meanX): mean of the Mean value for the body acceleration (from gyroscope) along Xaxis.  
22. mean(tBodyGyro.meanY): mean of the Mean value for the body acceleration (from gyroscope) along Yaxis.  
23. mean(tBodyGyro.meanZ): mean of the Mean value for the body acceleration (from gyroscope) along Zaxis.  
24. mean(tBodyGyro.stdX): mean of the Standard Deviation value signal for the body acceleration (from gyroscope) along Xaxis.  
25. mean(tBodyGyro.stdY): mean of the Standard Deviation value signal for the body acceleration (from gyroscope) along Yaxis.  
26. mean(tBodyGyro.stdZ): mean of the Standard Deviation value for the body acceleration (from gyroscope) along Zaxis.  
27. mean(tBodyGyroJerk.meanX): mean of the Mean value of the Jerk signal for the body acceleration (from gyroscope) along Xaxis.  
28. mean(tBodyGyroJerk.meanY): mean of the Mean value of the Jerk signal for the body acceleration (from gyroscope) along Yaxis.  
29. mean(tBodyGyroJerk.meanZ): mean of the Mean value of the Jerk signal for the body acceleration (from gyroscope) along Zaxis.  
30. mean(tBodyGyroJerk.stdX): mean of the Standard deviation value of the Jerk signal for the body acceleration (from gyroscope) along Xaxis.  
31. mean(tBodyGyroJerk.stdY): mean of the Standard deviation value of the Jerk signal for the body acceleration (from gyroscope) along Yaxis.  
32. mean(tBodyGyroJerk.stdZ): mean of the Standard deviation value of the Jerk signal for the body acceleration (from gyroscope) along Zaxis.  
33. mean(tBodyAccMag.mean): mean of the Mean value of the magnitude of the body acceleration (calculated using the Euclidean norm).  
34. mean(tBodyAccMag.std): mean of the Standard deviation value of the magnitude of the body acceleration (calculated using the Euclidean norm).  
35. mean(tGravityAccMag.mean): mean of the Mean value of the magnitude of the gravity acceleration (calculated using the Euclidean norm).  
36. mean(tGravityAccMag.std): mean of the Standard deviation value of the magnitude of the gravity acceleration (calculated using the Euclidean norm).  
37. mean(tBodyAccJerkMag.mean): mean of the Mean value of the magnitude of the Jerk signal for the body acceleration (calculated using the Euclidean norm).  
38. mean(tBodyAccJerkMag.std): mean of the Standard deviation value of the magnitude of the Jerk signal for the body acceleration (calculated using the Euclidean norm).  
39. mean(tBodyGyroMag.mean): mean of the Mean value of the magnitude of the body acceleration (calculated using the Euclidean norm).  
40. mean(tBodyGyroMag.std): mean of the Standard deviation value of the magnitude of the body acceleration (calculated using the Euclidean norm).  
41. mean(tBodyGyroJerkMag.mean): mean of the Mean value of the magnitude of the Jerk signal fot the gravity acceleration (calculated using the Euclidean norm).  
42. mean(tBodyGyroJerkMag.std): mean of the Standard deviation value of the magnitude of the Jerk signal fot the gravity acceleration (calculated using the Euclidean norm).  
43. mean(fBodyAcc.meanX): mean of the Mean value of the body acceleration along Xaxis after applying Fast Fourier Transform. (from accelerometer)  
44. mean(fBodyAcc.meanY): mean of the Mean value of the body acceleration along Yaxis after applying Fast Fourier Transform. (from accelerometer)  
45. mean(fBodyAcc.meanZ): mean of the Mean value of the body acceleration along Zaxis after applying Fast Fourier Transform. (from accelerometer)  
46. mean(fBodyAcc.stdX): mean of the Standard deviation value of the body acceleration along Xaxis after applying Fast Fourier Transform. (from accelerometer)  
47. mean(fBodyAcc.stdY): mean of the Standard deviation value of the body acceleration along Yaxis after applying Fast Fourier Transform. (from accelerometer)  
48. mean(fBodyAcc.stdZ): mean of the Standard deviation value of the body acceleration along Zaxis after applying Fast Fourier Transform. (from accelerometer)  
49. mean(fBodyAccJerk.meanX): mean of the Mean value of the Jerk signal for the body acceleration along Xaxis after applying Fast Fourier Transform. (from accelerometer)  
50. mean(fBodyAccJerk.meanY): mean of the Mean value of the Jerk signal for the body acceleration along Yaxis after applying Fast Fourier Transform. (from accelerometer)  
51. mean(fBodyAccJerk.meanZ): mean of the Mean value of the Jerk signal for the body acceleration along Zaxis after applying Fast Fourier Transform. (from accelerometer)  
52. mean(fBodyAccJerk.stdX): mean of the Standard deviation value of the Jerk signal for the body acceleration along Xaxis after applying Fast Fourier Transform. (from accelerometer)  
53. mean(fBodyAccJerk.stdY): mean of the Standard deviation value of the Jerk signal for the body acceleration along Yaxis after applying Fast Fourier Transform. (from accelerometer)  
54. mean(fBodyAccJerk.stdZ): mean of the Standard deviation value of the Jerk signal for the body acceleration along Zaxis after applying Fast Fourier Transform. (from accelerometer)  
55. mean(fBodyGyro.meanX): mean of the Mean value of the body acceleration along Xaxis after applying Fast Fourier Transform. (from gyroscope)  
56. mean(fBodyGyro.meanY): mean of the Mean value of the body acceleration along Yaxis after applying Fast Fourier Transform. (from gyroscope)  
57. mean(fBodyGyro.meanZ): mean of the Mean value of the body acceleration along Zaxis after applying Fast Fourier Transform. (from gyroscope)  
58. mean(fBodyGyro.stdX): mean of the Standard deviation value of the body acceleration along Xaxis after applying Fast Fourier Transform. (from gyroscope)  
59. mean(fBodyGyro.stdY): mean of the Standard deviation value of the body acceleration along Yaxis after applying Fast Fourier Transform. (from gyroscope)  
60. mean(fBodyGyro.stdZ): mean of the Standard deviation value of the body acceleration along Zaxis after applying Fast Fourier Transform. (from gyroscope)  
61. mean(fBodyAccMag.mean): mean of the Mean value of the magnitude of the body acceleration (calculated using the Euclidean norm) after applying Fast Fourier Transform. (from accelerator)  
62. mean(fBodyAccMag.std): mean of the Standard deviation value of the magnitude of the body acceleration (calculated using the Euclidean norm) after applying Fast Fourier Transform. (from accelerator)  
63. mean(fBodyBodyAccJerkMag.mean): mean of the Mean value of the magnitude of the Jerk signal for the body acceleration (calculated using the Euclidean norm) after applying Fast Fourier Transform. (from accelerator)  
64. mean(fBodyBodyAccJerkMag.std): mean of the Standard deviation value of the magnitude of the Jerk signal for the body acceleration (calculated using the Euclidean norm) after applying Fast Fourier Transform. (from accelerator)  
65. mean(fBodyBodyGyroMag.mean): mean of the Mean value of the magnitude of the body acceleration (calculated using the Euclidean norm) after applying Fast Fourier Transform.  (from gyroscope) 
66. mean(fBodyBodyGyroMag.std): mean of the Mean value of the magnitude of the body acceleration (calculated using the Euclidean norm) after applying Fast Fourier Transform.  (from gyroscope)  
67. mean(fBodyBodyGyroJerkMag.mean): mean of the Mean value of the magnitude of the Jerk signal for the body acceleration (calculated using the Euclidean norm) after applying Fast Fourier Transform.  (from gyroscope)  
68. mean(fBodyBodyGyroJerkMag.std): mean of the Standard deviation value of the magnitude of the Jerk signal for the body acceleration (calculated using the Euclidean norm) after applying Fast Fourier Transform.  (from gyroscope)  
  
 
***  
  
##Description of the experiment   
  
Human Activity Recognition Using Smartphones Dataset  
Version 1.0  
  
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws  
  

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  
  
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  
  
###License:  

Use of this dataset in publications must be acknowledged by referencing the following publication [1]  

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.  

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.  
