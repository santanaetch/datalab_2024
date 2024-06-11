library(babynames)
bb_names<- babynames
library(dplyr)
library(ggplot2)
library(tidyverse)
Marie_1982<- bb_names %>%
  filter(name == 'Marie')%>%
  filter(year >= 1982)%>%
  filter(sex == 'F')%>%
  ggplot(data = Marie_1982, aes(x = year, y= n))+
  geom_line()


  Joe<- bb_names %>%
    filter(name == 'Joe')
  
    ggplot(data = Joe, aes(x = year, y= prop , color = sex))+
    geom_line(alpha = 0.5 ,size= 2 )+
      labs( title = 'M and F with the name Joe')

    
    bb_names<- babynames
pop_names_2002<-babynames%>%
  filter(sex == 'F')%>%
  filter(year == '2002')%>%
  arrange(desc(n))%>%
  head(10)
ggplot(data = pop_names_2002 , aes( x = name)) +
  geom_bar(fill = 'blue')


the_nineties <- bb_names %>%
  filter(year >= 1990, year <= 1999)
   write_csv(the_nineties , file = ' bbanmes_nineties.csv')
  
  
  





      