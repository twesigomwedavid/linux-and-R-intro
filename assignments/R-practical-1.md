## R/Rstudio Practical 

Set the working directory in Rstudio to ~/r-tutorial/practical1 (create one if necessary)
Please write all the code for Task 1 and Task2  in an Rscript ``your_initials_practical1.R``

### Task 1

1(a) Create the following vectors: 
- `tools` composed of tool1, tool2, and tool3
- `DEL` composed of 38, 25, and 10
- `DUP` composed of 50, 40 and 12
- `INV` composed of 42, 33, and 20

1(b) What is the mode of vector `tools` and vector `DEL`?  

1(c) Create a dataframe `cnvs` from the above 4 vectors. Be sure to use the tools vector as the row names. 

1(d) How would you verify the number of rows and columns in the data fram `cnvs`

1(e) How would you select all elements of the column `DEL`? 

1(f) Results have just come in for insertions (INS) called by each tool. Create a vector 'INS' composed of 20, 28, and 14. Add a column for `INS` to the cnvs data frame and save the updated data frame as cnvs2. 

1(g) Create a bar plot showing the comparison of DEL CNVs by tool (i.e. tools on x-axis)


### Task 2

2(a) Download the `sample1.depth` file at https://github.com/twesigomwedavid/linux-and-R-intro/blob/main/data/bams/ and save it in your current working directory (~/r-tutorial/practical1). This file has read depth/coverage values at various positions on chr22. 

2(b) Import the contents of sample1.depth using `read.table` and store them in the variable `sample1_cov`

```
sample1_cov <- read.table("sample1.depth", header=FALSE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)

```

2(c) View sample1_cov under the `Environment` tab in Rstudio. What are the column headings?

2(d) Perform some basic exploratory data analyses on the `sample1_cov` data using the following functions: head(), str(), dim(), and names(). Give a brief description of what each of these functions does/provides.

2(e) Calculate the mean, standard deviation and variance of all the coverage values in column `V3`.


### Task 3 

3 (a) Create R markdown documentation(s) comprising the code in each of the files at https://github.com/twesigomwedavid/linux-and-R-intro/tree/main/scripts. Please feel free to be creative regarding the supportive text around the code chunks. 

3 (b) Use the `knitr` package to create .html versions of the R markdown documents. Please include outputs (where reasonable e.g. plots and summary stats or tests).  


```
Kindly submit the practical1.R script (Task 1 and Task 2) and the two .html documents (Task 3) for marking. 
```


