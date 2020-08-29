CREATE VIEW [dbo].[v_FactOnlineSalesAgg]
	AS 
	SELECT 
		DateKey
		,ProductKey
		,SUM(SalesQuantity) SalesQuantity
		,SUM(SalesAmount) SalesAmount
		,SUM(TotalCost) TotalCost
	FROM [FactOnlineSales]
	GROUP BY
		DateKey
		,ProductKey
