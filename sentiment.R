library(ggplot2)
library(dplyr)
library(tidytext)
library(gsheet)
install.packages("tidytext")
library(tidytext)
library(wordcloud2)
library(sentimentr)
library(lubridate)
survey <- gsheet::gsheet2tbl('https://docs.google.com/spreadsheets/d/1W9eGIihIHppys3LZe5FNbUuaIi_tfdscIq521lidRBU/edit?usp=sharing')
# Take a look at the first few rows of the data. What is the unit of observation?
# the unit of observation is dreams and feelings?

survey <- survey %>%
  mutate(date_time = mdy_hms(Timestamp))

ggplot(data = survey , aes(x= date_time))+
  geom_histogram()

sentiments <- get_sentiments('bing')
#How many rows? How many columns? What is the unit of observation.
nrow(sentiments)
ncol(sentiments)


words <- survey %>%
  dplyr::select(first_name,
                feeling_num,
                feeling) %>%
  unnest_tokens(word, feeling)
wordcloud2(word_freq)

sw <- read_csv('https://raw.githubusercontent.com/databrew/intro-to-data-science/main/data/stopwords.csv')
# Explore it a bit.
#its a bunch of words
# i am removing the repeating words
no_rep<-word_freq%>%
  filter(!word %in% sw$word)
wordcloud2(no_rep)

#Make an object with the top 10 words used only. 

head(no_rep)


