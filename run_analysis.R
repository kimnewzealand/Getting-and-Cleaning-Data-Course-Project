' 
  Title: Coursera Getting and Cleaning Data Course Project
  Author: kimnewzealand
  Date: 27 April 2017
  Goal: Prepare tidy data that can be used for later analysis
'

## Load packages
    library(dplyr)
    library(plyr)
    library(readr)
  

## Read features data into R and tidy by reducing to character vector
    features <- read.table("./UCI HAR Dataset/features.txt",stringsAsFactors = FALSE)
    features <- features %>% 
      mutate(V1=NULL) 

    str(features) # Features has 561 observations, describes signals used to estimate variables of the feature vector for each pattern:  
    # '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
    # Additional vectors obtained by averaging the signals in a signal window sample.
    # Use the features to rename the variables on the combined test and train datasets
    features.T <- t(features) # transpose features to a new matrix features.T to be used for renaming xtest and xtrain columns


    
## Read activity labels file    
    activity <- read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors = FALSE,sep = " ")
    names(activity) <- c("Number", "Names" )  #rename the columns
        activity$Names <- gsub('_','',activity$Names) # tidy the values by removing _'s
    activity$Names <- tolower(activity$Names) # tidy the values by lowering the case
    
## Read test data 
    xtest <- read.table("./UCI HAR Dataset/test/X_test.txt") #Test data set
    dim(xtest) # x test data set has 2,947 observations/rows and 561 columns/variables
        ytest <- read.table("./UCI HAR Dataset/test/y_test.txt") #Test set activity numbers
    dim(ytest) # y data set has 2,947 observations/rows and 1 columns/variable. 
        ## ytest is a variable matching the activity number and names. 
    names(ytest) <- ("activityNames")
    subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt") # Subject test set
    dim(subjecttest) # subject data set has 2,947 observations/rows and 1 columns/variable. 
    summary(subjecttest) # the values relate to the ID of the subject, where min is 2 and max 24
    names(subjecttest) <- ("personID")
    
## Read train data 
    xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt") #Training data set.
    dim(xtrain) # x train data set has 7,352 observations/rows and 561 columns/variables
    colnames(xtrain) <- features.T[1,] # rename the xtrain col headings with features values
    ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt") # Training set labels.
    dim(ytrain) # y data set has 7,352 observations/rows and 1 columns/variable. 
    ## ytrain is a variable matching the activity number and names.
    names(ytrain) <- ("activityNames")
    subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    dim(subjecttrain) # subject data set has 7,352 observations/rows and 1 columns/variable. 
    ## ytrain appears to be another variable matching the  labels. 
    ## subjecttrain is a variable related the features, this can be added as a column to xtrain
    names(subjecttrain) <- ("personID")
    
## Part 1 Merge the training and the test sets to create one data set.
    testdataset <- cbind(subjecttest,ytest,xtest)   #  appended subjecttest with personID and ytest with activityNames as columns to xtest  test data
    traindataset <- cbind(subjecttrain,ytrain,xtrain) #  appended  subjecttrain with personID and ytest with activityNames as columns to xtrain training data)
    onedataset <- rbind(testdataset,traindataset) # combined the appended test and training data sets into one
    

## Part 2 Extract only the measurements on the mean and standard deviation (std) for each measurement, acc and gyro.
    onedataset2 <- tbl_df(onedataset) ## the column headings are not unique
    onedataset2 <- onedataset %>% subset(., select=which(!duplicated(names(.)))) #remove duplicated columns and create new dataset onedataset2
    onedataset2 <- tbl_df(onedataset2) ## no duplicate errors
    onedataset2 <- onedataset2 %>% select(personID:activityNames , contains("mean"),contains("std"),-contains("angle"))
    
## Part 3 Use descriptive activity names to rename the activities with descriptions according to the activity dataset
    onedataset2$activityNames <- mapvalues(onedataset2$activityNames,activity$Number,activity$Names) # dataset is recoded with activity names for the activity values 

## Part 4 Appropriately label the data set with descriptive variable names.
    names(onedataset2) <- gsub("^t","Time",names(onedataset2))
    names(onedataset2) <- gsub("^f","Freq",names(onedataset2))
    names(onedataset2) <- gsub("-X","X",names(onedataset2))
    names(onedataset2) <- gsub("-Y","Y",names(onedataset2))
    names(onedataset2) <- gsub("-Z","Z",names(onedataset2))
    names(onedataset2) <- gsub("-std\\()","Std",names(onedataset2))
    names(onedataset2) <- gsub("-mean\\()","Mean",names(onedataset2))

## Part 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    onedataset3 <- onedataset2 %>% group_by(personID ,activityNames) %>% summarise_each(funs(mean))
    dim(onedataset3) # this independent tidy dataset has 180 observations and 68 variables
    
    write.table(onedataset3,"./tidydataset",row.name=FALSE) # write final tidy dataset to working directory
    