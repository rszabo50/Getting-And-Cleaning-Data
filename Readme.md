---
title: "Getting and Cleaning Data Course Project - Readme"
author: "Robert Szabo"
version: "1.0"
date: "Sunday, February 22, 2015"
output: html_document
---


### Aim

The "run_analysis.R" scripts aim is to prepare a tidy dataset related to measurements of human activities as collected by "Smartlab", for the purposes of analysing "Human Activity Recognition Using Smartphones".


### Source Data

The raw data was obtained from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A detailed description of this dataset is provided in this online documentation: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#### Fetching and unpacking the source data

1. Download the zip file from the above url
1. unzip the resulting file into this directory which will create a subdirectory called "UCI HAR DATESET"


### Required Input Files

The following files from the downloaded dataset were used as input to the "run_analysis.R" Script, it is assumed that these files were previously downloaded and unpacked prior to execution.


* ./UCI HAR Dataset/test/X_test.txt
* ./UCI HAR Dataset/train/X_train.txt
* ./UCI HAR Dataset/features.txt
* ./UCI HAR Dataset/test/y_test.txt
* ./UCI HAR Dataset/train/y_train.txt
* ./UCI HAR Dataset/activity_labels.txt
* ./UCI HAR Dataset/test/subject_test.txt
* ./UCI HAR Dataset/train/subject_train.txt


### Script execution

To run this script Simply enter the R shell from the source directory (setwd) and source the script. 

* source("run_analysis.R")

The output of the file will lan in a file called "tidied_human_movement_data.txt" in the current directory.

### Additional info

The file "CodeBook.md" describes the variables, data, and transformations used within the R script.


