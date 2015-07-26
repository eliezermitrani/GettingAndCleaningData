#Loading the libraries
library(curl)
library(dplyr)
library(plyr)
library(memisc)

#Set the working directory
mainDir = "D:/Users/Elito/Cursos/Data Science/3. Getting and Cleaning Data/Data Course Project - Accelerometer/GettingAndCleaningData"
setwd(mainDir)
subDir = "data"

#Create a data directory
ifelse(!dir.exists(file.path(mainDir, subDir)), dir.create(file.path(mainDir, subDir)), FALSE)

# download file from server and unziping
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "./data/dataset.zip",
              method = "libcurl")
unzip("./data/dataset.zip", exdir = "./data")

# Reading and building the train and test data
# First the ID data
train_id <- read.table(file = "./data/UCI HAR Dataset/train/subject_train.txt", sep=" ", header = FALSE)
test_id  <- read.table(file = "./data/UCI HAR Dataset/test/subject_test.txt", sep=" ", header = FALSE)

# Second, the activity data
train_act <- read.table(file="./data/UCI HAR Dataset/train/y_train.txt", sep=" ", header = FALSE)
test_act <- read.table(file="./data/UCI HAR Dataset/test/y_test.txt", sep=" ", header = FALSE)

# Finally the features data
train_feat <- read.table(file="./data/UCI HAR Dataset/train/X_train.txt", sep="", header = FALSE)
test_feat <- read.table(file="./data/UCI HAR Dataset/test/X_test.txt", sep="", header = FALSE)

# Let's understand our sepparate databases
str(train_id)
str(test_id)
str(train_act)
str(test_act)
str(train_feat)
str(test_feat)

# I don't know what I was expecting running the str function, but at least now I know that the test and train set have the same number of observations

# Now the fun part (kill me please).

# 1. Merges the training and the test sets to create one data set.
data_id <- rbind(train_id,test_id)
data_act <- rbind (train_act,test_act)
data_feat <- rbind(train_feat,test_feat)

# The datasets doesn't have the variables names. We have to assign a name for each dataset
names(data_id) <- c("ID")
names(data_act) <- c("activity")

# With features, the name assign it's a little bit tricky, because the name of the variables are in the features.txt file
features <- read.table(file="./data/UCI HAR Dataset/features.txt", sep="", header = FALSE)
names(data_feat) <- features$V2

# Now, we can combine the three dabatabases in one dataset
data_complete <- cbind(data_id,data_act,data_feat)

# As you can see, the features dataset has a lot of measures, but we only need the mean and the standard deviation variables
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features_mean_dev <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)] #this will create a factor with the mean and sd var.

# Now we have to filter the whole dataset, to filter only the variables related to the mean and standard deviation of the measurements
names_to_subset <- c("ID", "activity", as.character(features_mean_dev))
data <- subset(data_complete, select=names_to_subset)

# Only Wall-E can understand the name of activities with numbers, so lets revalue the activity varible
#3. Uses descriptive activity names to name the activities in the data set
activities_labes <- read.table(file="./data/UCI HAR Dataset/activity_labels.txt", sep="", header = FALSE)
activities_labes <- rename(activities_labes, activity=V1)
data2 <- join(data,activities_labes,"activity")
data2$activity <- data2$V2
data2$V2 <- NULL
str(data-3$activity)

# 4.Appropriately labels the data set with descriptive variable names. 
# The name of the mesureaments are a little hard to understand. So we must to convert the name of the variables to something more undertandable
# There are some common words. For example "t" stands for time, "f" for frequency, "Acc" for acceleration, "Gyro" for gyroscope and "Mag" for magnitude
# Again we will use gsub, part of grep package.
names(data2)<-gsub("^t", "Time", names(data2))
names(data2)<-gsub("^f", "Freq", names(data2))
names(data2)<-gsub("Acc", "Accelerometer", names(data2))
names(data2)<-gsub("Gyro", "Gyroscope", names(data2))
names(data2)<-gsub("Mag", "Magnitude", names(data2))

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# To do this, we will use the plyr package.

tidy_data <- aggregate(. ~ ID + activity, data2, mean)
tidy_data <- arrange(tidy_data, ID, activity)

# Finally, lets export the tidy data to a TXT file
write.table(tidy_data, file = "tidydata.txt",row.name=FALSE)
