---
title: "README.md"

---

#Getting-and-Cleaning-Data Project (README file)

##Background
This is a README intended to help the user run the provided script which handels the cleaning proccess of the UCI data. 

##Contents
This repo contains the following:

* An R script named "run_analysis.R" - a script used to clean and preapre the raw UCI data to a tidy data set (wide format)
* A CodeBook Markdwon file named "CodeBook.md" - which explaines how the script works
* A tidy data-set (wide format), which is the result of running the script on the raw data

##Requirments

In order to run the run_analysis script, one should: 



1. Insatll R;
2. Install package "dplyr";
3. Download the zip file in: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ;
4. Extract the zip file content to the same folder the script is saved - otherwise the proccess will run into error.

##Steps to view the final tidy data set:

1. Making sure all the requirments mentioned above are fullfilled
2. Run the R script ("run_analysis.R"). This will result with the creation of a tidy data txt file named "tidy_data.txt"
3. In order to view the data in R, use the command 'View(tidy_data)'.

Deatiled description of the code can be found at the CodeBook file.
