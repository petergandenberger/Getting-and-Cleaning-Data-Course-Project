run_analysis <- function(){
## Read the txt-files for training and test Datasets
test.data <- read.table("UCI HAR Dataset/test/X_test.txt")
test.activities <- read.table("UCI HAR Dataset/test/y_test.txt")
test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
train.data <- read.table("UCI HAR Dataset/train/X_train.txt")
train.activities <- read.table("UCI HAR Dataset/train/y_train.txt")
train.subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Read the features.txt file
features <- read.table("UCI HAR Dataset/features.txt")
names(features) <- c("index", "featureName")

## Rename the test and training data-names according to the features
names(test.data) <- features[,2]
names(train.data) <- features[,2]

## find the features for mean or standard deviations
features$meanStd <- str_detect(features[,2], "mean|std")

## select only the columns in the combined.data that are mean or standard deviation features
test.meanStd <- test.data[, features$meanStd]
train.meanStd <- train.data[, features$meanStd]

## Read the activity labels 
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")
train.activities.labels <- left_join(train.activities, activity.labels, by = "V1")[, "V2"]
test.activities.labels <- left_join(test.activities, activity.labels, by = "V1")[, "V2"]

## add the subject ids to the datasets
test.meanStd <- cbind("subjectid" = unlist(test.subjects), test.meanStd)
train.meanStd <- cbind("subjectid" = unlist(train.subjects), train.meanStd)


## add the activity labels to the datasets
test.meanStd <- cbind("activity" = test.activities.labels, test.meanStd)
train.meanStd <- cbind("activity" = train.activities.labels, train.meanStd)

## combine the training and test data
combined.data <- union(test.meanStd, train.meanStd)

## clean the variable names
names(combined.data) <- str_to_lower(str_replace_all(names(combined.data), "\\(|\\)|-", ""))

## calculate the mean of the variables by activity and subjectId
combined.avg <- combined.data %>% group_by(activity, subjectid) %>% summarise_all(funs(mean))
combined.avg
}