library(tidyverse)
library(janitor)
library(GGally)
library(here)
library(kableExtra)

path <- here("data", "winequality-red.csv")
wine <- read_csv(path)
wine 

wine %>% 
  clean_names() -> wine

glimpse(wine)
summary(wine)


ggplot(wine, aes(quality)) +
  geom_bar() 

ggplot(wine, aes(quality, fill = quality)) +
  geom_bar(fill = seq(1, 6, 1)) +
  geom_text(position = "stack", stat='count', aes(label=..count..), vjust = -0.5) +
  theme(plot.title=element_text(hjust=0.5)) +
  labs(x="Wine Quality",
       y="Observations",
       title = "Red Wine Quality Ratings Distribution")



ggplot(wine, aes(citric_acid, quality , alpha = 0.4)) +
  geom_jitter()

wine %>% 
  mutate(quality = as.factor(quality)) %>% 
  ggpairs(aes(color = quality, alpha=0.4),
          columns=1:7,
          lower=list(continuous="points"),
          upper=list(continuous="blank"),
          axisLabels="none", switch="both")

kable(head(wine,10), "html") %>%
  kable_styling(bootstrap_options = "striped", full_width = F, position = "left")



