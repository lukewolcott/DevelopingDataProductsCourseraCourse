library(shiny)
library(dplyr)
library(ggplot2)
shinyServer(function(input, output) {
      select_types <- reactive({
            slct = c(input$in1, input$in2, input$in3, input$in4,input$in5, 
                     input$in6, input$in7, input$in8, input$in9, input$in10,
                     input$in11, input$in12, input$in13, input$in14, input$in15,
                     input$in16, input$in17, input$in18, input$in19, input$in20,
                     input$in21, input$in22, input$in23, input$in24, input$in25, 
                     input$in26, input$in27, input$in28, input$in29, input$in30)
            crimes <- c("AGGRAVATED ASSAULT", "ARSON", "BURGLARY",
                        "CRIMINAL HOMICIDE", "DISORDERLY CONDUCT",
                        "DRUNK / ALCOHOL / DRUGS",
                        "DRUNK DRIVING VEHICLE / BOAT",
                        "FEDERAL OFFENSES W/O MONEY",
                        "FEDERAL OFFENSES WITH MONEY",
                        "FELONIES MISCELLANEOUS", "FORCIBLE RAPE",
                        "FORGERY", "FRAUD AND NSF CHECKS", "GAMBLING",
                        "GRAND AUTO THEFT", "LARCENY THEFT",
                        "LIQUOR LAWS", "MISDEMEANORS MISCELLANEOUS",
                        "NARCOTICS", "NON-AGGRAVATED ASSAULTS",
                        "OFFENSES AGAINST FAMILY",
                        "RECEIVING STOLEN PROPERTY",
                        "ROBBERY", "SEX OFFENSES FELONIES",
                        "SEX OFFENSES MISDEMEANORS", "VAGRANCY",
                        "VANDALISM", "VEHICLE / BOATING LAWS",
                        "WARRANTS", "WEAPON LAWS")
            sltd_cat <- crimes[slct]
      })
      
      data <- read.csv("LA_SHERIFF__CRIMES_-_LAST_12_MONTHS.csv")
      data$CRIME_DATE <- strptime(data$CRIME_DATE, "%m / %d / %Y %I : %M : %S %p")
      data <- data[,c(1,4,14)]
      data$HOUR <- (data$CRIME_DATE)$hour
      data$CRIME_DATE <- NULL
      names(data) <- c("type", "gang_related", "hour")

      output$plt <- renderPlot({
            d <- filter(data, type %in% select_types())
            ggplot(d, aes(hour, colour=type)) + geom_freqpoly(binwidth=1)+xlim(0,23)
      })
})