[_🇺🇸 Click here to read the English version 🇺🇸_](https://github.com/jon-fig/Intro-to-SQL-Course/blob/main/README.md)

# Resumo
Estudei SQL pela primeira vez há alguns anos, aprendendo os princípios básicos, mexendo no MySQL e iniciando projetos que nunca chegaram a ser finalizados. Fazer este curso me permitiu reconectar com essa base, aprofundar meu conhecimento técnico e testar minhas habilidades em conjuntos de dados do mundo real — o que me fez apreciar o SQL ainda mais.

Sempre fui alguém que aprende fazendo, em vez de apenas consumir teoria pura. A prática direta no ambiente de notebooks me forçou a realmente entender o funcionamento por trás das consultas — como perceber como as agregações criam colunas calculadas que precisam ser referenciadas explicitamente, ou dominar a lógica exata por trás da diferença entre HAVING e WHERE.

Este curso da Kaggle me deu uma compreensão muito mais sólida sobre a lógica de consultas relacionais e os fundamentos do trabalho com data warehouses no Google BigQuery. Link para o Curso da Kaggle

# Principais Aprendizados & Lógica de Consultas
Como eu já possuía um conhecimento base de ferramentas de planilhas como o Excel e conceitos fundamentais de banco de dados (SELECT, FROM), este curso focou fortemente em elevar meu nível em sintaxe SQL, arquitetura de dados em nuvem e otimização de queries.

Abaixo estão os principais conceitos técnicos e momentos de clareza que dominei através da prática no editor de notebooks do Kaggle:

# SDK do BigQuery em Python & Arquitetura de Dados:
Compreendi como o Google BigQuery estrutura dados hierarquicamente (Projetos > Datasets > Tabelas).

Dominei o fluxo de trabalho da API do Python: inicialização do objeto bigquery.Client(), construção de referências de datasets/tabelas e uso de chamadas de API para inspecionar esquemas antes de executar consultas custosas.

Aprendi a visualizar prévias de linhas usando .to_dataframe() e a configurar limites de tamanho de consulta e configurações de jobs (job_config) para evitar custos acidentais por excesso de cota de dados.

# Mecânica de Consultas & Agregações:
Reassimilei a praticidade de usar COUNT(*) para contar o total de linhas em vez de procurar nomes de colunas específicos para referenciar.

Entendi como strings SQL multilinha são estruturadas no Python utilizando aspas triplas (""").

# Filtragem e Extração de Datas (WHERE & EXTRACT):
Pratiquei a filtragem de dados temporais de forma dinâmica usando EXTRACT diretamente dentro de cláusulas WHERE.

Aprendi a encadear múltiplas condições utilizando AND dentro de instruções WHERE.

# Ordem de Execução: WHERE vs. HAVING:
O WHERE filtra linhas brutas individuais antes de qualquer agrupamento acontecer.

O HAVING filtra dados agregados após a execução da cláusula GROUP BY e deve ser usado apenas com colunas agregadas.

# Regras do GROUP BY & ORDER BY:
Aprendi na prática que qualquer coluna não agregada presente na instrução SELECT precisa estar explicitamente listada no GROUP BY.

Fixei a ordem estrita das cláusulas: o GROUP BY deve vir sempre antes do ORDER BY.

# Subqueries e CTEs (WITH):
Dominei a construção de consultas mais limpas e modulares usando Expressões de Tabela Comuns (WITH ... AS (...)) para dividir lógicas complexas em etapas compreensíveis, garantindo a referência correta à CTE na instrução SELECT subsequente.

# Lógica Relacional Multi-Tabelas (INNER JOIN):
Entendi como o SQL constrói tabelas combinadas temporárias em memória por meio da chave de ligação na cláusula ON (q.id = a.parent_id).

Dominei o uso explícito de aliases de tabelas (q. vs a.) para delimitar o escopo de colunas seletivamente — aprendendo que as chaves de junção não precisam estar expostas no SELECT final caso não sejam necessárias no resultado desejado.
