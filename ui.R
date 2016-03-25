## ui.R
shinyUI(pageWithSidebar(
    headerPanel(HTML('A sunburst chart in d3')),
    
    sidebarPanel(
        checkboxInput(
            inputId = 'dataSource',
            label = 'Select file.',
            value = FALSE
        ),
        
        conditionalPanel(
            condition = 'input.dataSource == false',
            textInput(inputId='url', label='File URL:', value='./visit-sequences.csv')
        ),
        
        conditionalPanel(
            condition = 'input.dataSource == true',
            fileInput(inputId = 'file', label='Data to plot:')
        )
    ),
    
    mainPanel(
        includeScript('./www/sequences.js'),
        includeCSS('./www/sequences.css'),
        includeHTML('./www/index.html')
    )
))