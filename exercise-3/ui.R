# UI for scatterplot
library(shiny)
library(plotly)
# Get a vector of column names (from `mpg`) to use as select inputs
select_values <- colnames(mpg)

# Create a shinyUI with a `fluidPage` layout
ui <-shinyUI(navbarPage(
  "Info",
  tabPanel( "Graph",
    sidebarLayout(
      sidebarPanel(
  
  # Add a select input for the x variable
selectInput("x_var", label = "X Variable", choices = select_values,
            selected = "displ"),
  
  # Add a select input for the y variable
selectInput("y_var", label = "Y Variable", choices = select_values,
            selected = "cyl"),

  # Add a sliderInput to set the size of each point
sliderInput("size", label= "Size of Input", min = 1, max = 10, value = 5 ),

  # Add a selectInput that allows you to select a color from a list of choices
selectInput("color", label = "Color of Input", 
            choices = list("Red" = "red", "Blue" = "blue", "Green" = "green")
),
  # Plot the output with the name "scatter"
        mainPanel(plotOutput("scatter"))
      )
    )
  )
))
shinyUI(ui) 