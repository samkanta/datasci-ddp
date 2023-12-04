# server.R

library(shiny)

function(input, output) {
  
  # Reactive expression to filter the dataset based on the selected model
  filteredData <- reactive({
    subset(mtcars, rownames(mtcars) %in% c(input$model, "Toyota Corolla"))
    # Filter based on the selected row name and Toyota Corolla
  })
  
  # Render the scatter plot
  output$mpgPlot <- renderPlot({
    # Create the scatter plot with only x-axis
    plot(x = filteredData()$mpg,
         y = rep(1, nrow(filteredData())),  # Ensure all points are at y = 1
         main = paste("MPG comparisons between", input$model, "and Toyota Corolla"),
         xlab = "MPG",
         ylab = "",
         col = ifelse(rownames(filteredData()) == input$model, "blue", "green"), 
         pch = ifelse(rownames(filteredData()) == input$model, 19, 16),
         cex = ifelse(rownames(filteredData()) == input$model, 2, 2),
         xlim = c(0, 50),  # Set the X-axis limit from 0 to 50
         axes = FALSE  # Do not draw axes
    )
    
    # Label the data points
    text(x = filteredData()$mpg,
         y = rep(1, nrow(filteredData())),
         labels = paste(rownames(filteredData()), "\nMPG:", filteredData()$mpg),
         pos = 3, col = "black", cex = 0.8)
    
    # Draw only the x-axis
    axis(side = 1, at = seq(0, 50, by = 10))
  })
}
