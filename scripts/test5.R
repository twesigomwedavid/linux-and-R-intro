

cohort1 <- data.frame(
  name = c(rep ("cases", 200), rep ("controls", 1000)),
  BP=c(rnorm(200, mean = 140, sd = 5), c(rnorm(450, mean=100, sd = 2), rnorm(100, mean=110, sd = 2), rnorm(450, mean=120, sd = 2))))


cohort2 <- data.frame(
  name = c(rep("CYP1A1", 42), rep("CYP1A2", 42), rep("CYP2A6", 42), rep("CYP2B6", 42), rep("CYP2C19", 42), rep("CYP2C9", 42), rep("CYP2C8", 42), rep("CYP2D6", 42), rep("CYP3A4", 42), rep("CYP3A5", 42), rep("CYP4F2", 42), rep("DPYD", 42), rep("NUDT15", 42), rep("SLCO1B1", 42)),
  Estimated_read_depth = c(rnorm(42, mean = 37.5, sd = 5), rnorm(42, mean = 37.5, sd = 5), rnorm(42, mean = 37.5, sd = 5), rnorm(42, mean = 37.5, sd = 5), rnorm(42, mean = 37.5, sd = 5), rnorm(42, mean = 37.5, sd = 5), rnorm(42, mean = 37.5, sd = 5), rnorm(42, mean = 37.5, sd = 5), rnorm(42, mean = 37.5, sd = 5), rnorm(42, mean = 37.5, sd = 5), rnorm(42, mean = 37.5, sd = 5), rnorm(42, mean = 37.5, sd = 5), rnorm(42, mean = 37.5, sd = 5), rnorm(42, mean = 37.5, sd = 5))
)

ggplot(data = cohort2, aes(x=name, y=Estimated_read_depth, fill=name)) +
  geom_violin() +
  geom_boxplot(width=0.2, color="gray20", alpha=0.01) + 
  scale_x_discrete(guide = guide_axis(angle = 90)) +
  scale_fill_viridis(discrete = TRUE, alpha=0.4, option="viridis") +
  theme_bw() +
  theme(legend.position="none", plot.title = element_text(size=11)) +
  theme(axis.text.x=element_text(colour="black")) +
  theme(axis.text.x = element_text(face="bold")) +
  # ggtitle("Estimated depth") +
  xlab("")