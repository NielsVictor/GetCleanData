# GetCleanData by NielsVictor

This repo contains my programming assignment for the Coursera course "Getting and Cleaning data".
This Code Book provides a description of the variables in the tidy data set obtained from the Human Activity Recognition Using Smartphones dataset. The data was collected from the accelerometers of the Samsung Galaxy S smartphone. The goal was to prepare tidy data that can be used for later analysis.

Data Source
The original data source can be found at: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones)

Variables
The tidy data set contains the following variables:
Subject: An identifier for the subject who performed the activity. Ranges from 1 to 30.
Activity: The activity performed by the subject. It is a character variable with the following six descriptive activity names:
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING
The rest of the variables represent the mean and standard deviation of the accelerometer measurements. These variables are numeric and have been appropriately labeled to be descriptive and informative.

The final tidy data set contains the average of each variable for each activity and each subject. This data set was saved to a file named "tidy_data_avg.txt" and is ready for later analysis.

Note: The original data set had multiple measurements for each subject and activity combination. The tidy data set contains the average of these measurements, making it a tidy and summarized version of the original data.
