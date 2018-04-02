Introduction
------------

This project for a Coursera Data Science course "Getting and Cleaning Data", and demonstrates utilization of published data on a contemporary topic to write R code to produce a summary data file following tidy data guidelines. The topic concerns motion data from wearable devices. The objectives, source data, script details, and references are described below.

Project Objectives
------------------

1.  Merge the training and the test sets to create one data set.
2.  Extract columns containing the mean and standard deviation for each measurement from the original dataset.
3.  Describe the type of activity for subject while measurements were obtained.
4.  Redefine variable names to be more descriptive.
5.  Creates a tidy data set with the average of each variable for each activity and each subject.

Tidy Data
---------

As summarized from [Hadley Wickham](https://www.jstatsoft.org/article/view/v059i10), a tidy datset follows these guidelines:

1.  Each variable forms a column.
2.  Each observation forms a row.
3.  Each type of observational unit forms a table.

Source Information
------------------

### Source

A packed file is available from the source [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Quoted source experimental description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features\_info.txt' for more details.

For each record it is provided:

-   Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
-   Triaxial Angular velocity from the gyroscope.
-   A 561-feature vector with time and frequency domain variables.
-   Its activity label.
-   An identifier of the subject who carried out the experiment.

### UCI HAR Dataset directory structure

Note: the data is partitioned into train / test subdirectories. Files within each subdirectory have the same column headers, and represent a splitting of the observations in the entire study. The source data contains nine files, which are later manipulated into a tidy data form as the object of the project.

In the original source files, train / test files are combined where required. A subset of the X- files, containing measurement summary features is labelled using the features / features\_info file. Additional columns are added as factors for the type of activity for each observation, and the subject for each observation. Labels for the activities are contained in a separate file.

\*The study includes observations from 30 subjects, with measurements recorded for each of six different activities. Measurements were obtained from two types of sensor signals, an accelerometer and a gyroscope. Time and frequency based measurements were obtained.

| Item                             | Comment                                                                                                                                                                                                              |
|:---------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| test / train                     | Subdirectories                                                                                                                                                                                                       |
| - Inertial Signals               | Raw data files from instrument readings (not used in this assignment).                                                                                                                                               |
| - subject\_test / subject\_train | Subject number for each observation, corresponding to observations in rows of X-test and X-train table.                                                                                                              |
| - X-test / X-train               | Measurement variable summaries, including statistical estimates and additional vectors. Contains 561 column feature vector with time and frequency domain variables. Columns are not labeled; rows are observations. |
| - y-test / y-train               | Activity numerical descriptor for each observation, corresponding to observations in rows of X-test and X-train table.                                                                                               |
| activity\_labels                 | Activity character descriptor, used to label observations in y-test and y-train table.                                                                                                                               |
| features                         | Measurement variable labels in terse form, used to label columns in X-test and X-train table.                                                                                                                        |
| features\_info                   | Measurement variable labels in descriptive form, with additional information, correspond to terse column labels of features.                                                                                         |

### X-train / X-test 561 vector features summary description

| Feature name prefix                                                                       | Columns per feature name | Measurement descriptions                                                                                                                                                                                                   |
|:------------------------------------------------------------------------------------------|:-------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| time based: tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk                 | 40                       | 3 measurements (XYZ) unless otherwise noted: mean, std, mad, max, min, sma(1), energy, iqr, entropy, arCoeff(12), correlation                                                                                              |
| time based: tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag  | 13                       | 1 measurement unless otherwise noted: mean, std, mad, max, min, sma, energy, iqu, entropy, arCoeff(4)                                                                                                                      |
| frequency based: fBodyAcc, fBodyAccJerk, fBodyGyro                                        | 79                       | 3 measurements (XYZ) unless otherwise noted: mean, std, mad, max, min, sma(1), energy, iqr, entropy, maxInds, meanFreq, skewness, kurtosis, bandsEnergy(42)                                                                |
| frequency based: fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag, fBodyBodyGyroJerkMag | 13                       | 1 measurement: mean, std, mad, max, min, sma, energy, iqr, entropy, maxInds, meanFreq, skewness, kurtosis                                                                                                                  |
| angle based:                                                                              | 1                        | 1 measurement: angle(tBodyAccMean,gravity), angle(tBodyAccJerkMean),gravityMean), angle(tBodyGyroJerkMean,gravityMean), angle(tBodyGyroMean,gravityMean), angle(X,gravityMean), angle(Y,gravityMean), angle(Z,gravityMean) |

Output Data Summary
-------------------

Data is output to the file **tidyData.csv**. This is a subset of any variable that contained mean() or sd() as part of the original source data header.

The output data follows the tidy data principles, as each variable forms a column, each row is an observation, and the entire table is one type of observational unit (instead of several different tables related to the same observational unit). The usefulness is enhanced through more descriptive variable names, and adds subjects and factors as activities. The number of observations is consistent with 30 subjects \* 6 activities = 180 observations.

Script
------

### Execution Instructions

Prior to executing the script, change the working directory if desired. The script contains instructions for downloading the packed data. Unpack it manually, then return to the script to obtain the deliverable.

### Script Flow Summary

The script:

-   Consolidates feature measurement summaries from test and train to one table
-   Labels the feature measurement columns
-   Subsets the feature columns containing mean() or sd() to form a new dataset
-   Relabels the dataset's feature measurement columns to be more descriptive
-   Translates character-based labels to an activity vector and binds it to the dataset as a factor by observation
-   Binds subject vector to the dataset by observation
-   Calculates the mean of each feature measurement by subject and activity, and writes it to a file conforming to tidy data principles.

Attribution
-----------

The following links were included in the Coursera assignment, credits are from the original author's readme document.

Background information:

> <http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/>

Original source of data:

> <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

> For more information about this dataset contact: <activityrecognition@smartlab.ws>

> This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Data for project:

> <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

Credits:

> Human Activity Recognition Using Smartphones Dataset Version 1.0 Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. <activityrecognition@smartlab.ws> www.smartlab.ws

*Use of this dataset in publications must be acknowledged by referencing the following publication:*

> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
