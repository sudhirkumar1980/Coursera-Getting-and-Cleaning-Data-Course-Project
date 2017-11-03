# Coursera-Getting-and-Cleaning-Data-Course-Project

This repository contain R code and documentation to create the tidy dataset from Human Activity Recoginition dataset collected using Samsung Galaxy smartphone.

R script run_analysis.R performs following steps to on source data to create tidy dataset.

* Load required dplyr and reshape2 R Packages.
* Download the source dataset in working directory from link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. It remove previous file and download a new copy.
* Load test and training dataset for Activities, Features and Subject dataset and merge them.
* Load features and assign to x_data dataset. keeping only columns related with mean and standard daviation.
* Load activity name and and assign "id" and "activity" as columns name.
* Merge activty dataset and activity name.
* Assign name subject as columns name in merged subject dataset.
* Merge all features, activity and subject dataset. and Convert activity column to character vector from factor.
* Average all columns for each subject and avtivity using melt and dcast function from reshape2 package.
* Finally store averaged data into a file tidy_data.txt. 

