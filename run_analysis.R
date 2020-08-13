## 1) Import and download the raw files

## 1a) Download the zip file
library(plyr)
urlfile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(urlfile, destfile = "C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Cleaning Data/Course Project/dataset.zip" 
              ,method = "curl")

## 1b) Unzip the file
unzip(zipfile = "C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Cleaning Data/Course Project/dataset.zip"
      ,exdir = "C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Cleaning Data/Course Project")

## 1c) Store zip file proper location
properloc  <- file.path("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Cleaning Data/Course Project", "UCI HAR Dataset")

## 1d) Check to see that the files were unzipped into the correct directory
list.files("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Cleaning Data/Course Project")


## 2)Reading the test and training data

## 2a) Read the test data
subtest <- read.table("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Cleaning Data/Course Project/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
xtest <- read.table("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Cleaning Data/Course Project/UCI HAR Dataset/test/X_test.txt", header = FALSE)
ytest <- read.table("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Cleaning Data/Course Project/UCI HAR Dataset/test/y_test.txt", header = FALSE)


## 2b) Read the training data
subtrain <- read.table("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Cleaning Data/Course Project/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
xtrain <- read.table("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Cleaning Data/Course Project/UCI HAR Dataset/train/X_train.txt", header = FALSE)
ytrain <- read.table("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Cleaning Data/Course Project/UCI HAR Dataset/train/y_train.txt", header = FALSE)

## 2c) Read the features and activitylabels into tha data
features <- read.table("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Cleaning Data/Course Project/UCI HAR Dataset/features.txt", header = FALSE)
activitylabels <- read.table("C:/Users/kenny.c.mcdowell/Documents/Coursera Courses/Cleaning Data/Course Project/UCI HAR Dataset/activity_labels.txt", header = FALSE)


## 3) Assigning variable names

##3a) Assign variable names for the test data
colnames(subtest) <- "subjectID"
colnames(xtest) <- features[,2]        ##Transposing the features
colnames(ytest) <- "activityID"

## 3b) Assign variable names for the training data
colnames(subtrain) <- "subjectID"
colnames(xtrain) <- features[,2]
colnames(ytrain) <- "activityID"

## 3c) Assign variables for activity labels
colnames(activitylabels) <- c("activityID", "activityType")

## 3d) Add in an Activity column based on Activity ID from activity labels
##Change activityID into a numeric value
ytrain$activityID <- as.numeric(ytrain$activityID)
ytest$activityID <-as.numeric(ytest$activityID)

library(dplyr)
ytrain <- ytrain %>%
  mutate(Activity = case_when(activityID == 1 ~ 'WALKING',
                              activityID == 2 ~ 'WALKING_UPSTAIRS',
                              activityID == 3 ~ 'WALKING_DOWNSTAIRS',
                              activityID == 4 ~ 'SITTING',
                              activityID == 5 ~ 'STANDING',
                              activityID == 6 ~ 'LAYING'))

ytest <- ytest %>%
  mutate(Activity = case_when(activityID == 1 ~ 'WALKING',
                              activityID == 2 ~ 'WALKING_UPSTAIRS',
                              activityID == 3 ~ 'WALKING_DOWNSTAIRS',
                              activityID == 4 ~ 'SITTING',
                              activityID == 5 ~ 'STANDING',
                              activityID == 6 ~ 'LAYING'))

## 4) Merge the data sets

## 4a) Merge the training and test data
mergedtrain <- cbind(subtrain, xtrain, ytrain)
mergedtest <- cbind(subtest, xtest, ytest)

## 4b) combine the training and test data to form the final data set
combinedmerged <- rbind(mergedtrain, mergedtest)

## 4c) Make the variable names more understandable
names(combinedmerged) <- gsub(x = names(combinedmerged), pattern = "^t", replacement = "time")
names(combinedmerged) <- gsub(x = names(combinedmerged), pattern = "^f", replacement = "frequency")
names(combinedmerged) <- gsub(x = names(combinedmerged), pattern = "Acc", replacement = "Accelerometer")
names(combinedmerged) <- gsub(x = names(combinedmerged), pattern = "Gyro", replacement = "Gyroscope")
names(combinedmerged) <- gsub(x = names(combinedmerged), pattern = "Mag", replacement = "Magnitude")
names(combinedmerged) <- gsub(x = names(combinedmerged), pattern = "BodyBody", replacement = "Body")




## 4d) Read the column names of the final data set
col_names <- colnames(combinedmerged)


## 5) Find on the measurements of the mean and st.dev for each measurement

## 5a) Create a data set that shows the mean and st.dev of subjectID and activityID
meanandstdev <- (grepl("Activity", col_names) |
                 grepl("subjectID", col_names) |
                 grepl("mean..", col_names) |
                 grepl("std...", col_names)
                  )

## 5b) Make a subset to read into the final data set 
subsetmean_stdev <- combinedmerged[, meanandstdev == TRUE]



## 6) Give descriptive activity names to the activities in the data set
## 6a) The data was already labeled
## Did this is part 3d
##activitynames <- merge(subsetmean_stdev, activitylabels, by = 'activityType', all.x = TRUE)


## 7) A new tidy data set that contains the average of each variable for each
## activity and subject
tidy_data <- aggregate(. ~subjectID + Activity, subsetmean_stdev, mean) 

## 7a) Need to put the tidy data set in order
tidydata <- tidy_data[order(tidy_data$subjectID, tidy_data$Activity), ]

## 7b) Output of final tidy data set
write.table(tidydata, "tidydata.txt", row.names = FALSE)