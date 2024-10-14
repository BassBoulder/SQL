  
  /*
	PRESS CTRL + L <<<
  */
  
  --RAW ORIGIN DATA
  SELECT TOP (1000) [Name]
      ,[Address_1]
      ,[Address_2]
  FROM [DEV].[dbo].[Origin]
  WHERE [Name] LIKE '%_i_k%'


  --NORMALISED_PEOPLE
  SELECT TOP (1000) [People_ID]
      ,[Name]
  FROM [DEV].[dbo].[Normalised_Origin_People]

  --NORMALISED ADDRESS
  SELECT TOP (1000) [Address_ID]
      ,[People_ID]
      ,[Address_1]
      ,[Address_2]
  FROM [DEV].[dbo].[Normalised_Origin_Address]
