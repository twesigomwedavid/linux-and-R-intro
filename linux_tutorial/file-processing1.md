## File processing: Part 1 (using sed)

**sed** allows us to make pattern substitutions (in each line) automatically. The name **sed** is an abbreviation of **stream editor**.

Change to the `workshop1` directory within `ABI_summer_school_project1` as it will be your working directory for this tutorial. 

### Replacing simple patterns with sed 

Replace the **fasta** pattern in each line of the file `sample_manifest2.tsv` with **fastq**

```
sed 's/fasta/fastq/' sample_manifest2.tsv
```

To save the output to a new file:

```
sed 's/fasta/fastq/' sample_manifest2.tsv > sample_manifest2_fastq.tsv
```

To make the replacement within the primary file (use with caution):

```
sed -i 's/fasta/fastq/' sample_manifest2.tsv
```

Notice that the **fasta** pattern after **Plasmodium_falciparum_** was not replaced by the previous command. Why is this?

Write the **sed** command(s) to replace both occurrences of **fasta** in each line of `sample_manifest2.tsv` with **fastq**. Save the output to **sample_manifest2_fastq_2.tsv**

```

```

With the same syntax, sed can be used to **remove** unwanted patterns within each line of a given file. Use **sed** to replace all occurrences of fastq in the **sample_manifest2_fastq_2.tsv** file. Save the output to **sample_manifest3.tsv**

```

```

### Adding simple patterns to a file using sed

2. Add the model numbers of the `Illumina_NextSeq` and `Illumina_MiSeq` platforms so that they read `Illumina_NextSeq_2000` and `Illumina_MiSeq_100` respectively. 

```

```



### File processing with awk 

AWK is a programming language named after its three developers: Alfred Aho, Peter J Weinberger and Brian KernIghan. 
AWK is useful for processing text files and extracting data, particularly when a file is split into columns or delimited by a specific character (e.g. a comma).
The AWK command/script reads a file line by line and splits each line into columns according to a delimiter character. The default delimiter is a single space character.
