#Homework_DataVisualization2

library(tidyverse)
install.packages("ggpubr")
library(ggpubr)
install.packages("ggrepel")
library(ggrepel)

cbbPalette  <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2" , "#D55E00", "#CC79A7")
sample.data.bac <- read.csv("BacterialAlpha.csv", na.strings= "na")
str(sample.data.bac)
sample.data.bac$Time_Point <- as.factor(sample.data.bac$Time_Point)
sample.data.bac$Crop <- as.factor(sample.data.bac$Crop)
sample.data.bac$Crop <- factor(sample.data.bac$Crop, levels= c("Soil", "Cotton", "Soybean"))

#plot one-B
bac.even <- ggplot(sample.data.bac, aes(x= Time_Point, y= even, color =crop)) +
  geom_boxplot(position= position_dodge()) +
  geom_jitter(0.05)+
  xlab("Time") +
  ylab("Pielou's evenness") +
  theme_classic()
bac.even

#Plot 2-A
sample.data.bac.no.soil <-subset(sample.data.bac, Crop != "Soil")



 # we can asthetics, jittered points, and can add individiual lines for each mean points, add x and y axis, set colors; whatever is required we can personally choose it and add it)
water.imbibed <- ggplot(sample.data.bac.nosoil, aes(Time_Point, 1000 * Water_Imbibed, color = Crop)) +  # Define aesthetics: x-axis as Time.Point, y-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_jitter(width = 0.5, alpha = 0.5) +  # Add jittered points to show individual data points with some transparency
  stat_summary(fun = mean, geom = "line", aes(group = Crop)) +  # Add lines representing the mean value for each Crop group
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.5) +  # Add error bars representing the standard error of the mean
  xlab("Hours post sowing") +  # Label the x-axis
  ylab("Water Imbibed (mg)") +  # Label the y-axis
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("", "")) +  # Manually set colors for the Crop variable
  theme_classic() +  # Use a classic theme for the plot
  theme(strip.background = element_blank(), legend.position = "none") +  # Customize theme: remove strip background and position legend to the right
  facet_wrap(~Crop, scales = "free")  # Create separate panels for each Crop, allowing free scales
water.imbibed

# Plot 3-C
water.imbibed.cor <- ggplot(sample.data.bac.nosoil, aes(y = even, x = 1000 * Water_Imbibed, color = Crop)) +  # Define aesthetics: y-axis as even, x-axis as Water_Imbibed (converted to mg), and color by Crop
  geom_point(aes(shape = Time_Point)) +  # Add points with different shapes based on Time.Point
  geom_smooth(se = FALSE, method = lm) +  # Add a linear model smooth line without confidence interval shading
  xlab("Water Imbibed (mg)") +  # Label the x-axis
  ylab("Pielou's evenness") +  # Label the y-axis
  scale_color_manual(values = c(cbbPalette[[2]], cbbPalette[[3]]), name = "", labels = c("Cotton", "Soybean")) +  # Manually set colors for the Crop variable
  scale_shape_manual(values = c(15, 16, 17, 18), name = "", labels = c("0 hrs", "6 hrs", "12 hrs", "18 hrs")) +  # Manually set shapes for the Time.Point variable
  theme_classic() +  # Use a classic theme for the plot
  theme(strip.background = element_blank(), legend.position = "none") +
  facet_wrap(~Crop, scales = "free")  # Create separate panels for each Crop, allowing free scales

water.imbibed.cor

figure2 <- ggarrange(
  water.imbibed,  
  bac.even, 
  water.imbibed.cor,  
  labels = "auto",  
  nrow = 3,  
  ncol = 1,  
  legend = FALSE)

# integrating statistics in to plots for explanatory analysis
bac.even + 
  stat_compare_means(method = "anova")

bac.even + 
  geom_pwc(aes(group=Crop, method= "t.test", label="p.adj.format")

           bac.even + 
             geom_pwc(aes(group = Crop), method = "t_test", label = "p.adj.signif")
           
           water.imbibed.cor +
             stat_regline_equation()
    
          diff.abound <- read.csv("BacterialAlpha.csv")
          str(diff.abound)
          diff.abund$log10_pvalue <- -log(diff.abund$p_CropSoybean)
          
          ggplot()+
            geom_point(data =diff.abund, aes(x=lfc_CropSoybean, y= log10_pvalue, color=diff_CropSoybean, label=label)) +
            theme_classic()+
            geom_text_repel(data = diff.abund.label, aes(x = lfc_CropSoybean, y = log10_pvalue, color = diff_CropSoybean, label = Label))+
            xlab("Log fold change Soil vs. Soybean") +
            ylab("-log10 p-value")
          
          
            
           