select t.table_schema,
       t.table_name,
       c.column_name

from information_schema.tables t
inner join information_schema.columns c on c.table_name = t.table_name 
                                and c.table_schema = t.table_schema
where c.column_name LIKE '%stock%'
      and t.table_schema not in ('information_schema', 'pg_catalog')
      and t.table_schema LIKE '%mr%'
      and t.table_type = 'BASE TABLE'
order by t.table_schema;

      ;