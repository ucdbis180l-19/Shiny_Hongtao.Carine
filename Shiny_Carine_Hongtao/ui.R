#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Tomato Data"),
  
  helpText("This application creates a boxplot to show difference between",
           "tomato traits in differnt altitude ranges.  Please use the radio box below to choose a trait",
           "for plotting, then use the slider to select altitude range"),
  
  # Sidebar with a slider input 
  sidebarLayout(
    sidebarPanel(
      radioButtons("trait",
                   "Choose a trait to display, then use slider to select Altitude range:",
                   c("hyp", "int", "petleng", "leafleng", "leafnum"), 
                   choiceNames = c("Hypocotyl Length (cm)", "Cummulative Internode Length(cm)", "Petal Length (cm)", "Leaf Length (cm)", "Leaf Number")),
      sliderInput("alt",
                   "Altitude range:",
                   min = 0,
                   max = 3540,
                   value = c(800, 1200))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("boxPlot")
    )
  )
))
