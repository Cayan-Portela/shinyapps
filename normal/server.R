
server <- function(input,output){
 
  data <- reactive({
    mu <- c(input$m1,input$m2) # Mean 
    sigma <- matrix(c(input$s1^2, input$s1*input$s2*input$rho, 
                      input$s1*input$s2*input$rho, input$s2^2),
                    2) # Covariance matrix
    M <- t(chol(sigma))
    Z <- matrix(rnorm(2*input$amostra),2,input$amostra) 
    medias <- matrix(rep(mu,input$amostra), byrow=TRUE,ncol=2)
    bvn2 <- t(M %*% Z) + medias
    colnames(bvn2) <- c("X1","X2")
    return(bvn2)
  })
  
  sigma_matriz <- reactive({
    mu <- c(input$m1,input$m2) # Mean 
    sigma <- matrix(c(input$s1^2, input$s1*input$s2*input$rho, 
                      input$s1*input$s2*input$rho, input$s2^2),
                    2) # Covariance matrix
    return(sigma)
  })
  

  output$grafico1 <- renderPlot({
    dados <- data()
    sigma1 <- sigma_matriz()
    plot(ellipse(sigma1,centre=c(input$m1,input$m2)),
         col="firebrick1",type="l",lty=2,lwd=2,axes=FALSE,xlab="X1",ylab="X2",asp=1,main="Correlação Normal Bivariada")
    points(dados[,1],dados[,2],col="darkorchid4",pch=20)
    Axis(side=1)
    Axis(side=2)
    })

  output$grafico2 <- renderPlotly({   
    dados <- data()
   kd <- kde2d(dados[,1],dados[,2], n = 50,h=2)
   p_teste <- plot_ly(x = kd$x, y = kd$y, z = kd$z) %>% add_surface()
   print(p_teste)
  })
  
}
