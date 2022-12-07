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
    geom_histogram(color="black", fill="white") +
    ggtitle("Distribution of Sentiment") 
}

server <- function(input, output) {
  
  
  output$text <- renderText({
    paste("Median Sentiment (between -1 and 1): ",
          median(df$compound[df$brand %in% input$Brand & df$state %in% input$State & df[colnames(df) == input$Key_Words] == 1]),
          sep = "")
    
  }) 
  
  output$hist <- renderPlot({
    histogram(df[df$brand %in% input$Brand & df$state %in% input$State & df[colnames(df) == input$Key_Words] == 1, ])
  })
  #output$table <- renderTable(df[df$state %in% input$State & df[colnames(df) == input$Key_Words] == 1, ])
}