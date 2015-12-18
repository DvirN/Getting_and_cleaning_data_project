

#Background

This is a Codebook for the proccessing of the raw data describing the results of experminets coducted by the team.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Data Cleaning and tidying steps

Generally, the proceess for tidying the data can be divided fo five steps.

1. In the first step, the six data files (3 for train, 3 for test) are loaded and merged alltogether:
first, the complete train set is created, by joining the columms of the X_train, Y_train, and subject_train. Similarly, a joined test data-set is created. These two data set are joined by their rows to create a whole data frame - train and test data.

2. In the second step, the variables in the recrently created dataset are given the names can be found in the features.txt file. The subject and label variables are also given their names at this stage.

3. In the third step, we choose to subset the data only to the variables dealing with mean or standart deviation. This is done by using regular experessions, to keep only the indices of variables including these measurments in their names.

4. In the fourth step, the labels numbers are replaced with the corresponding label activities. This is done by joining the data with the activity labels data provided as txt file.

5. In the fifth step, the data is melted down, and then reformed, using the subject number and activity type as an ID.

6. In the last step, the variables are given more informative names.This is done once again ising regular expressions.

The result is a tidy dataset, with 180 rows (30 subjects * 6 activity types) and 88 colloums (86 measurments, subject id and activity type).

##Variable Explanation

(The explenation is based on the information provided in the features explanation file)




###label_name

The "label_name" variable represents the six activities each of the 30 volunteers conducted while wearing a smartphone on the waist. These activities are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

###Subject

The "Subject" variable represents the index number of each of the volunteers who took part in this experiment. Thus, this variable ranges from 1 to 30.

##Sensor Signals


As mentioned in the "features_info.txt" file, the sensor signals variables in the original dataset (which, naturally, are the ones in the independent tidy data set created with the "run_analysis.R" file) "come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ." The signals are normalized so each variable ranges between -1 and 1.

###Acceleration Signal

The following variables in the dataset are the mean and standard deviation of the body and gravity acceleration signals, calculated from the 3-axial raw signals that were mentioned earlier:

* timeBodyAcc_mean()_X
* timeBodyAcc_mean()_Y
* timeBodyAcc_mean()_Z
* timeBodyAcc_std()_X
* timeBodyAcc_std()_Y
* timeBodyAcc_std()_Z
* timeGravityAcc_mean()_X
* timeGravityAcc_mean()_Y
* timeGravityAcc_mean()_Z
* timeGravityAcc_std()_X
* timeGravityAcc_std()_Y
* timeGravityAcc_std()_Z
 
###Jerk Signals

The following variables in the dataset are the mean and standard deviation of the body and gravity Jerk signals, obtained from the linear acceleration and angular velocity variables (for all 3 axis)

* timeBodyAccJerk_mean()_X
* timeBodyAccJerk_mean()_Y
* timeBodyAccJerk_mean()_Z
* timeBodyAccJerk_std()_X
* timeBodyAccJerk_std()_Y
* timeBodyAccJerk_std()_Z
* timeBodyGyro_mean()_X
* timeBodyGyro_mean()_Y
* timeBodyGyro_mean()_Z
* timeBodyGyro_std()_X
* timeBodyGyro_std()_Y
* timeBodyGyro_std()_Z

###Magnitude of Signals

The following variable in the dataset represent the magnitude of these three-dimensional signals, calculated using the Euclidean norm:

* timeBodyGyroJerk_mean()_X
* timeBodyGyroJerk_mean()_Y
* timeBodyGyroJerk_mean()_Z
* timeBodyGyroJerk_std()_X
* timeBodyGyroJerk_std()_Y
* timeBodyGyroJerk_std()_Z
* timeBodyAccMagnitude_mean()
* timeBodyAccMagnitude_std()
* timeGravityAccMagnitude_mean()
* timeGravityAccMagnitude_std()
* timeBodyAccJerkMagnitude_mean()
* timeBodyAccJerkMagnitude_std()
* timeBodyGyroMagnitude_mean()
* timeBodyGyroMagnitude_std()
* timeBodyGyroJerkMagnitude_mean()
* timeBodyGyroJerkMagnitude_std()
 
###Frequency domain signals

A Fast Fourier Transform (FFT) was applied to some of these signals" producing frequency domain signals. The following variables represent the mean and standard deviation of these frequency domain signals:

* FFT_BodyAcc_mean()_X
* FFT_BodyAcc_mean()_Y
* FFT_BodyAcc_mean()_Z
* FFT_BodyAcc_std()_X
* FFT_BodyAcc_std()_Y
* FFT_BodyAcc_std()_Z
* FFT_BodyAcc_meanFreq()_X
* FFT_BodyAcc_meanFreq()_Y
* FFT_BodyAcc_meanFreq()_Z
* FFT_BodyAccJerk_mean()_X
* FFT_BodyAccJerk_mean()_Y
* FFT_BodyAccJerk_mean()_Z
* FFT_BodyAccJerk_std()_X
* FFT_BodyAccJerk_std()_Y
* FFT_BodyAccJerk_std()_Z
* FFT_BodyGyro_mean()_X
* FFT_BodyGyro_mean()_Y
* FFT_BodyGyro_mean()_Z
* FFT_BodyGyro_std()_X
* FFT_BodyGyro_std()_Y
* FFT_BodyGyro_std()_Z 

###Weighted Averages of Variables

The following variables represent the weighted average of the frequency components of the frequeny domain signals mentioned so far, thus representing a mean frequency:

* FFT_BodyAccJerk_meanFreq()_X
* FFT_BodyAccJerk_meanFreq()_Y
* FFT_BodyAccJerk_meanFreq()_Z
* FFT_BodyGyro_meanFreq()_X
* FFT_BodyGyro_meanFreq()_Y
* FFT_BodyGyro_meanFreq()_Z
* FFT_BodyAccMagnitude_mean()
* FFT_BodyAccMagnitude_std()
* FFT_BodyAccMagnitude_meanFreq()
* FFT_BodyBodyAccJerkMagnitude_mean()
* FFT_BodyBodyAccJerkMagnitude_std()
* FFT_BodyBodyAccJerkMagnitude_meanFreq()
* FFT_BodyBodyGyroMagnitude_mean()
* FFT_BodyBodyGyroMagnitude_std()
* FFT_BodyBodyGyroMagnitude_meanFreq()
* FFT_BodyBodyGyroJerkMagnitude_mean()
* FFT_BodyBodyGyroJerkMagnitude_std()
* FFT_BodyBodyGyroJerkMagnitude_meanFreq()

