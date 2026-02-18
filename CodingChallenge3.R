library(tidyverse)
library(ggpubr)
library(ggrepel)
install.packages("ggplot2")
library(ggplot2)

# Using ggplot, create a boxplot of DON by Treatment so that the plot looks like the image below.
# a. Jitter points over the boxplot and fill the points and boxplots Cultivar with two colors from the cbbPallete introduced last week
# b.	Change the transparency of the jittered points to 0.6. 
# c.	The y-axis should be labeled "DON (ppm)", and the x-axis should be left blank. 
# d.	The plot should use a classic theme
# e.	The plot should also be faceted by Cultivar

cbbPalette  <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2" , "#D55E00", "#CC79A7")
toxin.data <- read.csv("MycotoxinData.csv", na.strings = "na")

 ggplot(toxin.data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(width = 0.8)) +
  geom_jitter(aes(color=Cultivar),position= position_jitterdodge(), pch=21, alpha = 0.6) +
  
  xlab("")+
  ylab("DON (ppm)")+
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4]))+
   scale_color_manual(values= c(cbbPalette[3], cbbPalette[4]))+
  theme_classic()+
  facet_wrap(~Cultivar)
  
# 2. Change the factor order level so that the treatment “NTC” is first, followed by “Fg”, “Fg + 37”, “Fg + 40”, and “Fg + 70.
toxin.data$Treatment <- factor(toxin.data$Treatment,levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70"))

ggplot(toxin.data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(width = 0.8)) +
  geom_jitter(aes(color=Cultivar),position= position_jitterdodge(), pch=21, alpha = 0.6) +
  
  xlab("")+
  ylab("DON (ppm)")+
  scale_fill_manual(values = c(cbbPalette[3], cbbPalette[4]))+
  scale_color_manual(values= c(cbbPalette[3], cbbPalette[4]))+
  theme_classic()+
  facet_wrap(~Cultivar)

# 3.Change the y-variable to plot X15ADON and MassperSeed_mg. The y-axis label should now be “15ADON” and “Seed Mass (mg)”. Save plots made in questions 1 and 3 into three separate R objects.
#Plot1: DON
plot_DON <- ggplot(toxin.data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(width = 0.8)) +
  geom_jitter(aes(color = Cultivar),
              position = position_jitterdodge(),
              alpha = 0.6) +
  ylab("DON (ppm)") +
  xlab("") +
  theme_classic()+
facet_wrap(~Cultivar)


#Plot2:15ADON
plot_15ADON <- ggplot(toxin.data, aes(x = Treatment, y = X15ADON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(width = 0.8)) +
  geom_jitter(aes(color = Cultivar),
              position = position_jitterdodge(),
              alpha = 0.6) +
  ylab("15ADON") +
  xlab("") +
  theme_classic() +
  facet_wrap(~Cultivar)


#Plot3:Seed mass
plot_SeedMass <- ggplot(toxin.data, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(width = 0.8)) +
  geom_jitter(aes(color = Cultivar),
              position = position_jitterdodge(),
              alpha = 0.6) +
  ylab("Seed Mass (mg)") +
  xlab("") +
  theme_classic()+
  facet_wrap(~Cultivar)


plot_15ADON
plot_DON
plot_SeedMass

# 4. Use ggarrange function to combine all three figures into one with three columns and one row. Set the labels for the subplots as A, B and C. Set the option common.legend = T within ggarage function. What did the common.legend option do?
combined_plot <- ggarrange(plot_DON,plot_15ADON,plot_SeedMass,
                           ncol = 3,
                           nrow = 1,
                           labels = c("A", "B", "C"),
                           common.legend = TRUE,
                           legend = "right")
combined_plot

# common.legend=true would combine the legends avoiding duplicating it, it makes the image clearer
# 5.Use geom_pwc() to add t.test pairwise comparisons to the three plots made above. Save each plot as a new R object, and combine them again with ggarange as you did in question 4. 
#DON with pairwise comparison
toxin.data$Treatment <- factor(toxin.data$Treatment)
toxin.data$Cultivar <- factor(toxin.data$Cultivar)
my_comparisons <- list(c("NTC", "Fg"), c("Fg", "Fg+35"), c("Fg+35", "Fg+70"))
plot_DON_pwc <- ggplot(toxin.data,
                       aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(width = 0.8)) +
  geom_jitter(aes(color = Cultivar),
              position = position_jitterdodge(),
              alpha = 0.6) +
  geom_pwc(method = "t.test",
           label = "{p.adj.format}{p.adj.signif}", group.by = "Cultivar") +
  ylab("DON (ppm)") +
  xlab("") +
  theme_classic()

#15ADON with pairwise comparison
plot_15ADON_pwc <- ggplot(toxin.data,
                          aes(x = Treatment, y = X15ADON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(width = 0.8)) +
  geom_jitter(aes(color = Cultivar),
              position = position_jitterdodge(),
              alpha = 0.6) +
  geom_pwc(method = "t.test",
           label = "{p.adj.format}{p.adj.signif}", group.by = "Cultivar") +
  ylab("15ADON") +
  xlab("") +
  theme_classic()

#Seed mass with pairwise comparison
plot_SeedMass_pwc <- ggplot(toxin.data,
                            aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(width = 0.8)) +
  geom_jitter(aes(color = Cultivar),
              position = position_jitterdodge(jitter.width = 0.2,
                                              dodge.width = 0.8),
              alpha = 0.6) +
  geom_pwc(method = "t.test",
           label = "{p.adj.format}{p.adj.signif}", group.by = "Cultivar") +
  ylab("Seed Mass (mg)") +
  xlab("") +
  theme_classic()

#To combine them 
combined_pwc <- ggarrange(plot_DON_pwc,plot_15ADON_pwc, plot_SeedMass_pwc,
                          ncol = 3,
                          nrow = 1,
                          labels = c("A", "B", "C"),
                          common.legend = TRUE,
                          legend = "right")
combined_plot



