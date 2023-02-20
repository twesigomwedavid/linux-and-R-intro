## Linux assessment

### Instructions:

- **For each step, please write the commands used where applicable.** 

- Download the vep output file at https://www.ensembl.org/Multi/Tools/VEP/Ticket?tl=D5V5D1BPLCmFGx8K and move it to your ``vep`` folder (can create a new folder if you don't have this). Be sure to download the .txt version (unfiltered).  

The ``D5V5D1BPLCmFGx8K.txt`` file comprises variants from 4 genes (_TP53_, _CYP2D6_, _RET_, and _NF1_) that have been annotated using the [Ensembl Variant Effect Predictor](https://www.ensembl.org/info/docs/tools/vep/index.html). 



### Task 1

1. How many unique variants are in the D5V5D1BPLCmFGx8K.txt file? 

2. Filter out column 9 (i.e. the Feature column) and save the output to `vep_filter1.txt` (this step is to remove some NM_ patterns in column 9 that could cause confusion when filtering for the MANE_SELECT transcript later on)

3. Remove the original D5V5D1BPLCmFGx8K.txt to save space on your computer.

4. Filter for all variant records annotated according to the MANE_SELECT transcript and save the output to `vep_filter2.txt`


### Task 2

2. Create a BASH script (use a reasonable file name) that extracts the following information for _TP53_, _CYP2D6_, _RET_, and _NF1_ from the `vep_filter2.txt` file.

- The number of unique variants annotated for each gene

2b. 

1. Of the variant annotations in ``cpvs.txt``, how many are based on a [MANE_SELECT](https://www.ncbi.nlm.nih.gov/refseq/MANE/) transcript, and how many are based on a canonical transcript?   

2. Filter the variant records in cpvs.txt as follows — keep only the last header line and only the variant records based on a MANE_SELECT transcript. Save the output to ``cpvs_mane_select.txt``

3. How many protein coding variants are in the ``cpvs_mane_select.txt`` file?

5. How many unique variant consequences are in the ``cpvs_mane_select.txt`` file? Provide counts for each of the unique variant consequences. 

4. Create a smaller file (smaller_cpvs_file.txt) from ``cpvs_mane_select.txt`` comprising only the variant rsID (#Uploaded_variation), location, allele, gene, protein position, amino acids, SIFT, Polyphen, and clinical significance (CLIN_SIG) columns. 


### Task 3

1. Convert the ``smaller_cpvs_file.txt`` file to a comma-separated file and save the output to ``test_file.csv``

