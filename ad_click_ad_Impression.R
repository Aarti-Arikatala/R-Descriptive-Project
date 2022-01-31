rm(list = ls())
library(plyr)
library(readr)
library(dplyr)
install.packages("caret")
library(caret)

data<-read.csv(file.choose())
data$user_gender <- as.factor(data$user_gender)
summary(data$user_gender)


data$brand <- as.factor(data$brand)
s<-summary(data$brand)

write.csv(s,"brand_summary.csv")

data$user_gender <- as.factor(data$user_gender)

ggplot(data, aes(x =user_age_group)) +
  geom_bar()

ggplot(data, aes(x =user_gender)) +
  geom_bar()

# scale_fill_manual(values=c('grey', 'blue', '#d499b4')


data$activity_type <- as.factor(data$activity_type)
summary(data$activity_type)

 #visualizing activity type for each age group
install.packages("janitor")
library(janitor)
data_count<-tabyl(data, user_age_group, activity_type)

data_count

data_percent<-tabyl(data, user_age_group, activity_type) %>%
  adorn_percentages("col") %>%
  adorn_pct_formatting(digits = 1)

data_percent

#ggplot(data = data_count) + 
  #geom_point(mapping = aes(x = user_age_group, y = adclick))

ggplot(data, mapping = aes(x = user_age_group, fill = activity_type)) + 
  geom_bar(alpha = 3/5, position = "identity")

