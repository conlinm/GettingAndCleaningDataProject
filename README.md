# Getting And Cleaning Data Project
Here are the files for my project in the Getting and Cleaning Data course.
This does not include the large data files X_test.txt, y_test.txt, X_train.txt, and y_train.txt. At least one of these was
too large for Github. 
The **run_analysis.R** script will work fine if you run it in the same directory as these files on your local machine.

Steps to run the script:
1. create a directory with all the files needed to run the script (see below)
2. download the run_analysis.R script into the directory you created
3. install the packages into R listed below, if not already installed
4. run the script in R or RStudio

The files needed to run the script are:

* activitiy_labels.txt
* features.txt
* X_test.txt
* y_test.txt
* subject_test.txt
* X_train.txt
* y_train.txt
* subject_train.txt

The dependancies for the script are:
* dplyr
* stringr
* reshape2

The script will perform the following general tasks:

1. Load all the data sets into data frames
2. Add the activity labels the train and test data frames
3. Add the subject numbers to the data frames
4. Combine the test and train data
5. Add the variable names
6. Select out the variables of interest (containing "mean" or "std")
7. Edit the variable names to clean them up
8. Reshape the data into a new data frame that is tidy, presenting the means for each measurement,
grouped by subject and activity

