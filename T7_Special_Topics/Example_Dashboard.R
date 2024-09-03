# install.packages("shiny")
# install.packages("bs4Dash")

library(shiny)
library(bs4Dash)

library(ggplot2)
library(dplyr)
library(readxl)
library(plotly)
library(ggformula)

ui = dashboardPage(
  
  header = dashboardHeader(
    title = "Mi primer dashboard"  
  ),
  
  sidebar = dashboardSidebar(),
  body = dashboardBody(
    fluidRow(
      
      box(
        title = "Unique Birds Found at each Location", 
        width = 12, 
        status = "olive",
        collapsible = FALSE, 
        ribbon(
          text = "NEW",
          color = "olive"
        ),
        
        plotlyOutput("histograma")
      )
      
    )
    
  )
  
  
  
)

server = function(input, output){
  
  auto_data = read_excel("auto_dataset.xlsx")
  
  histogram_mpg = gf_histogram( ~ mpg, data = auto_data, fill = "darkblue", color = "black") 
  histogram_mpg = histogram_mpg + labs(title = "Distribución de milas por galón de los autos", x = "Millas por galón", y = "Frecuencia")
  histogram_mpg = histogram_mpg + theme(axis.text=element_text(size=20), axis.title=element_text(size=20),
                                        plot.title=element_text(size=25))
  output$histograma = histogram_mpg
}

shinyApp(ui, server)