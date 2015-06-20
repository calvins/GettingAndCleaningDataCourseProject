# Steps to process 2012 Human Activity Recognition Using Smartphones data set
# into a tidy data set
# Calvin Seto
# Date: June 1, 2015
#
# Assumes raw data resides in the current directory in a folder called UCI HAR Dataset.
# The raw data for the training and test sets reside in sub-directories called train
# and test respectively.

# Create R object to hold activities and appropriately name
# this file contains 6 labels WALKING, etc.
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("AID","ACTIVITY")

# Create R object to hold features and appropriately name
# this file containts 561 labels for each feature 
features <- read.table("UCI HAR Dataset/features.txt")
names(features) <- c("FC","FEATURE")

# Clean up names of features.  I prefer Camel case and not all lowercase letters
# replace BodyBody with Body
features[,2] <- gsub("BodyBody", "Body", features[,2])
# replace hyphen, left parenthesis, and right parenthesis with empty space
features[,2] <- gsub("\\-|\\(|\\)","",features[,2])
# use make.names to make valid names
features[,2] <- make.names(features[,2])

# load each piece of the training set and appropriately name
# 7,352 rows of subject IDS (1-30) who performed the activity (integer)
trainsubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(trainsubject) <- c("SID")
# 7,352 rows of 561 features for each subject and activity (numeric)
trainx <- read.table("UCI HAR Dataset/train/X_train.txt")
### STEP 4. Appropriately labels the data set with descriptive variable names.
# Here I assign the cleaned up feature names to the training set of features
names(trainx) <- features[,2]
# 7,352 rows of training labels (1-6) to signify activity (integer)
trainy <- read.table("UCI HAR Dataset/train/y_train.txt")
names(trainy) <- c("AID")
### STEP 3. Uses descriptive activity names to name the activities in the data set
trainy$ACTIVITY[trainy$AID == 1] <- "WALKING"
trainy$ACTIVITY[trainy$AID == 2] <- "WALKING UPSTAIRS"
trainy$ACTIVITY[trainy$AID == 3] <- "WALKING DOWNSTAIRS"
trainy$ACTIVITY[trainy$AID == 4] <- "SITTING"
trainy$ACTIVITY[trainy$AID == 5] <- "STANDING"
trainy$ACTIVITY[trainy$AID == 6] <- "LAYING"

# load each piece of the test set and appropriately name
# 2,947 rows of subject IDS (1-30) who performed the activity (integer)
testsubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(testsubject) <- c("SID")
# 2,947 rows of 561 features for each subject and activity (numeric)
testx <- read.table("UCI HAR Dataset/test/X_test.txt")
### STEP 4. Appropriately labels the data set with descriptive variable names.
# Here I assign the cleaned up feature names to the test set of features
names(testx) <- features[,2]
# 2,942 rows of training labels (1-6) to signify activity (integer)
testy <- read.table("UCI HAR Dataset/test/y_test.txt")
names(testy) <- c("AID")
### STEP 3. Uses descriptive activity names to name the activities in the data set
testy$ACTIVITY[testy$AID == 1] <- "WALKING"
testy$ACTIVITY[testy$AID == 2] <- "WALKING UPSTAIRS"
testy$ACTIVITY[testy$AID == 3] <- "WALKING DOWNSTAIRS"
testy$ACTIVITY[testy$AID == 4] <- "SITTING"
testy$ACTIVITY[testy$AID == 5] <- "STANDING"
testy$ACTIVITY[testy$AID == 6] <- "LAYING"

# we are ready to combine each piece: subject, features, and activity and make
# a single training data set
train <- cbind(trainsubject, trainy, trainx)

# we are ready to combine each piece: subject, features, and activity and make
# a single test data set
test <- cbind(testsubject, testy, testx)

### STEP 1. Merges the training and test sets to create one data set.
# now we can combine the training and test sets into a single data set
merged <- rbind(test, train)

### STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# I chose to grep variable names for any occurrence of mean or std; upper or lower case
# and use the vector of indices to subset the columns of merged
ssMerged <- merged[,c(1,3,grep("[Mm][Ee][Aa][Nn]", names(merged)), grep("[Ss][Tt][Dd]", names(merged)))]

### STEP 5. From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.

# use reshape2 package for melt function
# melt took the mean and std feature columns and made them rows in ssMelt
library(reshape2)
ssMelt <- melt(ssMerged, id=c("SID","ACTIVITY"),measure.vars=c(3:88))
# checks of ssMelt 885714 rows (10299*86)
# unique(ssMelt$SID) 30 subject ids
# unique(ssMelt$ACTIVITY) 6 activities
# unique(ssMelt$variable) 86 feature names

# dcast recasts ssMelt data set into another shape containing the means of columns 3 to 88 by subject and activity
# 180 observations of 88 variables
ssTidy <- dcast(ssMelt, SID+ACTIVITY ~ variable, mean)

# rename variables 3-88 of ssTidy since they are "means of means" now
names(ssTidy)[3:88] <- paste0("mean",names(ssTidy)[3:88])

# write the tidy data set out to a file to upload
write.table(ssTidy, file="tidy_output.txt", row.names=FALSE)

# load the tidy data set from file into data R object
data <- read.table("tidy_output.txt", header = TRUE)

# view tidy data set variable names
# names(data)
