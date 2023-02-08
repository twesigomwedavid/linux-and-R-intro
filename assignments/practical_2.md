## Linux practical 2

### Instructions:

- **For each step, please write the commands used where applicable.** 

- Download the ``cpvs.txt`` file at ... and move it to a ``vep`` folder (can create a new folder if you don't have this)

The ``cpvs.txt`` file comprises variants that have been annotated using the [Ensembl Variant Effect Predictor](https://www.ensembl.org/info/docs/tools/vep/index.html). This exercise is about extracting/filtering various information from this file using Linux. 

### Task 1

1. How many header lines are in the ``cpvs.txt`` file? How many variant records are in the file?

2. How many unique variants are in the cpvs.tx file? 

3. Why is the number of unique variants different from the number of total variant records?


### Task 2

1. Of the variant annotations in ``cpvs.txt``, how many are based on a [MANE_SELECT](https://www.ncbi.nlm.nih.gov/refseq/MANE/) transcript, and how many are based on a canonical transcript?   

2. Filter the variant records in cpvs.txt — keep the header line and only the variant records based on a MANE_SELECT transcript. Save the output to ``cpvs_mane_select.txt``

3. How many protein coding variants are in the ``cpvs_mane_select.txt`` file?

5. How many unique variant consequences are in the ``cpvs_mane_select.txt`` file? Provide counts for each of the unique variant consequences. 

4. Create a smaller file (smaller_cpvs_file.txt) from ``cpvs_mane_select.txt`` comprising only the variant rsID (#Uploaded_variation), location, allele, gene, protein position, amino acids, SIFT, Polyphen, and clinical significance (CLIN_SIG) columns. 


### Task 3

1. Convert the ``smaller_cpvs_file.txt`` file to a comma-separated file and save the output to ``test_file.csv``

