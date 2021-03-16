# Trabalho de conclusão de curso: Introdução à programação para Ciência de Dados
# Aluno: Maykon Gabriel G. Pedro
# Contato: maykonglaffite@gmail.com   |  github: @maykongpedro   
# Sript 2: Análise SARG


# Instalar pacotes
# install.packages("magrittr", "readr", "dplyr")


# Carregar pacotes --------------------------------------------------------
library(magrittr)


# Carregar funções --------------------------------------------------------
source("funcoes/2021-03-15_funcoes_analises.R")


# Ler arquivos ----------------------------------------------------------

# Esse é o filtro utilizado para apresentação dos dados seguindo o critério mais restritivo. 
# Segue o padrão internacional de definição de SRAG, conforme Organização Mundial da Saúde. 
# É equivalente aos registros internacionais de SARI (Severe Acute Respiratory Infection).
sarg <- readr::read_csv2("dados/InfoGripe/serie_temporal_com_estimativas_recentes.csv ")


# Transformação dos dados -------------------------------------------------

# veficando tipo das colunas
str(sarg)

# conhecendo a base
unique(sarg$dado)
unique(sarg$tipo)
unique(sarg$escala)
unique(sarg$situacao_do_dado)

# verificando nomes das colunas
names(sarg)

# renomeando algumas colunas
names(sarg)[3] <- "unidade_da_federacao"
names(sarg)[7] <- "ano_epidemiologico"
names(sarg)[9] <- "situacao_do_dado"
names(sarg)[10] <- "casos_semanais"

names(sarg)


# verificando os anos que a base contempla
unique(sarg$ano_epidemiologico)


# criando lista de anos
anos <- seq(from = 2009, to = 2020, by = 1) 


# Manipulação dos dados ---------------------------------------------------

# criando dataframe que vai receber 
sarg_obitos_por_ano_df <- data.frame(ano = NULL, obitos = NULL)


# filtrando a base
sarg_filtrada <- 
  sarg[sarg$unidade_da_federacao == "Brasil" &
       sarg$dado == "obito" &
       sarg$escala == "casos" &
    sarg$situacao_do_dado == "Dado estável. Sujeito a pequenas alterações.", ]



sarg_filtrada[sarg_filtrada$ano_epidemiologico == "2009", "casos_semanais"] %>% 
  sum()


# fazendo a soma de óbitos por ano
for (ano in anos) {
  
  # filtrar ano
  coluna_obitos <- sarg_filtrada[sarg_filtrada$ano_epidemiologico == ano, "casos_semanais"]
  
  # fazer a soma
  soma_ano <- sum(coluna_obitos)
  
  # organizar mensagem
  mensagem <- paste0("A quantidade de óbitos no ano de ",
                     ano, 
                     " foi de ",
                     soma_ano)
  
  # imprimir mensagem
  print(mensagem)
  
  # gerar um dataframe
  ano_e_obitos <- data.frame(ano = ano, obitos = soma_ano)
  
  # salvar informação
  sarg_obitos_por_ano_df <- rbind(sarg_obitos_por_ano_df, ano_e_obitos)
  
}

# salvando resultado de óbitos por ano
write.csv2(sarg_obitos_por_ano_df,
           "./outputs/sarg_obitos_por_ano.csv")


# retirando o ano de 2020 da base
sarg_obitos_por_ano_sem_2020 <- sarg_obitos_por_ano_df[sarg_obitos_por_ano_df$ano != "2020", ]


# fazendo estatísticas descritivas dos anos
calcula_estatisticas_descritivas(sarg_obitos_por_ano_sem_2020, "obitos")


# abrindo resultado
estatisticas_obitos_sarg_ate_2019 <- readr::read_csv2("outputs/estatisticas.csv")


# salvando resultado com a nomenclatura correta
write.csv2(estatisticas_obitos_sarg_ate_2019,
           "./outputs/sarg_estatisticas_obitos_2009-2019.csv")



# calcular a média por estado?




sarg <- 
  janitor::clean_names(sarg) %>% 
  dplyr::rename(casos_semanais = "casos_semanais_reportados_ate_a_ultima_atualizacao") 
        

dplyr::glimpse(sarg)

sarg %>% 
  dplyr::filter(unidade_da_federacao == "Brasil",
                dado == "obito",
                escala == "casos",
                situacao_do_dado == "Dado estável. Sujeito a pequenas alterações.") %>% 
  dplyr::group_by(ano_epidemiologico) %>% 
  dplyr::summarise(obitos = sum(casos_semanais, na.rm = TRUE))

  
  
  sarg %>% 
  dplyr::filter(
                dado == "obito",
                escala == "casos",
                situacao_do_dado == "Dado estável. Sujeito a pequenas alterações.") %>% 
  dplyr::group_by(ano_epidemiologico, unidade_da_federacao) %>% 
  dplyr::summarise(obitos = sum(casos_semanais, na.rm = TRUE)) %>% 
    View()
  
  
