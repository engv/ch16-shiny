### Exercise 3 ###

library(shiny)
library(ggplot2)
# Create a shiny server that creates a scatterplot. 
server <- shinyServer(function(input, output) {
  output$scatter <- renderPlot({
    
# It should take as an input the x_var, y_var, color, and size
# Save the result of `renderPlot` to output$scatter

    # Store x and y values to plot
x <- mpg[[input$x_var]]
y <- mpg[[input$y_var]]

    # Store the title of the graph in a variable
title <- paste0(input$x_var, "vs", input$y_var)
    
    # Create ggplot scatter
plot <- ggplot() + geom_point(mapping = aes(x=x, y=y), 
             size = input$size,
             color = input$color) +
  labs(x= input$x_var, y = input$y_var, title = title)
  })
})
shinyServer(server)
