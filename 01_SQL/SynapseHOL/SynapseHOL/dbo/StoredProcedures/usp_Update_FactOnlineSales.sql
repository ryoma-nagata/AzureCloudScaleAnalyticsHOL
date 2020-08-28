CREATE PROC [dbo].[usp_Update_FactOnlineSales]
AS
BEGIN
	
	IF OBJECT_ID(N'new_FactOnlineSales') IS NOT NULL
    BEGIN
	    DROP TABLE  [new_FactOnlineSales]
	END
	
	CREATE TABLE [dbo].[new_FactOnlineSales]            
	WITH (DISTRIBUTION = HASH([ProductKey]  ) ) AS 
	SELECT * FROM [dbo].[stg_FactOnlineSales] OPTION (LABEL = 'CTAS :  [dbo].[new_DimProduct]');

    IF OBJECT_ID(N'old_FactOnlineSales') IS NOT NULL
    BEGIN
	    DROP TABLE  [old_FactOnlineSales]
	END

    RENAME OBJECT dbo.[FactOnlineSales]      TO [old_FactOnlineSales];
	RENAME OBJECT dbo.[new_FactOnlineSales]  TO [FactOnlineSales];

END
