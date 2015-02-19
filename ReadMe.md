---
title       : ReadMe
subtitle    : 
author      : Sukalpo Mitra 
mode        : selfcontained # {standalone, draft}
---

## The instruction list 

1. Step 1 - take the zip downloaded from coursera, and extract it.
2. Step 2 - Copy the folder UCI HAR Dataset with all its content and paste it in your R working directory
3. Step 3 - Open up R version 3.1.2 and install the dplyr package by typing install.packages("dplyr")
4. Step 4 - Load the package by typing library(dplyr)
5. Step 5 - Source the run_analysis function by typing source(filelocation) where filelocation is the location
			where the run_analysis.R is kept along with the filename. For e.g:- if run_analysis.R is kept at C drive
			then file location should be "C:/run_analysis.R"
6. Step 6 - Run run_analysis function by typing run_analysis()

---

## Explanation of the code

1. Step 1 - The program checks whether the directory UCI HAR Dataset directory exists in the working directory and whether 
			X_train.txt,y_train.txt,subject_train.txt files exist under the train folder in UCI HAR Dataset directory. It also
			checks whether X_test.txt,y_test.txt,subject_test.txt files exist under the test folder in UCI HAR Dataset directory.
			If not the program stops and shows the validation error message.
2. Step 2 - Once the validation passes all the files are first read and the data are stored as data frames.
3. Step 3 - The data in y_train.txt is added as a new column to the data read from X_train.txt. The column is named as activity
4. Step 4 - The data in subject_train.txt is added as a new column to the data read from X_train.txt. The column is named as subject.
5. Step 5 - The data in y_test.txt is added as a new column to the data read from X_test.txt. The column is named as activity
6. Step 6 - The data in subject_test.txt is added as a new column to the data read from X_test.txt. The column is named as subject
7. Step 7 - Both the datasets read from X_test.txt and X_train.txt are then joined together
8. Step 8 - The columns having the mean and standar deviation of the measures are then extracted from the merged dataset
9. Step 9 - The activity column is then transformed to a factor using levels and labels from activity_labels.txt
10. Step 10 - The columns of the merged dataset are then given meaningful names
11. Step 11 - The merged dataset is then grouped by Activity and Subject column
12. Step 12 - The grouped by dataset is then summarized by calculating averages on the measure columns and written to a txt file called
			  "tidydataset.txt" and is placed in the working directory.