######## aggiusto dati terna per poterli usare nei tutorial ###############


### apertura librerie ###

library(tidyverse)
library(lubridate)

### apertura dati ###

terna16 <- read.csv("terna_data/2016.csv", sep=";")[,-1]
terna17 <- read.csv("terna_data/2017.csv", sep=";")[,-1]
terna18 <- read.csv("terna_data/2018.csv", sep=";")[,-1]
terna19 <- read.csv("terna_data/2019.csv", sep=";")[,-1]
terna20 <- read.csv("terna_data/2020.csv", sep = ";")[,-1]
terna21 <- read.csv("terna_data/2021.csv", sep=";")[,-1]
  
### modifica ###

terna_all <- rbind(terna16,terna17,terna18,terna19,terna20,terna21) %>% 
  rename(generation.GWh = Renewable.Generation..GWh., 
         source = Energy.Source) %>% 
  mutate(generation.GWh =as.numeric(gsub(",",".",generation.GWh)),
         Date = dmy_hm(Date), 
         Month = format(Date, format="%m"), 
         Day = format(Date, format="%d"),
         Year = format(Date, format="%Y"))

daily_avg <- terna_all %>%
  group_by(Day, Month, Year, source) %>% 
  summarise(generation_avg_daily = mean(generation.GWh)) %>% 
  spread(source,generation_avg_daily) %>% 
  mutate(date = dmy(paste(Day, Month, Year, sep="/"))) %>% 
  ungroup() %>%
  select(-Day,-Month,-Year) %>% 
  arrange(date)

write.csv(daily_avg, "terna_data/TERNA_renewables_daily_avg.csv")
