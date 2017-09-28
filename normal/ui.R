## ui.r
fluidPage(
  
    tabsetPanel(
      
  tabPanel("Correlação", plotOutput("grafico1")),
  tabPanel("Densidade", plotlyOutput("grafico2"))),
  
  fluidRow(
    column(4,
        numericInput("amostra",HTML("Tamanho da Amostra"),
                   value=1000),
      numericInput("rho",HTML("Correlação"),value = 0)),
      
    column(4,
      numericInput("m1",
                  HTML("Média X1;"),
                  value = 0),
      
      numericInput("m2",
                  HTML("Média X2;"),
                  value = 0)
    ),
  
    column(4,  
      numericInput("s1",
                  HTML("Desvio padrão X1"),
                  value = 1),
      
      numericInput("s2",
                  HTML("Desvio padrão X2"),
                  value = 1) 

    
  )
    
  )
)