
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
                   c("Hypocotyl Length (cm)" = "hyp",
                     "Internode Length (cm)" = "int",
                     "Petal Length (cm)" = "petleng",
                     "Leaf Length (cm)" = "leafleng",
                     "Leaf Number"= "leafnum")
                   ),
      
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
