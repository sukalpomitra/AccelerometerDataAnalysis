
## The function runs an analysis and creates a tidy data set
## from the raw dataset obtained from UCI dataset

run_analysis <- function() 
{
        if (!file.exists("UCI HAR Dataset"))
                stop("UCI HAR Dataset directory does not exist in your working directory. Please make sure that
                      you have copied the UCI HAR Dataset directory after extraction and placed
                      it in your working directory")
        if (!file.exists("UCI HAR Dataset//train//X_train.txt"))
                stop("x_train.txt is not found.")
        if (!file.exists("UCI HAR Dataset//train//y_train.txt"))
                stop("y_train.txt is not found.")
        if (!file.exists("UCI HAR Dataset//train//subject_train.txt"))
                stop("subject_train.txt is not found.")
        if (!file.exists("UCI HAR Dataset//test//X_test.txt"))
                stop("X_test.txt is not found.")
        if (!file.exists("UCI HAR Dataset//test//y_test.txt"))
                stop("y_test.txt is not found.")
        if (!file.exists("UCI HAR Dataset//test//subject_test.txt"))
                stop("subject_test.txt is not found.")
        xTrain <- read.table("UCI HAR Dataset//train//X_train.txt",stringsAsFactors = F)
        yTrain <- read.table("UCI HAR Dataset//train//y_train.txt",stringsAsFactors = F)
        yTrain <- rename(yTrain,Activity=V1)
        sTrain <- read.table("UCI HAR Dataset//train//subject_train.txt",stringsAsFactors = F)
        sTrain <- rename(sTrain,Subject=V1)
        xTest <- read.table("UCI HAR Dataset//test//X_test.txt",stringsAsFactors = F)
        yTest <- read.table("UCI HAR Dataset//test//y_test.txt",stringsAsFactors = F)
        yTest <- rename(yTest,Activity=V1)
        sTest <- read.table("UCI HAR Dataset//test//subject_test.txt",stringsAsFactors = F)
        sTest <- rename(sTest,Subject=V1)
        xTrain <- cbind(xTrain,yTrain)
        xTrain <- cbind(xTrain,sTrain)
        xTest <- cbind(xTest,yTest)
        xTest <- cbind(xTest,sTest)
        mergedSet <- rbind(xTrain,xTest)
        mergedSet <- select(mergedSet,V1,V2,V3,V4,V5,V6,V41,V42,V43,V44,V45,V46,V81,V82,V83,V84,V85,V86,V121,V122,
                            V123,V124,V125,V126,V161,V162,V163,V164,V165,V166,V201,V202,V214,V215,V227,V228,V240,V241,
                            V253,V254,V266,V267,V268,V269,V270,V271,V345,V346,V347,V348,V349,V350,V424,V425,V426,V427,
                            V428,V429,V503,V504,V516,V517,V529,V530,V542,V543,Activity,Subject)
        mergedSet[,67] <- factor(mergedSet[,67],levels=c(1:6),labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS",
                                                                       "SITTING","STANDING","LAYING"))
        mergedSet <- rename(mergedSet,tBodyAccMeanXaxis=V1,tBodyAccMeanYaxis=V2,tBodyAccMeanZaxis=V3,tBodyAccSDXaxis=V4,
                            tBodyAccSDYaxis=V5,tBodyAccSDZaxis=V6,tGravityAccMeanXaxis=V41,tGravityAccMeanYaxis=V42,
                            tGravityAccMeanZaxis=V43,tGravityAccSDXaxis=V44,tGravityAccSDYaxis=V45,tGravityAccSDZaxis=V46,
                            tBodyAccJerkMeanXaxis=V81,tBodyAccJerkMeanYaxis=V82,tBodyAccJerkMeanZaxis=V83,tBodyAccJerkSDXaxis=V84,
                            tBodyAccJerkSDYaxis=V85,tBodyAccJerkSDZaxis=V86,tBodyGyroMeanXaxis=V121,tBodyGyroMeanYaxis=V122,tBodyGyroMeanZaxis=V123,
                            tBodyGyroSDXaxis=V124,tBodyGyroSDYaxis=V125,tBodyGyroSDZaxis=V126,tBodyGyroJerkMeanXaxis=V161,tBodyGyroJerkMeanYaxis=V162,
                            tBodyGyroJerkMeanZaxis=V163,tBodyGyroJerkSDXaxis=V164,tBodyGyroJerkSDYaxis=V165,tBodyGyroJerkSDZaxis=V166,tBodyAccMagMean=V201,
                            tBodyAccMagSD=V202,tGravityAccMagMean=V214,tGravityAccMagSD=V215,tBodyAccJerkMagMean=V227,tBodyAccJerkMagSD=V228,
                            tBodyGyroMagMean=V240,tBodyGyroMagSD=V241,tBodyGyroJerkMagMean=V253,tBodyGyroJerkMagSD=V254,fBodyAccMeanXaxis=V266,
                            fBodyAccMeanYaxis=V267,fBodyAccMeanZaxis=V268,fBodyAccSDXaxis=V269,fBodyAccSDYaxis=V270,fBodyAccSDZaxis=V271,fBodyAccJerkMeanXaxis=V345,
                            fBodyAccJerkMeanYaxis=V346,fBodyAccJerkMeanZaxis=V347,fBodyAccJerkSDXaxis=V348,fBodyAccJerkSDYaxis=V349,fBodyAccJerkSDZaxis=V350,
                            fBodyGyroMeanXaxis=V424,fBodyGyroMeanYaxis=V425,fBodyGyroMeanZaxis=V426,fBodyGyroSDXaxis=V427,fBodyGyroSDYaxis=V428,fBodyGyroSDZaxis=V429,
                            fBodyAccMagMean=V503,fBodyAccMagSD=V504,fBodyBodyAccJerkMagMean=V516,fBodyBodyAccJerkMagSD=V517,fBodyBodyGyroMagMean=V529,
                            fBodyBodyGyroMagSD=V530,fBodyBodyGyroJerkMagMean=V542,fBodyBodyGyroJerkMagSD=V543)
        grouped <- group_by(mergedSet,Activity,Subject)
        summary <- summarize(grouped,mean(tBodyAccMeanXaxis),mean(tBodyAccMeanYaxis),mean(tBodyAccMeanZaxis),mean(tBodyAccSDXaxis),
                             mean(tBodyAccSDYaxis),mean(tBodyAccSDZaxis),mean(tGravityAccMeanXaxis),mean(tGravityAccMeanYaxis),
                             mean(tGravityAccMeanZaxis),mean(tGravityAccSDXaxis),mean(tGravityAccSDYaxis),mean(tGravityAccSDZaxis),
                             mean(tBodyAccJerkMeanXaxis),mean(tBodyAccJerkMeanYaxis),mean(tBodyAccJerkMeanZaxis),mean(tBodyAccJerkSDXaxis),
                             mean(tBodyAccJerkSDYaxis),mean(tBodyAccJerkSDZaxis),mean(tBodyGyroMeanXaxis),mean(tBodyGyroMeanYaxis),
                             mean(tBodyGyroMeanZaxis),mean(tBodyGyroSDXaxis),mean(tBodyGyroSDYaxis),mean(tBodyGyroSDZaxis),
                             mean(tBodyGyroJerkMeanXaxis),mean(tBodyGyroJerkMeanYaxis),mean(tBodyGyroJerkMeanZaxis),mean(tBodyGyroJerkSDXaxis),
                             mean(tBodyGyroJerkSDYaxis),mean(tBodyGyroJerkSDZaxis),mean(tBodyAccMagMean),mean(tBodyAccMagSD),mean(tGravityAccMagMean),
                             mean(tGravityAccMagSD),mean(tBodyAccJerkMagMean),mean(tBodyAccJerkMagSD),mean(tBodyGyroMagMean),mean(tBodyGyroMagSD),
                             mean(tBodyGyroJerkMagMean),mean(tBodyGyroJerkMagSD),mean(fBodyAccMeanXaxis),mean(fBodyAccMeanYaxis),mean(fBodyAccMeanZaxis),
                             mean(fBodyAccSDXaxis),mean(fBodyAccSDYaxis),mean(fBodyAccSDZaxis),mean(fBodyAccJerkMeanXaxis),mean(fBodyAccJerkMeanYaxis),
                             mean(fBodyAccJerkMeanZaxis),mean(fBodyAccJerkSDXaxis),mean(fBodyAccJerkSDYaxis),mean(fBodyAccJerkSDZaxis),mean(fBodyGyroMeanXaxis),
                             mean(fBodyGyroMeanYaxis),mean(fBodyGyroMeanZaxis),mean(fBodyGyroSDXaxis),mean(fBodyGyroSDYaxis),mean(fBodyGyroSDZaxis),
                             mean(fBodyAccMagMean),mean(fBodyAccMagSD),mean(fBodyBodyAccJerkMagMean),mean(fBodyBodyAccJerkMagSD),mean(fBodyBodyGyroMagMean),
                             mean(fBodyBodyGyroMagSD),mean(fBodyBodyGyroJerkMagMean),mean(fBodyBodyGyroJerkMagSD))
        write.table(summary,"tidydataset.txt",row.names=F)
}