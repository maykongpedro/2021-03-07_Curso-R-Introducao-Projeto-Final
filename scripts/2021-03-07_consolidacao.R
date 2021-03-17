
# Trabalho de conclusão de curso: Introdução à programação para Ciência de Dados
# Aluno: Maykon Gabriel G. Pedro
# Contato: maykonglaffite@gmail.com   |  github: @maykongpedro   
# Sript 1: Consolidação

# Instalar pacotes --------------------------------------------------------
install.packages("magrittr", "readr", "fs", "lubridate")

# Estrutura de pastas -----------------------------------------------------
fs::dir_tree()

# Carregar pacotes --------------------------------------------------------
library(magrittr)


# Ler arquivos ------------------------------------------------------------

# Script 2 - Covid-19
source("scripts/2021-03-14_analise_covid.R", encoding = "UTF-8")

# Script 3 - SARG
source("scripts/2021-03-14_analise_sarg.R", encoding = "UTF-8")

# Qual foi o total de óbitos por covid até o momento (data da análise)? ---
covid_mensagem_obitos_br


# Qual foi o total de óbitos por covid em 2020? ---------------------------
covid_mensagem_obitos_br_2020


# Qual foi o total de óbitos por covid em 2020 por estado? ----------------
for (uf in estados) {
  
  obitos_cov_19 <- 
    covid_obito_por_estado_df_2020[covid_obito_por_estado_df_2020$estado == uf, "obito"]
  
  mensagem_covid_obito_por_uf <-
    paste0("A quantidade de óbitos na unidade federativa ",
           uf,
           " foi de ",
           obitos_cov_19)
  
  print(mensagem_covid_obito_por_uf)
  
}


# Qual foi o total de óbitos por SARG em 2020? ----------------------------
sarg_mensagem_obitos_br_2020


# Qual foi o total de óbitos por SARG nos últimos anos? -------------------
for (ano in anos) {
  
  obitos <- sarg_obitos_por_ano_df[sarg_obitos_por_ano_df$ano == ano, "obitos"]
  
  mensagem_sarg_obitos_por_ano <- 
    paste0(
      "A quantidade de óbitos por SARG em ",
      ano,
      " foi de ",
      obitos)
  
  print(mensagem_sarg_obitos_por_ano)
  
}


# Quais são as estatísticas básicas dos óbitos de SARG antes de 2020 ------
paste0("A média de óbitos de SARG entre 2009 e 2020 foi de [",
       estatisticas_obitos_sarg_ate_2019$media,
       "] óbitos, com um desvio padrão de [",
       estatisticas_obitos_sarg_ate_2019$desvio_padrao,
       "] e coeficiente de variação de [",
       estatisticas_obitos_sarg_ate_2019$coeficiente_de_variacao,
       "%]. O máximo de óbitos verificado dentro desse período foi de [",
       estatisticas_obitos_sarg_ate_2019$maximo,
       "], e o mínimo de [",
       estatisticas_obitos_sarg_ate_2019$minimo,
       "].")


# Quantos óbitos em 2020 ultrapassam a média e o máximo? -----------------------------
paste0("Um total de ",
       sarg_obitos_superior_a_media,
       " óbitos em 2020 foi superior a média encontrada no período de 2009 a 2019.",
       "Já em relação ao máximo de óbitos registrados no ano de ",
       ano_maximo_obitos,
       " do histórico (",
       estatisticas_obitos_sarg_ate_2019$maximo,
       " óbitos), teve um total de ",
       sarg_obitos_superior_ao_max,
       " óbitos a mais.")

# Conclusões
paste0("Durante a pandemia de COVID-19 no Brasil em 2020,",
       " os óbitos de Síndrome Respiratória Aguda Grave (SARG) chegaram a ser ",
       sarg_quanti_vezes_maior_que_a_media,
       " vezes maior que a média registrada no histórico, apontando um outlier que deve ser estudado.")


