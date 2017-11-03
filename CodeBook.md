# Coursera-Getting-and-Cleaning-Data-Course-Project - CodeBook

# Variables

* fileURL contains URL for source dataset.
* fileName contains zip local zip file name which will be downloaded from URL.
* x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
* x_data, y_data and subject_data merge the previous datasets.
* features contains the correct names for the x_data dataset, which are applied to the column names to keep variables for mean and standard daviation in script.
* activity_names variables will contain name for all activity along with their ids. activity_names will be used to merge with y_data and later used in for calculating average.
* final_data contains all merged data of x_data, y_data and subject_data.  
* final_data_melted contains the final_data converted into molten dataset.
* final_data_tidy contains average of all columns in  final_data_melted by activity and subject columns.

