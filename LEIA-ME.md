# Trabalho de conclusão de curso: Introdução à programação para Ciência de Dados

**Aluno**: Maykon Gabriel G. Pedro

**Contato**: [maykonglaffite\@gmail.com](mailto:maykonglaffite@gmail.com){.email} \| **github**: @maykongpedro

## Introdução

Trabalho de conclusão de curso referente ao curso "Introdução à Programação para Ciência de Dados", tendo como objetivo geral aplicar uma manipulação e análise em uma base de dados de modo prático, usando os conhecimentos adquiridos durante as aulas.

## Objetivo específico

Avaliar a média de mortes por SARG (Síndrome Respiratória Aguda Grave) dos últimos anos, buscando analisar a informação de que a pandemia de COVID-19 teve efeito em cima dos óbitos, podendo corroborar com a hipótese de subnotificação dos óbitos por COVID.

## Organização dos arquivos

1.  **Script_1 - "2021-03-07_consolidacao**": Nesse script é realizado o resumo e consolidação da análise, respondendo aos questionamentos levantados a partir dos outputs dos outros scripts.

2.   **Script_2 - "2021-03-14_analise_covid**": Aqui é realizado a análise utilizando a base de dados referente aos casos de COVID-19 no Brasil. É gerado: um vetor que contabiliza a quantidade de óbitos totais pela doença até a última data da base (2021/03/13); um vetor que contabiliza os óbitos no ano de 2020; e um arquivo .csv que resume a quantidade de óbitos por estado no ano de 2020.

3.  **Script_3 - "2021-03-14_analise_sarg**": Esse script realiza as análises referentes à SARG. Nele é gerado como output: um arquivo .csv contabilizando os óbitos ocasionados pela doença nos anos de 2009 a 2020; uma mensagem informando a quantidade de óbitos por SARG em 2020; e um arquivo .csv que resume algumas estatísticas descritivas referentes aos óbitos de 2009 a 2019.

4.  **Função_1 - "2021-03-15_funcoes_analises**": Esse script armazena a função utilizada para cálcular as seguintes estatísticas descritivas de uma coluna de um dataframe: média, máximo, mínimo, desvio padrão e coeficiente de variação. Após o cálculo, a função salva um arquivo .csv como output de resultado.

## Estrutura de pastas:

    +-- 2021-03-07_Curso-R-Introducao-Projeto-Final.Rproj
    +-- dados
    |   +-- HIST_PAINEL_COVIDBR_13mar2021.csv
    |   \-- InfoGripe
    |       +-- readme.md
    |       \-- serie_temporal_com_estimativas_recentes.csv
    +-- funcoes
    |   \-- 2021-03-15_funcoes_analises.R
    +-- LEIA-ME.txt
    +-- outputs
    |   +-- covid_obitos_por_estado_2020.csv
    |   +-- estatisticas.csv
    |   +-- sarg_estatisticas_obitos_2009-2019.csv
    |   \-- sarg_obitos_por_ano.csv
    \-- scripts
        +-- 2021-03-07_consolidacao.R
        +-- 2021-03-14_analise_covid.R
        \-- 2021-03-14_analise_sarg.R

## Fonte dos dados

1.  **InfoGripe**. Dados referentes à Síndrome Respiratória Aguda Grave (SARG). Disponível em: <https://gitlab.procc.fiocruz.br/mave/repo/-/tree/master/Dados/InfoGripe>. Acesso realizado em 10 de Mar. de 2021.

2.  **Ministério da Saúde**. Dados referentes à COVID-19. Disponível em: <https://covid.saude.gov.br> . Acesso realizado em 13 de Mar. de 2021.

3.  **Arquivos**. Os arquivos exatos utilizados na análise podem ser obtidos baixando o projeto no seguinte link: <https://drive.google.com/file/d/1x3YVm1qnvfCG363XYG4bKYaPk2K3k3sD/view?usp=sharing>. Pasta atualizada em 17 de Mar. de 2021.

## Apoio teórico

1.  <https://g1.globo.com/bemestar/coronavirus/noticia/2020/04/23/estudo-mostra-aumento-expressivo-de-internacoes-por-sindromes-respiratorias-e-indica-subnotificacao-da-covid-19.ghtml>

2.  <http://info.gripe.fiocruz.br/help>

## Considerações finais

Na fonte de dados sobre SARG estão disponíveis vários arquivos, sendo estes diversos em seus detalhes e estruturas. A base escolhida foi resultado de minha interpretação, seguindo as recomendações do README presente na base de dados e no estudo dos filtros no painel de dados do InfoGripe.

Não tenho como pretensão dar certeza sobre o fato do número de óbitos de SARG acima da média ser diretamente relacionado à sub-notificação de COVID-19. Entretanto, dado o resultado demonstrado na análise, os números de óbitos de SARG em 2020 - ano do início da pandemia de COVID-19 - estão estratosféricos se comparados à sua média histórica, sendo necessário estudos de correlação entre as duas doenças, para poder avaliar em definitivo se a hipótese de subnotificação dos casos de COVID-19 tem significância positiva.
