install.packages('rsconnect')

rsconnect::setAccountInfo(name='kkunicka2',
                          token='2CC62EFEB1764B39D6402225DB125A1A',
                          secret='C1a5x+vS9kJ4ZlPnOogwy52sS7u2f8ccbAjYpNIe')
# Load packages ----
library(shiny)
library(shinythemes)

# User interface ----
ui <- fluidPage(
    theme = shinytheme("superhero"),
    titlePanel("Zadanie 5"),
    
    sidebarLayout(
        sidebarPanel(
            textInput("text",
                      label = "Wpisz tekst ponizej:", 
                      value = "lorem ipsum"),
            numericInput("num", 
                         label = "Wybierz numer od 0 do 100:", 
                         min = 0, max = 100, value = 50),
            selectInput("var", 
                        label = "Wybierz litere od A do K:",
                        choices = c("A","B","C","D","E","F","G","H","I","J","K"),
                        selected = "A"),
        ),
        
        mainPanel(h3("Ponizej wpisany tekst, wybrany numer i litera"),
                  br(),
                  tags$code(textOutput("selected_text")),
                  tags$strong(textOutput("selected_num")),
                  tags$em(textOutput("selected_var")))
    )
)

# Server logic ----
server <- function(input, output) {
    output$selected_text <- renderText({ 
        paste("Wpisany tekst:", input$text)
    })
    output$selected_num <- renderText({ 
        paste("Wybrany numer:", input$num)
    })
    output$selected_var <- renderText({ 
        paste("Wybrana litera:", input$var)
    })
}

# Run app ----
shinyApp(ui, server)