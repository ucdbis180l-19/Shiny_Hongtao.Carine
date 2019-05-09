
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyverse)

tomato <- read.csv("Tomato.csv")
tomato <- tomato %>% 
  mutate(int = int1 + int2 + int3 + int4) %>% 
  select(species , alt , hyp , int , petleng , leafleng , leafnum , everything())

shinyServer(function(input, output) {
   
  output$boxPlot <- renderPlot({
    
    pl <- ggplot(data = tomato %>% filter(alt), 
                 aes_string(
                   x="species" ,
                   y=input$trait ,
                   fill="species"
                 )
    )
    
    pl + geom_boxplot()
    
  })
  
})
