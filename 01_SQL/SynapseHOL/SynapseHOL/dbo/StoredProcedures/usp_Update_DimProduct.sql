CREATE PROC [dbo].[usp_Update_DimProduct]
AS
BEGIN
	
	IF OBJECT_ID(N'new_DimProduct') IS NOT NULL
    BEGIN
	    DROP TABLE  [new_DimProduct]
	END
	
	CREATE TABLE [dbo].[new_DimProduct]            
	WITH (DISTRIBUTION = HASH([ProductKey]  ) ) AS 
	SELECT * FROM [dbo].[stg_DimProduct] OPTION (LABEL = 'CTAS :  [dbo].[new_DimProduct]');

    IF OBJECT_ID(N'old_DimProduct') IS NOT NULL
    BEGIN
	    DROP TABLE  [old_DimProduct]
	END

    RENAME OBJECT dbo.[DimProduct]      TO [old_DimProduct];
	RENAME OBJECT dbo.[new_DimProduct]  TO [DimProduct];

END
