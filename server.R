library(shiny)
shinyServer(
      function(input, output) {
            library(ggplot2)
            output$gplot <- renderPlot({
                  cl <- as.numeric(input$cyl)
                  tr <- as.numeric(input$am)
                  if(cl==0) {df1 <- mtcars}
                  else {df1 <- mtcars[mtcars$cyl==cl,]}
                  if(tr==2) {df2 <- df1}
                  else {df2 <- df1[df1$am==tr,]}
                  ggplot(df2,aes(x=wt,y=mpg))+
                        geom_point()+
                        geom_smooth(method = 'lm')
            })
            output$descr <- renderText({
                  cl <- as.numeric(input$cyl)
                  tr <- as.numeric(input$am)
                  if(cl==0) {df1 <- mtcars}
                  else {df1 <- mtcars[mtcars$cyl==cl,]}
                  if(tr==2) {df2 <- df1}
                  else {df2 <- df1[df1$am==tr,]}
                  fit <- lm(formula=mpg~wt,data=df2)
                  paste0(c("Intercept: ","Slope: "),fit$coefficients)
            })
      }
)
