
# Import libraries
library(shiny)
library(shinydashboard)
library(bslib)

# Import modules
source("modules/metadataTable_module.R")

# Define the UI
ui <- dashboardPage(
  skin = "black",
  header = dashboardHeader(title = "My Shiny Dashboard"),
  sidebar = dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem("Metadata Table", tabName = "metadata_table", icon = icon("table")),
      menuItem("PCA Plots", tabName = "pca_plots", icon = icon("chart-area")),
      menuItem("Correlation Matrices", tabName = "correlation_matrices", icon = icon("project-diagram")),
      menuItem("Volcano Plots", tabName = "volcano_plots", icon = icon("chart-bar")),
      menuItem("DEGs Table", tabName = "degs_table", icon = icon("table")),
      menuItem("GSEA Results", tabName = "gsea_results", icon = icon("table"))
    )
  ),
  body = dashboardBody(
    theme = bslib::bs_theme(bootswatch = "lux"),
    tabItems(
      tabItem(tabName = "metadata_table", metadataTableUI("metadataTable")),
      #tabItem(tabName = "metadata_table", verbatimTextOutput("metadataTable")),
      tabItem(tabName = "pca_plots", plotOutput("pcaPlot")),
      tabItem(tabName = "correlation_matrices", plotOutput("corrMatrix")),
      tabItem(tabName = "volcano_plots", plotOutput("volcanoPlot")),
      tabItem(tabName = "degs_table", verbatimTextOutput("degsTable")),
      tabItem(tabName = "gsea_results", verbatimTextOutput("gseaResults"))
    )
  )
)

# Define the server logic
server <- function(input, output) {
  metadataTableServer("metadataTable")
  #output$metadataTable <- renderPrint("Metadata Table goes here.")
  output$pcaPlot <- renderPlot(plot.new(), height = 300, width = 600)
  output$corrMatrix <- renderPlot(plot.new(), height = 300, width = 600)
  output$volcanoPlot <- renderPlot(plot.new(), height = 300, width = 600)
  output$degsTable <- renderPrint("DEGs Table goes here.")
  output$gseaResults <- renderPrint("GSEA Results go here.")
}

# Run the application 
shinyApp(ui = ui, server = server)
