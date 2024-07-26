library(shinydashboard)
library(shinyhelper)
library(leaflet)
library(shiny)
library(ggplot2)
library(shinyjs)
library(kableExtra)
library(pracma)






sidebar<-dashboardSidebar(
  width = 250,
  fluidPage(
    title = 'Introduce your choices',
    
    radioButtons('Test', 'Select the test', list('One sample t test'="t_one", 'Independent samples t test'="t_two", 'Paired samples t test'="t_paired", 'Chi squared test'="chi", 'Goodness of fit'="good", 'Wilcoxon rank sum'="rsum", 'Wilcoxon signed rank'="srank", 'Random'="rand_test"), selected=character(0), width = 500),
    br(),
    actionButton(inputId='quest_but', label='New exercise', icon=icon("arrow-alt-circle-right", class = "arrowmark"))
    
  )
  
)

body <- dashboardBody(
  tags$head(tags$style(HTML('/* body */
                                .content-wrapper, .right-side {
                            background-color: #FFFAFA;}'
                            ))),
  shinyjs::useShinyjs(),
  tags$script('
                  $(document).on("keydown", function (e) {
                  Shiny.onInputChange("lastkeypresscode", e.keyCode);
                  });
                  '),

  htmlOutput(outputId='questionText'),
  br(),
  fluidRow(column(width=2,offset = 1, actionButton(inputId='next_but', label='New exercise', icon=icon("arrow-alt-circle-right", class = "arrowmark")),
                  tags$head(tags$style("#next_but{font-size:18px; height:50px; width:250px; background-color:orange}"))
                  
  ),
  column(width=2,offset = 3, actionButton(inputId='side_but', label='Select a different test', icon=icon("bars")),
  tags$head(tags$style("#side_but{font-size:18px; height:50px; width:250px; background-color:cyan}"))))
  

  )

dashboardPage(
  #skin = "red",
  #header,
  #help,
  dashboardHeader(disable=TRUE),
  sidebar,
  body,
  title = "Inferential statistics"
)




