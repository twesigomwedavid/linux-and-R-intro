
## Tutorial on making various plots in R. 
# NB: This code is not meant to be exhaustive i.e. there are many other options/features/packages that could be considered to make your plots more informative (and more beautiful!)

install.packages("tidyverse")
install.packages("ggplot2")
install.packages("viridis")
install.packages("RColorBrewer")

library(RColorBrewer)
library(ggplot2)
library(tidyverse)
library(viridis)

# Simulating data for a histogram

BRCA1_coverage <- rnorm(100, mean = 30, sd=8)

RET_coverage <- rnorm(100, mean = 10, sd=3)

# basic histogram

hist(BRCA1_coverage)

# Superpose 2 histograms
hist(BRCA1_coverage, col = "green", main = "BRCA1 and RET coverage distribution", xlab="Read depth")
hist(RET_coverage, col = "blue", breaks=10, add=T)

# Improved colours
hist(BRCA1_coverage, col=rgb(1,0,0,0.5), main = "BRCA1 and RET coverage distribution", xlab="Read depth")
hist(RET_coverage, col = rgb(0,0,1,0.5), breaks=10, add=T)


# bar plot

tools <- c('tool1', 'tool2', 'tool3')
DEL <- c(38, 25, 10)
DUP <- c(50, 40, 12)

df <- data.frame(tools, DEL, DUP) # check row.names
df

# Basic bar plot
barplot(df$DEL)

# adding labels
barplot(df$DEL, main="Number of deletions called by each tool", xlab="CNV callers", ylab = "Deletion event count")

# names
barplot(df$DEL, main="Number of deletions called by each tool", xlab="CNV callers", ylab = "Deletion event count", names = c("tool1", "tool2", "tool3"))
barplot(df$DEL, main="Number of deletions called by each tool", xlab="CNV callers", ylab = "Deletion event count", names = df$tools)


# colour palette
coul <- brewer.pal(3, "Set2") 
barplot(df$DEL, main="Number of deletions called by each tool", xlab="CNV callers", ylab = "Deletion event count", names = df$tools, col=coul)

# horizontal bars
barplot(df$DEL, main="Number of deletions called by each tool", xlab="CNV callers", ylab = "Deletion event count", names = df$tools, col=coul, horiz = TRUE)

# bar width -- can be usefull to represent the number of value behind each bar
barplot(df$DEL, main="Number of deletions called by each tool", xlab="CNV callers", ylab = "Deletion event count", names = df$tools, col=coul, width = c(0.2,0.4,0.2))

# spacing 
barplot(df$DEL, main="Number of deletions called by each tool", xlab="CNV callers", ylab = "Deletion event count", names = df$tools, col=coul, space=c(2,2,2))

# texture colouring
barplot(df$DEL, main="Number of deletions called by each tool", xlab="CNV callers", ylab = "Deletion event count", names = df$tools, col=coul, density=c(10,10,20), angle=c(0,45,36)) 



# other bar charts

genes <- c(rep("NF1" , 3) , rep("TP53" , 3) , rep("BRCA1" , 3))
variants <- rep(c("intron_variant" , "missense" , "frameshift") , 3)
count <- round(abs(rnorm(9 , 1 , 5)))
data <- data.frame(genes,variants,count)

# Clustered

ggplot(data, aes(fill=variants, y=count, x=genes)) + 
  geom_bar(position="dodge", stat="identity")


# Stacked
ggplot(data, aes(fill=variants, y=count, x=genes)) + 
  geom_bar(position="stack", stat="identity")


# Stacked + percent

ggplot(data, aes(fill=variants, y=count, x=genes)) + 
  geom_bar(position="fill", stat="identity")


## Box plot

# Simulate blood pressure dataset

cohort1 <- data.frame(
name = c(rep ("cases", 200), rep ("controls", 1000)),
BP=c(rnorm(200, mean = 140, sd = 5), c(rnorm(450, mean=100, sd = 2), rnorm(100, mean=110, sd = 2), rnorm(450, mean=120, sd = 2))))


# Basic box plot

ggplot(data = cohort1, aes(x=name, y=BP, fill=name)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="viridis") +
  theme_bw() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Basic boxplot") +
  xlab("")


# Box plot with jitter

ggplot(data = cohort1, aes(x=name, y=BP, fill=name)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  geom_jitter(color="black", size=0.4, alpha=0.9) +
  theme_bw() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("A boxplot with jitter") +
  xlab("")


# Basic violin plot

ggplot(data = cohort1, aes(x=name, y=BP, fill=name)) +
  geom_violin() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="viridis") +
  theme_bw() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Violin chart") +
  xlab("")


# Violin plot wrapping box plot

ggplot(data = cohort1, aes(x=name, y=BP, fill=name)) +
  geom_violin() +
  geom_boxplot(width=0.1, color="gray", alpha=0.2) + 
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="viridis") +
  theme_bw() +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Violin chart") +
  xlab("")


# Pie chart

prop <- c(5,10,22,28,35)
pie(prop)

# add labels to pie chart
pie(prop, labels = c("Cancer", "TB", "HIV", "Malaria", "URTI"))

# add colour palette

pie_palette <- brewer.pal(5, "Set2") 

pie(prop, labels = c("Cancer", "TB", "HIV", "Malaria", "URTI"), border="white", col = pie_palette)


# Heatmap
data

data_matrix <- cbind(rnorm(20,15,3),rnorm(20,5,6), rnorm(20,10,4), rnorm(20,12,10))

data_matrix

colnames(data_matrix) <- c("BRCA1", "TP53", "NF1", "CYP2D6")

# Basic heatmap
heatmap(data_matrix, cexRow = 1, cexCol = 1)


# Normalised heatmat
heatmap(data_matrix, scale="column", cexRow = 1, cexCol = 1)


# No dendrogram nor reordering for neither column or row
heatmap(data_matrix, Colv = NA, Rowv = NA, scale="column", cexRow = 1, cexCol = 1)


# Add colour
coul2 <- brewer.pal(4, "Set2") 
heatmap(data_matrix, Colv = NA, Rowv = NA, scale="column", cexRow = 1, cexCol = 1, col = rainbow(256))

heatmap(data_matrix, Colv = NA, Rowv = NA, scale="column", cexRow = 1, cexCol = 1, col= colorRampPalette(brewer.pal(4, "Blues"))(25))



# Upset plot in R -- used to compare sets of elements

install.packages("UpSetR")
library(UpSetR)

expressionInput <- c(tool1 = 11, tool2 = 30, tool3 = 8, `tool1&tool2` = 4, `tool2&tool3` = 9, 
                     `tool1&tool3` = 25, `tool1&tool3&tool2` = 107)

x <- fromExpression(expressionInput)
x
str(x)

upset(x, order.by = "degree", mainbar.y.label = "Haplotype Intersections", sets.x.label = "Haplotypes called per tool", text.scale = c(1.3, 1.3, 1, 0.9, 1.5, 1.2), sets.bar.color = "maroon", main.bar.color = "gray23")
      

## Using xyplot and lattice -- self study :)


