library(shiny)
require(wordcloud) || install.packages('wordcloud')
require(ggplot2) || install.packages('ggplot2')
require(tm) || install.packages('tm')
require(tm.plugin.webmining) || install.packages('tm.plugin.webmining')
require(tm.plugin.sentiment) || install.packages("tm.plugin.sentiment", repos="http://R-Forge.R-project.org") 



shinyServer(
  function(input, output){
    output$sentiment <- renderText(
             { calculateSentiment(input$sampleText,
                                  input$posWords,
                                  input$negWords
             ) })

    output$numberOfPositiveWords <- renderText({ 
             calculateNumPosWords(input$posWords) 
             })


    output$numberOfNegativeWords <- renderText({ 
             calculateNumNegWords(input$negWords) 
             })




  }
)

calculateSentiment <- function (sampleText, posWords, negWords) 
{
  result <- weeklyRent * 52 / propertyPrice * 100
  return(round(result, digits = 2))
}

calculateNumPosWords <- function(posWords)
{
  pos.words = c(hu.liu.pos, 'upgrade')
  return(round(result, digits = 2))
}

calculateNumNegWords <- function(negWords)
{
  pos.words = c(hu.liu.pos, 'upgrade')
  return(round(result, digits = 2))
}


