# Trabalho de conclusão de curso: Introdução à programação para Ciência de Dados
# Aluno: Maykon Gabriel G. Pedro
# Contato: maykonglaffite@gmail.com   |  github: @maykongpedro   
# Sript 2: Análise Covid


# Instalar pacotes
#install.packages("magrittr", "readr", "fs", "lubridate")


# Carregar pacotes --------------------------------------------------------
library(magrittr)


# Ler arquivos ----------------------------------------------------------
covid_dados <- readr::read_csv2("dados/HIST_PAINEL_COVIDBR_13mar2021.csv")


# Transformação dos dados -------------------------------------------------

# veficando tipo das colunas
str(covid_dados)

# criando coluna de ano
covid_dados$ano <- lubridate::year(covid_dados$data)


# Manipulação dos dados ---------------------------------------------------

# verificando infos dos estados
unique(covid_dados$estado)

# filtrando "brasil"
brasil_covid <- covid_dados[covid_dados$regiao == "Brasil",]

# quantidade total de mortes até o momento
covid_tot_obitos_brasil <- sum(brasil_covid$obitosNovos)

# ultima data disponível na base de dados
ultima_data <- max(brasil_covid$data)

# mensagem de óbitos
covid_mensagem_obitos_br <- paste0("A quantidade de óbitos por COVID-19 até o momento (",
                             ultima_data,
                             ") foi de ",
                             covid_tot_obitos_brasil)

#print(covid_mensagem_obitos_br)


# filtrando somente o ano de 2020
covid_dados_2020 <- covid_dados[covid_dados$ano == "2020", ]


# total de óbitos em 2020
covid_tot_obitos_2020 <- 
  covid_dados_2020[covid_dados_2020$regiao == "Brasil", "obitosNovos"] %>% 
  sum()


# mensagem de óbitos em 2020
covid_mensagem_obitos_br_2020 <-
  paste0("A quantidade de óbitos por COVID-19 em 2020 foi de ",
         covid_tot_obitos_2020)

# lista de estados
estados <-
  c(
    "RO" ,
    "AC" ,
    "AM",
    "RR",
    "PA",
    "AP",
    "TO",
    "MA",
    "PI",
    "CE" ,
    "RN",
    "PB",
    "PE",
    "AL" ,
    "SE",
    "BA",
    "MG" ,
    "ES",
    "RJ",
    "SP",
    "PR" ,
    "SC" ,
    "RS",
    "MS",
    "MT",
    "GO",
    "DF"
  )

# quantidade total de mortes por estado
covid_obito_por_estado_df_2020 <- data.frame(estados = NULL,
                               obitos = NULL)


for (uf in estados) {
  
  # filtrar estado
  coluna_estado <- covid_dados_2020[covid_dados_2020$estado == uf, "obitosNovos"]
  
  # fazer a soma
  soma_estado <- sum(coluna_estado, na.rm = TRUE)
  
  # organizar mensagem
  mensagem <- paste0("A quantidade de óbitos na unidade federativa ",
                     uf, 
                     " no ano de 2020 foi de ",
                     soma_estado)
  
  # imprimir mensagem
  print(mensagem)
  
  # gerar um dataframe
  estado_e_obito <- data.frame(estado = uf, obito = soma_estado)
  
  # salvar informação
  covid_obito_por_estado_df_2020 <- rbind(covid_obito_por_estado_df_2020, estado_e_obito)
  
}

covid_obito_por_estado_df_2020

# salvando arquivo de obitos por estado
write.csv2(covid_obito_por_estado_df_2020,
           "./outputs/covid_obitos_por_estado_2020.csv")
