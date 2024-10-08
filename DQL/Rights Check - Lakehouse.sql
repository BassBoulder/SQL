
SELECT l.name as grantee_name, p.state_desc, p.permission_name, *
FROM sys.database_permissions AS p JOIN sys.database_principals AS l 
ON   p.grantee_principal_id = l.principal_id
--WHERE l.name = 'HealthNet Self Service Restricted'
--WHERE l.name = 'ben.amalin@healthnethc.onmicrosoft.com'

SELECT O.name 'Object', T.name 'Table', C.name 'Column', C.is_masked, * FROM sys.objects O 
INNER JOIN sys.tables T ON O.object_id = T.object_id
INNER JOIN sys.all_columns C ON T.object_id = C.object_id
WHERE C.is_masked = 1
ORDER BY T.name