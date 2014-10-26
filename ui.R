library(shiny)
shinyUI(fluidPage(
  titlePanel("Text Sentiment Analysis. Sign is denotes sentiment. Number valus is sentiment magnitude"),
  sidebarPanel(
    h4('Simple Text Sentiment by Scoring against Words  '),
    textInput('sampleText', 'Sample sentence', value=''),
    h4('New Positive words'),
    textInput('posWords', 'New positive sentiment word', value=''),
    h4('New Negative words'),
    textInput('negWords', 'New negative sentiment word', value='')

  ),
  mainPanel(
    h4('Calculated Sentiment Score'),
    textOutput("sentiment"),
    br(),
    h4('Number Of Positive Words in database'),
    textOutput("numberOfPositiveWords"),
    br(),
    h4('Number Of Negative Words in database'),
    textOutput("numberOfNegativeWords"),
    br(),
    h4('Instructions'),
    helpText("This application is for simple sentiment analysis for text. User enter their text for analysis. A positive number is a postive sentiment. "),
    code("Sample Text"),
    helpText("Enter text."),
    code("New Positive Words"),
    helpText("Enter words that signals positive sentiment"),
    code("New Negative Words"),
    helpText("Enter words that signals negative sentiment")

  )
))
