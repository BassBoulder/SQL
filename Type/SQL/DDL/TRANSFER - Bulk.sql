DECLARE @NEWschema varchar(3)
DECLARE @CURRENTschema varchar(3)
SET @NEWschema = 'dbo'
SET @CURRENTschema = 'met'

SELECT CONCAT('ALTER SCHEMA ' , @NEWschema, ' TRANSFER ', @CURRENTschema,'.', T.NAME)
FROM   
	sys.tables  T
INNER JOIN   
	sys.schemas S ON S.SCHEMA_ID = T.SCHEMA_ID
WHERE 
	--T.SCHEMA_ID = 1 /* 1 = dbo */
--AND
	S.NAME = @CURRENTschema