## Linux assessment

### Instructions:

- **For each step, please write the commands used where applicable.** 

- Download the vep output file at https://www.ensembl.org/Multi/Tools/VEP/Ticket?tl=D5V5D1BPLCmFGx8K and move it to your ``vep`` folder (can create a new folder if you don't have this). Be sure to download the .txt version (unfiltered).  

The ``D5V5D1BPLCmFGx8K.txt`` file comprises variants from 4 genes (_TP53_, _CYP2D6_, _RET_, and _NF1_) that have been annotated using the [Ensembl Variant Effect Predictor](https://www.ensembl.org/info/docs/tools/vep/index.html). 



### Task 1

1. How many unique variants are in the D5V5D1BPLCmFGx8K.txt file? 

2. Filter out column 9 (i.e. the Feature column) and save the output to `vep_filter1.txt` (this step is to remove some NM_ patterns in column 9 that could cause confusion when filtering for the MANE_SELECT transcript later on) (hint: if a file has 10 columns, you can select column 5 to 10 by saying `cut -f5- test_file.txt` ; apply this same principle)

3. Remove the original D5V5D1BPLCmFGx8K.txt to save space on your computer.

4. Filter for all variant records annotated according to the MANE_SELECT transcript and save the output to `vep_filter2.txt`


### Task 2

2. Create a BASH script (use a reasonable file name) that extracts the following information for _TP53_, _CYP2D6_, _RET_, and _NF1_ from the `vep_filter2.txt` file (hint: use a `for loop`)

- the number of unique variants annotated for each gene
- the variant records annotated according to the canonical transcripts saved in a file <gene_name>.canonical.txt (be sure to replace <gene_name> with the corresponding gene name)
- the counts for each of the unique variant consequences for each gene saved in a file <gene_name>.variant_consequences.txt (be sure to replace <gene_name> with the corresponding gene name)

3. Create appropriate bar plot(s) in R comparing the number of missense, frameshift, splice site, stop-lost/stop-gained, and intron variants in _TP53_, _CYP2D6_, _RET_, and _NF1_.  
