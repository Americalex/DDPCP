library(shiny)
library(UsingR)
library(ggplot2)
data(cats)

fit <- lm(Hwt~Bwt,cats)

pr <- function(x){
        r <- predict.lm(fit,data.frame(Bwt=x))
        return(as.numeric(r[1]))
}

pr2 <- function(x){
         t <- predict.lm(fit,data.frame(Bwt=x), interval="confidence")
         t2 <- c((round(t[2],2)),(round(t[3],2)))
         return (paste("[",t2[1],",",t2[2],"]", sep=""))
}


shinyServer(
        function(input, output) {

                output$text1 <- renderPrint({input$slider})
                output$text2 <- renderPrint({pr(input$slider)})
                output$text3 <- renderPrint({pr2(input$slider)})

                output$plot <- renderPlot(qplot(cats$Bwt,cats$Hwt,
                                                geom=c("point","smooth"))
                                          +xlab("Cat's Body Weight in Kilograms")
                                          +ylab("Cat's Predicted Heart Weight in Grams")
                                          +scale_x_continuous(breaks=2.0:3.9)
                                          +scale_y_continuous(breaks=6.3:20.5)
                                          +geom_vline(xintercept=input$slider, colour='green', size=1)
                                          +geom_hline(yintercept=pr(input$slider), colour='orange', size=1))

})