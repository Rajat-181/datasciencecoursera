library(reshape2)
trainX=read.table("./train/X_train.txt",sep="")
testX=read.table("./test/X_test.txt",sep="")
features=read.table("./features.txt",sep="")
activity=read.table("./activity_labels.txt",sep="")
features<-features[,2]
extractFeatures<-grep("std()|mean()",features)
names(trainX)<-features
names(testX)<-features
trainX<-trainX[,extractFeatures]
testX<-testX[,extractFeatures]
trainY=read.table("./train/y_train.txt",sep="")
testY=read.table("./test/y_test.txt",sep="")
trainSubject=read.table("./train/subject_train.txt",sep="")
testSubject=read.table("./test/subject_test.txt",sep="")
mergedData<-rbind(trainX,testX)
mergedSubjects<-rbind(trainSubject,testSubject)
mergedY<-rbind(trainY,testY)
FinalMergedData<-cbind(mergedSubjects,mergedData,mergedY)
names(FinalMergedData)<-c("subject",names(mergedData),"activity")
act<-factor(FinalMergedData$activity)
levels(act)<-activity[,2]
FinalMergedData$activity<-act
baseData <- melt(FinalMergedData,(id.vars=c("subject","activity")))
secondDataSet <- dcast(baseData, subject + activity ~ variable, mean)
names(secondDataSet)[-c(1:2)] <- paste("[mean of]" , names(secondDataSet)[-c(1:2)] )
write.table(secondDataSet, "tidy_data.txt", sep = ",")

