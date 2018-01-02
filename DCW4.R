setwd("E:\\Coding\\R\\Data cleansing\\UCI HAR Dataset")
##maxCol <- nchar(head(readLines("test\\X_test.txt"),n=1))+1
##rawTrainX <- readLines("test\\X_test.txt")
##maxRows <- NROW(rawTrainX)
##Each observation is 15 chars and 1 whitespace
##Only the first white space count is 2
##for(i in 1:maxCol){}
rawTestX <- read.table("test\\X_test.txt",header = FALSE,sep = "")
rawTestY <- read.fwf("test\\Y_test.txt",header = FALSE,widths = 2)
rawSubjectTest <- read.table("test\\subject_test.txt",header = FALSE)
rawTrainX <- read.table("train\\X_train.txt",header = FALSE,sep = "")
rawTrainY <- read.fwf("train\\Y_train.txt",header = FALSE,widths = 2)
rawSubjectTrain <- read.table("train\\subject_train.txt",header = FALSE)
features <- read.table("features.txt",header = FALSE, stringsAsFactors = T)$V2
actlabels <- read.table("activity_labels.txt",header = FALSE)
