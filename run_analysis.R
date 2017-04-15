#Step 0
#Download data
################################################################################

  if(!file.exists("./data")){
    dir.create("./data")
  }
  
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  download.file(fileUrl,destfile="./data/Dataset.zip")
  
  # Unzip dataSet to /data directory
  unzip(zipfile="./data/Dataset.zip",exdir="./data")
  
# Step 1 
# Merge the training and test sets to create one data set 
############################################################################### 
 
 
  # Reading trainings tables:
  x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
  subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

  # Reading testing tables:
  x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

  # Reading feature vector:
  features <- read.table('./data/UCI HAR Dataset/features.txt')
  
  # Reading activity labels:
  activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')
  
  colnames(x_train) <- features[,2] 
  colnames(y_train) <-"activityId"
  colnames(subject_train) <- "subjectId"
  
  colnames(x_test) <- features[,2] 
  colnames(y_test) <- "activityId"
  colnames(subject_test) <- "subjectId"
  
  colnames(activityLabels) <- c('activityId','activityType')
 
  mrg_train <- cbind(y_train, subject_train, x_train)
  mrg_test <- cbind(y_test, subject_test, x_test)
  all_data <- rbind(mrg_train, mrg_test)
  
  
 # Step 2 
 # Extract only the measurements on the mean and standard deviation for each measurement 
 ############################################################################### 
 
 
  colNames <- colnames(all_data)
 
 
  mean_and_std <- (grepl("activityId" , colNames) | 
                     grepl("subjectId" , colNames) | 
                     grepl("mean.." , colNames) | 
                     grepl("std.." , colNames) 
  )
  
  setForMeanAndStd <- all_data[ , mean_and_std == TRUE]
 
 
# Step 3 
# Use descriptive activity names to name the activities in the data set 
############################################################################### 
 
  setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                                by='activityId',
                                all.x=TRUE)
 
  colNames <- colnames(setWithActivityNames)
# Step 4 
# Appropriately label the data set with descriptive variable names 
############################################################################### 
 
 
  for (i in 1:length(colNames))  
  { 
      colNames[i] = gsub("\\()","",colNames[i]) 
      colNames[i] = gsub("-std$","StdDev",colNames[i]) 
      colNames[i] = gsub("-mean","Mean",colNames[i]) 
      colNames[i] = gsub("^(t)","time",colNames[i]) 
      colNames[i] = gsub("^(f)","freq",colNames[i]) 
      colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i]) 
      colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i]) 
      colNames[i] = gsub("[Gg]yro","Gyro",colNames[i]) 
      colNames[i] = gsub("AccMag","AccMagnitude",colNames[i]) 
      colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i]) 
      colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i]) 
      colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i]) 
  }; 
  
  colnames(setWithActivityNames) = colNames;
 
 
# Step 5 
# Create a second, independent tidy data set with the average of each variable 
# for each activity and each subject 
############################################################################### 

 
  secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
  secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]
 
 
  write.table(secTidySet, "secTidySet.txt", row.name=FALSE) 
