# Getting and cleaning data course project

This is my results from the course proyect in the Data Science Specialization.


## Goal
Companies like FitBit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked are collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data is available at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You will find 4 files in my repo: 

    run_analysis.R : the R-code.
    tidydata.txt : the clean data extracted from the original data using run_analysis.R
    CodeBook.md : the CodeBook reference to the variables in the tidy dataset.
    README.md : Your are actually reading this file right now.

## The steps

1. First we have to load all the required libraries 'curl, dplyr, memisc'
2. Set the working directory and download the raw dataset in ZIP format.
3. 'RBINDING' and 'CBINDING' the train and test data in a large dataset.
4. Assign a name to the variables. Also renaming the measurements variables using the 'features.txt' file.
5. Merge the training and the test sets to create one data set.
6. I extracted only the measurements on the mean and standard deviation for each measurement.
7. Then I had to use descriptive activity names to name the activities in the data set
8. The name of the measurements are a little hard to understand. So we must to convert the name of the variables to something more understandable. There are some common words. For example "t" stands for time, "f" for frequency, "Acc" for acceleration, "Gyro" for gyroscope and "Mag" for magnitude. I used gsub, part of grep package.
9. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. To do this, I used the plyr package.
10. Finally, I export the tidy data to a TXT file

##Run from command line

    Clone this repo

    Try to modify your WD and then run the script:

    $ Rscript run_analysis.R

    Look for the final dataset at tidydata.txt

