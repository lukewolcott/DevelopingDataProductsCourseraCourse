library(shiny)
shinyUI(fluidPage(
      titlePanel("Los Angeles Crime In A Day: 2016 annual totals by hour and type"),
      sidebarLayout(
            sidebarPanel(
                  h4("Choose crime categories to display:"),
                  tabsetPanel(type="tabs",
                              tabPanel("1-10",
                                    br(),
                                    checkboxInput("in1", "aggravated assault", value=TRUE),
                                    checkboxInput("in2", "arson"),
                                    checkboxInput("in3", "burglary"),
                                    checkboxInput("in4", "criminal homicide"),
                                    checkboxInput("in5", "disorderly conduct"),
                                    checkboxInput("in6", "drunk/alcohol/drugs"),
                                    checkboxInput("in7", "drunk driving vehicle/boat"),
                                    checkboxInput("in8", "federal offenses w/o money"),
                                    checkboxInput("in9", "federal offenses with money"),
                                    checkboxInput("in10", "felonies miscellaneous")
                              ),
                              tabPanel("11-20",
                                       br(),
                                       checkboxInput("in11", "forcible rape"),
                                       checkboxInput("in12", "forgery"),
                                       checkboxInput("in13", "fraud and NSF checks"),
                                       checkboxInput("in14", "gambling"),
                                       checkboxInput("in15", "grand auto theft"),
                                       checkboxInput("in16", "larceny theft"),
                                       checkboxInput("in17", "liquor laws"),
                                       checkboxInput("in18", "misdemeanors miscellaneous"),
                                       checkboxInput("in19", "narcotics"),
                                       checkboxInput("in20", "non-aggravated assaults")
                              ),
                              tabPanel("21-30",
                                       br(),
                                       checkboxInput("in21", "offenses against family"),
                                       checkboxInput("in22", "receiving stolen property"),
                                       checkboxInput("in23", "robbery"),
                                       checkboxInput("in24", "sex offenses felonies"),
                                       checkboxInput("in25", "sex offenses misdemeanors"),
                                       checkboxInput("in26", "vagrancy"),
                                       checkboxInput("in27", "vandalism"),
                                       checkboxInput("in28", "vehicle/boating laws"),
                                       checkboxInput("in29", "warrants"),
                                       checkboxInput("in30", "weapon laws")
                              )
                  )
            ),
            mainPanel(
                  tabsetPanel(type = "tabs", 
                              tabPanel("Documentation",
                                       br(),
                                       h4("What is this dataset? Where is it from?"),
                                       em("The data come from the following website."),
                                       br(),
                                       code("https://data.lacounty.gov/Criminal/LA-SHERIFF-CRIMES-LAST-12-MONTHS/ca5f-5zzs"),
                                       br(),
                                       br(),
                                       em("This was accessed on December 17, 2016.  It contains information on crimes
                                          committed in Los Angeles County in the prior 12 months.  The data are organized to 
                                          show the total number of crimes happening in each hour of the day."),
                                       br(),
                                       br(),
                                       h4("How do I use this website?"),
                                       em("On the sidebar, select any categories of
                                          crime that you're interested in.  There are
                                          three tabs of them.  The plot, which appears in
                                          the PLOT tab, will update automatically.")
                              ),
                              tabPanel("PLOT",
                                    br(), 
                                    plotOutput("plt")
                              ) 
                  )
            )
      )
))