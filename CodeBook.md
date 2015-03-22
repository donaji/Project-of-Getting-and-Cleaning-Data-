The code on the file "run_analysis.R" does the 5 steps required on the project description.

1. The files get read and the "X files", "y files" and "subject files" are merged with the rbind() function.
2. From the "features.txt" file the columns that have mean and standard deviation measurements are taken and with those columns a new set a "X data" is created, (i.e. only the columns with the measurements that are required are in this new subset of data), at last the names of the columns from the  "features.txt" file are used to put the correct names on the subset of data.
3. The activity labels are used on the data.
4. The data from the (subset) "X files", "y files" and "subject files" is merged creating the complete data.
5. The ddply() function from the plyr library viewed in class is used to apply the colMeans() function to the final data set to obtain the average of each variable for each activity and each subject as is requested on the course project.
6. The documentation for the ddply() function can be found in http://cran.r-project.org/web/packages/plyr/plyr.pdf on the 19th page.
7. The data obtained by the ddply function is stored in the "av_data.txt" file, this file has 180 rows and 68 columns and can be found on this repository or obtained by running the  "run_analysis.R" on RStudio.
