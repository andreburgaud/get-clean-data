# Getting and Cleaning Data

## Files

* `CodeBook.md`: Code book describing the data set resulting from the analysis required for the assignment.
* `CodeBook.html`: HTML version of the code book.
* `notebook.Rmd`: R markdown file describing step by step and with R code the process resulting ib the final data set. 
* `notebook.html`: HTML version of the notebook.Rmd file.
* `notebokk.pdf`: PDF version of the notebook.Rmd file.
* `run_analysis.R`: R script that transforms the original dataset into a tidy data set with average of each variable for each activity and each subject (see CodeBook for additional details).

## Script execution

Assumptions:

1. The zip file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has been downloaded
1. The content of the zip file has been unzipped in the project directory, such that the directory `UCI HAR Dataset` is at the same level of `run_analysis.R`. The R script will look for datasets included in directory `UCI HAR Dataset` and its subdirectories.
1. To run the script at the command line:

```
$ Rscript run_analysis.R
```
