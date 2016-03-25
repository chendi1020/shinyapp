## ui.R
library(sunburstR)
shinyUI(pageWithSidebar(
    headerPanel(HTML('A sunburst chart in d3')),
    
    sidebarPanel(
        checkboxInput(
            inputId = 'dataSource',
            label = 'Select file.',
            value = FALSE
        ),
        
        
        
        conditionalPanel(
            condition = 'input.dataSource == true',
            fileInput(inputId = 'file', label='Data to plot:')
        )
    ),
    
    mainPanel(
     sunburstOutput('sunburst')
        
    )
))