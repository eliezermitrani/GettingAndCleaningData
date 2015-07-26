## TidyData code book

Filename :  tidydata.txt
Source:     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The tidydata file was constructed with information of a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
All the information gathered in the experiment was combined in a large dataset, was filtered and aggregated in the tidydata dataset.

The tidydata.txt file contains 180 observations in 68 variables.

##The dataset includes the following files:

####ID
A unique identifier of the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- class: int  1 1 1 1 1 1 2 2 2 2 ...

####activity
The action performed by the subject
- class: Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals:
- TimeAccelerometer-XYZ
- TimeGyroscope-XYZ.

Similarly, the acceleration signal was then separated into body and gravity acceleration signals:
- TimeBodyAccelerometer-XYZ
- TimeGravityAccelerometer-XYZ).  

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals:
- TimeBodyAccelerometerJerk-XYZ
- TimeBodyGyroscopeJerk-XYZ).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing:
- FreqBodyAccelerometer-XYZ
- FreqBodyAccelerometerJerk-XYZ
- FreqBodyGyroscope-XYZ
- FreqBodyAccelerometerJerkMagnitude
- FreqBodyGyroscopeMagnitude
- FreqBodyGyroscopeJerkMagnitude

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

All the measurements variables in tidy data are an aggregate from the original data, measuring the mean of the originals variables for each subject and activity.
