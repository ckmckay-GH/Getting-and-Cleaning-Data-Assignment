# Getting and Cleaning Data Course Project

## Assignment Description:

This README.md file documents my submission for the week 4 peer review assignment of the Getting and Cleaning Data Coursera course.  The assignment required the creation of a "tidy" dataset from data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The submission requirements included submitting an R script called run_analysis.R that creates a tidy dataset from the merged source files and a second data set that contains averages the each unique combination of subject, activity, and feature contained withing the inpout files.

The assignment also required this README.md file expaining the run_analysis.R script and a CodeBook.md that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

## My Computing Environment:
iMac (21.5-inch, Late 2013)
Processor 2.7GHz Intel Core i%
Memory 8 GB 1600 MHZ DDR3
OSX El Capitan 10.11.6
R Studio Version 1.0.44
R 3.3.2 GUI 1.68 Mavericks build (7288)

## Data Source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## My Activities:

As docuemnted in my run_analysis.R script
1) Load R packages
2) Read-in data files from source
3) Create a vector for use translating activity codes 1-6 to their repective names.  While not as elegant, this seem a bit simpler approach than using the activities_labels.txt file
4) Process the test files
4.1) Convert activities codes to activities labels via vector 
4.2) Rename the test data file columns with the descriptors in the features.txt file
4.3) Rename the columns in the activities and subject files
4.4) Merge the test subject, activities, and data files
5) Process the train files.  Repeat septs in (4) with the train files
6) Merge the test processed test and train files
7) Apply the melt fuction to reshape the combined file to put one observation/statistic per row
8) Subset the data to include only mean and std measures.  I chose to include and row when the feature description contained either the string "mean" or "std"
9) Renamed the variable and value columns to feature and measure to be more descriptive of the data
10) Sorted the combine subset file by subject, activity, and feature to produce my version of a tidy data set: tidy_merged_file
11) Grouped the tidy dataset by each unique combination of subject/activity/feature and and calcualted the mean measure for each grouping.  This result was written to w new data set tidy_averages.txt for submission 

## Folder and Files

Folder ./UCI HAR Dataset
Files 	README.md
		CodeBook.md
		tidy_averages.txt
		
## GitHub
https://github.com/ckmckay-GH/Getting-and-Cleaning-Data-Assignment

