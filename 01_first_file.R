install.packages("usethis")
install.packages("gitcreds")
install.packages("here")
install.packages("tidyverse")
install.packages("medicaldata")
install.packages("cowplot")

read.csv("https://ispmbern.github.io/projects-in-R/data/raw/insurance_with_date.csv")

library(readr)

data <- read_csv("https://ispmbern.github.io/projects-in-R/data/raw/insurance_with_date.csv")

str(data)

library(stringr)

#Using the insurance data you loaded earlier…
data <- read_csv("https://ispmbern.github.io/projects-in-R/data/raw/insurance_with_date.csv")li
library(tidyverse)

#make factors out of the sex, and region
data <- data%>% mutate(sex2=factor(sex), region2=factor(region))
str(data)

#make logical indicators for “has more than 2 children” and “smokes”
data <- data%>% mutate(more_children=children>2) 
data <- data%>% mutate(smokes = smoker == "yes")
str(data)

#add 6 months to the date variable
data<- data%>% mutate(date_6m = date + months(6))
str(data)

library(ggplot2)

#load libraries 
library(dplyr)
library(lubridate)
library(readr)

#read data
covid <- read_csv("https://ispmbern.github.io/projects-in-R/data/raw/COVID19Cases_geoRegion.csv")
covid
library(ggplot2)

plot_covid_point_v0 <- ggplot(data = covid_cantons_2020, 
                              mapping = aes(x = datum, y = entries)) + 
  geom_point()

##Exercise 4A: basic plot

#Read Ebola data and sort it by date.
ebola<- read_csv("https://ispmbern.github.io/projects-in-R/data/raw/ebola.csv")
str(ebola)

#Determine what variables you need to include in your dataframe to make the type of plot shown below.
library(ggplot2)
plot_ebola <- ggplot(data = ebola,
                     mapping = aes(x=Date, y=Cum_conf_cases)) + geom_point()
plot_ebola

#Create a dataframe with the required variables and all data for 3 countries before 31 March 2015.
ebola <- ebola_Cum_conf_cases <- ebola%>%
  select(date=Date, country=Country, cum_conf_cases=Cum_conf_cases)%>%
  filter(date <= ymd("2015-03-31") + 
           (country == "Guinea" | country ==  "Liberia" | country == "Sierra Leone"))
ebola

#create point plot
plot_ebola_point <- ggplot(data = ebola,
                     mapping = aes(x=date, y=cum_conf_cases)) + geom_point(aes(group=country))
plot_ebola_point

#create line plot
plot_ebola_line <- ggplot(data = ebola,
                     mapping = aes(x=date, y=cum_conf_cases)) + geom_line(aes(group=country))
plot_ebola_line

plot_ebola_countries <- ggplot(data = ebola,
                     mapping = aes(x=date, y=cum_conf_cases)) + geom_point(aes(color=country))
plot_ebola_countries

#create column plot
plot_ebola_column <- ggplot(data = ebola,
                          mapping = aes(x=date, y=cum_conf_cases)) + 
  geom_col(#aes(group=country),
           
  position = "stack"
           )
plot_ebola_column

## Exercise 4C: colour and fill

#Change global aesthetics of the 3 plots you created in Exercise 4B.

#Point plot: Try different values for alpha, colour, fill, shape, size and stroke.
plot_ebola_point_color <- ggplot(data = ebola, 
                                mapping = aes(x=date,y=cum_conf_cases)) +
  geom_point(alpha = 0.7, colour = "black", fill = "pink", 
             shape = 21, size = 1.5, stroke = 1.0)
plot_ebola_point_color

#Line plot: Try different values for alpha, colour, linetype and linewidth.
plot_ebola_line_color <- ggplot(data = ebola, 
                                 mapping = aes(x=date,y=cum_conf_cases)) +
  geom_line(mapping = aes(group = country), 
            alpha = 0.7, colour = "yellow", linetype = "solid", linewidth = 2.0)
plot_ebola_line_color

#Column plot: Try different values for alpha, colour, fill, linetype, linewidth, position and width.
plot_ebola_column_color <- ggplot(data = ebola, 
                                  mapping = aes(x=date,y=cum_conf_cases)) +
  geom_col(position = "stack", alpha = 0.7, fill = "black", 
           linetype = "solid", linewidth = 0.5, width = 1.0)
plot_ebola_column_color











