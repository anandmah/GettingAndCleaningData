## set the directory containing the data
dataDir <- 'data'

## read in the training and test dataset
X_train <- read.table(sprintf('%s/train/X_train.txt', dataDir))
y_train <- read.table(sprintf('%s/train/y_train.txt', dataDir))
subject_train <- read.table(sprintf('%s/train/subject_train.txt', dataDir))
X_test <- read.table(sprintf('%s/test/X_test.txt', dataDir))
y_test <- read.table(sprintf('%s/test/y_test.txt', dataDir))
subject_test <- read.table(sprintf('%s/test/subject_test.txt', dataDir))

## read in feature info, acitivity labels
featureInfo <-read.table(sprintf('%s/features.txt', dataDir))
names(featureInfo) <- c('featureId', 'featureName')
activityLabels <- read.table(sprintf('%s/activity_labels.txt', dataDir))
names(activityLabels) <- c('activityId', 'activityLabel')

## find the feature ids that are mean or std measurements
validFeatureIds <- featureInfo[grepl('.*-(std|mean)\\(\\)', featureInfo$featureName),]$featureId
validFeatureNames <- featureInfo[grepl('.*-(std|mean)\\(\\)', featureInfo$featureName),]$featureName

## merge training and test dataset
X <- rbind(X_train, X_test)
X <- X[,validFeatureIds]     # mean or std measurements
names(X) <- validFeatureNames
y <- rbind(y_train, y_test)
colnames(y) <- 'activityId'
subject <- rbind(subject_train, subject_test)
colnames(subject) <- 'subjectId'

data <- cbind(X, y, subject)  # put together the columns

## associate descriptive activity names by merging data and activityLabels
data <- merge(data, activityLabels, by.x='activityId', by.y='activityId')

## create the tidy set containing average measurements for each (activityLabel, subjectId)
library(reshape2)
melted <- melt(data, id=c("activityLabel", "subjectId"), measure.vars=as.vector(validFeatureNames))
tidy <- dcast(melted, activityLabel + subjectId ~ variable, mean, na.rm=TRUE)

## save the tidy data set
write.csv(tidy, 'tidy_data.csv')
