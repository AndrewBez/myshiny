library(shiny)
shinyUI(pageWithSidebar(
      headerPanel("MPG regression model"),
      sidebarPanel(
            h4("Description: 
               This app builds the regression model on the subset of mtcars dataset that is an R build in dataset. 
               The MpG variable is used as the outcome and the weight variable is used as the regressor.
               The dataset can be subsetted by either number of cylinders or transmission type or both."),
            selectInput("cyl",label = "Select Cylinder Number", choices = list("4"=4,"6"=6,"8"=8,"all"=0), selected = 0),
            radioButtons("am",label = "Select Transmission Type", choices = list("Auto"=0,"Manual"=1,"Both"=2),selected = 2)
            ),
      mainPanel(
            h3('Regression Model'),
            plotOutput(outputId="gplot"),
            textOutput(output="descr")
      )
      ))
