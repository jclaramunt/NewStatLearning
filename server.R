#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(knitr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  source("parameters_questions.R")
  
  shinyjs::runjs("window.scrollTo(0, 0)")
  curr.val <- "" # Corresponds to the current displayed input$myinput
  curr.butt  <- 0  # Corresponds to the last known button value (integer)

  
  
  observeEvent(input$side_but, {
    
    shinyjs::removeClass(selector = "body", class = "sidebar-collapse")
    shinyjs::runjs("window.scrollTo(0, 0)")
    
  })
  

  
  
  observeEvent(input$next_but,{
    


    shinyjs::addClass(selector = "body", class = "sidebar-collapse")
    shinyjs::runjs("window.scrollTo(0, 0)")
    
    if(input$Test=="rand_test"){
      test<-sample(x=c("chi", "good", "t_one", "t_two", "t_paired", "rsum", "srank"),size=1)
    }else{
      test<-input$Test
    }
    

    output$questionText<-renderUI({


      params_questions<<-parameters_questions(test=test,question=1)

      withMathJax(HTML(markdown::markdownToHTML(knitr::knit(paste0(getwd(),'/',test,'/','question',1,'.Rmd'),
                                                quiet = TRUE),stylesheet = 'questions.css')))


    })

    shinyjs::runjs("window.scrollTo(0, 0)")
    

  })
  
  
  
  
  observeEvent(input$quest_but,{
    

      shinyjs::addClass(selector = "body", class = "sidebar-collapse")
      shinyjs::runjs("window.scrollTo(0, 0)")
      
      if(input$Test=="rand_test"){
        test<-sample(x=c("chi", "z_one", "t_one", "t_two", "z_means"),size=1)
      }else{
        test<-input$Test
      }
      
      
      output$questionText<-renderUI({
        
        
        params_questions<<-parameters_questions(test=test,question=1)
        
        withMathJax(HTML(markdown::markdownToHTML(knitr::knit(paste0(getwd(),'/',test,'/','question',1,'.Rmd'),
                                                              quiet = TRUE),stylesheet = 'questions.css')))
        
        
      })
      
      shinyjs::runjs("window.scrollTo(0, 0)")
    
    
  })
  

  

  
  
  
})
