---
title: "Code Book - 2012 Human Activity Recognition Using Smartphones"
author: "Calvin Seto"
date: "June 1, 2015"
output: html_document
---

## Overview

This code book will describe the variables in the raw data entities and features derived from the Smartphone accelerometer and gyroscopes.

## Raw data entities
Entity name: activity_labels
AID integer Activity ID
ACTIVITY character descriptive activity name

Entity names: trainsubject and testsubject
SID integer Subject ID identifying the subject in the experiment

Entity names: trainy and testy
AID integer Activity ID
ACTIVITY character descriptive activity name

Entity name: features
FC integer Feature Code
FEATURE character name of feature from the original raw data set

Entity names: trainx and testx
The 561 variables in these entities are named using the features loaded from the raw data.  They are described below.

## The Features
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

## Transformations
-For Activity names, replaced underscore with space in Activities Walking Upstairs and Walking Downstairs.

-Removed hyphens and parentheses in feature names.

-Keep feature names in upper and lower case as a personal preference.

-Replaced BodyBody with Body in feature names with the typo.

-Run make.names on feature names to make them valid R variable names.

-Add mean to the beginning of feature names in the tidy data set since they are now "means of means"


## The Tidy Data Set
By grepping feature names for mean or std in upper or lower case, I found 86 features to include in the tidy data set.
I list them below with their modified names since they are now "means of means."

SID integer subject ID

ACTIVITY character Descriptive name of the activity

meantBodyAccmeanX numeric

meantBodyAccmeanY numeric

meantBodyAccmeanZ numeric

meantGravityAccmeanX numeric

meantGravityAccmeanY numeric

meantGravityAccmeanZ numeric

meantBodyAccJerkmeanX numeric

meantBodyAccJerkmeanY numeric

meantBodyAccJerkmeanZ numeric

meantBodyGyromeanX numeric

meantBodyGyromeanY numeric

meantBodyGyromeanZ numeric

meantBodyGyroJerkmeanX numeric

meantBodyGyroJerkmeanY numeric

meantBodyGyroJerkmeanZ numeric

meantBodyAccMagmean numeric

meantGravityAccMagmean numeric

meantBodyAccJerkMagmean numeric

meantBodyGyroMagmean numeric

meantBodyGyroJerkMagmean numeric

meanfBodyAccmeanX numeric

meanfBodyAccmeanY numeric

meanfBodyAccmeanZ numeric

meanfBodyAccmeanFreqX numeric

meanfBodyAccmeanFreqY numeric

meanfBodyAccmeanFreqZ numeric

meanfBodyAccJerkmeanX numeric

meanfBodyAccJerkmeanY numeric

meanfBodyAccJerkmeanZ numeric

meanfBodyAccJerkmeanFreqX numeric

meanfBodyAccJerkmeanFreqY numeric

meanfBodyAccJerkmeanFreqZ numeric

meanfBodyGyromeanX numeric

meanfBodyGyromeanY numeric

meanfBodyGyromeanZ numeric

meanfBodyGyromeanFreqX numeric

meanfBodyGyromeanFreqY numeric

meanfBodyGyromeanFreqZ numeric

meanfBodyAccMagmean numeric

meanfBodyAccMagmeanFreq numeric

meanfBodyAccJerkMagmean numeric

meanfBodyAccJerkMagmeanFreq numeric

meanfBodyGyroMagmean numeric

meanfBodyGyroMagmeanFreq numeric

meanfBodyGyroJerkMagmean numeric

meanfBodyGyroJerkMagmeanFreq numeric

meanangletBodyAccMean.gravity numeric

meanangletBodyAccJerkMean.gravityMean numeric

meanangletBodyGyroMean.gravityMean numeric

meanangletBodyGyroJerkMean.gravityMean numeric

meanangleX.gravityMean numeric

meanangleY.gravityMean numeric

meanangleZ.gravityMean numeric

meantBodyAccstdX numeric

meantBodyAccstdY numeric

meantBodyAccstdZ numeric

meantGravityAccstdX numeric

meantGravityAccstdY numeric

meantGravityAccstdZ numeric

meantBodyAccJerkstdX numeric

meantBodyAccJerkstdY numeric

meantBodyAccJerkstdZ numeric

meantBodyGyrostdX numeric

meantBodyGyrostdY numeric

meantBodyGyrostdZ numeric

meantBodyGyroJerkstdX numeric

meantBodyGyroJerkstdY numeric

meantBodyGyroJerkstdZ numeric

meantBodyAccMagstd numeric

meantGravityAccMagstd numeric

meantBodyAccJerkMagstd numeric

meantBodyGyroMagstd numeric

meantBodyGyroJerkMagstd numeric

meanfBodyAccstdX numeric

meanfBodyAccstdY numeric

meanfBodyAccstdZ numeric

meanfBodyAccJerkstdX numeric

meanfBodyAccJerkstdY numeric

meanfBodyAccJerkstdZ numeric

meanfBodyGyrostdX numeric

meanfBodyGyrostdY numeric

meanfBodyGyrostdZ numeric

meanfBodyAccMagstd numeric

meanfBodyAccJerkMagstd numeric

meanfBodyGyroMagstd numeric

meanfBodyGyroJerkMagstd numeric

