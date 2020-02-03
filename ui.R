library(shiny)
shinyUI(pageWithSidebar(
      headerPanel("MPG regression model"),
      sidebarPanel(
            h3('Subset by attributes'),
            selectInput("cyl",label = "Cylinder Number", choices = list("4"=4,"6"=6,"8"=8,"all"=0), selected = 0),
            radioButtons("am",label = "Transmission Type", choices = list("Auto"=0,"Manual"=1,"Both"=2),selected = 2)
      ),
      mainPanel(
            h3('Regression Model'),
            plotOutput(outputId="gplot")
      )
))
