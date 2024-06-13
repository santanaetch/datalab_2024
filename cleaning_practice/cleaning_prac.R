# set working directory

# load libraries
library(tidyverse)
library(dplyr)
#load in the data
messy_dives <- read_csv('whalesmessy.csv')
#get rid of na's
names(messy_dives)
messy_dives<-na.omit(messy_dives)
names(messy_dives)<-(c('species_id',
                       'bhvr',
                       'preyvol',
                       'preydepth',
                       'dive_time',
                       'surfacetime',
                       'blow_interval',
                       'blow_number_count',
                       'year',
                       'month',
                       'day',
                       'sit'
))
#correct the dates and such
messy_dives<-messy_dives %>%
  mutate(year=ifelse(nchar(year)<4, paste0(20, year), year)) %>%
  mutate(day=ifelse(nchar(day)<2, paste0(0, day), day)) %>%
  mutate(month=ifelse(nchar(month)<2, paste0(0, month), month)) %>%
  mutate(id=paste0(year, month, day, substr(sit, 10, 12))) %>%
  mutate(bhvr=toupper(bhvr)) %>%
  filter(nchar(species_id)==2) %>%
  filter(nchar(bhvr)>3) %>%
  select(id, species_id, everything()) %>%
  arrange(id)
messy_dives <- subset(messy_dives, select = -year)
messy_dives <- subset(messy_dives, select = -month)
messy_dives <- subset(messy_dives, select = -day)
messy_dives <- subset(messy_dives, select = -sit)
