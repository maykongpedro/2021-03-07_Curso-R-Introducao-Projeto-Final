


# Função para cálculo de estatísticas descritivas -------------------------

calcula_estatisticas_descritivas <- function(df, coluna){
  
  # Filtrando os dados! ----------------------------------------------------
  
  coluna_desejada <- df[[coluna]]
  
  
  # Calculando estatísticas -------------------------------------------------
  
  media <- 
    mean(coluna_desejada, na.rm = TRUE) %>% 
    round(0)
  
  desvio_padrao <- 
    sd(coluna_desejada, na.rm = TRUE) %>% 
    round(0)
  
  coeficiente_de_variacao <- round(100*desvio_padrao/media, 2)
  
  maximo <- max(coluna_desejada, na.rm = TRUE)
  
  minimo <- min(coluna_desejada, na.rm = TRUE)
  
  
  # Criando um data.frame com as estatísticas descritivas -------------------
  est_descr <- data.frame(media, desvio_padrao, coeficiente_de_variacao, maximo, minimo)
  
  
  # Imprimindo os resultados finais -----------------------------------------
  
  mensagem_que_vou_imprimir <-
    paste0(
      "A média dos dados é ",
      media,
      ", já o desvio padrão é ",
      desvio_padrao,
      ". O coeficiente de variação, portanto, é ",
      coeficiente_de_variacao,
      ", enquanto o máximo e o mínimo, por sua vez, são ",
      minimo,
      " e ",
      maximo,
      "."
    )

  print(mensagem_que_vou_imprimir)
  
  # Salvando data.frame
  write.csv2(est_descr,
             "./outputs/estatisticas.csv")
}
