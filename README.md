Readme for Run_analysis.R.

Steps done:

1) Firstly Data is read using Data.Table package.
2) Now the trainX and testX data are merged using rbind since they have same no. of columns.
3) Similarly subjecttrain,subjecttest and trainy,testy are merged using rbind.
4) grep() is used on features vector to find values with mean() or standard deviation().
5) Subset of  mergedDataX is extracted based on the extracted feature vector.
6) the three datasets i.e Subjects , MergedData and Y values(avtivity outcomes) are merged using cbind.
7) Activity column (Y values) is made as a factor and its levels are given as per 'activity_labels.txt' data.
8) The data is melted using melt function with ID's being subject and activities.
9) Mean of the remaining variables i.e actual features are calculated as per each subject and each activity using the dcast function.
10) data is written using write.table function.
