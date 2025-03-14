library(shiny)
library(dplyr)
library(DT)
library(plotly)
library(ggplot2)
library(tidyr)
library(stringr)
library(reshape2)

# Load the dataset
GraduateSurvey <- read.csv("C:\\Users\\dinne\\OneDrive\\Documents\\Eduvos_Dashboard\\GraduateSurvey.csv")

server <- function(input, output) {
  # Render Data Table
  output$dataTable <- DT::renderDataTable(DT::datatable(GraduateSurvey))
  
  create_plot <- function(column, title) {
    ggplot(GraduateSurvey %>%
             mutate(!!sym(column) := str_split(!!sym(column), ";")) %>%
             unnest(!!sym(column)) %>%
             group_by(StudyField, !!sym(column)) %>%
             summarise(Count = n(), .groups = 'drop'), 
           aes(x = reorder(!!sym(column), Count), y = Count, fill = StudyField)) +
      geom_bar(stat = "identity", position = position_dodge(), width = 0.9) +
      coord_flip() +
      labs(title = title, x = "Items", y = "Count by Study Field") +
      scale_fill_manual(values = c("Computer Science" = "red", "Data Science" = "blue", "IT" = "green")) +
      theme_minimal() +
      theme(legend.position = "top")
  }
  
  # Render Plots
  output$languagesPlot <- renderPlotly(create_plot("ProgLang", "Top Programming Languages by Study Field") %>% ggplotly())
  output$databasesPlot <- renderPlot(create_plot("Databases", "Top Databases Used by Study Field"))
  output$aisearchPlot <- renderPlot(create_plot("AISearch", "Top AI Search Tools Used by Study Field"))
  output$aitoolsPlot <- renderPlot(create_plot("AIToolCurrentlyUsing", "Top AI Tools Used by Study Field"))
  output$frameworksPlot <- renderPlotly(create_plot("WebFramework", "Frequently Used Web Frameworks") %>% ggplotly())
  
  # Top Platforms Used Plot
  output$cloudPlatformsPlot <- renderPlotly(create_plot("Platform", "Top Cloud Platforms Used by Study Field") %>% ggplotly())
  
  # Summary Outputs
  output$summaryStats <- renderPrint(summary(GraduateSurvey))
  output$dataStructure <- renderPrint(str(GraduateSurvey))
  output$datasetSummary <- renderPrint(summary(GraduateSurvey))
}