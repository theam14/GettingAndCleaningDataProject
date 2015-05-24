# Code Book - Project of Getting and Cleaning Data course

## Variables and data description

The data set contains the average of each measurement variable, where the variables assigned with the prefix 't' is a signal in time domain and 'f', in the frequency domain (FFT). The average of each variable is grouped by the corresponding Subject (which is identified by a integer id) and a Activity (which is a factor description).

The signals are obtained from a accelerometer (Acc) or gyroscope (Gyro)

The columns in the data set present the suffix '.Average', to indicate theirs meaning.

In this way, the data set presents the following columns:


1.	Activity.Description
2.	Subject.Id
3.	tBodyAcc_mean_X.Average
4.	tBodyAcc_mean_Y.Average
5.	tBodyAcc_mean_Z.Average
6.	tBodyAcc_std_X.Average
7.	tBodyAcc_std_Y.Average
8.	tBodyAcc_std_Z.Average
9.	tGravityAcc_mean_X.Average
10.	tGravityAcc_mean_Y.Average
11.	tGravityAcc_mean_Z.Average
12.	tGravityAcc_std_X.Average
13.	tGravityAcc_std_Y.Average
14.	tGravityAcc_std_Z.Average
15.	tBodyAccJerk_mean_X.Average
16.	tBodyAccJerk_mean_Y.Average
17.	tBodyAccJerk_mean_Z.Average
18.	tBodyAccJerk_std_X.Average
19.	tBodyAccJerk_std_Y.Average
20.	tBodyAccJerk_std_Z.Average
21.	tBodyGyro_mean_X.Average
22.	tBodyGyro_mean_Y.Average
23.	tBodyGyro_mean_Z.Average
24.	tBodyGyro_std_X.Average
25.	tBodyGyro_std_Y.Average
26.	tBodyGyro_std_Z.Average
27.	tBodyGyroJerk_mean_X.Average
28.	tBodyGyroJerk_mean_Y.Average
29.	tBodyGyroJerk_mean_Z.Average
30.	tBodyGyroJerk_std_X.Average
31.	tBodyGyroJerk_std_Y.Average
32.	tBodyGyroJerk_std_Z.Average
33.	tBodyAccMag_mean.Average
34.	tBodyAccMag_std.Average
35.	tGravityAccMag_mean.Average
36.	tGravityAccMag_std.Average
37.	tBodyAccJerkMag_mean.Average
38.	tBodyAccJerkMag_std.Average
39.	tBodyGyroMag_mean.Average
40.	tBodyGyroMag_std.Average
41.	tBodyGyroJerkMag_mean.Average
42.	tBodyGyroJerkMag_std.Average
43.	fBodyAcc_mean_X.Average
44.	fBodyAcc_mean_Y.Average
45.	fBodyAcc_mean_Z.Average
46.	fBodyAcc_std_X.Average
47.	fBodyAcc_std_Y.Average
48.	fBodyAcc_std_Z.Average
49.	fBodyAccJerk_mean_X.Average
50.	fBodyAccJerk_mean_Y.Average
51.	fBodyAccJerk_mean_Z.Average
52.	fBodyAccJerk_std_X.Average
53.	fBodyAccJerk_std_Y.Average
54.	fBodyAccJerk_std_Z.Average
55.	fBodyGyro_mean_X.Average
56.	fBodyGyro_mean_Y.Average
57.	fBodyGyro_mean_Z.Average
58.	fBodyGyro_std_X.Average
59.	fBodyGyro_std_Y.Average
60.	fBodyGyro_std_Z.Average
61.	fBodyAccMag_mean.Average
62.	fBodyAccMag_std.Average
63.	fBodyBodyAccJerkMag_mean.Average
64.	fBodyBodyAccJerkMag_std.Average
65.	fBodyBodyGyroMag_mean.Average
66.	fBodyBodyGyroMag_std.Average
67.	fBodyBodyGyroJerkMag_mean.Average
68.	fBodyBodyGyroJerkMag_std.Average

## Performed Transformations from raw to tidy data

In this section are presented the steps implemented in the script 'run_analysis.R' to transform the raw data present in [data link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to a tidy data set containng the information describe in previous section

1. Read the files containing the features and activities descriptions
2. Y data is loaded from y*type*.txt, containing the corresponding activity for each measurement
3. At the variable from step 3 is concatenated to the corresponding activity description
4. X data is loaded from X*type*.txt
5. To the X data is concatenated a column with the activity description
6. For each column, is assigned the corresponding variable name. The column name is treated to replae special characters "(", ")", "-"
6. The subject file is loaded.
7. To the X data loaded is also concatenated a column with the subject id information
8. The steps from 2 to 7 are perfomed for both, test and trainning data
9. The rows of the data tables obtained from the previous step are concatenated
10. Another data table is created, containing only the measurements corresponding to mean and std
11. To this data table, is created another, with the average of each variable grouped by the subject and the activity.
12. A processing is perfomed in the column names of this data table, in order to remove the characters used to replace the special characters from the features name and to place the suffix ".Average"

## Analysis Objective

The objective of this analysis is test the knowledge presented at the course about get a row data, "filter" the desired information and put the data in tidy format.  

