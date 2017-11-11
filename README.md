# Getting-and-Cleaning-Data
Project Assignment

The objective is for the learners to practice cleaning a data set that is ready to use for an analysis.

Below are the files uploaded in this repository:

CodeBook.md - This describes the data, variables, and any transformations or work that were performed to clean up the data and produce the tidy data.

run_analysis.R - This includes the R code on how to download and prepare the data sets, merge training and test data, label the measurements, extract the variables about means and standard deviations, and write the cleaned data into a text file.

tidydata.txt - The generated .txt file of the cleaned up data. 

This is how the script works:


1.	Download and unzip the data set in the working directory
2.	Load the training and test data sets, the variable names from features file and the description of activities from the activity labels file.
3.	Set the column names of the datasets (measurement, subject, activity) and combine them using cbind function for both training and test sets
4.	Combine the training and test data sets using cbind
5.	Select only the column names from the training-test dataset that indicate the subject and activity identifiers and the mean and standard deviation from the list of features.
6.	Label the activity numbers in the combined training-test dataset using the activity_label file.
7.	Aggregate the data by subject and activity and compute the mean values of the measurements.
8.	Create a text file of the tidy data using write.table() function
