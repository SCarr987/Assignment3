Introduction
------------

This codebook describes each variable and the values in the tidy dataset for a Coursera class project. The dataset is a data frame, grouped by two factors: subject and activity. The dimensions are 180, 68. The sixty-eight variables were derived from all variables in which a mean \[mean()\] or standard deviation \[sd()\] were present in the original dataset. The observations represent the means for data from 30 subjects participating in each of 6 activities (30\*6 = 180).

Source Information
------------------

A packed file is available from the source [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Variables in the dataset
------------------------

The observations are the means by subject and activity for each of the 68 variables selected. Features consititute the column headers, and are derived summary measurements from a smartphone's embedded accelerometer and gyroscope. These primarily concern triaxial linear acceleration and triaxial angular velocity measurements, measured in the time domain (seconds) or frequency domain (Hz).

Rationale for summary choices
-----------------------------

The mean of the dataset, by subject and activity, were calculated based upon assignment directions.

Quoted data collection methods and experimental design
------------------------------------------------------

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features\_info.txt' for more details.

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
