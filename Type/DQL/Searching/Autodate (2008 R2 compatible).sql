--HIGHLIGHT THE ONE YOU WANT AND PRESS F5, ERROR DUE TO ALL BEING CALLED @START & @END, HIGHTLIGHTING WILL FIX ERROR--

--DAILY-- (>= @START + <@END)
DECLARE @START AS Date
DECLARE @END AS Date
SET @START = GETDATE()-2 --Day before yesterday
SET @END = GETDATE()-1--Yesterday
SELECT @START ,@END


--DAILY type 2-- (>= @START + <@END)
DECLARE @START AS Date
DECLARE @END AS Date
SET @START = 			CASE WHEN DATEPART(WEEKDAY,GETDATE()) = '1' THEN GETDATE()-4 
									  WHEN DATEPART(WEEKDAY,GETDATE()) IN ('2','3','4','5') THEN GETDATE()-2  END  		

SET @END = 			CASE WHEN DATEPART(WEEKDAY,GETDATE()) = '1' THEN GETDATE()-1 
									  WHEN DATEPART(WEEKDAY,GETDATE()) IN ('2','3','4','5') THEN GETDATE()-1  END  
SELECT @START ,@END


--WEEKLY-- v1.1 --1 week ago to most recent Monday *unless run on monday then it's 2 weeks ago > 1 week ago  (>= @START + <@END)
DECLARE @START AS Date
DECLARE @END AS Date
SET @START = /*05-Nov-2018*/
						   CASE WHEN DATEPART(WEEKDAY,GETDATE()) = '1' THEN GETDATE()-14 --IF MONDAY @START = Today - 14 Days (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '2' THEN GETDATE()-8  --IF TUESDAY @START = Today - 8 Days (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '3' THEN GETDATE()-9  --IF WEDNESDAY @START = Today - 9 Days (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '4' THEN GETDATE()-10  --IF THURSDAY @START = Today - 10 Days (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '5' THEN GETDATE()-11  --IF FRIDAY @START = Today - 11 Days (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '6' THEN GETDATE()-12  --IF SATURDAY @START = Today - 12 Days (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '7' THEN GETDATE()-13 /*IF SUNDAY @START = Today - 13 Days (Set to Date Only)*/ END  							 
SET @END=  /*12-Nov-2018*/ 
						  CASE WHEN DATEPART(WEEKDAY,GETDATE()) = '1' THEN GETDATE()-7--IF MONDAY @END = Today-7 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '2' THEN GETDATE()-1 --IF TUESDAY @END = Today -1 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '3' THEN GETDATE()-2 --IF WEDNESDAY @END = Today -2 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '4' THEN GETDATE()-3 --IF THURSDAY @END = Today -3 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '5' THEN GETDATE()-4 --IF FRIDAY @END = Today -4 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '6' THEN GETDATE()-5 --IF SATURDAY @END = Today -5 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '7' THEN GETDATE()-6 /*IF SUNDAY @END = Today -6 (Set to Date Only)*/ END  				
										SELECT @START ,@END
										

--FORTNITELY-- 2 weeks ago to most recent Monday *unless run on monday then it's 3 weeks ago > 1 week ago  (>= @START + <@END)
DECLARE @START AS Date
DECLARE @END AS Date
SET @START = /*05-Nov-2018*/
						   CASE WHEN DATEPART(WEEKDAY,GETDATE()) = '1' THEN GETDATE()-21 --IF MONDAY @START = Today - 14 Days (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '2' THEN GETDATE()-15  --IF TUESDAY @START = Today - 8 Days (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '3' THEN GETDATE()-16  --IF WEDNESDAY @START = Today - 9 Days (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '4' THEN GETDATE()-17  --IF THURSDAY @START = Today - 10 Days (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '5' THEN GETDATE()-18  --IF FRIDAY @START = Today - 11 Days (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '6' THEN GETDATE()-19  --IF SATURDAY @START = Today - 12 Days (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '7' THEN GETDATE()-20 /*IF SUNDAY @START = Today - 13 Days (Set to Date Only)*/ END  							 
SET @END=  /*12-Nov-2018*/ 
						  CASE WHEN DATEPART(WEEKDAY,GETDATE()) = '1' THEN GETDATE()-7--IF MONDAY @END = Today-7 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '2' THEN GETDATE()-1 --IF TUESDAY @END = Today -1 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '3' THEN GETDATE()-2 --IF WEDNESDAY @END = Today -2 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '4' THEN GETDATE()-3 --IF THURSDAY @END = Today -3 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '5' THEN GETDATE()-4 --IF FRIDAY @END = Today -4 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '6' THEN GETDATE()-5 --IF SATURDAY @END = Today -5 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '7' THEN GETDATE()-6 /*IF SUNDAY @END = Today -6 (Set to Date Only)*/ END  				
										SELECT @START ,@END
						
						
--LAST 10 WEEKS --10 WEEKS AGO'S MONDAY to LAST MONDAY PAST (>= @START + <@END)
DECLARE @START AS Date
DECLARE @END AS Date
SET @START = 
						  CASE WHEN DATEPART(WEEKDAY,GETDATE()) = '1' THEN DATEADD(Week,-10,(GETDATE()-14))--IF MON @START = Today - 10 Wks
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '2' THEN DATEADD(Week,-10,(GETDATE()-1)) --IF TUES @START = Today -1 -10 Wks
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '3' THEN DATEADD(Week,-10,(GETDATE()-2)) --IF WEDN@START = Today -2  -10 Wks
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '4' THEN DATEADD(Week,-10,(GETDATE()-3)) --IF THUR @START = Today -3  -10 Wks
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '5' THEN DATEADD(Week,-10,(GETDATE()-4)) --IF FRI @START = Today -4  -10 Wks
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '6' THEN DATEADD(Week,-10,(GETDATE()-5)) --IF SAT @START = Today -5  -10 Wks
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '7' THEN DATEADD(Week,-10,(GETDATE()-6)) /*IF SUN @START = Today-6 -10 Wks*/ 
									  END  
SET @END=  /*12-Nov-2018*/ 
						  CASE WHEN DATEPART(WEEKDAY,GETDATE()) = '1' THEN GETDATE()-7--IF MONDAY @END = Today-7 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '2' THEN GETDATE()-1 --IF TUESDAY @END = Today -1 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '3' THEN GETDATE()-2 --IF WEDNESDAY @END = Today -2 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '4' THEN GETDATE()-3 --IF THURSDAY @END = Today -3 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '5' THEN GETDATE()-4 --IF FRIDAY @END = Today -4 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '6' THEN GETDATE()-5 --IF SATURDAY @END = Today -5 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '7' THEN GETDATE()-6 /*IF SUNDAY @END = Today -6 (Set to Date Only)*/ END				
									  SELECT @START ,@END


--LAST 52 WEEKS --52 WEEKS AGO'S MONDAY to LAST MONDAY PAST (>= @START + <@END)
DECLARE @START AS Date
DECLARE @END AS Date
SET @START = 
						  CASE WHEN DATEPART(WEEKDAY,GETDATE()) = '1' THEN DATEADD(Week,-52,(GETDATE()-14))--IF MON @START = Today - 10 Wks
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '2' THEN DATEADD(Week,-52,(GETDATE()-1)) --IF TUES @START = Today -1 -10 Wks
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '3' THEN DATEADD(Week,-52,(GETDATE()-2)) --IF WEDN@START = Today -2  -10 Wks
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '4' THEN DATEADD(Week,-52,(GETDATE()-3)) --IF THUR @START = Today -3  -10 Wks
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '5' THEN DATEADD(Week,-52,(GETDATE()-4)) --IF FRI @START = Today -4  -10 Wks
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '6' THEN DATEADD(Week,-52,(GETDATE()-5)) --IF SAT @START = Today -5  -10 Wks
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '7' THEN DATEADD(Week,-52,(GETDATE()-6)) /*IF SUN @START = Today-6 -10 Wks*/ 
									  END  
SET @END=  /*12-Nov-2018*/ 
						  CASE WHEN DATEPART(WEEKDAY,GETDATE()) = '1' THEN GETDATE()-7--IF MONDAY @END = Today-7 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '2' THEN GETDATE()-1 --IF TUESDAY @END = Today -1 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '3' THEN GETDATE()-2 --IF WEDNESDAY @END = Today -2 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '4' THEN GETDATE()-3 --IF THURSDAY @END = Today -3 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '5' THEN GETDATE()-4 --IF FRIDAY @END = Today -4 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '6' THEN GETDATE()-5 --IF SATURDAY @END = Today -5 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '7' THEN GETDATE()-6 /*IF SUNDAY @END = Today -6 (Set to Date Only)*/ END 
									  SELECT @START ,@END


--AUTO FINYr

--DECLARE @START AS date =
--CASE WHEN CompletedDateTime >= '01-Apr-' +' '+ CAST(DATEPART(YEAR,CompletedDateTime) AS varchar)
--		AND CompletedDateTime < '31-Mar-' +' '+ CAST(DATEPART(YEAR,DATEADD(YEAR,1,CompletedDateTime)) AS varchar)
--				  THEN  CAST(DATEPART(YEAR,CompletedDateTime) AS varchar)
--				   +'/'+ RIGHT(CAST(DATEPART(YEAR,DATEADD(YEAR,1,CompletedDateTime)) AS varchar),2)
--				   END FINYR
--				   SELECT @START



--MONTHLY--START OF MONTH TO LAST MONDAY PAST (>= @START + <@END)
DECLARE @START AS Date
DECLARE @END AS Date
SET @START = /*05-Nov-2018*/ DATEADD(month,0,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0))  							 
SET @END=  /*12-Nov-2018*/ 
						  CASE WHEN DATEPART(WEEKDAY,GETDATE()) = '1' THEN GETDATE()-7--IF MONDAY @END = Today-7 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '2' THEN GETDATE()-1 --IF TUESDAY @END = Today -1 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '3' THEN GETDATE()-2 --IF WEDNESDAY @END = Today -2 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '4' THEN GETDATE()-3 --IF THURSDAY @END = Today -3 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '5' THEN GETDATE()-4 --IF FRIDAY @END = Today -4 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '6' THEN GETDATE()-5 --IF SATURDAY @END = Today -5 (Set to Date Only)
									  WHEN DATEPART(WEEKDAY,GETDATE()) = '7' THEN GETDATE()-6 /*IF SUNDAY @END = Today -6 (Set to Date Only)*/ END  				 
									  SELECT @START ,@END
						
--470 Days : START OF MONTH
DECLARE @START AS Date
DECLARE @END AS Date
SET @START = /*05-Nov-2018*/ GETDATE()-470
SET @END= /*12-Nov-2018*/ 
CASE 
CASE WHEN DATEPART(DAY,GETDATE()) = '01' AND DATEPART(MONTH,DATEADD(month,0,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0))) = DATEPART(MONTH,GETDATE())
THEN DATEADD(month,-1,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0)) 
 ELSE DATEADD(month,0,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0))  END



--MONTH-TO-MONTH-- (>= @START + <@END)
DECLARE @START AS Date
DECLARE @END AS Date
SET @START = DATEADD(month,-1,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0)) --GREATER THAN OR EQUAL TO /*  >=  */
SET @END = CASE WHEN DATEPART(DAY,GETDATE()) = '01' AND DATEPART(MONTH,DATEADD(month,0,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0))) = DATEPART(MONTH,GETDATE())
THEN DATEADD(month,-1,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0)) 
 ELSE DATEADD(month,0,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0))  END

SELECT @START, @END 						
									  

--QUARTERLY based on months, not finanical or calendar quarter-- (>= @START + <@END)
DECLARE @START AS Date
DECLARE @END AS Date
SET @START = DATEADD(month,-4,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0)) --GREATER THAN OR EQUAL TO /*  >=  */
SET @END = DATEADD(month,-1,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0))  --LESS THAN  /*  <  */
SELECT @START, @END 

--12 WHOLE MONTHS-- (>= @START + <@END)
DECLARE @START AS Date
DECLARE @END AS Date
SET @START = 
CASE 
WHEN DATEPART(DAY,GETDATE()) = '01' AND DATEPART(MONTH,DATEADD(month,0,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0))) = DATEPART(MONTH,GETDATE())
THEN DATEADD(month,-14,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0)) 
 ELSE DATEADD(month,-13,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0))  END

SET @END = 
CASE 
WHEN DATEPART(DAY,GETDATE()) = '01' AND DATEPART(MONTH,DATEADD(month,0,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0))) = DATEPART(MONTH,GETDATE())
THEN DATEADD(month,-1,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0)) 
 ELSE DATEADD(month,0,DATEADD(m,DATEDIFF(m, 0,GETDATE()),0))  END

SELECT @START, @END


--START OF FIN YEAR--v3----Start of the finyear, unless it's April and then take off a year (because if it's april 2018 you would want april 2017 as start)
--(>= @START + <@END)
DECLARE @START AS Date 
--DECLARE @Pretender AS Date SET @Pretender = '01-Apr-2019' /* '02-Apr-2019' */
SET @START = /*01-Apr-2018*/
'01-Apr-' + ' ' + CASE WHEN (DATEPART(DAY,CURRENT_TIMESTAMP) = '1' 
									AND (SUBSTRING(datename(mm,CURRENT_TIMESTAMP),1,3) IN ('Apr')) 
									OR SUBSTRING(datename(mm,CURRENT_TIMESTAMP),1,3) IN ('Jan','Feb','Mar'))
									THEN CONVERT(nvarchar,(SUM(CONVERT(int,(SUBSTRING(datename(yyyy,CURRENT_TIMESTAMP),1,4))))-1),101) 
										ELSE SUBSTRING(datename(yyyy,CURRENT_TIMESTAMP),1,4) 
										END		
SELECT @START --,CURRENT_TIMESTAMP

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--EXAMPLE need uncommenting

--VARIABLE TABLE for Month, Calendar Qtr & Financial Qtr
DECLARE @yourtable table (Month varchar(9),CalQuarter varchar(4),FinQuarter varchar(4))
	INSERT INTO @yourtable (Month,CalQuarter,FinQuarter) values 
	('January','Q1','Q4'),('February','Q1','Q4'),('March','Q1','Q4'),('April','Q2','Q1'),('May','Q2','Q1'),('June','Q2','Q1'),('July','Q3','Q2'),('August','Q3','Q2'),('September','Q3','Q2'),('October','Q4','Q3'),('November','Q4','Q3'),('December','Q4','Q3')	
SELECT *
FROM @yourtable

/*
SELECT TOP 12 DATENAME(MONTH,admitmonth) Month, AdmitFinQtr as CalQuarter, AdmitFinQtr as FinQuarter
FROM IP_ADMISSION
UNION ALL SELECT 
Month,CalQuarter,FinQuarter
FROM @yourtable
SELECT TOP 5 * FROM IP_ADMISSION
*/

-----------------------------------------------------------------------
--EXAMPLE need uncommenting

--VARIABLE TABLE for ID holding
DECLARE @NHStable table (NHS varchar(10))
	INSERT INTO @NHStable values 
('4080082312'),
('4506858174')
SELECT *
FROM @NHStable
/*
SELECT DISTINCT TOP 2 NHSNo2 
FROM IP_ADMISSION a 
LEFT JOIN @NHStable b ON NHS = a.NHSNo2 
WHERE a.NHSNo2 = b.NHS
*/
-----------------------------------------------------------------------