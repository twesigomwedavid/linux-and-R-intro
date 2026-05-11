# File processing: Part 2 (using awk) 

**AWK** is a programming language named after its three developers: Alfred Aho, Peter J Weinberger and Brian KernIghan. 
AWK is useful for processing text files and extracting data, particularly when a file is **split into columns** or **delimited by a specific character** (e.g. a tab, comma).
The **awk** command/script reads a file line by line and splits each line into columns according to a delimiter character. The default output delimiter is a single space character.

For this tutorial, the workind directory will be the `workshop1` directory within `ABI_summer_school_project1`.

## Starter commands with awk

Use the awk command to print the first column of the `SAMPLE_001.vcf` file 

```
awk -F'\t' '{print $1}' SAMPLE_001.vcf
```

Alternatively:

```
awk 'BEGIN {FS="\t"} {print $1}' SAMPLE_001.vcf   # Notice the difference in inner vs outer quotation marks
```

In case you want to skip the header row:

```
awk 'BEGIN {FS="\t"} NR>1 {print $1}' SAMPLE_001.vcf 
```

In case you want to extract only the header row:

```
awk 'NR==1 {print $0}' SAMPLE_001.vcf  
```

### Removing/Skipping a line with a specific pattern 
e.g. extracting all contents of the file `SAMPLE_001.vcf` but skipping the record with **position 1024**: 

```
awk -F'\t' '!/1024/ {print $0}' SAMPLE_001.vcf 
```

This is also helpful when skipping multiple header lines:

```
awk -F'\t' '!/#/ {print $0}' SAMPLE_001.vcf 
```


### Extracting more than one column 

Extract the first 5 columns and the 10th column only in `SAMPLE_001.vcf` using awk

```
awk 'BEGIN {FS="\t"} {print $1,$2,$3,$4,$5,$10}' SAMPLE_001.vcf
```

Note that the delimiter in the output is now a single space character (the default for awk). How can we maintain **tab** as the delimiter?

```

```

