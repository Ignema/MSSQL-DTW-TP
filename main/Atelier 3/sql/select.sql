USE AdventureWorksDW2012
GO

SET STATISTICS IO ON
GO

SELECT 
    ProductKey,
    SUM(SalesAmount) AS Sales,
    COUNT_BIG(*) AS NumberOfRows
FROM dbo.FactInternetSales
GROUP BY ProductKey
GO