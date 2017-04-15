# Coursera-Getting-and-Cleaning-Data-Course-Project
Han Zhang
This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.<br/><br/>
The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
<br/><br/>
## Files

The code takes for granted all the data is present in the same folder, un-compressed and without names altered.<br/><br/>
'CodeBook.md' describes the variables, the data, and any transformations or work that was performed to clean up the data.<br/><br/>
'run_analysis.R' contains all the code to perform the analyses as following:<br/><br/>
1.Merges the training and the test sets to create one data set.<br/>
2.Extracts only the measurements on the mean and standard deviation for each measurement.<br/>
3.Uses descriptive activity names to name the activities in the data set<br/>
4.Appropriately labels the data set with descriptive variable names.<br/>
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br/><br/>
The output of the 5th step is called 'averages_data.txt', and uploaded in the course project's form.
