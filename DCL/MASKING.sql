ALTER TABLE dbo.status
ALTER COLUMN ID DROP MASKED;

ALTER TABLE dbo.patients
ALTER COLUMN ID DROP MASKED;

ALTER TABLE dbo.comments
ALTER COLUMN ID DROP MASKED;

ALTER TABLE dbo.delivery
ALTER COLUMN ID DROP MASKED;

ALTER TABLE dbo.failures
ALTER COLUMN ID DROP MASKED;

ALTER TABLE dbo.activity
ALTER COLUMN ID DROP MASKED;

ALTER TABLE dbo.adherepredict
ALTER COLUMN ID DROP MASKED;




ALTER TABLE dbo.status
ALTER COLUMN ID ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.patients
ALTER COLUMN ID ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.comments
ALTER COLUMN ID ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.delivery
ALTER COLUMN ID ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.failures
ALTER COLUMN ID ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.activity
ALTER COLUMN ID ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.adherepredict
ALTER COLUMN ID ADD MASKED WITH (FUNCTION = 'default()');


ALTER TABLE dbo.cez_bankdetails
ALTER COLUMN AccountNumber ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.cez_bankdetails
ALTER COLUMN AccountHolder ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.cez_bankdetails
ALTER COLUMN BankName ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.cez_bankdetails
ALTER COLUMN SortCode ADD MASKED WITH (FUNCTION = 'default()');


ALTER TABLE dbo.[cez_compensation]
ALTER COLUMN [CurrentAmount] ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.[cez_compensation]
ALTER COLUMN [AnnualAmount] ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.[cez_compensation]
ALTER COLUMN [ChangeFromPreviousAmount] ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.[cez_compensation]
ALTER COLUMN [AnnualChangeFromPreviousAmount] ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.[cez_compensation]
ALTER COLUMN [CurrentBaseAmount] ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.[cez_compensation]
ALTER COLUMN [AnnualBaseAmount] ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.[cez_compensation]
ALTER COLUMN [ChangeFromPreviousBaseAmount] ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.[cez_compensation]
ALTER COLUMN [AnnualChangeFromPreviousBaseAmount] ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.[cez_compensation]
ALTER COLUMN [TargetBaseAmount] ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.[cez_compensation]
ALTER COLUMN [CurrentPercentageChange] ADD MASKED WITH (FUNCTION = 'default()');

ALTER TABLE dbo.[cez_compensation]
ALTER COLUMN [BasePercentageChange] ADD MASKED WITH (FUNCTION = 'default()');