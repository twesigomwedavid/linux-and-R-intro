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
2.	How many BAM (.bam) files are in the **ldlr_lwk** directory? Write the command(s) you used to determine this (hint: use the | character to combine commands). 
3.	Are the BAM files in this folder indexed? 
4.	List all the bam files in the folder and save the output of the **ls** command to a file named bams.txt (Hint: Use the * wildcard and remember to redirect with the **>** sign). 
5.	The **bams.txt** file should now have the name of a bam file on each line. Delete the **_ldlr.bam** pattern from every line in the **bam.txt** file using the **sed** command and save the output to a file named **sample_ids.txt** (Hint: remember the sed syntax: sed 's/pattern_to_be_replaced//' file_name > new_file)  
6.	Open a new file named index.sh using nano. In this file add the lines below:

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
bcftools norm -f hg38_chr19.fasta NA19017_ldlr.vcf -o NA19017.norm.vcf
```

4.	What does the command above do?
5.	Check the positions **11092202** and **11092205** again? Are the REF and ALT alleles the same as before (as in NA19017_ldlr.vcf)? If not, could you explain what’s different? 


### Exercise 3:

The variant calling from exercise 2 was only for NA19017. 

1. Modify the first _bcftools_ command from Exercise 2 to perform multi-sample variant calling on all the BAM files in the **ldlr_lwk** folder (be sure to include the AD flag). Save the output VCF file as **ldlr_lwk_multisample.vcf**
2. Normalise the variants in ldlr_lwk_multisample.vcf using **bcftools norm** and save the output to ldlr_lwk_multisample.norm.vcf (see the command used in exercise 2 for reference)
   

Run the command below (in one line):

```
bcftools filter -s LowQual -i'QUAL>=30 && AD[*:1]>=15' -g8 -G10 ldlr_lwk_multisample.norm.vcf  -o ldlr_lwk_multisample.norm.flt.vcf
```

3. What does the command above do and how is the ldlr_lwk_multisample.norm.flt.vcf file different from the ldlr_lwk_multisample.norm.vcf file?
4. How many variants are in the ldlr_lwk_multisample.norm.flt.vcf file?
5. How many variants in ldlr_lwk_multisample.norm.flt.vcf passed the filters? 
6. How many SNPs and how many indels are in the ldlr_lwk_multisample.norm.flt.vcf file? (Hint: you can query SNPS using: ```bcftools query -f'%POS %REF>%ALT\n' -i'type="snp"' ldlr_lwk_multisample.norm.flt.vcf```). Replace ```"snp"``` with ```"indel"``` to query indels.
7. How can you count the number of samples in ldlr_lwk_multisample.norm.flt.vcf using bcftools query? (Hint: pull up the help menu with the ```--help``` option and check for the appropriate flag)
8. What is the minor allele frequency of the **11111624G>A** variant in this group of LWK samples?

### Exercise 4:

Submit the **ldlr_lwk_multisample.norm.flt.vcf** file to the Ensembl Variant Effect Predictor (https://www.ensembl.org/Tools/VEP). Feel free to add (see checkboxes) as many options as you might consider useful. When it comes to the VEP plugins for functionality/pathogenicity predictions, limit these to SIFT, Polyphen, CADD, REVEL, MutationTaster, MutationAssessor, PROVEAN, LRT, and LoFTool (note that some of these plugins are only visible after enabling dbNSFP). More information about these plugins and others can be found here (https://www.ensembl.org/info/docs/tools/vep/script/vep_plugins.html).  

1.	List all the annotations that you’ve selected.
2.	


