# Explain the following concepts about ggplot 
# a.	What three elements do you need to produce a ggplot?
# Data, Aesthetics (mapping that connects your data to visual properties) and geoms (the visual marks used to represt the data)
# b.	What is a geom? 
# visual representations of obsservations. these are actual graphical elements drawn on a plot. 
# c.	What is a facet? 
# this partitions a plot into matrix panels
# d.	Explain the concept of layering. 
# The layers are called geoms. It is description of how to render a specific set of data. Some of the key components are: Data, aesthetic mapping, geometric objects, statistical transformations and position adjustments. 
# In R, we typically add x and y variables and map different shapes, colors and other attributes to data within a plotting function, for example in ggplot() package. 
# specific location for defining these mappings is inside the aes() after ggplot() command. 

# 2.Make a boxplot using ggplot with DON as the y variable, treatment as the x variable, and color mapped to the wheat cultivar. Change the y label to “DON (ppm)” and make the x label blank.
library(tidyverse) 
toxin.data <- read.csv("MycotoxinData.csv", na.strings = "na")
ggplot(toxin.data, aes(x=Treatment, y=DON, color = Cultivar)) +
  geom_boxplot() + 
  labs(y="DON (ppm)", x= "") 
# 3. Now convert this data into a bar chart with standard-error error bars using the stat_summary() command. (hint: use position = dodge)
ggplot(toxin.data, aes(x = Treatment, y = DON, fill= Cultivar)) +
  stat_summary(fun = mean, geom = "bar", 
               position = position_dodge(width = 0.9)) +
  stat_summary(fun.data = mean_cl_normal, 
               geom = "errorbar", 
               width = 0.2,
               position = position_dodge(width = 0.9)) +
  labs(y = "DON (ppm)", 
       x = "")
# 4. Add points to the foreground of the boxplot and bar chart you made in questions 2 & 3 that show the distribution of points. Set the shape = 21 and the outline color black (hint: use jitter_dodge). 
# For boxplot
ggplot(toxin.data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(width = 0.8)) +
  geom_point(aes(fill = Cultivar),
             shape = 21,
             color = "black",
             size = 2,
             position = position_jitterdodge(jitter.width = 0.2,dodge.width = 0.8)) +
  labs(y = "DON (ppm)",
       x = "")
#For bargraph
ggplot(toxin.data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun = mean,
               geom = "bar",
               position = position_dodge(width = 0.8)) +
  stat_summary(fun.data = mean_se,
               geom = "errorbar",
               width = 0.2,
               position = position_dodge(width = 0.8)) +
  geom_point(aes(fill = Cultivar),
             shape = 21,
             color = "black",
             size = 2,
             position = position_jitterdodge(
               jitter.width = 0.2,
               dodge.width = 0.8
             )) +
  labs(y = "DON (ppm)",
       x = "")
# 5. Add a facet to the plots based on cultivar.
# For boxplot
ggplot(toxin.data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(width = 0.8)) +
  geom_point(aes(fill = Cultivar),
             shape = 21,
             color = "black",
             size = 2,
             position = position_jitterdodge(jitter.width = 0.2,dodge.width = 0.8)) +
  labs(y = "DON (ppm)", x = "") + 
  facet_wrap(~Cultivar)
# For Bar graph
ggplot(toxin.data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun = mean,
               geom = "bar",
               position = position_dodge(width = 0.8)) +
  stat_summary(fun.data = mean_se,
               geom = "errorbar",
               width = 0.2,
               position = position_dodge(width = 0.8)) +
  geom_point(aes(fill = Cultivar),
             shape = 21,
             color = "black",
             size = 2,
             position = position_jitterdodge(
               jitter.width = 0.2, dodge.width = 0.8 )) +
  labs(y = "DON (ppm)", x = "")+ 
  facet_wrap(~Cultivar)
# 6. Add transparency to the points so you can still see the boxplot or bar in the background.
# For boxplot
ggplot(toxin.data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(width = 0.8)) +
  geom_point(aes(fill = Cultivar),
             shape = 21,
             color = "black",
             size = 2,
             alpha= 0.5,  
             position = position_jitterdodge(jitter.width = 0.2,dodge.width = 0.8)) +
  labs(y = "DON (ppm)", x = "") + 
  facet_wrap(~Cultivar)
# For Bar graph
ggplot(toxin.data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  stat_summary(fun = mean,
               geom = "bar",
               position = position_dodge(width = 0.8)) +
  stat_summary(fun.data = mean_se,
               geom = "errorbar",
               width = 0.2,
               position = position_dodge(width = 0.8)) +
  geom_point(aes(fill = Cultivar),
             shape = 21,
             color = "black",
             size = 2,
             alpha= 0.5,
             position = position_jitterdodge(
               jitter.width = 0.2, dodge.width = 0.8 )) +
  labs(y = "DON (ppm)", x = "")+ 
  facet_wrap(~Cultivar)
# Annotate your code and push it to github. 
#Go to Git in R studio (Top right)
#Check the box next to the file
#Click commit
#Write commit
#Click push to send it to the GitHub

