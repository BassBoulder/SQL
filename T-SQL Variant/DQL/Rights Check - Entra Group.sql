select concat('deny select on ', s.name, '.', t.name, ' to [<EntraGroupName>];')
from   sys.tables  t
join   sys.schemas s on s.schema_id = t.schema_id
WHERE t.name NOT IN ('<TableName>')
