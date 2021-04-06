USE AdventureWorksDW2019
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE VIEW dbo.SalesByProduct
WITH SCHEMABINDING AS 
SELECT 
    ProductKey,
    SUM(SalesAmount) AS Sales,
    COUNT_BIG(*) AS NumberOfRows
FROM dbo.FactInternetSales
GROUP BY ProductKey
GO

CREATE UNIQUE CLUSTERED INDEX CLU_SalesByProduct
ON dbo.SalesByProduct (ProductKey)
GO