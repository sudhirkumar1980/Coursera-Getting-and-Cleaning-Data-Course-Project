## Install required packages and Library
library(dplyr)
library(reshape2)
##Download the source dataset
fileName<- "source_dataset.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists(fileName)){
        download.file(fileURL, destfile = fileName)
}
if(!file.exists("UCI HAR Dataset")){
        file.remove("UCI HAR Dataset")
        unzip(fileName)
}
unzip(fileName)

##1. Merges the training and the test sets to create one data set.
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

x_test<- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test<- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test<- read.table("./UCI HAR Dataset/test/subject_test.txt")

##x data creation
x_data <- rbind(x_train,x_test)
## y data creation 
y_data <- rbind(y_train,y_test)

## subject data creation
subject_data <- rbind(subject_train,subject_test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./UCI HAR Dataset/features.txt")

##      Use description name of activity
names(x_data) <- features[,2]

##      subset the data for mean and sd features
x_data <- x_data[,grep("-(mean|sd)\\(\\)", names(x_data))]

##3. Uses descriptive activity names to name the activities in the data set
activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_names)<- c("id", "activity")
##      join y_data with activity names
y_data <- merge(y_data,activity_names, by.x = "V1", by.y = "id")[,2]
y_data <- as.data.frame(y_data)
names(y_data)<- c("activity")

##4. Appropriately labels the data set with descriptive variable names.
names(subject_data) <- "subject"


## join all dataset using column binding
final_data <- cbind(x_data,y_data,subject_data)

##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
final_data$activity <- as.character(final_data$activity)

final_data_melted <- melt(final_data, id = c("subject", "activity"))
final_data_tidy=dcast(final_data_melted, subject + activity ~ variable, mean)
write.table(final_data_tidy, "tidy_data.txt", row.name=FALSE)

