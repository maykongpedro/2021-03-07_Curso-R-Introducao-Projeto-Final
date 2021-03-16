# Trabalho de conclusão de curso: Introdução à programação para Ciência de Dados
# Aluno: Maykon Gabriel G. Pedro
# Contato: maykonglaffite@gmail.com   |  github: @maykongpedro   
# Sript 1: Análise Covid


# Instalar pacotes
install.packages("magrittr", "readr", "fs", "lubridate", "dplyr")


# Carregar pacotes --------------------------------------------------------
library(magrittr)


# Ler arquivos ----------------------------------------------------------
covid_dados <- readr::read_csv2("dados/HIST_PAINEL_COVIDBR_13mar2021.csv")


# Transformação dos dados -------------------------------------------------


# veficando tipo das colunas
str(covid_dados)

# criando coluna de ano
covid_dados$ano <- lubridate::year(covid_dados$data)

# criando coluna de mês
covid_dados$mes <- lubridate::month(covid_dados$data)


# Manipulação dos dados ---------------------------------------------------

# verificando infos dos estados
unique(covid_dados$estado)

# filtrando "brasil"
brasil_covid <- covid_dados[covid_dados$regiao == "Brasil",]

# quantidade total de mortes até o momento
obitos_covid_br <- sum(brasil_covid$obitosNovos)

# ultima data disponível na base de dados
ultima_data <- max(brasil_covid$data)

# printa mensagem
mensagem_obitos_br <- paste0("A quantidade de óbitos por COVID-19 até o momento (",
                             ultima_data,
                             ") foi de ",
                             obitos_covid_br)

print(mensagem_obitos_br)



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
morte_por_estado <- data.frame(estados = NULL,
                               obitos = NULL)


for (uf in estados) {
  
  # filtrar estado
  coluna_estado <- covid_dados[covid_dados$estado == uf, "obitosNovos"]
  
  # fazer a soma
  soma_estado <- sum(coluna_estado, na.rm = TRUE)
  
  # organizar mensagem
  mensagem <- paste0("A quantidade de óbitos na unidade federativa ",
                     uf, 
                     " foi de ",
                     soma_estado)
  
  # imprimir mensagem
  print(mensagem)
  
  # gerar um dataframe
  estado_e_obito <- data.frame(estado = uf, obito = soma_estado)
  
  # salvar informação
  obito_por_estado_df <- dplyr::bind_rows(obito_por_estado_df, estado_e_obito)
  
}




