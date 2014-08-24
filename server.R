library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
  dataset<- subset(ChickWeight, ChickWeight$Chick==input$chick)
    # Render a barplot
    plot(weight ~ Time, dataset,
            ylab="Weight",
            xlab="Days since first measurement")
    lines(weight ~ Time, dataset)
  })
  output$summary <- renderPrint({
    dataset<- subset(ChickWeight, ChickWeight$Chick==input$chick)
    paste("This chicken followed diet",dataset[1,4],"and had a growth ratio of ",round((max(dataset$weight)-min(dataset$weight))/max(dataset$weight)*100,2),"%. ")
  })
})