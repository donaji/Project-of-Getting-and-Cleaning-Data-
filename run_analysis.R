###   This code assume that you are in the data directory   ###
###   This code uses the plyr lybrary   ###

library(plyr)

#####################################################
###   1. Read and merge the data sets provided.   ###
#####################################################

X_test  <- read.table("test/X_test.txt")
X_train <- read.table("train/X_train.txt")

X_dat <- rbind(X_test, X_train)

y_test  <- read.table("test/y_test.txt")
y_train <- read.table("train/y_train.txt")

y_dat <- rbind(y_test, y_train)

subject_test  <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")

subject_dat <- rbind(subject_test, subject_train)


#################################################################################
###   2. Extract only the mean and standard deviation for each measurement.   ###
#################################################################################


features <- read.table("features.txt")

###   Getting only the mean() and std() columns   ###

m_std <- grep("-(mean|std)\\(\\)", features[, 2])

###   Subsetting data   ###

X_dat <- X_dat[, m_std]

###  Adding column names  ###

names(X_dat) <- features[m_std, 2]

#  summary(X_dat)


#####################################################################################
###   3. Use descriptive activity names to name the activities in the data set.   ###
#####################################################################################


act <- read.table("activity_labels.txt")

###   Correct activity and column names  ###

y_dat[,1] <- act[y_dat[,1],2]

names(y_dat) <- "activity"

#  summary(y_dat)


################################################################################
###   4. Appropriately label the data set with descriptive variable names.   ###
################################################################################


###  Changing column name   ###

names(subject_dat) <- "subject"

###   merging data   ###

dat <- cbind (X_dat, y_dat, subject_dat)

# summary(dat)


##########################################################################################################
###   5. Create a 2nd tidy data set with the average of each variable from activity and each subject   ###
##########################################################################################################


###   If we check the size  of the data with dim(data), the final data has 68 columns, the last two   ###
###   are not needed, as those are the "activity" and "subject" columns                               ###

av_data <- ddply(dat, .(subject, activity), function(x) colMeans(x[, 1:66]))

### Finally, write the data to a new txt file!  ###

write.table(av_data, "av_data.txt", row.name=FALSE)
