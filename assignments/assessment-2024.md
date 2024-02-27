## MSc Med Genomic Medicine: Bioinformatics assessment

In this assessment, you will be summarising a few things with regard to genetic variation in _LDLR_ across 20 genomes from the Luhya in Webuye, Kenya (LWK). This dataset is a subset of the 1000 Genomes Project dataset (full project has 3202 participants from global populations). You can read more about the 1000 Genomes Project here (https://www.internationalgenome.org; https://pubmed.ncbi.nlm.nih.gov/36055201). 
The assessment is designed to help you practice the content covered in the Bioinformatics/Linux and R module. **For each step, write both the command that you used and the output where applicable**. For example, if I run the _pwd_ command, then my answer will be as follows:

```
twesidave:~ tdavid$ pwd
/home/tdavid
```

### Download the data for the assessment 
(basically the same way you downloaded the **new_data.zip** data we’ve been using in class)

- Navigate to your assignments directory (create one if missing) within the linux_tutorial directory we created in class. 

- Download the **ldlr_lwk.zip** dataset for this assessment from https://github.com/twesigomwedavid/linux-and-R-intro/tree/main/data using wget. 

- MacOS users (you can download directly from the browser and move the file from your Downloads folder to the assignments directory since curl won’t work for a zipped file). Alternatively, install wget by running (in one line): 

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && brew install wget
```

-	Unzip the dataset

### Exercise 1 

1.	Change directory to the **ldlr_lwk** directory (note that we are using small "L" not letter i)
2.	How many BAM (.bam) files are in the **ldlr_lwk** directory? Write the command(s) you used to determine this (hint: use the **|** character to combine commands). 
3.	Are the BAM files in this folder indexed? 
4.	List all the bam files in the folder and save the output of the **ls** command to a file named bams.txt (Hint: Use the * wildcard and remember to redirect with the **>** sign). 
5.	The **bams.txt** file should now have the name of a bam file on each line. Delete the **_ldlr.bam** pattern from every line in the **bam.txt** file using the **sed** command and save the output to a file named **sample_ids.txt** (Hint: remember the sed syntax: sed 's/pattern_to_be_replaced//' file_name > new_file)  
6.	Open a new file named **index.sh** using **nano**. In this file add the lines below:

```
for i in $(cat sample_ids.txt); do 
    samtools index ${i}*.bam 
done
```
Save the file and go back to the command line. Execute this file using the command:

```
bash index.sh
```

7. What is different in the **ldlr_lwk** folder after running the command above? How does this compare with indexing each file one at a time?

8. The hg38_chr19.fasta file contains the chromosome 19 reference sequence from GRCh38. Index the hg38_chr19.fasta file using **samtools** (Hint: Use **samtools faidx hg38_chr19.fasta**). What file is produced after running this command?


### Exercise 2:

Run the command below to call variants for NA19017:

```
bcftools mpileup -a AD -f hg38_chr19.fasta NA19017_ldlr.bam -Ou | bcftools call -mv -o NA19017_ldlr.vcf
```

1. How many variants are in **NA19017_ldlr.vcf**? 
2. What is the sequencing read depth at position **11124829**? What are the REF and ALT alleles at this position? What is the allele depth for the REF and ALT alleles at this position?
3. What variant events are at positions **11092202** and **11092205**? What are the REF and ALT alleles at these positions? 

Run the command:

```
bcftools norm -f hg38_chr19.fasta NA19017_ldlr.vcf -o NA19017_ldlr.norm.vcf
```

4.	What does the command above do?
5.	Check the positions **11092202** and **11092205** again but this time from the NA19017_ldlr.norm.vcf file? Are the REF and ALT alleles the same as before (as in NA19017_ldlr.vcf)? If not, could you explain what’s different? 


### Exercise 3:

The variant calling from exercise 2 was only for NA19017. 

1. Modify the first _bcftools_ command from exercise 2 to perform multi-sample variant calling on all the BAM files in the **ldlr_lwk** folder (be sure to include the AD flag). Save the output VCF file as **ldlr_lwk_multisample.vcf**
2. Normalise the variants in ldlr_lwk_multisample.vcf using **bcftools norm** and save the output to ldlr_lwk_multisample.norm.vcf (see the command used in exercise 2 for reference)
   

Run the command below (in one line):

```
bcftools filter -s LowQual -i'QUAL>=30 && AD[*:1]>=15' -g8 -G10 ldlr_lwk_multisample.norm.vcf  -o ldlr_lwk_multisample.norm.flt.vcf
```

3. What does the command above do and how is the *ldlr_lwk_multisample.norm.flt.vcf* file different from the *ldlr_lwk_multisample.norm.vcf* file?
4. How many variants are in the ldlr_lwk_multisample.norm.flt.vcf file?
5. How many variants in ldlr_lwk_multisample.norm.flt.vcf passed the filters above? 
6. How many SNPs and how many indels are in the ldlr_lwk_multisample.norm.flt.vcf file? (Hint: you can query SNPS using: ```bcftools query -f'%POS %REF>%ALT\n' -i'type="snp"' ldlr_lwk_multisample.norm.flt.vcf```). Replace ```"snp"``` with ```"indel"``` to query indels.
7. How can you count the number of samples in **ldlr_lwk_multisample.norm.flt.vcf** using **bcftools query**? (Hint: pull up the help menu with the ```--help``` option and check for the appropriate flag)
8. What is the minor allele frequency of the **11111624G>A** variant in this group of LWK samples? What two metrics in the INFO column are important for determining this?

### Exercise 4:

1. How many amino acids are in the longest protein that can be translated from _LDLR_ (Hint: Refer to Ensembl Genome Browser)
2. What is the RefSeq accession number and the Ensembl Transcript ID of the MANE Select transcript for (Human) _LDLR_ and how long is the protein sequence from this transcript?
3. What is the UniProt accession number of (Human) _LDLR_? What is the function of LDLR according to UniProtKB?

Run the command below:
```
grep -v '#' ldlr_lwk_multisample.norm.flt.vcf | cut -f1-7 | sed 's/$/\t./' > for_vep_analysis.vcf
```
This command de-identifies the VCF file so that you can submit the variants to the online VEP without running into ethical issues. 

Submit the **for_vep_analysis.vcf** file to the Ensembl Variant Effect Predictor (go to https://www.ensembl.org/Tools/VEP and launch VEP). Feel free to add (see checkboxes) as many options as you might consider useful. When it comes to the VEP plugins for functionality/pathogenicity predictions, limit these to SIFT, Polyphen, CADD, REVEL, MutationTaster, MutationAssessor, PROVEAN, LRT, and LoFTool (note that some of these plugins are only visible after enabling dbNSFP). More information about these plugins and others can be found here (https://www.ensembl.org/info/docs/tools/vep/script/vep_plugins.html).  

4. List all the annotations that you’ve selected.

VEP may take some time to run. After it has run successfully, select view results. 
Filter the results as shown in the screenshot below. Select the Symbol to be LDLR and MANE_SELECT to the _LDLR_ MANE Select transcript accession number that you inferred earlier in this assessment. 

Download the filtered  TXT format (not VCF and not VEP) file from the Download panel on the VEP results page (see screenshot below). Move the downloaded file to your **ldlr_lwk** folder. 

5. Rename the downloaded filtered VEP output file to **ldlr_lwk_vep.txt**
6. What are the counts for the missense, frameshift, stop-gain, splice defect (only splice donor and splice acceptor), inframe insertions/deletions, intronic, 5-prime-UTR, and downstream gene variants?

Load the packages below in R/Rstudio:
```
library(RColorBrewer)
library(ggplot2)
library(tidyverse)
library(viridis)
```

7. Create a vector in Rstudio for the counts you determined above. Create a corresponding vector for the labels (i.e. missense, frameshift, ... etc).
8. Make a barplot in Rstudio to visualize these data. If the x-axis looks crowded, try the bar plot with horizontal bars. Alternatively, group the non-synonymous variants together.   


### Exercise 5:
1. Run the **samtools depth** command to obtain the read depth for **NA19017_ldlr.bam** and **NA19475_ldlr.bam** and save the output to **NA19017_ldlr_depth.txt** and **NA19475_ldlr_depth.txt**, respectively.
2. Open a new Rscript file in your Rstudio. Import the NA19017_ldlr_depth.txt and NA19475_ldlr_depth.txt files into your Rstudio.

```
NA19017_cov <- read.table("fill this space with the path to NA19017_ldlr_depth.txt", header=FALSE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)

NA19475_cov <- read.table("fill this space with the path to NA19475_ldlr_depth.txt", header=FALSE, sep="\t", na.strings="NA", dec=".", strip.white=TRUE)
```

3. You can view the contents of NA19017_cov and NA19475_cov in the environment variable panel (top right corner in Rstudio). Notice that the third columns for each comprises the read depths at the corresponding chromosomal locations positions. What is the mean read depth and standard deviation across the read depth distribution for NA19017_cov and NA19475_cov, respectively? (Hint: use the **mean** and **sd** functions in R)

4. Check whether the mean read depths for NA19017 and NA19475 are significantly different using the student's t-test in R. What is the outcome of the t-test (i.e. can we reject the null hypothesis? what is the p-value/confidence interval?)
   

**Congratulations, you've reached the end of the assessment!**




