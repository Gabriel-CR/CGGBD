-- quantidade de tabelas do banco de dados
SELECT	count(*) as quantidade_tabelas
FROM	pg_catalog.pg_tables
WHERE	schemaname = 'public';

-- quantidade de atributos de cada tabela
SELECT	table_name, count(*) as quantidade_atributos
FROM	information_schema.columns
WHERE	table_schema = 'public' 
GROUP BY table_name;

-- tamanho de cada tabela em em gigabaytes
CREATE EXTENSION IF NOT EXISTS pgstattuple;

SELECT
  table_name,
  pg_size_pretty(pg_total_relation_size(table_name::regclass)) AS tamanho_tabela
FROM
  information_schema.tables
WHERE
  table_schema = 'public' -- Substitua 'public' pelo nome do esquema desejado, se necessário
  AND table_type = 'BASE TABLE';

-- quantidade de acessos sequenciais realizada em cada
