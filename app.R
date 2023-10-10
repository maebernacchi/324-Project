library(shiny)
library(magrittr)
library(readxl)
library(wordcloud)
library(shinythemes)
library(ggplot2)
library(gridExtra)
library(bslib)

# Define UI for application



ui <- fluidPage(
  includeCSS("minty.css"),

    # Application title
    titlePanel("How Spending per Student Impacts Average Standardized Test Scores"),

    # Sidebar with a slider input for number of bins 

        # Show a plot of the generated distribution
        mainPanel(
          tabsetPanel(type = "tabs",
                      tabPanel("West",
                               titlePanel("Statistics for the West"),
                               sidebarPanel("This includes California, Washington, Oregon, Nevada, Idaho, Montana, Utah, and Wyoming"), 
                               mainPanel("",
                                         plotOutput("weas"),
                                         plotOutput("westFourMathEPS"),
                                         plotOutput("westFourReadEPS"),
                                         plotOutput("westEightMathEPS"),
                                         plotOutput("westEightReadEPS")
                                         )
                               ),
                      tabPanel("Midwest",
                               titlePanel("Statistics for the Midwest"),
                               sidebarPanel("This includes North Dakota, South Dakota, Nebraska, Kansas, Minnesota, Iowa, Missouri, Illinois, Indiana, Michigan, and Ohio"), 
                               mainPanel("",
                                         plotOutput("Midweas"),
                                         plotOutput("midWestFourMathEPS"),
                                         plotOutput("midWestFourReadEPS"),
                                         plotOutput("midWestEightMathEPS"),
                                         plotOutput("midWestEightReadEPS")
                               )
                               ),
                      tabPanel("Northeast",
                               titlePanel("Statistics for the Northeast"),
                               sidebarPanel("This includes Pennsylvania, New Jersey, New York, Conneticut, Rhode Island, Massachusets, New Hampshire, Vermont, and Maine"), 
                               mainPanel("",
                                         plotOutput("NEweas"),
                                         plotOutput("northeastFourMathEPS"),
                                         plotOutput("northeastFourReadEPS"),
                                         plotOutput("northeastEightMathEPS"),
                                         plotOutput("northeastEightReadEPS")
                               )
                               ),
                      tabPanel("Southeast",
                               titlePanel("Statistics for the Southeast"),
                               sidebarPanel("This includes Arkansas, Louisiana, Mississippi, Alabama, Tennessee, Kentucky, Georgia, Florida, South Carolina, North Carolina, Virgina, West Virgina, Maryland, and Deleware"),
                               mainPanel("",
                                         plotOutput("SEweas"),
                                         plotOutput("southeastFourMathEPS"),
                                         plotOutput("southeastFourReadEPS"),
                                         plotOutput("southeastEightMathEPS"),
                                         plotOutput("southeastEightReadEPS")
                               )
                               ),
                      tabPanel("Southwest",
                               titlePanel("Statistics for the Southwest"),
                               sidebarPanel("This includes Arizona, New Mexico, Texas, and Oklahoma"),
                               mainPanel("",
                                         plotOutput("Southweas"),
                                         plotOutput("southWestFourMathEPS"),
                                         plotOutput("southWestFourReadEPS"),
                                         plotOutput("southWestEightMathEPS"),
                                         plotOutput("southWestEightReadEPS")
                               )
                               )
                  )
          
        )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    excel_sheets("states_all.xlsx")
    midwestDet <- read_excel("states_all.xlsx", sheet = 1) 
    midwestDet <- read_excel("states_all.xlsx", sheet = "Midwest") 
    northeastDet <- read_excel("states_all.xlsx", sheet = "Northeast")
    southeastDet <- read_excel("states_all.xlsx", sheet = "Southeast")
    westDet <- read_excel("states_all.xlsx", sheet = "West")
    southwestDet <- read_excel("states_all.xlsx", sheet = "Southwest")
    #For overall, use the total math averages and total reading averages, as well as averages by grade
    overallDet <- read_excel("states_all.xlsx", sheet = "states_all")
    #All graphs and variables for West
    output$wPlots <- renderPlot({
      switch(isolate(input$West),
             'Expenditure per student and year' = weas)
    })
    
    
    #All graphs for the West
    output$weas <- renderPlot({
      #Plot for the West Expenditure per student and year
        plot(westDet$EXPEND_PER_STUDENT, westDet$YEAR, 
             main = "Expenditure per student and year for the West", 
             xlab = "Expendature per Student",
             ylab = "Year")
    })
    output$westFourMathEPS <- renderPlot({
      #Plot for the West 4th grade Math Average and Expenditure per Student
      plot(westDet$AVG_MATH_4_SCORE, westDet$EXPEND_PER_STUDENT, 
           main = "4th grade Math Average and Expenditure per Student", 
           xlab = "4th grade Math Average",
           ylab = "Expenditure per Student")
    })
    output$westFourReadEPS <- renderPlot({
      #Plot for the West 4th grade Reading Average and Expenditure per Student
      plot(westDet$AVG_READING_4_SCORE, westDet$EXPEND_PER_STUDENT, 
           main = "4th grade Reading Average and Expenditure per Student", 
           xlab = "4th grade Reading Average",
           ylab = "Expenditure per Student")
    })
    output$westEightMathEPS <- renderPlot({
      #Plot for the West 8th grade Math Average and Expenditure per Student
      plot(westDet$AVG_MATH_8_SCORE, westDet$EXPEND_PER_STUDENT, 
           main = "8th grade Math Average and Expenditure per Student", 
           xlab = "8th grade Math Average",
           ylab = "Expenditure per Student")
    })
      output$westEightReadEPS <- renderPlot({
      #Plot for the West 8th grade Reading Average and Expenditure per Student
      plot(westDet$AVG_READING_8_SCORE, westDet$EXPEND_PER_STUDENT, 
           main = "8th grade Reading Average and Expenditure per Student", 
           xlab = "8th grade Reading Average",
           ylab = "Expenditure per Student")
    })
      
      
      #All graphs for the Midwest
      output$Midweas <- renderPlot({
        #Plot for the Midwest Expenditure per student and year
        plot(midwestDet$EXPEND_PER_STUDENT, midwestDet$YEAR, 
             main = "Expenditure per student and year", 
             xlab = "Expendature per Student",
             ylab = "Year")
      })
      output$midWestFourMathEPS <- renderPlot({
        #Plot for the Midwest 4th grade Math Average and Expenditure per Student
        plot(midwestDet$AVG_MATH_4_SCORE, midwestDet$EXPEND_PER_STUDENT, 
             main = "4th grade Math Average and Expenditure per Student", 
             xlab = "4th grade Math Average",
             ylab = "Expenditure per Student")
      })
      output$midWestFourReadEPS <- renderPlot({
        #Plot for the Midwest 4th grade Reading Average and Expenditure per Student
        plot(midwestDet$AVG_READING_4_SCORE, midwestDet$EXPEND_PER_STUDENT, 
             main = "4th grade Reading Average and Expenditure per Student", 
             xlab = "4th grade Reading Average",
             ylab = "Expenditure per Student")
      })
      output$midWestEightMathEPS <- renderPlot({
        #Plot for the Midwest 8th grade Math Average and Expenditure per Student
        plot(midwestDet$AVG_MATH_8_SCORE, midwestDet$EXPEND_PER_STUDENT, 
             main = "8th grade Math Average and Expenditure per Student", 
             xlab = "8th grade Math Average",
             ylab = "Expenditure per Student")
      })
      output$midWestEightReadEPS <- renderPlot({
        #Plot for the Midwest 8th grade Reading Average and Expenditure per Student
        plot(midwestDet$AVG_READING_8_SCORE, midwestDet$EXPEND_PER_STUDENT, 
             main = "8th grade Reading Average and Expenditure per Student", 
             xlab = "8th grade Reading Average",
             ylab = "Expenditure per Student")
      })
      
      
      #All graphs for the Northeast
      output$NEweas <- renderPlot({
        #Plot for the Northeast Expenditure per student and year
        plot(northeastDet$EXPEND_PER_STUDENT, northeastDet$YEAR, 
             main = "Expenditure per student and year", 
             xlab = "Expendature per Student",
             ylab = "Year")
      })
      output$northeastFourMathEPS <- renderPlot({
        #Plot for the Northeast 4th grade Math Average and Expenditure per Student
        plot(northeastDet$AVG_MATH_4_SCORE, northeastDet$EXPEND_PER_STUDENT, 
             main = "4th grade Math Average and Expenditure per Student", 
             xlab = "4th grade Math Average",
             ylab = "Expenditure per Student")
      })
      output$northeastFourReadEPS <- renderPlot({
        #Plot for the Northeast 4th grade Reading Average and Expenditure per Student
        plot(northeastDet$AVG_READING_4_SCORE, northeastDet$EXPEND_PER_STUDENT, 
             main = "4th grade Reading Average and Expenditure per Student", 
             xlab = "4th grade Reading Average",
             ylab = "Expenditure per Student")
      })
      output$northeastEightMathEPS <- renderPlot({
        #Plot for the Northeast 8th grade Math Average and Expenditure per Student
        plot(northeastDet$AVG_MATH_8_SCORE, northeastDet$EXPEND_PER_STUDENT, 
             main = "8th grade Math Average and Expenditure per Student", 
             xlab = "8th grade Math Average",
             ylab = "Expenditure per Student")
      })
      output$northeastEightReadEPS <- renderPlot({
        #Plot for the Northeast 8th grade Reading Average and Expenditure per Student
        plot(northeastDet$AVG_READING_8_SCORE, northeastDet$EXPEND_PER_STUDENT, 
             main = "8th grade Reading Average and Expenditure per Student", 
             xlab = "8th grade Reading Average",
             ylab = "Expenditure per Student")
      })
      
      
      #All graphs for the Southeast
      output$SEweas <- renderPlot({
        #Plot for the Southeast Expenditure per student and year
        plot(southeastDet$EXPEND_PER_STUDENT, southeastDet$YEAR, 
             main = "Expenditure per student and year", 
             xlab = "Expendature per Student",
             ylab = "Year")
      })
      output$southeastFourMathEPS <- renderPlot({
        #Plot for the Southeast 4th grade Math Average and Expenditure per Student
        plot(southeastDet$AVG_MATH_4_SCORE, southeastDet$EXPEND_PER_STUDENT, 
             main = "4th grade Math Average and Expenditure per Student", 
             xlab = "4th grade Math Average",
             ylab = "Expenditure per Student")
      })
      output$southeastFourReadEPS <- renderPlot({
        #Plot for the Southeast 4th grade Reading Average and Expenditure per Student
        plot(southeastDet$AVG_READING_4_SCORE, southeastDet$EXPEND_PER_STUDENT, 
             main = "4th grade Reading Average and Expenditure per Student", 
             xlab = "4th grade Reading Average",
             ylab = "Expenditure per Student")
      })
      output$southeastEightMathEPS <- renderPlot({
        #Plot for the Southeast 8th grade Math Average and Expenditure per Student
        plot(southeastDet$AVG_MATH_8_SCORE, southeastDet$EXPEND_PER_STUDENT, 
             main = "8th grade Math Average and Expenditure per Student", 
             xlab = "8th grade Math Average",
             ylab = "Expenditure per Student")
      })
      output$southeastEightReadEPS <- renderPlot({
        #Plot for the Southeast 8th grade Reading Average and Expenditure per Student
        plot(southeastDet$AVG_READING_8_SCORE, southeastDet$EXPEND_PER_STUDENT, 
             main = "8th grade Reading Average and Expenditure per Student", 
             xlab = "8th grade Reading Average",
             ylab = "Expenditure per Student")
      })
      
      
      #All graphs for the Southwest
      output$Southweas <- renderPlot({
        #Plot for the Southwest Expenditure per student and year
        plot(southwestDet$EXPEND_PER_STUDENT, southwestDet$YEAR, 
             main = "Expenditure per student and year for the West", 
             xlab = "Expendature per Student",
             ylab = "Year")
      })
      output$southWestFourMathEPS <- renderPlot({
        #Plot for the Southwest 4th grade Math Average and Expenditure per Student
        plot(southwestDet$AVG_MATH_4_SCORE, southwestDet$EXPEND_PER_STUDENT, 
             main = "4th grade Math Average and Expenditure per Student", 
             xlab = "4th grade Math Average",
             ylab = "Expenditure per Student")
      })
      output$southWestFourReadEPS <- renderPlot({
        #Plot for the Southwest 4th grade Reading Average and Expenditure per Student
        plot(southwestDet$AVG_READING_4_SCORE, southwestDet$EXPEND_PER_STUDENT, 
             main = "4th grade Reading Average and Expenditure per Student", 
             xlab = "4th grade Reading Average",
             ylab = "Expenditure per Student")
      })
      output$southWestEightMathEPS <- renderPlot({
        #Plot for the Southwest 8th grade Math Average and Expenditure per Student
        plot(southwestDet$AVG_MATH_8_SCORE, southwestDet$EXPEND_PER_STUDENT, 
             main = "8th grade Math Average and Expenditure per Student", 
             xlab = "8th grade Math Average",
             ylab = "Expenditure per Student")
      })
      output$southWestEightReadEPS <- renderPlot({
        #Plot for the Southwest 8th grade Reading Average and Expenditure per Student
        plot(southwestDet$AVG_READING_8_SCORE, southwestDet$EXPEND_PER_STUDENT, 
             main = "8th grade Reading Average and Expenditure per Student", 
             xlab = "8th grade Reading Average",
             ylab = "Expenditure per Student")
      })
}

# Run the application 
shinyApp(ui = ui, server = server)
