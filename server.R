library(shiny)
require(wordcloud) || install.packages('wordcloud')
require(ggplot2) || install.packages('ggplot2')
require(tm) || install.packages('tm')
require(tm.plugin.webmining) || install.packages('tm.plugin.webmining')
require(tm.plugin.sentiment) || install.packages("tm.plugin.sentiment", repos="http://R-Forge.R-project.org") 



shinyServer(
  function(input, output){
    output$rentalYield <- renderText({ calculateSentiment(input$weeklyRent, input$price) }),

    output$numberOfPositiveWords <- renderText({ 
             calculateNumPosWords(input$weeklyRent, input$price) 
             }),


    output$numberOfNegativeWords <- renderText({ 
             calculateNumNegWords(input$weeklyRent, input$price) 
             })




  }
)

calculateSentiment <- function (weeklyRent, propertyPrice) 
{
  result <- weeklyRent * 52 / propertyPrice * 100
  return(round(result, digits = 2))
}

calculateNumPosWords <- function(weeklyRent, strata, council, water, managementFees, weeklyRepayments)
{
  pos.words = c(hu.liu.pos, 'upgrade')
  return(round(result, digits = 2))
}

calculateNumNegWords <- function(weeklyRent, strata, council, water, managementFees, weeklyRepayments)
{
  neg.words = c(hu.liu.pos, 'upgrade')
  return(round(result, digits = 2))
}

