## server.R


library(sunburstR)


dd<- read.csv('gpa.csv')

shinyServer(function(input, output) {
  output$sunburst <-renderSunburst(sunburst(dd, width = 300, height = 300, 
                                            
                                            percent = T,
                                            count = F) )
})