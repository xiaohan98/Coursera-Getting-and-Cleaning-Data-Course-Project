
# Introduction
The script 'run_analysis.R' download the data from URL and performs the 5 steps described in the course project's definition.
* Merges the training and the test sets to create one data set.<br/>
* Extracts only the measurements on the mean and standard deviation for each measurement.<br/>
* Uses descriptive activity names to name the activities in the data set<br/>
* Appropriately labels the data set with descriptive variable names.<br/>
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br/><br/>

# Variables
* 'x_train', 'y_train', 'x_test', 'y_test', 'subject_train' and 'subject_test' contain the data from the downloaded files.<br/>
* 'mrg_train' and 'mrg_test' merge the previous datasets to further analysis.<br/>
* 'all_data' merges 'mrg_train' and 'mrg_train' in a big dataset.<br/>
* Finally, 'secTidySet' contains the relevant averages which will be later stored in a '.txt' file. 
