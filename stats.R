
# Common statistical tests in R


### Simulate blood pressure dataset

BP_cases <- c(rnorm(200, mean = 140, sd = 5))
BP_cases
BP_controls <- c(rnorm(200, mean=120, sd = 2))

BP <- data.frame(BP_cases, BP_controls)
BP

dummy_for_non_norm <- c(rep(100, 50), rep(110,50), rep(90,50))

dummy_for_non_norm

### Testing for normality with Shapiro-Wilk test

#### Null hypothesis -- sample has been generated from a normal distribution

shapiro.test(BP_cases)

p_value_shapiro_test <- shapiro.test(BP_cases)$p.value

shapiro.test(dummy_for_non_norm)


###  T-test (students t-test or Welch test)

?t.test()
t.test(x = BP_cases, y = BP_controls, paired = FALSE, var.equal=FALSE)

t.test(x = BP_cases, y = BP_controls, paired = FALSE, var.equal=FALSE)


?var.test() ## Fisher's F-test

t.test(BP$BP_cases, BP$BP_controls)

t.test(BP$BP_cases, BP$BP_controls)$p.value



### Wilcoxon Rank-Sum Test (Mann Whitney U Test) 

#### This is a non-parametric test and it does not assume a normal distribution.

wilcox.test(x = BP_cases, y = BP_controls, paired = FALSE)


#### For Wilcoxon Signed-Rank test, paired = TRUE (i.e. equivalent alternative of paired t-test)


### Kruskal-Wallis test -- for comparisons across three or more populations. Also non-parametric

BP_controls_2 <- c(rnorm(200, mean=110, sd = 2))

BP <- data.frame(BP_cases, BP_controls, BP_controls_2)

kruskal.test(BP)


### Analysis of Variance (ANOVA) -- alternative method that generalises the t-test beyond two groups

#### one-way ANOVA

?aov()

cohort2 <- data.frame(
  BMI = c(rep ("group1", 200), rep ("group2", 1000), rep("group3", 1000)),
  BP=c(rnorm(200, mean = 140, sd = 5), c(rnorm(450, mean=100, sd = 2), rnorm(100, mean=110, sd = 2), rnorm(450, mean=120, sd = 2)), rnorm(1000, mean = 110, sd = 5)))

test_aov <- aov(BP ~ BMI, data = cohort2)
summary(test_aov)

install.packages("report")
library(report)
report(test_aov)

#### ANOVA using lm()
lm.model <- lm(BP ~ BMI, data = cohort2)
summary(lm.model)

#### F-statistic is the test statistic for ANOVA

#### two-way ANOVA

x<-c(rep("yes", 1000), rep("no", 1000))

cohort3 <- data.frame(
  exercise = c(c(rep("yes", 25), rep("no", 150), rep("yes", 25)), sample(x, 2000)),
  BMI = c(rep ("group1", 200), rep ("group2", 1000), rep("group3", 1000)),
  BP = c(rnorm(200, mean = 140, sd = 5), c(rnorm(450, mean=100, sd = 2), rnorm(100, mean=110, sd = 2), rnorm(450, mean=120, sd = 2)), rnorm(1000, mean = 110, sd = 5)))

two_way_anova <- aov(BP ~ BMI + exercise, data = cohort2)

report(two_way_anova)


### Pairwise t-test
  
pairwise.t.test(x = cohort3$BP, g = cohort3$BMI, paired = FALSE, p.adjust.method = "bonferroni")


### Simple linear regression 
a <- 18:40
b <- 60:82
lm(b ~ a)


### Correlation test -- tests the linear relationship of two continuous variables
cor.test(a, b)


### Kolmogorov-Smirnov test -- used to check whether 2 samples follow the same distribution

x <- rnorm(50)
y <- rnorm(50)
z <- runif(50)

ks.test(x, y) 
ks.test(x, z) 


### Fisher's exact test

df <- data.frame(
  "Africa" = c(50, 200),
  "EUR" = c(10, 500),
  row.names = c("var1_present", "var1_absent"),
  stringsAsFactors = FALSE
)

df

test <- fisher.test(df)
test  


### Chi-square test

chisq.test(df)


### Hardy Weinberg Equilibrium (HWE)

install.packages("genetics")
library(genetics)

data <- c(rep("A/A", 250), rep("A/G", 50), rep("G/G", 15))
data
g <- genotype(data)
HWE.test(g)

