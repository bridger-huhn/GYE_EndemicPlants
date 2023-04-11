require(tidyverse)
require(plotly)
require(brms)

d<- read.csv("/Users/bridgerhuhn/Documents/Research/GYE_Endemics/DATA/Isotope_data/CSVs/Summer_2021.csv")[-94,] %>% rename(Rarity = X)
d2<- read.csv("/Users/bridgerhuhn/Documents/Research/GYE_Endemics/DATA/Isotope_data/CSVs/Summer_2021_o_h.csv")[-(69:93),] %>% filter(hab != "") %>% mutate(Rarity = NA)

for (i in 1:nrow(d)) {
  ifelse(d$spp[i] == "wl"|d$spp[i]== "t ast"|d$spp[i]== "pea"|d$spp[i] == "abs pen", d$Rarity[i] <- "R", d$Rarity[i] <-"C")
}

for (i in 1:nrow(d2)) {
  ifelse(d2$spp[i] == "wl"|d2$spp[i]== "t ast"|d2$spp[i]== "pea"|d2$spp[i] == "abs pen", d2$Rarity[i] <- "R", d2$Rarity[i] <-"C")
}

ggplot(data = d %>% filter(hab == "r"), aes(x = Rarity, y = Wt..S., fill = Rarity))+
  geom_boxplot()

brm(Wt..S.~hab, data = d)
