library(shiny)


# Define UI fordata
shinyUI(fluidPage(

        # Application title
        titlePanel("Tool to predict the weight of cat hearts based on body weight"),

        sidebarPanel(

                h4("CONTEXT"),

                h5("This application uses the information available in data(cats),
                        a dataset collected and used by R A Fisher in 1947,
                         to study the relationship between a part and a whole, in the context
                         of the weight of a cat's body and a cat's heart."),

                h4("METHODOLOGY"),

                h5("This app uses a linear model fit to predict the weight of a cats heart in grams,
                   based on its body weight."),

                h4("CAT HEART WEIGHT ESTIMATOR"),

                sliderInput("slider", label = h5("Select a given cat's body weight in kilograms, then click 
                                                 on the submit button. This will update the visualization 
                                                 and the results section beneath it."),
                            min = 2, max = 3.9, step=0.1, value=2),
                submitButton("Submit")
        ),

        mainPanel(
                h4("Data Visualization"),
                h5("The green line shows the selected cat body weight, the orange line shows the corresponding
                 expected heart weight, while the blue line represents the linear regression model."),
                plotOutput('plot'),

                h4("Results"),
                h5("Cat's body weight (in kilograms):"),
                verbatimTextOutput('text1'),
                h5("Cat's predicted heart weight (in grams):"),
                verbatimTextOutput('text2'),
                h5("With a 95% confidence interval of:"),
                verbatimTextOutput('text3')


        )
))