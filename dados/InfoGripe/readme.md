# AVISO
Dados provenientes de sistemas de notificação de caso, como é o caso sivep-gripe que alimenta o InfoGripe, podem conter eventuais erros de digitação ou preenchimento afetando um ou mais dos diversos campos de registro.

Em função disso, as notificações estão em constante avaliação para correções que se façam necessárias mediante análise da rede de vigilância e das equipes locais responsáveis por cada registro

Todos os casos aqui reportados utilizam como data de referência a semana de início de sintomas (data de primeiros sintomas),
mesmo quando referente a óbitos. Isto é, mesmo para os óbitos, as datas utilizadas para contagem são de quando os casos que vieram a falecer em algum momento, em decorrência de SRAG, apresentaram os primeiros sintomas de síndrome respiratória.

## InfoGripe

Dados gerados pelo sistema InfoGripe, em parceira entre os pesquisadores do MAVE e GT-Influenza da Secretaria de Vigilância em Saúde do Ministério da Saúde.
Permissão de uso público com citação dos artigos e sistemas correspondentes.

Autores: Grupo de Métodos Analíticos de Vigilância Epidemiológica (MAVE), PROCC/Fiocruz e EMap/FGV, e GT-Influenza da Secretaria de Vigilância em Saúde do Ministério da Saúde, http://covid-19.procc.fiocruz.br/, http://info.gripe.fiocruz.br

### Conjuntos de dados

Neste repositório, disponibilizamos três recortes de dados processados do sivep-gripe, com base em filtros de sintomas distintos. Todos os arquivos com nomenclaura base similar seguem o mesmo dicionário de dados.

Para análise de situação associada ao surto de COVID-19 no Brasil, a recomendação é que seja utilizado o dado sem filtro de febre.

##### Filtro de sintomas segundo definição de SRAG.
Esse é o filtro utilizado para apresentação dos dados seguindo o critério mais restritivo. Segue o padrão internacional de definição de SRAG, conforme Organização Mundial da Saúde. É equivalente aos registros internacionais de SARI (Severe Acute Respiratory Infection).

São mantidos apenas os registros que atendem os seguintes critérios:
  - Febre E
  - Tosse OU dor de garganta E
  - Dispnéia OU saturação de oxigênio < 95% OU dificuldade respiratória E
  - internação OU óbito
  
Arquivos associados presentes no diretório:
  - dados\_semanais\_faixa_etaria\_sexo\_virus.csv
  - serie\_temporal\_com\_estimativas\_recentes.csv
  - valores\_esperados\_por\_localidade.csv
  - tabela\_de\_alerta.csv
  
A descrição dos arquivos e seus dicionários é feita com base nesse conjunto. Porém, se aplica aos arquivos análogos presentes nos demais.

##### Filtro de sintomas segundo definição de SRAG, porém sem necessidade de apresentar febre.
Filtro intermediário, sugerido pelo Ministério da Saúde, em função da ocorrência de casos de síndrome respiratória aguda de COVID-19 sem presença de febre. Pode ser comparado a casos internacionais de ARI (Acute Respiratory Infection), com descrição explícita dos sintomas considerados.

São mantidos apenas os registros que atendem os seguintes critérios:
  - Tosse OU dor de garganta E
  - Dispnéia OU saturação de oxigênio < 95% OU dificuldade respiratória E
  - internação OU óbito
  
Arquivos associados presentes no diretório:
  - dados\_semanais\_faixa\_etaria\_sexo\_virus\_sem\_filtro\_febre.csv
  - serie\_temporal\_com\_estimativas\_recentes\_sem\_filtro\_febre.csv
  - valores\_esperados\_por\_localidade\_sem\_filtro\_febre.csv
  - tabela\_de\_alerta\_sem\_filtro\_febre.csv

##### Filtro de apenas por internação ou óbito
Filtro menos restritivo, sugerido pelo Ministério da Saúde para acompanhamento de hospitalizações e óbitos notificados no sistema sivep-gripe, independentemente de atender os critérios estritos de SRAG. Pode ser comparado a casos internacionais de ARI (Acute Respiratory Infection), com descrição explícita de que não há restrição rígida de sintomas.

São mantidos apenas os registros que atendem os seguintes critérios:
  - internação OU óbito
  
Arquivos associados presentes no pacote dados\_sem\_filtro\_sintomas.zip:
  - dados\_semanais\_faixa\_etaria\_sexo\_virus\_sem\_filtro\_sintomas.csv
  - serie\_temporal\_com\_estimativas\_recentes\_sem\_filtro\_sintomas.csv
  - tabela\_de\_alerta\_sem\_filtro\_sintomas.csv

### Alerta de situação com base no número de novos casos semanais.

- arquivos tablea\_de\_alerta

Apresenta a estimativa para o número de novos casos semanais por localidade para as últimas duas semanas epidemiológicas, a média móvel com base nas últimas três semanas epidemiológicas, e o nível de alerta associado a esses valores.

| Variável | Descrição |
|-|-|
| UF | código da localidade (Brasil (0), UFs (11-53), Regiões geopolíticas (1-5), e Regional por perfil de atividade (1001-1004)) |
| Unidade da Federação | nome da localidade (tanto UF quanto agregados de Ufs) |
| dado |  total de síndrome respiratória aguda grave (srag), total de óbitos de SRAG (obito),   SRAG por influenza (sragflu), óbitos de SRAG por influenza (obitoflu), SRAG por COVID-19 (sragcovid), obitos de SRAG por COVID-19 (obitocovid) |
| escala |  incidência por 100mil habitantes (incidência), casos |
| Ano epidemiológico | ano epidemiológico da semana de primeiros sintomas. |
| Semana epidemiológica | semana epidemiológica de primeiros sintomas. |
| casos estimados |  estimativa de casos recentes. |
| média móvel | média móvel com janela de 3 semanas |
| nível semanal | valor baixo, valor epidêmico, valor alto, valor muito alto. Definido com base no padrão histórico. |
| nível por média móvel | Amarelo (valor baixo), laranja (epidêmico), vermelho (alto ou muito alto). |

### Dados por sexo do paciente, estratificado por idade ou situação do exame laboratorial.

- arquivos dados\_semanai\_faixa\_etaria\_sexo\_virus

Dado correspondente aos painéis de "Exames Laboratoriais" e "Distribuição por Gênero/Idade" no site do InfoGripe.

O total de casos até a última atualização pode ser obtida através da seleção `sexo = "Total"`, selecionando o ano de interesse na coluna `Ano epidemiológico`, o conjunto de dados na coluna `dado`, e somando os valores da coluna de interesse para todas as semanas. Por exemplo, para obter o total de casos notificados para SRAG desde a semana 1 até a semana 15 do ano 2020, para o estado de São Paulo, deve-se filtrar os dados da seguinte forma:

```
sexo = 'Total'
Ano epidemiológico = 2020
UF = 35 (ou de maneira equivalente Unidade da Federação = 'São Paulo')
dado = 'srag'
Semana epidemiológica entre 1 e 15
```

E somar os valores na coluna `Total reportado até a última atualização`.
Caso o total de interesse, para o memso intervalo de tempo, for o número de casos positivos para SARS-CoV-2, pode-se ou trocar o dado para `dado = sragcovid` ou manter o dado `srag` e somar os valores da coluna `SARS-CoV-2`.

Arquivo:
- dado\_semanais\_faixa\_etaria\_sexo\_virus.csv

Conteúdo:

| Variável | Descrição |
|-|-|
| UF |código da localidade (Brasil (0), UFs (11-53), Regiões geopolíticas (1-5), e Regional por perfil de atividade (1001-1004)) |
| Unidade da Federação |nome da localidade (tanto UF quanto agregados de UFs) |
| Tipo |tipo de localidade (País, Estado, Região, Regional) |
| dado |total de síndrome respiratória aguda grave (srag), total de óbitos de SRAG (obito), SRAG por influenza (sragflu), óbitos de SRAG por influenza (obitoflu), SRAG por COVID-19 (sragcovid), obitos de SRAG por COVID-19 (obitocovid) |
| escala |incidência por 100mil habitantes (incidência), casos |
| Situação do dado |estável ou incompleto em função do padrão de inserção das notificações no sistema de informação. |
| sexo |masculino (M), feminino (F), ignorado (I), total (Total) |
| Ano epidemiológico |ano epidemiológico da semana de primeiros sintomas. |
| Semana epidemiológica |semana epidemiológica de primeiros sintomas. |
| 'Total reportado até a última semana' |total de notificações para a UF, dado, semana, e sexo correspondentes. |
| colunas '<2 anos', '0-4 anos', ... '60+ anos' |estratificação por faixa etária. A coluna <2 anos só possui valores na escala 'casos'. Total em cada faixa etária para a UF, dado, semana, e sexo correspondentes. |
| colunas 'Testes positivos', 'Testes negativos', ..., 'Casos sem teste laboratorial' | total de casos por situação dos exames laboratoriais, para a UF, dado, semana, e sexo correspondentes. |
| colunas 'Influenza A', 'Influenza B', 'SARS-CoV-2', ..., 'Adenovírus' | total de casos com resultado positivo para cada vírus, para a UF, dado, semana, e sexo correspondentes. Não inclui todos os vírus testados. |
  
Descrição: casos de síndrome respiratória aguda grave agregado por país, UF, regiões geopolíticas, regionais de perfil de atividade, semana epidemiológica e sexo. Estratificado por faixa etária e por resultado laboratorial.

Autores:
MAVE 

Referências:

- Sivep-gripe
- http://info.gripe.fiocruz.br

### Total de casos por semana e estimativas de casos recentes, para SRAG, SRAG por Influenza, SRAG por COVID-19, óbitos de SRAG, óbitos de SRAG por Influenza, e óbitos de SRAG por COVID-19.

Dado correspondente ao painel 'Série Temporal' no site do InfoGripe. Para as duas úlitmas semanas são apresentadas apenas as estimativas e os respectivos intervalos de confiança. Dados já inserido são apresentados até duas semanas anteriores à última por conta da oportunidade de digitação (tempo entre primeiros sintomas e inserção do caso no banco de dados).

Recomenda-se que estados com padrões histoŕicos muito baixo utilizem os dados da região geopolítica ou da regional por perfil de atividade para alerta de situação.

Arquivo:
- serie\_temporal\_com\_estimativas\_recentes.csv

Conteúdo:

| Variável | Descrição |
|-|-|
| data de publicação |data em que as análises foram geradas. As estimativas levam em conta os dados inseridos no sistema até o domingo da última semana epidemiológica apresentada. |
| UF |código da localidade (Brasil (0), UFs (11-53), Regiões geopolíticas (1-5), e Regional por perfil de atividade (1001-1004)) |
| Unidade da Federação |nome da localidade (tanto UF quanto agregados de UFs) |
| Tipo |tipo de localidade (País, Estado, Região, Regional) |
| dado |total de síndrome respiratória aguda grave (srag), total de óbitos de SRAG (obito), SRAG por influenza (sragflu), óbitos de SRAG por influenza (obitoflu), SRAG por COVID-19 (sragcovid), obitos de SRAG por COVID-19 (obitocovid) |
| escala |incidência por 100mil habitantes (incidência), casos |
| Ano epidemiológico |ano epidemiológico da semana de primeiros sintomas. |
| Semana epidemiológica |semana epidemiológica de primeiros sintomas. |
| Situação do dado |estável ou incompleto em função do padrão de inserção das notificações no sistema de informação. |
| 'Total reportado até a última semana' |total de notificações para a UF, dado, semana, e sexo correspondentes. 
| 'limite inferior da estimativa' |limite inferior do intervalo de confiança para a estimativa de casos recentes |
| 'casos estimados' |estimativa de casos recentes. |
| 'limite superior da estimativa' |limite inferior do intervalo de confiança para a estimativa de casos recentes |
| 'Percentual em relação ao país' |
| 'População' |população total UF correspondente. |
| média móvel | média móvel com janela de 3 semanas |

Descrição: casos de síndrome respiratória aguda grave agregado por país, UF, regiões geopolíticas, regionais de perfil de atividade, por semana epidemiológica.

Referências:

- Sivep-gripe
- http://info.gripe.fiocruz.br
- Bastos L, Economou T, Gomes M, Villela D, Coelho F, Cruz O, Stoner O, Bailey T, Codeço C. (2019). A modelling approach for correcting reporting delays in disease surveillance data, Statistics in Medicine, DOI:10.1002/sim.8303.


### Padrão esperado e limiares de atividade por localidade e conjunto de dados

Apresenta os limiares pré-epidêmico, de atividade alta, e muito alta (linhas horizontais apresentadas no InfoGripe), bem como as séries temporais que definem as zonas de êxito, segurança, alerta e risco (cores de fundo da série temporal no InfoGripe), para cada localidade.

Para os dados de SRAG por COVID-19 foram utilizados os padrões esperados a partir das séries históricas de SRAG por Influenza.

Recomenda-se que estados com padrões histoŕicos muito baixo utilizem os dados da região geopolítica ou da regional por perfil de atividade para alerta de situação.

Arquivo:
- valores\_esperados\_por\_localidade.csv

Conteúdo:

| Variável | Descrição |
|-|-|
| UF |código da localidade (Brasil (0), UFs (11-53), Regiões geopolíticas (1-5), e Regional por perfil de atividade (1001-1004))
| Unidade da Federação |nome da localidade (tanto UF quanto agregados de UFs)
| Tipo |tipo de localidade (País, Estado, Região, Regional)
| dado |total de síndrome respiratória aguda grave (srag), total de óbitos de SRAG (obito),
  SRAG por influenza (sragflu), óbitos de SRAG por influenza (obitoflu), SRAG por COVID-19 (sragcovid), obitos de SRAG por COVID-19 (obitocovid)
| escala |incidência por 100mil habitantes (incidência), casos
| Semana epidemiológica |semana epidemiológica de primeiros sintomas.
| Situação do dado |estável ou incompleto em função do padrão de inserção das notificações no sistema de informação.
| 'corredor baixo' |valor semanal considerado significativamente baixo com base no perfil histórico das temporadas regulares. Isto é, atipicamente baixo para a semana correspondente.
| 'corredor mediano' |valor semanal esperado com base no perfil histórico das temporadas regulares. Isto é, valor esperado para a semana correspondente.
| 'corredor alto' |valor semanal considerado significativamente alto com base no perfil histórico das temporadas regulares. Isto é, atipicamente alto para a semana correspondente.
| 'limiar pré-epidêmico' |patamar que sinaliza inicio da temporada (início de surto epidêmico) com base no perfil histórico das temporadas regulares.
| 'intensidade alta' |patamar que sinaliza valor significativamente alto com base no perfil histórico das temporadas regulares. Sinaliza um ano com pico considerado alto.
| 'intensidade muito alta' |patamar que sinaliza valor extremamente alto com base no perfil histórico das temporadas regulares. Sinaliza um ano com pico considerado extremamente alto.
  
Descrição: padrões típicos e limiares de atividade. Permitem definir os alertas de situação semanal e identificar a zona de atividade semanal.

Referências:

- Sivep-gripe
- http://info.gripe.fiocruz.br
- Vega T., Lozano J.E. (2004) Modelling influenza epidemic - can we detect the beginning and predict the intensity and duration? International Congress Series 1263 (2004) 281-283.
- Vega T., Lozano J.E. (2012) Influenza surveillance in Europe: establishing epidemic thresholds by the Moving Epidemic Method. Influenza and Other Respiratory Viruses, DOI:10.1111/j.1750-2659.2012.00422.x.

### Total de casos de SRAG por semana, estimativa de casos recentes e tendência de curto e longo prazo para UFs, capitais e macrorregiões de saúde

Arquivos:
- estados\_e\_pais\_serie\_estimativas\_tendencia\_sem_filtro_febre.csv
- capitais\_serie\_estimativas\_tendencia\_sem\_filtro\_febre.csv
- macsaud\_serie\_estimativas\_tendencia\_sem\_filtro\_febre.csv

| Variável | Descrição |
|-|-|
| data de publicação |data em que as análises foram geradas. As estimativas levam em conta os dados inseridos no sistema até o domingo da última semana epidemiológica apresentada. |
| CO\_MUN\_RES | código de 6 dígitos para o município de residência dos casos reportados (presente apenas no arquivo capitais). Para Brasília, os dados incluem apenas os registros referentes a residentes da Região de Saúde Central, embora o código de município seja o de Brasília. |
| DS\_NOMEPAD\_municip | Nome do município de residência ou da região de saúde correspondente no caso de Brasília (presenta apenas no arquivo capitais) |
| CO_MACSAUD | Código de 4 dígitos da Macrorregião de saúde de notificação dos casos reportados (presente apenas no arquivo macsaud) |
| CO\_UF | código da UF (0-53), sendo 0 indicando dado agregado para todo o país. |
| DS\_\UF\_SIGLA | Sigla da UF. Para CO\_UF = 0, a sigla correspondente é BR. |
| escala |incidência por 100mil habitantes (incidência), casos |
| Semana epidemiológica |semana epidemiológica de primeiros sintomas. |
| 'Casos semanais reportados até a última atualização' | total de notificações para a localidade e semana correspondentes. |
| 'casos estimados' |estimativa de casos recentes. |
| média móvel | média móvel com janela de 3 semanas |
| 'tendência de curto prazo' | código numérico para a tendência nas últimas 3 semanas: -1 (Prob. queda > 95%), -0.5 (Prob. queda > 75%), 0 (Estabilidade/oscilação), 0.5 (Prob. crescimento > 75%), 1.0 (Prob. crescimento > 95%) |
| 'tendência de longo prazo' | código numnérico para a tendência nas últimas 6 semanas: -1 (Prob. queda > 95%), -0.5 (Prob. queda > 75%), 0 (Estabilidade/oscilação), 0.5 (Prob. crescimento > 75%), 1.0 (Prob. crescimento > 95%) |
| 'População' |população total correspondente. |
| Q1 | limite inferior do intervalo de credibilidade interquartílico (50%) |
| Q3 | limite superior do intervalo de credibilidade interquartílico (50%) |
| IC80I | limite inferior do intervalo de credibilidade de 80% |
| IC80S | limite superior do intervalo de credibilidade de 80% |
| IC90I | limite inferior do intervalo de credibilidade de 90% |
| IC90S | limite superior do intervalo de credibilidade de 90% |
| IC95S | limite inferior do intervalo de credibilidade de 95% |
| IC95S | limite superior do intervalo de credibilidade de 95% |
| Grupo Jurídico | Grupo jurídico da unidade de notificação: 0 (todos), 1 (adm. pública), 2 (ent. empresarial, incluindo empresa pública), 3 (ent. sem fins lucrativos). |



Referências:
- Sivep-gripe
- http://info.gripe.fiocruz.br
- Bastos L, Economou T, Gomes M, Villela D, Coelho F, Cruz O, Stoner O, Bailey T, Codeço C. (2019). A modelling approach for correcting reporting delays in disease surveillance data, Statistics in Medicine, DOI:10.1002/sim.8303.
- Nota técnica: indicadores de tendência para os dados de SRAG do InfoGripe, MAVE, 19 de agosto de 2020. http://bit.ly/mave-infogripe-nota-tendencia
