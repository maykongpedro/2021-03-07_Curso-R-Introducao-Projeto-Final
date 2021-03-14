

# Trabalho de conclusão de curso: Introdução à programação para Ciência de Dados
# Aluno: Maykon Gabriel G. Pedro
# Contato: maykonglaffite@gmail.com   |  github: @maykongpedro   
# Sript 1: Consolidação

# Instalar pacotes
install.packages("magrittr", "readr", "fs", "lubridate")

# Carregar pacotes --------------------------------------------------------
library(magrittr)


# Ler arquivos ----------------------------------------------------------


# Transformação dos dados -------------------------------------------------




seq(2, 10, 4)

sum(vetor_exemplos)
mean(vetor_exemplos)
median(vetor_exemplos)
var(vetor_exemplos)
sd(vetor_exemplos)
max(vetor_exemplos)
min(vetor_exemplos)
round(vetor_exemplos)
length(vetor_exemplos)

# Selecionando a coluna pelo nome:
base_de_dados[["origem"]]
base_de_dados[["companhia_aerea"]]

# Selecionando a coluna pela posição (indexação):
base_de_dados[[13]]
base_de_dados[[10]]


# Seleciona TODAS as linhas e apenas a coluna 2
base_de_dados[ , 2] 


# Selecionando colunas

base_de_dados[, c(13, 10)]
base_de_dados[, c("origem", "companhia_aerea")]



if(nota >= 5){
  
  print("Aprovado")
  
} else if(nota < 3) {
  
  print("Reprovada")
  
} else {
  
  print("Recuperação")
}


# Queremos juntar as bases com dados de janeiro em fevereiro, e uma única base.
# a base contém as mesmas colunas!
# usar a funcao rbind() (de row bind)

base_jan_fev <- rbind(base_de_dados, base_de_dados_fev)

# E se eu quiser adicionar uma nova coluna? 
# cbind()   (de column bind)

nome_mes <- "janeiro"
cbind(base_de_dados, nome_mes)



arquivos_de_dados <- c("dados/voos_de_janeiro.csv", "dados/voos_de_fevereiro.csv", "dados/voos_de_marco.csv")
# vetor de textos com o caminhos dos nossos arquivos

for(arquivo in arquivos_de_dados){
  # como ficou o nosso ESCOPO?
  # VARIAVEL aqui levou esse nome "arquivo"
  # VETOR_TOTAL aqui levou o nome "arquivos_de_dados"
  
  dados <- readr::read_csv2(arquivo)
  
  maior_atraso <- max(dados$atraso_saida, na.rm = TRUE)
  
  texto_de_saida <- paste0("O maior atraso no arquivo ", arquivo, " é ", maior_atraso)
  
  print(texto_de_saida)
  
}


# Resultados - Loop -------------------------------------------------------

for(arquivo in arquivos){
  
  dados <- readr::read_csv2(arquivo,
                            col_types = "dddddddddcdcccddddT",
                            col_names = TRUE,
                            locale = locale(decimal_mark = ",", grouping_mark = "."))
  
  # Filtrando os dados! ----------------------------------------------------
  
  base_filtrada <- dados[dados$origem == "JFK" & dados$destino == "ATL",]
  
  
  # Calcula a média do dia --------------------------------------------------
  
  media <- round(mean(base_filtrada$atraso_saida, na.rm = TRUE), digits = 2)
  
  
  # Imprime a mensagem final em função dos dados ----------------------------
  
  if(media > meta){
    
    mensagem_final <- paste("No arquivo ", arquivo, " a média do atraso foi de", media,
                            "minutos, o que é maior do que a meta de", meta, "minutos.")
    
  } else if(media <= meta) {
    
    mensagem_final <- paste("[ALERTA - NÃO BATEU A META] No arquivo ", arquivo, " a média do atraso foi de", media,
                            "minutos, o que é menor do que a meta de", meta, "minutos.")
    
  }
  
  print(mensagem_final)
  
}


# é preciso reiniciar o vetor, se não ele vai continuar crescendo conforme a gente roda o for
vetor_de_medias <- NULL

for(aeroporto in lista_de_aeroportos){
  
  print(paste0("Calculando média dos voos que saíram de ", aeroporto))
  
  print(paste0("Filtrando a base..."))
  
  base_filtrada <- base_de_dados[base_de_dados$origem == aeroporto, ]
  
  print(paste0("Calculando a média..."))
  
  media <- mean(base_filtrada$atraso_saida, na.rm = TRUE)
  
  print(paste0("A média de atraso dos voos que saíram de ", aeroporto, " é ", media))
  
  print(paste0("Salvando em um vetor..."))
  
  # aqui está o pulo do gato!
  vetor_de_medias <- c(media, vetor_de_medias)
  
  print(paste0("Vetor ao final do cálculo do aeroporto ", aeroporto, ":"))
  print(vetor_de_medias)
  
}



calcula_estatisticas_descritivas <- function(df, coluna, meta = 5){
  
  
  # Filtrando os dados! ----------------------------------------------------
  
  
  coluna_desejada <- df[[coluna]]
  
  
  
  # Calculando estatísticas -------------------------------------------------
  
  media <- round(mean(coluna_desejada, na.rm = TRUE), 2)
  
  desvio_padrao <- round(sd(coluna_desejada, na.rm = TRUE), 2)
  
  coeficiente_de_variacao <- round(100*desvio_padrao/media, 2)
  
  maximo <- max(coluna_desejada, na.rm = TRUE)
  
  minimo <- min(coluna_desejada, na.rm = TRUE)
  
  
  # Criando um data.frame com as estatísticas descritivas -------------------
  
  
  est_descr <- data.frame(media, desvio_padrao, coeficiente_de_variacao, maximo, minimo)
  
  # salvar a tabela no computador -------------------------------------------
  
  
  write_csv2(est_descr, file = paste0("estatisticas_descritivas_", coluna, ".csv"))
  
  
  # Imprimindo os resultados finais -----------------------------------------
  
  mensagem_que_vou_imprimir <- paste0("A média dos dados é ", media, ", já o desvio padrão é ", desvio_padrao,
                                      ". O coeficiente de variação, portanto, é ", coeficiente_de_variacao,
                                      ", enquanto o máximo e o mínimo, por sua vez, são ", minimo, " e ", maximo,
                                      ".")
  
  if(media > meta){
    
    paste(mensagem_que_vou_imprimir, " A média do atraso foi de", media,
          "minutos, o que é maior do que a meta de", meta, "minutos.")
    
  } else if(media <= meta) {
    paste(mensagem_que_vou_imprimir, " A média do atraso foi de", media,
          "minutos, o que é menor do que a meta de", meta, "minutos.")
  }
  
  
  
  
  
}


# Exemplo 2: Quero criar um arquivo diretamente do R!
# obs: caso a arquivo já exista, nada acontecerá.

fs::file_create("exemplo_file_create.R")

# Exemplo 3: Ver a estrutura do projeto no console: quais arquivos estão presentes?
# como estão organizados nas pastas?

fs::dir_tree()


source()
