CREATE PROC [dbo].[usp_Optimize_DimProduct]
AS
BEGIN
	
	SELECT GETDATE();
	ALTER INDEX ALL ON [dbo].[DimProduct] REBUILD;

	SELECT GETDATE();
	CREATE STATISTICS [stat_dbo_DimProduct_AvailableForSaleDate] ON [dbo].[DimProduct]([AvailableForSaleDate]);
	CREATE STATISTICS [stat_dbo_DimProduct_BrandName] ON [dbo].[DimProduct]([BrandName]);
	CREATE STATISTICS [stat_dbo_DimProduct_ClassID] ON [dbo].[DimProduct]([ClassID]);
	CREATE STATISTICS [stat_dbo_DimProduct_ClassName] ON [dbo].[DimProduct]([ClassName]);
	CREATE STATISTICS [stat_dbo_DimProduct_ColorID] ON [dbo].[DimProduct]([ColorID]);
	CREATE STATISTICS [stat_dbo_DimProduct_ColorName] ON [dbo].[DimProduct]([ColorName]);
	CREATE STATISTICS [stat_dbo_DimProduct_ETLLoadID] ON [dbo].[DimProduct]([ETLLoadID]);
	CREATE STATISTICS [stat_dbo_DimProduct_ImageURL] ON [dbo].[DimProduct]([ImageURL]);
	CREATE STATISTICS [stat_dbo_DimProduct_LoadDate] ON [dbo].[DimProduct]([LoadDate]);
	CREATE STATISTICS [stat_dbo_DimProduct_Manufacturer] ON [dbo].[DimProduct]([Manufacturer]);
	CREATE STATISTICS [stat_dbo_DimProduct_ProductDescription] ON [dbo].[DimProduct]([ProductDescription]);
	CREATE STATISTICS [stat_dbo_DimProduct_ProductKey] ON [dbo].[DimProduct]([ProductKey]);
	CREATE STATISTICS [stat_dbo_DimProduct_ProductLabel] ON [dbo].[DimProduct]([ProductLabel]);
	CREATE STATISTICS [stat_dbo_DimProduct_ProductName] ON [dbo].[DimProduct]([ProductName]);
	CREATE STATISTICS [stat_dbo_DimProduct_ProductSubcategoryKey] ON [dbo].[DimProduct]([ProductSubcategoryKey]);
	CREATE STATISTICS [stat_dbo_DimProduct_ProductURL] ON [dbo].[DimProduct]([ProductURL]);
	CREATE STATISTICS [stat_dbo_DimProduct_Size] ON [dbo].[DimProduct]([Size]);
	CREATE STATISTICS [stat_dbo_DimProduct_SizeRange] ON [dbo].[DimProduct]([SizeRange]);
	CREATE STATISTICS [stat_dbo_DimProduct_SizeUnitMeasureID] ON [dbo].[DimProduct]([SizeUnitMeasureID]);
	CREATE STATISTICS [stat_dbo_DimProduct_Status] ON [dbo].[DimProduct]([Status]);
	CREATE STATISTICS [stat_dbo_DimProduct_StockTypeID] ON [dbo].[DimProduct]([StockTypeID]);
	CREATE STATISTICS [stat_dbo_DimProduct_StockTypeName] ON [dbo].[DimProduct]([StockTypeName]);
	CREATE STATISTICS [stat_dbo_DimProduct_StopSaleDate] ON [dbo].[DimProduct]([StopSaleDate]);
	CREATE STATISTICS [stat_dbo_DimProduct_StyleID] ON [dbo].[DimProduct]([StyleID]);
	CREATE STATISTICS [stat_dbo_DimProduct_StyleName] ON [dbo].[DimProduct]([StyleName]);
	CREATE STATISTICS [stat_dbo_DimProduct_UnitCost] ON [dbo].[DimProduct]([UnitCost]);
	CREATE STATISTICS [stat_dbo_DimProduct_UnitOfMeasureID] ON [dbo].[DimProduct]([UnitOfMeasureID]);
	CREATE STATISTICS [stat_dbo_DimProduct_UnitOfMeasureName] ON [dbo].[DimProduct]([UnitOfMeasureName]);
	CREATE STATISTICS [stat_dbo_DimProduct_UnitPrice] ON [dbo].[DimProduct]([UnitPrice]);
	CREATE STATISTICS [stat_dbo_DimProduct_UpdateDate] ON [dbo].[DimProduct]([UpdateDate]);
	CREATE STATISTICS [stat_dbo_DimProduct_Weight] ON [dbo].[DimProduct]([Weight]);
	CREATE STATISTICS [stat_dbo_DimProduct_WeightUnitMeasureID] ON [dbo].[DimProduct]([WeightUnitMeasureID]);
END
