# Getting and Cleaning Data Course Project
## Description
The Repo contains the files for the final Project of the coursera course "Getting and Cleaning Data". For more Information about the variables please refer to the Codebook.md file.

## Script
The "run_analysis.R" Script does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It looks for the data in the "/UCI HAR Dataset" folder.
Run the script with  

1. source('run_analysis.R')
2. run_analysis()

For more Information about the script please refer to the comments in the script itself or the CodeBook.