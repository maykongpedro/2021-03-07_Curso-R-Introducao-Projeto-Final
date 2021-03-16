# Trabalho de conclusão de curso: Introdução à programação para Ciência de Dados
# Aluno: Maykon Gabriel G. Pedro
# Contato: maykonglaffite@gmail.com   |  github: @maykongpedro   
# Sript 3: Análise SARG com filtro menos restritivo


# Instalar pacotes
# install.packages("magrittr", "readr", "dplyr")


# Carregar pacotes --------------------------------------------------------
library(magrittr)


# Ler arquivos ----------------------------------------------------------

# Filtro menos restritivo, sugerido pelo Ministério da Saúde para acompanhamento de hospitalizações e óbitos 
# notificados no sistema sivep-gripe, independentemente de atender os critérios estritos de SRAG. 
# Pode ser comparado a casos internacionais de ARI (Acute Respiratory Infection), com descrição explícita de 
# que não há restrição rígida de sintomas.
sarg_sem_restricao <- readr::read_csv2("dados/InfoGripe/serie_temporal_com_estimativas_recentes_sem_filtro_sintomas.csv")


#sarg_sem_restricao_val_esperados <- readr::read_csv2("dados/InfoGripe/valores_esperados_por_localidade.csv")


# Transformação dos dados -------------------------------------------------

# veficando tipo das colunas
str(sarg_sem_restricao)

# conhecendo a base
unique(sarg_sem_restricao$dado)
unique(sarg_sem_restricao$tipo)
unique(sarg_sem_restricao$escala)
unique(sarg_sem_restricao$situacao_do_dado)




# Manipulação dos dados ---------------------------------------------------


