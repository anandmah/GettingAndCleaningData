CodeBook
======================

This code book explains the structure of the submitted [tidy dataset](https://github.com/chimneyliu/GettingAndCleaningData/blob/master/tidy_data.csv).

### File type

It's a csv file, which can be opened using R, Excel or Github UI. It's a 180 * 69 table.

### Structure of the table

The data contains 180 rows, each defined by a (acitivityLabel, subject) combination. 

Each row consists of 69 columns, where the first one contains the raw row index, then the next 2 are used for (activitiyLabel, subject), and the remaining 66 are the average value of the features we are focusing on (mean/std related), which is well reflected by the column names.
