# CodeBook for Getting and Cleaing Data Assignment

## Project Description
Week 4 assignment in Coursear Getting and Cleaning Data class

## Short description of the project
Merge and "tidy" data from collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Collection of the raw data

Data was read in as a .zip dataset from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The .zip included a README.txt file ad additional descriptions of the data

## Description on how to create the tidy data file 

1) Download files

2) Read files into R Studio

3) Merge files to add names to ob=servation columns

4) merge subject, activity, and observation data files

5) subset data to extract rows that contain mean or standard deviation data

6) sort data

7) create new file with and average merasure (value) for each unique combination of subject, activity, and feature


## Cleaning of the data

1) translated activity codes to text descriptors

2) added column heading to data file

3) transposed data file using the melt function to put each observed or calcualted data point in a single row.

4) renamed the variable and value colums post melt to feature and measure

5) extracted only rows containing the string "mean" or "std" in the feature column

5) subsetted data by unique combination of subject, activity, feature and calculated mena of associated measures for each unique combination

##General description of the tidy_average_data dataset:

Dimensions of the dataset: 14220, 4
Summary of the data: means for measures associated with unique combinations of subject, activity, and feature 

Variables present in the dataset
subject, activity, feature, measure

## activity

$ activity: Factor w/ 6 levels WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING

## feature
$ feature : Factor w/ 477 levels detailed in featrues.txt file
Feature represents the specific subject/activity movement recorded.  Feaure included direct measure in threee spacial dimensions X, Y, Z as well as calcualted values based on the measires such as maed and standard deviation

##average
$ average : num  
Calculated from input data.  The average of the unique combination of subject, activity, and feature
