---
title: "README - 2012 Human Activity Recognition Using Smartphones"
author: "Calvin Seto"
date: "June 1, 2015"
output: html_document
---

## Overview
The project's data set was collected from the accelerometers and gyroscopes from the Samsung Galaxy S smartphone.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, scientists captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

### For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables.
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### NOTES:
- Features are normalized and bounded within [-1,1].
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are rad/seg.

## This project consists of the following:
1. this README.md explains how the run_analysis script works
2. a corresponding CodeBook.md describing the variables, the data, and any transformations or work to clean up the data
3. run_analysis.R script that processes the raw data and creates a tidy data set named tidy_output.txt

## The raw data (it's assumed that the Samsung raw data is in same directory as run_analysis.R)
1. The file "UCI HAR Dataset/activity_labels.txt" contains 6 rows of the names of the activities performed by each subject, preceded by an activity ID.  They are integer and character types.
2. The file "UCI HAR Dataset/features.txt" contains 561 rows of the names of the features derived from the accelerometer and gyroscope readings captured by the smartphones, preceded by a feature ID.  They are integer and character types.
3. The training set and test set are each composed of 3 raw files.
The file "UCI HAR Dataset/train/subject_train.txt" contains 7,352 rows of integers identifying the subject ID performing any one of the 6 activities.  They are integer type.
The file "UCI HAR Dataset/train/X_train.txt" contains 7,352 rows of the 561 features derived for each subject and activity.  They are numeric type.
The file "UCI HAR Dataset/train/y_train.txt" contains 7,352 rows of integers identifying the activity performed by the subject.  They are integer type.
The file "UCI HAR Dataset/test/subject_test.txt" contains 2,947 rows of integers identifying the subject ID performing any one of the 6 activities.  They are integer type.
The file "UCI HAR Dataset/test/X_test.txt" contains 2,947 rows of the 561 features derived for each subject and activity.  They are numeric types.
The file "UCI HAR Dataset/test/y_test.txt" contains 2,947 rows of integers identifying the activity performed by the subject.  They are integer type.
4. The training and test sets included several other raw files in an Inertial Signals folder.  These files were not included in the analysis because they will NOT be used to create our final tidy data set.

## The goal of the data processing
We are required to create a tidy data set with the average of each variable in the first data set, for each activity and for each subject.  This output will be named "tidy_output.txt" and be saved in the working directory.

## The steps of the data processing
1. Create R object activity_labels to hold the names of the activities and rename the variables AID and ACTIVITY.
2. Create features R object to hold the names of the features and rename the variables FC and FEATURE.
3. Clean up names of features by replacing BodyBody with Body, replacing hyphens and parentheses with empty spaces, and running make.names
4. Create trainsubject R object to hold the subject component of the training set and rename the variable SID.
5. Create trainx R object to hold the features component of the training set and rename the variables using column 2 of the features data frame.
6. Create trainy R object to hold the activities each subject performed and rename the variable to AID.
7. Create ACTIVITY variable in trainy to hold descriptive activiy names
8. Use AID to add the corresponding activity name.
9. to 13. Perform steps similar to 4 to 8 on the test raw data files, creating R objects testsubject, testx, and testy.
10. Combine 3 pieces of training set by column.
11. Combine 3 pieces of test set by column.
12. Merge training and test sets by row.
13. Grep column names in merged data set and search for the strings mean and std, upper and lower case.
14. Use the vector of column indices returned by the grep in the previous step to subset the columns of the merged data set.
15. Use reshape2 melt function to melt the mean and std features into rows.
16. Use dcast function to recast our molten data set into the means of each feature by subject and activity.
17. Since we have means of means in our data set, use names and paste0 functions to add mean at the beginning of each variable name.
18. Use write.table with row.names=FALSE to write output file tidy_output.txt in working directory.
19. Create data R object using read.table on the output file as a check.

