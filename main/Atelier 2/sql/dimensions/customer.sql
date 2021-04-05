USE LIGHTADVENTUREWORKSDW
GO

CREATE TABLE dbo.Customers(
    CustomerDwKey INT NOT NULL,
    CustomerKey INT NOT NULL,
    FullName NVARCHAR(150) NULL,
    EmailAddress NVARCHAR(50) NULL,
    BirthDate DATE NULL,
    MaritalStatus NCHAR(1) NULL,
    Gender NCHAR(1) NULL,
    Education NVARCHAR(40) NULL,
    Occupation NVARCHAR(100) NULL,
    City NVARCHAR(30) NULL,
    StateProvince NVARCHAR(50) NULL,
    CountryRegion NVARCHAR(50) NULL,
    Age AS
    CASE
        WHEN DATEDIFF(yy, BirthDate, CURRENT_TIMESTAMP) <= 40
        THEN 'Younger'
        WHEN DATEDIFF(yy, BirthDate, CURRENT_TIMESTAMP) > 50
        THEN 'Older'
        ELSE 'Middle Age'
    END,
    CurrentFlag BIT NOT NULL DEFAULT 1,
    CONSTRAINT PK_Customers PRIMARY KEY (CustomerDwKey)
    )
GO