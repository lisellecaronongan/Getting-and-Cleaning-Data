pathdata <-getwd()
files = list.files(pathdata, recursive=TRUE)
files


### 1. Create the data set of training and test
#Reading training tables - xtrain / ytrain, subject train
xtrain = read.table(file.path(pathdata, "train", "X_train.txt"),header = FALSE)
ytrain = read.table(file.path(pathdata, "train", "y_train.txt"),header = FALSE)
subject_train = read.table(file.path(pathdata, "train", "subject_train.txt"),header = FALSE)
#Reading the testing tables
xtest = read.table(file.path(pathdata, "test", "X_test.txt"),header = FALSE)
ytest = read.table(file.path(pathdata, "test", "y_test.txt"),header = FALSE)
subject_test = read.table(file.path(pathdata, "test", "subject_test.txt"),header = FALSE)
#Read the features data
features = read.table(file.path(pathdata, "features.txt"),header = FALSE)
#Read activity labels data
activityLabels = read.table(file.path(pathdata, "activity_labels.txt"),header = FALSE)


colnames(xtrain) = features[,2]
colnames(ytrain) = "activityId"
colnames(subject_train) = "subjectId"
#Create Sanity and column values to the test data
colnames(xtest) = features[,2]
colnames(ytest) = "activityId"
colnames(subject_test) = "subjectId"
#Create sanity check for the activity labels value
colnames(activityLabels) <- c('activityId','activityType')

#Merging the train and test data 
mrg_train = cbind(ytrain, subject_train, xtrain)
mrg_test = cbind(ytest, subject_test, xtest)
##1 objective  - Create the main data table merging both table tables 
Alldata = rbind(mrg_train, mrg_test)

# Read all the values that are available
colNames = colnames(Alldata)
#2 Mean and standard deviation and the corresponding in activityID and subjectID 
mean_and_std = (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
#A subtset needs to be created to get the required dataset
MeanAndStd <- Alldata[ , mean_and_std == TRUE]

##3 - 5 :Activity Names, Labels the data set, creates a tidy data and write to a text file

ActivityNames = merge(MeanAndStd, activityLabels, by='activityId', all.x=TRUE)


Cleandata <- aggregate(. ~subjectId + activityId, ActivityNames, mean)
Cleandata <- Cleandata[order(Cleandata$subjectId, Tidy_data$activityId),]

write.table(Cleandata, file = "tidydata.txt",row.name=FALSE)


