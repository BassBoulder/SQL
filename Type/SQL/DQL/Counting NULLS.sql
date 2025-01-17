
--CONCATENATE----------------------------------------------
SELECT
'Doh' P1
,'Ray' P2
,'Me' P3
,'01:00:00' [Hour]
,'01/01/2001' [Date]
INTO #Concatenate

SELECT 
	 P1 + ' ' + P2 + ' ' +P3
	,[Date] + ' ' + [Hour]
	,CAST([Date] + ' ' + [Hour] AS DATETIME)
FROM #Concatenate    -- CAN'T COUNT NULLS
DROP TABLE #Concatenate
------------------------------------------------------

--ISNULL----------------------------------------------
SELECT
NULL Name
INTO #NameList

SELECT COUNT(Name) FROM #NameList    -- CAN'T COUNT NULLS
SELECT COUNT(ISNULL(Name,0)) FROM #NameList -- CAN COUNT NULLS IF WE TRANSFORM THEM INTO SOMETHING 'COUNTABLE' aka 0
DROP TABLE #NameList
------------------------------------------------------

--NULLIF----------------------------------------------
SELECT
	 PERSON_GIVEN_NAME
	,NULLIF(PERSON_GIVEN_NAME, 'Gary') 
FROM 
	CDO_MPI
WHERE 
	CDO_MPI.PERSON_GIVEN_NAME IN ('Paul','Gary')
------------------------------------------------------

--COALESCE----------------------------------------------
SELECT TOP 100
	 ref.REFERRAL_REQUEST_CANCELLED_DATE
	,ref.REFERRAL_REQUEST_CLOSURE_DATE
	,ref.REFERRAL_REQUEST_RECEIVED_DATE
	,COALESCE(ref.REFERRAL_REQUEST_CANCELLED_DATE, ref.REFERRAL_REQUEST_CLOSURE_DATE, ref.REFERRAL_REQUEST_RECEIVED_DATE)
FROM -- IF FIRST IS NULL THEN SECOND, IF FIRST AND SECOND IS NULL THEN THIRD
	CDO_OP_REFERRAL ref
WHERE
	ref.REFERRAL_REQUEST_CANCELLED_DATE IS NULL
OR
	ref.REFERRAL_REQUEST_CLOSURE_DATE IS NULL
------------------------------------------------------

--LEN----------------------------------------------
SELECT
	 PERSON_GIVEN_NAME
	,NULLIF(PERSON_GIVEN_NAME, 'Gary') 
FROM 
	CDO_MPI
WHERE 
	CDO_MPI.PERSON_GIVEN_NAME IN ('Paul','Gary')
------------------------------------------------------