# Code Book

## Dataset

* The final dataset represents a combination of the training and testing datasets from the original analysis contained in the zip file available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
* In addition, the dataset was reduced to include only the mean and standard deviation for each measurement. See section **Features** below for additional details.
* To generate the final dataset, execute the script `run_analysis.R`. The resulting file is the text file `tidy_data_set.txt`.

## Variables

### Subject

The `subject` is a unique number identifying the volunteer (subject) participating in the test or training.

### Activity

The `activity` variable may have the following values:

* `walking`
* `walking_upstairs`
* `walking_downstairs`
* `sitting`
* `standing`
* `laying`

The final dataset includes one record for each activity per subject.

### Set

The set variable denotes the type of data, either training or testing. The value in the dataset are respectively `train` and `test`.

### Features

The following features are included in the final dataset. This is a subset of the features included in the original training and testing dataset. For more information about the original dataset, refer to the file `features_info.txt` included in the original analysis. 

* tBodyAccmeanX
* tBodyAccmeanY
* tBodyAccmeanZ
* tBodyAccstdX
* tBodyAccstdY
* tBodyAccstdZ
* tGravityAccmeanX
* tGravityAccmeanY
* tGravityAccmeanZ
* tGravityAccstdX
* tGravityAccstdY
* tGravityAccstdZ
* tBodyAccJerkmeanX
* tBodyAccJerkmeanY
* tBodyAccJerkmeanZ
* tBodyAccJerkstdX
* tBodyAccJerkstdY
* tBodyAccJerkstdZ
* tBodyGyromeanX
* tBodyGyromeanY
* tBodyGyromeanZ
* tBodyGyrostdX
* tBodyGyrostdY
* tBodyGyrostdZ
* tBodyGyroJerkmeanX
* tBodyGyroJerkmeanY
* tBodyGyroJerkmeanZ
* tBodyGyroJerkstdX
* tBodyGyroJerkstdY
* tBodyGyroJerkstdZ
* tBodyAccMagmean
* tBodyAccMagstd
* tGravityAccMagmean
* tGravityAccMagstd
* tBodyAccJerkMagmean
* tBodyAccJerkMagstd
* tBodyGyroMagmean
* tBodyGyroMagstd
* tBodyGyroJerkMagmean
* tBodyGyroJerkMagstd
* fBodyAccmeanX
* fBodyAccmeanY
* fBodyAccmeanZ
* fBodyAccstdX
* fBodyAccstdY
* fBodyAccstdZ
* fBodyAccJerkmeanX
* fBodyAccJerkmeanY
* fBodyAccJerkmeanZ
* fBodyAccJerkstdX
* fBodyAccJerkstdY
* fBodyAccJerkstdZ
* fBodyGyromeanX
* fBodyGyromeanY
* fBodyGyromeanZ
* fBodyGyrostdX
* fBodyGyrostdY
* fBodyGyrostdZ
* fBodyAccMagmean
* fBodyAccMagstd
* fBodyBodyAccJerkMagmean
* fBodyBodyAccJerkMagstd
* fBodyBodyGyroMagmean
* fBodyBodyGyroMagstd
* fBodyBodyGyroJerkMagmean
* fBodyBodyGyroJerkMagstd

### Feature Details

* First character (`t|f`): `t` represents time, whereas `f` represents frequency
* `X`, `Y` or `Z` ending the feature: represents one of the signal directions, X, Y or Z captured by the accelerometer or gyroscope.
* `std` or `mean` at the end of the feature (with optional postfix of X, Y or Z) identifies a measurement on the mean or the standard deviation.

## Transformations

The transformation details with commented R code are available in the file `notebook.Rmd`. Two user friendly versions of the file are also available respectively as notebook.html and notebook.pdf. The code included in `notebook.Rmd` was used to produce the final script `run_analysis.R`.