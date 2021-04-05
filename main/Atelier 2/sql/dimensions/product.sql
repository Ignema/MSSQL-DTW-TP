USE LIGHTADVENTUREWORKSDW
GO

CREATE TABLE dbo.Products(
    ProductKey INT NOT NULL,
    ProductName NVARCHAR(50) NULL,
    Color NVARCHAR(15) NULL,
    Size NVARCHAR(50) NULL,
    SubcategoryName NVARCHAR(50) NULL,
    CategoryName NVARCHAR(50) NULL,
    CONSTRAINT PK_Products PRIMARY KEY (ProductKey)
    )
GO