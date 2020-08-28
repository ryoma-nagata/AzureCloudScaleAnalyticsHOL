CREATE PROC [dbo].[usp_Optimize_FactOnlineSales]
AS
BEGIN
	
	SELECT GETDATE();
	ALTER INDEX ALL ON [dbo].[FactOnlineSales] REBUILD;

	SELECT GETDATE();
	CREATE STATISTICS [stat_dbo_FactOnlineSales_CurrencyKey] ON [dbo].[FactOnlineSales]([CurrencyKey]);
	CREATE STATISTICS [stat_dbo_FactOnlineSales_CustomerKey] ON [dbo].[FactOnlineSales]([CustomerKey]);
	CREATE STATISTICS [stat_dbo_FactOnlineSales_DateKey] ON [dbo].[FactOnlineSales]([DateKey]);
	CREATE STATISTICS [stat_dbo_FactOnlineSales_OnlineSalesKey] ON [dbo].[FactOnlineSales]([OnlineSalesKey]);
	CREATE STATISTICS [stat_dbo_FactOnlineSales_ProductKey] ON [dbo].[FactOnlineSales]([ProductKey]);
	CREATE STATISTICS [stat_dbo_FactOnlineSales_PromotionKey] ON [dbo].[FactOnlineSales]([PromotionKey]);
	CREATE STATISTICS [stat_dbo_FactOnlineSales_StoreKey] ON [dbo].[FactOnlineSales]([StoreKey]);
END							
