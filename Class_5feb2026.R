install.packages("tidyverse")
library(tidyverse)

mtcars
#line is on top
ggplot(mtcars,aes(x=wt, y=mpg)) + 
  geom_point() + 
  geom_smooth(method = lm, se=FALSE) #se controls the 95% confidence line

#points pointed above the line  (layering effect) +
ggplot(mtcars,aes(x=wt, y=mpg, size=wt, color=hp)) + 
  geom_point() + 
  geom_smooth(method = lm, se=FALSE) + 
  geom_point() +
  xlab("weight (tons)") +
  ylab("Miles per gallon")+
  scale_color_gradient(low="green", high= "grey")+
  scale_size_continuous(range=c(200,300))

bull.richness <- read.csv("Bull_richness.csv")
ggplot(bull.richness, aes(x=GrowthStage, y=richness, color = Crop, fill= Fungicide)) +
  geom_boxplot() + 
  geom_point(position= position_jitterdodge()) +
  scale_fill_manual(values=c("orange", "blue"))+
  scale_color_manual(values=c("orange", "blue"))

#bars with SE error bars
ggplot(bull.richness, aes(x=GrowthStage, y=richness, fill= Fungicide)) +
  stat_summary(fun=mean, geom= "bar", position= "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge")


#line with SE error bars
ggplot(bull.richness, aes(x=GrowthStage, y=richness, group= Fungicide, color= Fungicide)) +
  stat_summary(fun=mean, geom= "line") +
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar")

#Facetting 
ggplot(bull.richness, aes(x=GrowthStage, y=richness, group= Fungicide, color= Fungicide)) +
  stat_summary(fun=mean, geom= "line") +
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar") +
  facet_wrap(~Crop*Treatment, scales = "free")

