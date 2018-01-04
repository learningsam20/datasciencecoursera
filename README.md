datasciencecoursera - Data cleansing
====================================


<h2>File present</h2>
It consists of the following files:
<b>run_analysis.R </b> would take the input file as UCI HAR datasets and perform requisite analysis
<b>readme.md</b> would provide an overview of the processing
<b>codebook.md would provide an overview of the variables in the output file i.e. tidy dataset</b>

<h2>Analysis performed</h2>
Here is a sequence of steps performed for analysis:
1. Read train data, X and Y variables along with subject data
2. Read test data, X and Y variables along with subject data
3. Read the feature names along with the activity labels
4. Coerce this data into a single dataset and retain only those columns that have std or mean in their names
5. Aggregate the data by grouping it by activity and subject and calculate mean by this grouping for all the variables
6. Finally, write out the tidy dataset to a text file
