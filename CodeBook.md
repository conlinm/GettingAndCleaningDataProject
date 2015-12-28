#Code Book for the project
The description of the study is described by the study website:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


The original test and train data files contained 2947 and 7352 observations respectively of 561 variables. These measurements are described by the study website:

###For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


The final output of the project is my file "conlin_tidy_means.txt"
This is a text file in a tab delimited format and may be loaded into R using the
**read.table** function. This is the result of the following general processes on the original data:

1. Load all the data sets into data frames
2. Add the activity labels to the train and test data frames
3. Add the subject numbers to the data frames
4. Combine the test and train data
5. Add the variable names
6. Select out the variables of interest (containing "mean" or "std")
7. Edit the variable names to clean them up
8. Reshape the data into a new data frame that is tidy, presenting the means for each measurement,
grouped by subject and activity

I chose to load the activity labels and subject numbers to the test and train data seperately to avoid 
possible errors in the combination of these data frames later.
By the end of step 7, I have a dataframe that contains all 10299 observations. Each individual observation at this point is for one subject and one activity. These activity_names are:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

The results for each variable are numeric. There are mulptiple measurements for each subject in each activity. 
Finally, the result of step 7, as represented in the file conlin_tidy_means.txt, is one row per subject for each activity. The value of the number for each of the variables (in the columns) are means of the prior multiple measurements for each person in each activity.
