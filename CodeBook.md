---
title: "Getting and Cleaning Data Course Project - CodeBook V1.0"
author: "Robert Szabo"
date: "Sunday, February 22, 2015"
output: html_document
---

This codebook describes the tranformations, variables and data used to during the execution of the "run_analysis.R" program.

The Readme.md file describes the data source and how to the "run_Analysis.R" to generate the tidied_human_movement_data.txt file


###The applied transformation process###
The transformation process applied by the run_analysis.R can be summarised in the following steps

Step |  Step Name | Output | Relevant Notes
:----: | :------ |:-----| :------------------------------
1| Load features.txt file| variable: features| features contains exactly 561 records which directly maps to each column in the test and training datasets
2| Load test data X_test.txt|variable: test_results| creates a dataframe called test_results with column names mapped directly to the names column from the features variable
3| Load training data X_train.txt|variable: training_results| creates a dataframe called training_results with column names mapped directly to the names column from the features variable
4| Merge test and training data|variable: merged_results| creates a data frame combining the test and training results whilst introducing  the files subject_test.txt, y_test.txt, subject_train.txt and y_train.txt have a direct row mapping to their data counterparts, allowing us to add the subject and activity keys as columns in the dataset.
5| Filter out undesired columns|variable: merged_results| filter out all columns but subject_id,actvity_id and those not containing mean and std deviation results.
6| melt the data| variable: molten_results | melts the dataset into essentially key value pairs associated by activity_id and subject_id, this allows us to take them mean split by these keys.
7| take the mean and re-construct| variable: mean_results | take the mean of all results split by activity_id, and subject_id and get the data back into a wide format using dcast
8| sort and write results|file: tidied_human_movement_data.txt|sort the data by subject_id, activity_id and then write the result to file

###Observation Variables###

A full description of raw data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The entire dataset is data provided by 30 subjects for 6 activies each with 561 total observations.

THe Activies were defined as: 1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS, 4=SITTING, 5=STANDING, 6=LAYING.

The Raw data transformation produces a tidy data set which is a combination of the training and test data sets. 

The feature names with the format "mean..X" or "mean..Y"are the avg or mean of the feature X or y grouped by "Activity" and "Subject". The feature names with the format "std...X" or std..Y" are the avg or mean of the standard deviation of x or y grouped by "activity" and "subject".

The resultant tidy data set contains the following features:

col # |  R Col Name | Original Col Name
:----: | :------ | :------
1|subject_id| Note: 1-30 of 30 subjects
2|activity_name| 1 WALKING,2 WALKING_UPSTAIRS,3 WALKING_DOWNSTAIRS,4 SITTING,5 STANDING,6 LAYING
3| tBodyAcc.mean...X| tBodyAcc-mean()-X
4| tBodyAcc.mean...Y| tBodyAcc-mean()-Y
5| tBodyAcc.mean...Z| tBodyAcc-mean()-Z
6| tBodyAcc.std...X| tBodyAcc-std()-X
7| tBodyAcc.std...Y| tBodyAcc-std()-Y
8| tBodyAcc.std...Z| tBodyAcc-std()-Z
9| tGravityAcc.mean...X| tGravityAcc-mean()-X
10| tGravityAcc.mean...Y| tGravityAcc-mean()-Y
11| tGravityAcc.mean...Z| tGravityAcc-mean()-Z
12| tGravityAcc.std...X| tGravityAcc-std()-X
13| tGravityAcc.std...Y| tGravityAcc-std()-Y
14| tGravityAcc.std...Z| tGravityAcc-std()-Z
15| tBodyAccJerk.mean...X| tBodyAccJerk-mean()-X
16| tBodyAccJerk.mean...Y| tBodyAccJerk-mean()-Y
17| tBodyAccJerk.mean...Z| tBodyAccJerk-mean()-Z
18| tBodyAccJerk.std...X| tBodyAccJerk-std()-X
19| tBodyAccJerk.std...Y| tBodyAccJerk-std()-Y
20| tBodyAccJerk.std...Z| tBodyAccJerk-std()-Z
21| tBodyGyro.mean...X| tBodyGyro-mean()-X
22| tBodyGyro.mean...Y| tBodyGyro-mean()-Y
23| tBodyGyro.mean...Z| tBodyGyro-mean()-Z
24| tBodyGyro.std...X| tBodyGyro-std()-X
25| tBodyGyro.std...Y| tBodyGyro-std()-Y
26| tBodyGyro.std...Z| tBodyGyro-std()-Z
27| tBodyGyroJerk.mean...X| tBodyGyroJerk-mean()-X
28| tBodyGyroJerk.mean...Y| tBodyGyroJerk-mean()-Y
29| tBodyGyroJerk.mean...Z| tBodyGyroJerk-mean()-Z
30| tBodyGyroJerk.std...X| tBodyGyroJerk-std()-X
31| tBodyGyroJerk.std...Y| tBodyGyroJerk-std()-Y
32| tBodyGyroJerk.std...Z| tBodyGyroJerk-std()-Z
33| tBodyAccMag.mean..| tBodyAccMag-mean()
34| tBodyAccMag.std..| tBodyAccMag-std()
35| tGravityAccMag.mean..| tGravityAccMag-mean()
36| tGravityAccMag.std..| tGravityAccMag-std()
37| tBodyAccJerkMag.mean..| tBodyAccJerkMag-mean()
38| tBodyAccJerkMag.std..| tBodyAccJerkMag-std()
39| tBodyGyroMag.mean..| tBodyGyroMag-mean()
40| tBodyGyroMag.std..| tBodyGyroMag-std()
41| tBodyGyroJerkMag.mean..| tBodyGyroJerkMag-mean()
42| tBodyGyroJerkMag.std..| tBodyGyroJerkMag-std()
43| fBodyAcc.mean...X| fBodyAcc-mean()-X
44| fBodyAcc.mean...Y| fBodyAcc-mean()-Y
45| fBodyAcc.mean...Z| fBodyAcc-mean()-Z
46| fBodyAcc.std...X| fBodyAcc-std()-X
47| fBodyAcc.std...Y| fBodyAcc-std()-Y
48| fBodyAcc.std...Z| fBodyAcc-std()-Z
49| fBodyAcc.meanFreq...X| fBodyAcc-meanFreq()-X
50| fBodyAcc.meanFreq...Y| fBodyAcc-meanFreq()-Y
51| fBodyAcc.meanFreq...Z| fBodyAcc-meanFreq()-Z
52| fBodyAccJerk.mean...X| fBodyAccJerk-mean()-X
53| fBodyAccJerk.mean...Y| fBodyAccJerk-mean()-Y
54| fBodyAccJerk.mean...Z| fBodyAccJerk-mean()-Z
55| fBodyAccJerk.std...X| fBodyAccJerk-std()-X
56| fBodyAccJerk.std...Y| fBodyAccJerk-std()-Y
57| fBodyAccJerk.std...Z| fBodyAccJerk-std()-Z
58| fBodyAccJerk.meanFreq...X| fBodyAccJerk-meanFreq()-X
59| fBodyAccJerk.meanFreq...Y| fBodyAccJerk-meanFreq()-Y
60| fBodyAccJerk.meanFreq...Z| fBodyAccJerk-meanFreq()-Z
61| fBodyGyro.mean...X| fBodyGyro-mean()-X
62| fBodyGyro.mean...Y| fBodyGyro-mean()-Y
63| fBodyGyro.mean...Z| fBodyGyro-mean()-Z
64| fBodyGyro.std...X| fBodyGyro-std()-X
65| fBodyGyro.std...Y| fBodyGyro-std()-Y
66| fBodyGyro.std...Z| fBodyGyro-std()-Z
67| fBodyGyro.meanFreq...X| fBodyGyro-meanFreq()-X
68| fBodyGyro.meanFreq...Y| fBodyGyro-meanFreq()-Y
69| fBodyGyro.meanFreq...Z| fBodyGyro-meanFreq()-Z
70| fBodyAccMag.mean..| fBodyAccMag-mean()
71| fBodyAccMag.std..| fBodyAccMag-std()
72| fBodyAccMag.meanFreq..| fBodyAccMag-meanFreq()
73| fBodyBodyAccJerkMag.mean..| fBodyBodyAccJerkMag-mean()
74| fBodyBodyAccJerkMag.std..| fBodyBodyAccJerkMag-std()
75| fBodyBodyAccJerkMag.meanFreq..| fBodyBodyAccJerkMag-meanFreq()
76| fBodyBodyGyroMag.mean..| fBodyBodyGyroMag-mean()
77| fBodyBodyGyroMag.std..| fBodyBodyGyroMag-std()
78| fBodyBodyGyroMag.meanFreq..| fBodyBodyGyroMag-meanFreq()
79| fBodyBodyGyroJerkMag.mean..| fBodyBodyGyroJerkMag-mean()
80| fBodyBodyGyroJerkMag.std..| fBodyBodyGyroJerkMag-std()
81| fBodyBodyGyroJerkMag.meanFreq..| fBodyBodyGyroJerkMag-meanFreq()

