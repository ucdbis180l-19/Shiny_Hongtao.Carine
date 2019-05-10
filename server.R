library(shiny)
library(ggplot2)
library(tidyverse)

# Import the tomato data into R
tomato <- read.csv("Tomato.csv")
tomato <- tomato %>% 
  mutate(int = int1 + int2 + int3 + int4) %>% 
  select(species , alt , hyp , int , petleng , leafleng , leafnum , everything())

shinyServer(function(input, output) {
   
  output$boxPlot <- renderPlot({
    
    # Draw a ggplot, using species as x-axis, different traits as y-axis, filtered by altitude
    pl <- ggplot(data = tomato %>% filter(alt >= min(input$alt) & alt <= max(input$alt)), 
                 aes_string(
                   x="species" ,
                   y=input$trait ,
                   fill="species"
                 )
    )
    
    # Here we choose a boxplot
    pl + geom_boxplot()
    
  })
  
})
