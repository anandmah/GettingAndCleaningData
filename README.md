GettingAndCleaningData
======================

This is the project for Coursera course "Getting and Cleaning Data". This README briefly explains the submitted R scripts. For detailed explanations of submitted tidy dataset, please refer to [CodeBook.md](https://github.com/chimneyliu/GettingAndCleaningData/blob/master/CodeBook.md).

About the submitted R script
======================

### Submitted R script

[run_analysis.R](https://github.com/chimneyliu/GettingAndCleaningData/blob/master/run_analysis.R)

### Run the script

If you want to run the script, you need to

1. Clone this repository to your computer.
2. In R, set the working directory to the directory of this repository.
3. In R, run `source('run_analysis.R')`, then the scripts will be executed.
4. A tidy data file tidy_data.csv will be generated in the same directory.

### The structure of the scripts

I've added comments to every part of the scripts. So please refer to the comments in the script. Here are some highlights:

1. Read the training data and test data respectively, both including X(features), y(results), subject.
2. Read the feature definition (feature id -> feature name) and activity labels (acitivity id -> activity label), reset the column name.
3. Calculated the subset of features we should focus on (means and stds), using regular expression matching. 
4. Use rbind to merge the training and test data, and use cbind to merge the X,y,subject. Set the column name for each feature to the real feature name.
5. Use `merge` function to join the data and the activity labels info by acitivityId, to associate the correct acitivity label for each activity id.
6. Use `melt` and `dcast` (some kind of flattening and grouping) to calculate the final tidy data.
