DECLARE @NUMBER NVARCHAR(MAX) = 10;
DECLARE @INJECT_WORD NVARCHAR(MAX) = 'Name' --'ID@;
DECLARE @SQL_QUERY NVARCHAR(MAX);
SET @SQL_QUERY = N'SELECT TOP ('+ @NUMBER +') ProductKey
      ,[ProductLabel]
      ,[ProductName]
      ,[ProductDescription]
      ,[ProductSubcategoryKey]
      ,[Manufacturer]
      ,[BrandName]
      ,[ClassID]
      ,[ClassName]
      ,[StyleID]
      ,[StyleName]
      ,[Color'+ @INJECT_WORD +']
      --,[ColorName]
      ,[Size]
      ,[SizeRange]
      ,[SizeUnitMeasureID]
      ,[Weight]
      ,[WeightUnitMeasureID]
      ,[UnitOfMeasureID]
      ,[UnitOfMeasureName]
      ,[StockTypeID]
      ,[StockTypeName]
      ,[UnitCost]
      ,[UnitPrice]
      ,[AvailableForSaleDate]
      ,[StopSaleDate]
      ,[Status]
      ,[ImageURL]
      ,[ProductURL]
      ,[ETLLoadID]
      ,[LoadDate]
      ,[UpdateDate]
  FROM [Contoso].[dbo].[DimProduct]
  N'

  EXEC(@SQL_QUERY)
