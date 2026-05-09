### File processing - part 1 (using sed)

**sed** allows us to make pattern substitutions automatically. The name **sed** is an abbreviation of **stream editor**.

Change to the `workshop1` directory within `ABI_summer_school_project1` as it will be your working directory for this tutorial. 

1.  Replace the **fasta** pattern in the file `sample_manifest2.tsv` with **fastq**

```
sed 's/fasta/fastq/' sample_manifest2.tsv
```

To save the output to a new file:

```
sed 's/fasta/fastq/' sample_manifest2.tsv > sample_manifest2_fastq.tsv
```

To make the replacement within the primary file:

```
sed -i 's/fasta/fastq/' sample_manifest2.tsv
```



### File processing with awk 

AWK is a programming language named after its three developers: Alfred Aho, Peter J Weinberger and Brian KernIghan. 
AWK is useful for processing text files and extracting data, particularly when a file is split into columns or delimited by a specific character (e.g. a comma).
The AWK command/script reads a file line by line and splits each line into columns according to a delimiter character. The default delimiter is a single space character.
