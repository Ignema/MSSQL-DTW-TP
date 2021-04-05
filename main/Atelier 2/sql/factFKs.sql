USE LIGHTADVENTUREWORKSDW
GO

ALTER TABLE dbo.InternetSales ADD CONSTRAINT
    FK_InternetSales_Customers FOREIGN KEY(CustomerDwKey)
    REFERENCES dbo.Customers (CustomerDwKey)

ALTER TABLE dbo.InternetSales ADD CONSTRAINT
    FK_InternetSales_Products FOREIGN KEY(ProductKey)
    REFERENCES dbo.Products (ProductKey)
    
ALTER TABLE dbo.InternetSales ADD CONSTRAINT
    FK_InternetSales_Dates FOREIGN KEY(DateKey)
    REFERENCES dbo.Dates (DateKey)
GO