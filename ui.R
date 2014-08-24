library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  pageWithSidebar(    
    
    # Give the page a title
    headerPanel("Chicken weight on diet"),    
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("chick", "Select chicken:", 
                    choices=levels(ChickWeight$Chick))
      ),
     
      # Create a spot for the barplot
      mainPanel(
        tabsetPanel(type = "tabs", 
                    tabPanel("Plot", plotOutput("phonePlot")), 
                    tabPanel("Summary", verbatimTextOutput("summary"))
        ) 
      )
)
)