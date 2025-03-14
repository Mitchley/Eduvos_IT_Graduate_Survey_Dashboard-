library(shiny)
library(shinydashboard)
library(DT)
library(plotly)
library(ggplot2)
library(tidyr)
library(stringr)

# UI Definition
ui <- dashboardPage(
  dashboardHeader(
    title = "Eduvos IT Graduates Survey Analysis", 
    titleWidth = 650,
    tags$li(class = "dropdown", 
            tags$a(
              href = "https://github.com/Mitchley",  
              target = "_blank", 
              icon("github"), 
              title = "GitHub"
            )
    )
  ),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("View Dataset", tabName = "dataset", icon = icon("table")),
      menuItem("Visualizations", icon = icon("chart-bar"),
               menuSubItem("Programming Languages by Field", tabName = "languages"),
               menuSubItem("Databases by Field", tabName = "databases"),
               menuSubItem("AI Search Tools by Field", tabName = "aisearch"),
               menuSubItem("AI Tools by Field", tabName = "aitools"),
               menuSubItem("Web Frameworks by Field", tabName = "frameworks"),
               menuSubItem("Platforms Used", tabName = "cloudPlatforms")
      )
    )
  ),
  
  dashboardBody(
    tags$head(tags$style(HTML("
      .content-wrapper { min-height: 100vh; padding: 20px; }
      .main-header, .main-sidebar { background-color: #3c8dbc; }
      h2 { text-align: center; }
    "))),
    
    tabItems(
      tabItem(tabName = "dataset", 
              tabBox(width = 12, 
                     tabPanel("About", icon = icon("address-card"),
                              fluidRow(column(12, tags$br(),
                                              tags$p("This dataset contains information about IT graduates from Eduvos."),
                                              tags$p("Columns:"),
                                              tags$ul(
                                                tags$li("ProgLang: Programming languages used."),
                                                tags$li("Databases: Databases used."),
                                                tags$li("AISearch: AI search tools utilized."),
                                                tags$li("AIToolCurrentlyUsing: Current AI tools used."),
                                                tags$li("WebFramework: Web frameworks employed."),
                                                tags$li("Platform: Platforms selected."),
                                                tags$li("StudyField: Field of study."),
                                                tags$li("Role: Job Title.")
                                              ),
                                              tags$p("Each respondent could select multiple tools, separated by a semicolon.")
                              )
                              )),
                     tabPanel("Data", dataTableOutput("dataTable"), icon = icon("table")), 
                     tabPanel("Structure", verbatimTextOutput("dataStructure"), icon = icon("uncharted")),
                     tabPanel("Summary Stats", verbatimTextOutput("datasetSummary"), icon = icon("chart-pie"))
              )
      ),
      tabItem(tabName = "languages", 
              h2("Top Programming Languages by Study Field"), 
              plotlyOutput("languagesPlot")),
      tabItem(tabName = "databases", 
              h2("Top Databases Used by Study Field"), 
              plotOutput("databasesPlot")),
      tabItem(tabName = "aisearch", 
              h2("Top AI Search Tools Used by Study Field"), 
              plotOutput("aisearchPlot")),
      tabItem(tabName = "aitools", 
              h2("Top AI Tools Used by Study Field"), 
              plotOutput("aitoolsPlot")),
      tabItem(tabName = "frameworks", 
              h2("Frequently Used Web Frameworks"), 
              plotlyOutput("frameworksPlot")),
      tabItem(tabName = "cloudPlatforms", 
              h2("Platforms Used by Study Field"), 
              plotOutput("cloudPlatformsPlot"))
    )
  )
)