library(plyr) # mapvalues
library(dplyr)

# Set current directory as working directory
setwd(".")

# Assumption: the data is in the current directory

# ------------------------------------------------------------------------------
# Training Data
# ------------------------------------------------------------------------------
# Load training signals in data frame
trainSignals <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
# Load training subjects in a vector
subject <- scan("UCI HAR Dataset/train/subject_train.txt")
# Load training activities in a vector
activity <- scan("UCI HAR Dataset/train/y_train.txt")
# Add set type column (train vs. test)
trainDF <- cbind(set="train", trainSignals)
# Add activity column
trainDF <- cbind(activity, trainDF)
# Add subject column
trainDF <- cbind(subject, trainDF)

# ------------------------------------------------------------------------------
# Test Data
# ------------------------------------------------------------------------------
# Load testing signals in data frame
testSignals <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
# Load testing subjects in a vector
subject <- scan("UCI HAR Dataset/test/subject_test.txt")
# Load testing activities in a vector
activity <- scan("UCI HAR Dataset/test/y_test.txt")
# Add set type column (test vs. train)
testDF <- cbind(set="test", testSignals)
# Add activity column
testDF <- cbind(activity, testDF)
# Add subject column
testDF <- cbind(subject, testDF)

# ------------------------------------------------------------------------------
# (1) Merges training and test data setes to create one data set.
# ------------------------------------------------------------------------------
DF <- merge(trainDF, testDF, all=TRUE)

# ------------------------------------------------------------------------------
# (2) Extracts measurements on mean and standard deviation for each measurement.
# ------------------------------------------------------------------------------
# Read the features in a table to extract features name
features <-  read.table("UCI HAR Dataset/features.txt", header=FALSE,
                        stringsAsFactors=FALSE)
# Convert id value to column names matching the consolidated DF column names
features <- mutate(features, V1=paste("V", V1, sep=""))
# Extract only the features matching mean of std functions
stdMeanFeatures <- features[grepl("mean\\(\\)|std\\(\\)", features$V2),]
# Extract measurements for std and mean func in the consolidated DF
# Preserve subject, activity and set column names
firstThreeCols <- names(DF)[1:3]
stdMeanDF <- select_(DF, .dots=c(firstThreeCols, stdMeanFeatures$V1))

# ------------------------------------------------------------------------------
# (3) Uses descriptive activity names to name activities in the data set.
# ------------------------------------------------------------------------------
activityDF <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)
activityLabels = tolower(activityDF$V2)
# Set descriptive activities (i.e. 1="walking", 2="walking_upstairs"...)
stdMeanDF <- mutate(stdMeanDF, activity=mapvalues(activity, from=c(1,2,3,4,5,6),
                                                  to=activityLabels))
# convert activity variable to factor
stdMeanDF <- mutate(stdMeanDF, activity=factor(activity,
                                               levels=tolower(activityDF$V2)))

# ------------------------------------------------------------------------------
# (4) Appropriately labels the data set with descriptive variable names.
# ------------------------------------------------------------------------------
# Remove special characters from column names (features)
cleanFeatures <- gsub("[\\(\\)-]", "", stdMeanFeatures$V2)
colnames(stdMeanDF) <- c(firstThreeCols, cleanFeatures)

# ------------------------------------------------------------------------------
# (5) From the data set in step 4, creats a second, independent tidy data set
#     with the average of each variable for each activity and each subject.
# ------------------------------------------------------------------------------
# Group DF by subject and activity, then apply mean for each feature
meanDF <- stdMeanDF %>%
    group_by(subject, activity, set) %>%
    summarise_each_(funs(mean), names(stdMeanDF[4:ncol(stdMeanDF)]))
# Write to a file for assignment submission
write.table(meanDF, file="tidy_data_set.txt", row.name=FALSE)
