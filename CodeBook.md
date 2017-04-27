# Getting and Cleaning Data Course Project Code Book



This code book
 describes the file names, variables, the data, and any transformations or work performed to clean up the data.


# File Names

## features
A 561-feature dataframe with time and frequency domain variables from source data. Changed to a single vector, removing V1, leaving column header V2

## features.T
A 561-feature vector with time and frequency domain variables transposed from features file

## activity 
A dataframe the participants activity labels, renamed with column headings "Number" and "Names" and the values changed to lower case and '_' removed
1 walking
2 walking upstairs
3 walking downstairs
4 sitting
5 standing
6 laying

## subjecttest
A  dataframe with 2,947 test data observations of the numeric identifier of the subject in the experiment, column renamed to personID
The values are sequential from 1 to 30.

## subjecttrain
A  dataframe with 2,947 training data observations of the numeric identifier of the subject in the experiment,column renamed to personID
The values are sequential from 1 to 30.

## xtest
A  dataframe with 2,947 test data observations (ie 30% of test data) across the 561 renamed feature variables

## xtrain
A  dataframe with 7,352 test data observations (ie 70% of test data)across the 561 renamed feature variables


## onedataset
Combined wide data set with 10,299 test data observations of the xtest and xtrain test data,  563 variables as column headings:

PersonID
Numeric identifier of the subject in the experiment. As per the data set information, the experiment included 30 volunteers/ participants, 
the values are sequential from 1 to 30.

ActivityName
Character strings of the activities, consisting of six activities performed by participants in the experiment wearing a smartphone(Samsung Galaxy S II) on the waist. 
walking
walking upstairs
walking downstairs
sitting
standing
laying

The remaning variable names consist of the following component descriptions:

Acc
Measurements of the 3-axial acceleration from the accelerometer embedded in the smartphone, 

Gyro
Measurements of the 3-axial angular velocity from the gyroscope embedded in the smartphone, 

Body 
The body acceleration signal of the participant, one of two sensor acceleration  signals based on phone's accelerometer

Gravity 
The gravity acceleration signal, second of two sensor acceleratio signals based on phone's accelerometer

Jerk 
Measurement of sudden movement, denoted by 3-axial signals in the X, Y and Z directions. 
-X
-Y
-Z

Mag
denotes magnitude of these three-dimensional signals were calculated using the Euclidean norm 

t
Indicates time  

f
Measurement of the frequency, as a Fast fourier transform of the time based signals

#Estimated Values:

mean() : Mean value
std() : Standard deviation, the description has been changed from std().
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

## onedataset2 
Filtered datasets,removing duplicate columns from onedataset, with 10,299 test data observations with 68 variables as column headings:

PersonID
Numeric identifier of the subject in the experiment. As per the data set information, the experiment included 30 volunteers/ participants, 
the values are sequential from 1 to 30.

ActivityName
Character strings of the activities, consisting of six activities performed by participants in the experiment wearing a smartphone(Samsung Galaxy S II) on the waist. 
walking
walking upstairs
walking downstairs
sitting
standing
laying

The remaning variable names consist of values of the following component descriptions:

Acc
Measurements of the 3-axial acceleration from the accelerometer embedded in the smartphone, 

Gyro
Measurements of the 3-axial angular velocity from the gyroscope embedded in the smartphone, 

Body 
The body acceleration signal of the participant, one of two sensor acceleration  signals based on phone's accelerometer

Gravity 
The gravity acceleration signal, second of two sensor acceleratio signals based on phone's accelerometer

Jerk 
Measurement of sudden movement, denoted by 3-axial signals in the X, Y and Z directions. The value has been tidied by removing the '-'
X
Y
Z

Mag
denotes magnitude of these three-dimensional signals were calculated using the Euclidean norm 

Time
Indicates time, changed from t  

Freq
Measurement of the frequency, as a Fast fourier transform of the time based signals, changed from f

Mean 
Mean value, the description has been changed from mean()

Std
Standard deviation, the description has been changed from std().

## onedataset3
Dataset with 180 observations of the average values for the 66 variables for each activity (activityNames variable) and particpant (personID variable) with the following variables:

PersonID
Numeric identifier of the subject in the experiment. As per the data set information, the experiment included 30 volunteers/ participants, 
the values are sequential from 1 to 30.

ActivityName
Character strings of the activities, consisting of six activities performed by participants in the experiment wearing a smartphone(Samsung Galaxy S II) on the waist. 
walking
walking upstairs
walking downstairs
sitting
standing
laying

The remaning variable names consist of averages of the following component descriptions:

Acc
Measurements of the 3-axial acceleration from the accelerometer embedded in the smartphone, 

Gyro
Measurements of the 3-axial angular velocity from the gyroscope embedded in the smartphone, 

Body 
The body acceleration signal of the participant, one of two sensor acceleration  signals based on phone's accelerometer

Gravity 
The gravity acceleration signal, second of two sensor acceleratio signals based on phone's accelerometer

Jerk 
Measurement of sudden movement, denoted by 3-axial signals in the X, Y and Z directions. The value has been tidied by removing the '-'
X
Y
Z

Mag
denotes magnitude of these three-dimensional signals were calculated using the Euclidean norm 

Time
Indicates time, changed from t  

Freq
Measurement of the frequency, as a Fast fourier transform of the time based signals, changed from f

Mean 
Mean value, the description has been changed from mean()

Std
Standard deviation, the description has been changed from std().


The remaining estimated values have been removed from the onedataset2 and onedataset3:

mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.







