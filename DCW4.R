library(data.table)
##Set working directory to current directory where UCI HAR dataset is extracted
setwd("D:\\Coding\\R\\Data Cleansing\\UCI HAR Dataset")

##Read test data
rawTestX <- read.table("test\\X_test.txt",header = FALSE,sep = "")
rawTestY <- read.fwf("test\\Y_test.txt",header = FALSE,widths = 2)
rawSubjectTest <- read.table("test\\subject_test.txt",header = FALSE)

##Read train data
rawTrainX <- read.table("train\\X_train.txt",header = FALSE,sep = "")
rawTrainY <- read.fwf("train\\Y_train.txt",header = FALSE,widths = 2)
rawSubjectTrain <- read.table("train\\subject_train.txt",header = FALSE)

##Read feature and activity label data
features <- read.table("features.txt",header = FALSE, stringsAsFactors = T)$V2
actlabels <- read.table("activity_labels.txt",header = FALSE)

##Add subject and activity label columns to test and train datasets
rawTrainX <- cbind(rawTrainX, act=as.character(merge(rawTrainY,actlabels,by="V1")$V2),subject=as.data.table(rawSubjectTrain))
rawTestX <- cbind(rawTestX, act=as.character(merge(rawTestY,actlabels,by="V1")$V2),subject=as.data.table(rawSubjectTest))

##Combine test and train dataset
combinedX <- rbind(rawTrainX,rawTestX)
colnames(combinedX) <- c(as.character(features),"act","subject")
combinedMeanStdDev<-combinedX[,c(grepl("mean|std", features),TRUE,TRUE)]

##Calculate mean of all the columns, by grouping on activity and subject
aggregateList<-aggregate(combinedMeanStdDev[1:79],by=list(combinedMeanStdDev$act,combinedMeanStdDev$subject),FUN=mean,na.RM = T)

##Function to add mean to all the columns
addstr<-function(x) paste(x," mean",sep="")
##colnames(aggregateList)<-c("act","subject",colnames(aggregateList)[3:81])
colnames(aggregateList)<-c("act","subject",unlist(lapply(colnames(aggregateList)[3:81],addstr)))

##Write tidy dataset to output file
write.table(aggregateList, file = "./aggregated data.txt")
