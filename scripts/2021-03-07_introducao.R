

# Trabalho de conclusão de curso: Introdução à programação para Ciência de Dados
# Aluno: Maykon Gabriel G. Pedro
# Contato: maykonglaffite@gmail.com   |  github: @maykongpedro   
# Sript 1: Consolidação

# Instalar pacotes


# Carregar pacotes --------------------------------------------------------
library(magrittr)


# Ler arquivos ----------------------------------------------------------
source("scripts/2021-03-14_analise_covid.R", encoding = "UTF-8")


# Ver a estrutura do projeto no console: quais arquivos estão presentes?
# como estão organizados nas pastas?
fs::dir_tree()



# Qual foi o total de óbitos por covid até o momento? ---------------------
mensagem_obitos_br


# Qual foi o total de óbitos por covid em 2020? ---------------------------
covid_mensagem_obitos_br_2020


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
sarg_obitos_por_ano_df



# Quais são as estatísticas básicas dos óbitos de SARG antes de 2020 ------
estatisticas_obitos_sarg_ate_2019


# Quantos óbitos em 2020 ultrapassam a média? -----------------------------




# Quantos óbitos de SARG teoricamente podem ter sido COVID? ---------------





