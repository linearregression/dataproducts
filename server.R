library(shiny)
require(plyr) || install.packages('plyr') 
require(stringr) || || install.packages('stringr')
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

cleanse_tokenize <-function(sentence) {
  # normalize to lowercase, get rid of non english character segments
  # trim leading/trailing whitespace
  sentence <- tolower(str_trim(sentence))
  sentence = gsub('[[:punct:]]', '', sentence)
  sentence = gsub('[[:cntrl:]]', '', sentence)
  sentence = gsub('\\d+', '', sentence)
  # split into words. str_split is in the stringr package
  word.list = str_split(sentence, '\\s+') 
  # sometimes a list() is one level of hierarchy too much
  words = unlist(word.list)
  return(words)
}

calculateSentiment <- function (sampleText, posWords, negWords) 
{
  require(plyr)
  require(stringr)
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


