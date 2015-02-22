## Load data that are common for test and train
features <- read.csv("features.txt", header=FALSE, sep=" ")
activity_labels <- read.csv("activity_labels.txt", header=FALSE, sep=" ")

## Load test data
## load subject_test, x_test, and y_test
subject_test <- read.csv("test\\subject_test.txt", header=FALSE)
x_test <- read.csv("test\\x_test.txt", header=FALSE, sep="")
y_test <- read.csv("test\\y_test.txt", header=FALSE)

## Load test inertial signals
## load body_acc_(xyz)_test
body_acc_x_test <- read.csv("test\\inertial signals\\body_acc_x_test.txt", header=FALSE, sep="")
body_acc_y_test <- read.csv("test\\inertial signals\\body_acc_y_test.txt", header=FALSE, sep="")
body_acc_z_test <- read.csv("test\\inertial signals\\body_acc_z_test.txt", header=FALSE, sep="")
## load body_gyro_(xyz)_test
body_gyro_x_test <- read.csv("test\\inertial signals\\body_gyro_x_test.txt", header=FALSE, sep="")
body_gyro_y_test <- read.csv("test\\inertial signals\\body_gyro_y_test.txt", header=FALSE, sep="")
body_gyro_z_test <- read.csv("test\\inertial signals\\body_gyro_z_test.txt", header=FALSE, sep="")
## load total_acc_(xyz)_test
total_acc_x_test <- read.csv("test\\inertial signals\\total_acc_x_test.txt", header=FALSE, sep="")
total_acc_y_test <- read.csv("test\\inertial signals\\total_acc_y_test.txt", header=FALSE, sep="")
total_acc_z_test <- read.csv("test\\inertial signals\\total_acc_z_test.txt", header=FALSE, sep="")


## Load train data
## load subject_train, x_train, and y_train
subject_train <- read.csv("train\\subject_train.txt", header=FALSE)
x_train <- read.csv("train\\x_train.txt", header=FALSE, sep="")
y_train <- read.csv("train\\y_train.txt", header=FALSE)

## Load train inertial signals
## load body_acc_(xyz)_train
body_acc_x_train <- read.csv("train\\inertial signals\\body_acc_x_train.txt", header=FALSE, sep="")
body_acc_y_train <- read.csv("train\\inertial signals\\body_acc_y_train.txt", header=FALSE, sep="")
body_acc_z_train <- read.csv("train\\inertial signals\\body_acc_z_train.txt", header=FALSE, sep="")
## load body_gyro_(xyz)_train
body_gyro_x_train <- read.csv("train\\inertial signals\\body_gyro_x_train.txt", header=FALSE, sep="")
body_gyro_y_train <- read.csv("train\\inertial signals\\body_gyro_y_train.txt", header=FALSE, sep="")
body_gyro_z_train <- read.csv("train\\inertial signals\\body_gyro_z_train.txt", header=FALSE, sep="")
## load total_acc_(xyz)_train
total_acc_x_train <- read.csv("train\\inertial signals\\total_acc_x_train.txt", header=FALSE, sep="")
total_acc_y_train <- read.csv("train\\inertial signals\\total_acc_y_train.txt", header=FALSE, sep="")
total_acc_z_train <- read.csv("train\\inertial signals\\total_acc_z_train.txt", header=FALSE, sep="")

## Merge train and test data
## Merge subject, x and y
subject <- rbind(subject_train, subject_test)
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
## Merge inertial signals
body_acc_x <- rbind(body_acc_x_train, body_acc_x_test)
body_acc_y <- rbind(body_acc_y_train, body_acc_y_test)
body_acc_z <- rbind(body_acc_z_train, body_acc_z_test)
body_gyro_x <- rbind(body_gyro_x_train, body_gyro_x_test)
body_gyro_y <- rbind(body_gyro_y_train, body_gyro_y_test)
body_gyro_z <- rbind(body_gyro_z_train, body_gyro_z_test)
total_acc_x <- rbind(total_acc_x_train, total_acc_x_test)
total_acc_y <- rbind(total_acc_y_train, total_acc_y_test)
total_acc_z <- rbind(total_acc_z_train, total_acc_z_test)

## Extract only the measurements on the mean and standard deviation for each measurement.
extracted <- x[, c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 425:429, 503:504, 516:517, 529:530, 542:543)]

## Uses descriptive activity names to name the activities in the data set
y[,2] <- activity_labels[y$V1,2]

## Appropriately label the data set with descriptive variable names. 
colnames(extracted) <- features[c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543), 2]

## Create a second, independent tidy data set with the average of each variable for each activity and each subject.

