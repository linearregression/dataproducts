library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Text Sentiment Analysis"),
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
    h4('numberOfPositiveWords'),
    textOutput("numberOfPositiveWords"),
    h4('numberOfNegativeWords'),
    textOutput("numberOfNegativeWords"),
    br(),
    h4('Instructions'),
    helpText("This application is for simple sentiment analysis for text. User enter their text for analysis "),
    code("Sample Text"),
    helpText("Enter text."),
    code("New Positive Words"),
    helpText("Enter words that signals positive sentiment"),
    code("New Negative Words"),
    helpText("Enter words that signals negative sentiment")

  )
))
