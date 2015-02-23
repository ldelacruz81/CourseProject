# Getting and Cleaning Data Course Project
This script assumes that the raw data is stored in a folder called **UCI HAR Dataset** under the working directory.
 
### Load data that are common for test and train
**features.txt** and **activity_labels.txt** are the two data that are used by both test and train data sets. The following code loads those two text files into their respective data frames.
```
features <- read.csv("UCI HAR Dataset\\features.txt", header=FALSE, sep=" ")
activity_labels <- read.csv("UCI HAR Dataset\\activity_labels.txt", header=FALSE, sep=" ")
```

## Load test data
The following code loads the subject table (subject_test.txt), the actual features data (x_test.txt), and the activity data (y_test.txt) for the test data set.
### load subject_test, x_test, and y_test
```
subject_test <- read.csv("UCI HAR Dataset\\test\\subject_test.txt", header=FALSE)
x_test <- read.csv("UCI HAR Dataset\\test\\x_test.txt", header=FALSE, sep="")
y_test <- read.csv("UCI HAR Dataset\\test\\y_test.txt", header=FALSE)
```

## Load test inertial signals
The following code loads the Inertial Signals for the test data set.
### load body_acc_(xyz)_test
```
body_acc_x_test <- read.csv("UCI HAR Dataset\\test\\inertial signals\\body_acc_x_test.txt", header=FALSE, sep="")
body_acc_y_test <- read.csv("UCI HAR Dataset\\test\\inertial signals\\body_acc_y_test.txt", header=FALSE, sep="")
body_acc_z_test <- read.csv("UCI HAR Dataset\\test\\inertial signals\\body_acc_z_test.txt", header=FALSE, sep="")
```
### load body_gyro_(xyz)_test
```
body_gyro_x_test <- read.csv("UCI HAR Dataset\\test\\inertial signals\\body_gyro_x_test.txt", header=FALSE, sep="")
body_gyro_y_test <- read.csv("UCI HAR Dataset\\test\\inertial signals\\body_gyro_y_test.txt", header=FALSE, sep="")
body_gyro_z_test <- read.csv("UCI HAR Dataset\\test\\inertial signals\\body_gyro_z_test.txt", header=FALSE, sep="")
```
### load total_acc_(xyz)_test
```
total_acc_x_test <- read.csv("UCI HAR Dataset\\test\\inertial signals\\total_acc_x_test.txt", header=FALSE, sep="")
total_acc_y_test <- read.csv("UCI HAR Dataset\\test\\inertial signals\\total_acc_y_test.txt", header=FALSE, sep="")
total_acc_z_test <- read.csv("UCI HAR Dataset\\test\\inertial signals\\total_acc_z_test.txt", header=FALSE, sep="")
```

## Load train data
### load subject_train, x_train, and y_train
The following code loads the subject table (subject_test.txt), the actual features data (x_test.txt), and the activity data (y_test.txt) for the train data set.
```
subject_train <- read.csv("UCI HAR Dataset\\train\\subject_train.txt", header=FALSE)
x_train <- read.csv("UCI HAR Dataset\\train\\x_train.txt", header=FALSE, sep="")
y_train <- read.csv("UCI HAR Dataset\\train\\y_train.txt", header=FALSE)
```

## Load train inertial signals
### load body_acc_(xyz)_train
The following code loads the Inertial Signals for the train data set.
```
body_acc_x_train <- read.csv("UCI HAR Dataset\\train\\inertial signals\\body_acc_x_train.txt", header=FALSE, sep="")
body_acc_y_train <- read.csv("UCI HAR Dataset\\train\\inertial signals\\body_acc_y_train.txt", header=FALSE, sep="")
body_acc_z_train <- read.csv("UCI HAR Dataset\\train\\inertial signals\\body_acc_z_train.txt", header=FALSE, sep="")
```
### load body_gyro_(xyz)_train
```
body_gyro_x_train <- read.csv("UCI HAR Dataset\\train\\inertial signals\\body_gyro_x_train.txt", header=FALSE, sep="")
body_gyro_y_train <- read.csv("UCI HAR Dataset\\train\\inertial signals\\body_gyro_y_train.txt", header=FALSE, sep="")
body_gyro_z_train <- read.csv("UCI HAR Dataset\\train\\inertial signals\\body_gyro_z_train.txt", header=FALSE, sep="")
```
### load total_acc_(xyz)_train
```
total_acc_x_train <- read.csv("UCI HAR Dataset\\train\\inertial signals\\total_acc_x_train.txt", header=FALSE, sep="")
total_acc_y_train <- read.csv("UCI HAR Dataset\\train\\inertial signals\\total_acc_y_train.txt", header=FALSE, sep="")
total_acc_z_train <- read.csv("UCI HAR Dataset\\train\\inertial signals\\total_acc_z_train.txt", header=FALSE, sep="")
```

## Merge train and test data
### Merge subject, x and y
The following code merges the subject, the measurements and the activity tables from the train and test data sets.
```
subject <- rbind(subject_train, subject_test)
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
```
### Merge inertial signals
The following code merges the inertial signals from the train and test data sets.
```
body_acc_x <- rbind(body_acc_x_train, body_acc_x_test)
body_acc_y <- rbind(body_acc_y_train, body_acc_y_test)
body_acc_z <- rbind(body_acc_z_train, body_acc_z_test)
body_gyro_x <- rbind(body_gyro_x_train, body_gyro_x_test)
body_gyro_y <- rbind(body_gyro_y_train, body_gyro_y_test)
body_gyro_z <- rbind(body_gyro_z_train, body_gyro_z_test)
total_acc_x <- rbind(total_acc_x_train, total_acc_x_test)
total_acc_y <- rbind(total_acc_y_train, total_acc_y_test)
total_acc_z <- rbind(total_acc_z_train, total_acc_z_test)
```

## Extract only the measurements on the mean and standard deviation for each measurement.
The following code extracts only the measurements on the mean and standard deviation for each measurement. Looking at features.txt, some features have a prefix of **-mean** or **-std**. It is assumed that those correspond to the columns with the mean and standard deviations measurements in the dataset. Based on features.txt, these are the following columns:
```
1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
41 tGravityAcc-mean()-X
42 tGravityAcc-mean()-Y
43 tGravityAcc-mean()-Z
44 tGravityAcc-std()-X
45 tGravityAcc-std()-Y
46 tGravityAcc-std()-Z
81 tBodyAccJerk-mean()-X
82 tBodyAccJerk-mean()-Y
83 tBodyAccJerk-mean()-Z
84 tBodyAccJerk-std()-X
85 tBodyAccJerk-std()-Y
86 tBodyAccJerk-std()-Z
121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
201 tBodyAccMag-mean()
202 tBodyAccMag-std()
214 tGravityAccMag-mean()
215 tGravityAccMag-std()
227 tBodyAccJerkMag-mean()
228 tBodyAccJerkMag-std()
240 tBodyGyroMag-mean()
241 tBodyGyroMag-std()
253 tBodyGyroJerkMag-mean()
254 tBodyGyroJerkMag-std()
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
503 fBodyAccMag-mean()
504 fBodyAccMag-std()
529 fBodyBodyGyroMag-mean()
530 fBodyBodyGyroMag-std()
542 fBodyBodyGyroJerkMag-mean()
543 fBodyBodyGyroJerkMag-std()
```
The following code, selects the columns listed above and stores the result to **extracted**.
```
extracted <- x[, c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543)]
```

## Use descriptive activity names to name the activities in the data set
The activity names are stored in **activity_labels**. The following code, adds a second column to the activity table (**y**) which is the descriptive name (factor) obtained from **activity_labels** corresponding to the numeric data stored in the activity table.
```
y[,2] <- activity_labels[y$V1,2]
```

## Appropriately label the data set with descriptive variable names. 
The column names of the extracted data is changed to the descriptive names from features.txt.
```
colnames(extracted) <- features[c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543), 2]
```

## Create a second, independent tidy data set with the average of each variable for each activity and each subject.

### Add columns in the dataset for subject and activity
Two additional columns are added to the extracted data set, obtained from the subject and the activity tables.
```
extracted$subject <- subject[,1]
extracted$activity <- y[,2]
```

### Melt the dataset so it includes columns for subject, activity and variable
The melt function transform the data into a form suitable for the required output, in this case with columns for subject, activity, the measurement variable name, and the measurement values.
```
melted <- melt(extracted,id=c("subject", "activity"),measure.vars=colnames(extracted)[1:66])
```

### Finally, get the mean of the values grouped by subject,activity and variable which gives us our tidy table
The mean function is applied to the values and the result is stored in tidy data frame, and then saved to the working directory as a text file.
```
tidy <- ddply(melted, c("subject", "activity", "variable"), summarize, average=mean(value))
write.table(tidy, file="tidy.txt", row.names=FALSE)
```
