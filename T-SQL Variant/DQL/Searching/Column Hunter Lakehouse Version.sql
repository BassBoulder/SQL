select t.table_schema,
       t.table_name,
       c.column_name

from INFORMATION_SCHEMA.TABLES t
inner join INFORMATION_SCHEMA.COLUMNS c on c.table_name = t.table_name 
                                and c.table_schema = t.table_schema
where c.column_name LIKE '%salesid%'
      and t.table_schema not in ('information_schema', 'pg_catalog')
      and t.table_type = 'BASE TABLE'
order by t.table_schema;

      ;