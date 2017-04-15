# Coursera-Getting-and-Cleaning-Data-Course-Project
Han Zhang
This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.
The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
## Files
The code takes for granted all the data is present in the same folder, un-compressed and without names altered.
'CodeBook.md' describes the variables, the data, and any transformations or work that was performed to clean up the data.
'run_analysis.R' contains all the code to perform the analyses as following:1.Merges the training and the test sets to create one data set.2.Extracts only the measurements on the mean and standard deviation for each measurement. 3.Uses descriptive activity names to name the activities in the data set4.Appropriately labels the data set with descriptive variable names. 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The output of the 5th step is called 'averages_data.txt', and uploaded in the course project's form.
