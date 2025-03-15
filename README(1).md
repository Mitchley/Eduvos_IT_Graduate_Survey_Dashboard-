
## Title
Eduvos IT Graduate Survey Analysis

## Description
The Eduvos Graduate Dashboard is designed to analyze survey data from IT graduates at Eduvos. Utilizing the insights from this analysis, the dashboard helps Eduvos provide relevant course material to enhance the educational experience.

## Dataset
The dashboard is built using the dataset **GraduateSurvey.csv**, which contains information about graduates, including their responses regarding programming languages, databases, AI tools, and more.

## Files
- **GraduateSurvey.csv**: The dataset used for analysis.
- **ui.r**: Contains the user interface components of the dashboard.
- **server.r**: Contains the server logic for processing data and rendering visualizations.
- **app**: The main application file that ties together the UI and server.

## Features
- dashboard contains tabs that the user can click on
- the user can hover over any graph under visiualisations tab  to see more about each data point in the graph

## Usage
To run the dashboard, execute the following command in R

#load necessary library
library(shiny)

#Run the application
shiny::runApp("app")
## License

School assignment given by Eduvos Higher Institution


