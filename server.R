library(shiny)
require(plyr) || install.packages('plyr') 
require(stringr) || install.packages('stringr')
require(wordcloud) || install.packages('wordcloud')
require(ggplot2) || install.packages('ggplot2')
require(tm) || install.packages('tm')
require(tm.plugin.webmining) || install.packages('tm.plugin.webmining')
require(tm.plugin.sentiment) || install.packages("tm.plugin.sentiment", repos="http://R-Forge.R-project.org") 



shinyServer(
  function(input, output){
    uci.dataset.pos <- scan('data/positive-words.txt', what='character', comment.char=';')
    uci.dataset.neg <- scan('data/negative-words.txt', what='character', comment.char=';')
    output$sentiment <- renderText(
             { calculateSentiment(input$sampleText,
                                  input$posWords,
                                  input$negWords,
                                  uci.dataset.pos,
                                  uci.dataset.neg
             ) })

    output$numberOfPositiveWords <- renderText({ 
             calculateNumPosWords(input$posWords, uci.dataset.pos) 
             })


    output$numberOfNegativeWords <- renderText({ 
             calculateNumNegWords(input$negWords, uci.dataset.neg) 
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
  words <- unlist(word.list)
  return(as.character(words))
}

calculateSentiment <- function (sampleText, posWords, negWords, 
                                posWordsDb, negWordsDb ) 
{
  word.list <- cleanse_tokenize(sampleText)
 
  if(length(word.list) > 1) {
     posWords <- cleanse_tokenize(posWords)
     negWords <- cleanse_tokenize(negWords) 
     pos.words <- ifelse(length(posWords), unique(c(posWords, posWordsDb)), posWordsDb) 
     neg.words <- ifelse(length(negWords), unique(c(negWords, negWordsDb)), negWordsDb)

     # compare word vectors from sentence against positve and negative word vectos

     pos.matches <- match(word.list, pos.words)
     neg.matches <- match(word.list, neg.words)
print(pos.matches)
print(neg.matches)
     # create word vector that denoted matches to postive and negative word vectors
     pos_matches <- is.na(pos.matches)
     neg_matches <- !is.na(neg.matches)
print('***')
print(pos.matches)
print(neg.matches)
print('***')
     score <- sum(pos_matches) - sum(neg_matches)
     return(round(score, digits = 3))
  }
  return(0)
}

calculateNumPosWords <- function(posWords, posWordsDb)
{
  posWords <- cleanse_tokenize(posWords)
  pos.words <- c(posWords, posWordsDb)
  result <- length(pos.words)
  return(result)
}

calculateNumNegWords <- function(negWords, negWordsDb )
{
  negWords <- cleanse_tokenize(negWords)
  neg.words <- c(negWords, negWordsDb )
  result <- length(neg.words)
  return(result)
}


