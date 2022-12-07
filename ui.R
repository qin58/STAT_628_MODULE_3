library(shiny)
library(shinythemes)
library(tidyverse)
library(ggthemes)
library(ggplot2)

df = read_csv("full_data.csv")
kws = list('roast_beef', 'customer_service', 'freaky_fast', 'staff_friendly',
           'meat_cheese', 'hot_sauce', 'fresh_bread', 'lettuce_tomato',
           'cheese_steak', 'hot_pepper', 'meatball_sub', 'drive_thru',
           'great_service', 'italian_sub', 'online_order', '10_minute',
           '15_minute', '20_minute', '30_minute', 'bag_chip', 'one_star',
           'wont_back', 'turkey_bacon', 'big_kahuna', 'order_wrong')
histogram <- function(df) {
  ggplot(df, aes(x=compound)) +
    geom_histogram(color="black", fill="blue") +
    ggtitle("Distribution of Sentiment") 
}

ui <- fluidPage(
  tags$div(
    HTML("<h1 style='color:black;text-align:center;'>Yelp Review Sentiment Analysis of Sandwich Shops</h1>")
  ),  
  
  selectInput("State", label = "State", choices = unique(df$state), multiple = TRUE, selected = unique(df$state)),
  selectInput("Brand", label = "Brand", choices = unique(df$brand), multiple = TRUE, selected = unique(df$brand)),
  selectInput("Key_Words", label = "Kw", choices = kws, multiple = FALSE),
  
  textOutput("text"),
  plotOutput("hist"),
  "Thank you for using our app, if you have any questions, please contact: zou47@wisc.edu"
  #tableOutput('table')
)
