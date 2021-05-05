# Tache 2

Il s’agit d’alimenter le datawarehouse LightAdventureWorksDW depuis AdventureWorks2012.

**Remarque:** Il faut penser à Slowly Changing Dimensions car on alimente depuis une base de donnees transactionnelle

## **Etape 1:** Établir les connexions avec les bdd SQL Server AdventureWorks2019 et LightAdventureWorksDW

INSERT IMAGE HERE (1)

## **Etape 2:** Réaliser le flux de données de la table de products

### Création du data flow depuis Visual Studio et SSIS

INSERT IMAGE HERE (2)

### Mise en place de l'extraction des données

INSERT IMAGE HERE (3)

Nous devrons utiliser ces deux requêtes car nous travaillons avec une base de données transactionnelle.

    SELECT 
        P.ProductID as ProductKey, 
        P.Name as ProductName, 
        P.Color, 
        P.Size, 
        PS.Name as SubcategoryName, 
        PC.Name as CategoryName
    FROM 
        Production.Product P, 
        Production.ProductSubcategory PS, 
        Production.ProductCategory PC
    WHERE
        P.ProductSubcategoryID = PS.ProductSubcategoryID
        AND PS.ProductCategoryID = PC.ProductCategoryID;
    
    SELECT 
        Production.Product.ProductID, 
        Production.Product.Name, 
        Production.Product.Color, 
        Production.Product.[Size], 
        Production.ProductSubcategory.Name AS SubcategoryName, 
        Production.ProductCategory.Name AS CategoryName
    FROM     
        Production.Product 
        
        INNER JOIN Production.ProductSubcategory 
        ON Production.Product.ProductSubcategoryID = Production.ProductSubcategory.ProductSubcategoryID 
        
        INNER JOIN Production.ProductCategory 
        ON Production.ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID

### Slowly Changing Dimensions

INSERT IMAGE HERE (4)

INSERT IMAGE HERE (5)

INSERT IMAGE HERE (6)

## **Etape 3:** Creation du data flow pour Customer

    SELECT 
        Sales.Customer.CustomerID, 
        Person.Person.FirstName, 
        Person.Person.LastName, 
        Person.EmailAddress.EmailAddress, 
        Person.CountryRegion.Name AS CountryRegion, 
        Person.StateProvince.Name AS StateProvince, 
        Address_1.City
    FROM     
        Person.Person 
        INNER JOIN Person.EmailAddress 
        ON Person.Person.BusinessEntityID = Person.EmailAddress.BusinessEntityID 
        
        INNER JOIN Sales.Customer 
        ON Person.Person.BusinessEntityID = Sales.Customer.PersonID 
        
        INNER JOIN Sales.SalesOrderHeader 
        ON Sales.Customer.CustomerID = Sales.SalesOrderHeader.CustomerID AND Sales.Customer.CustomerID = Sales.SalesOrderHeader.CustomerID 
        
        INNER JOIN Person.StateProvince 
        
        INNER JOIN Person.Address AS Address_1 
        ON Person.StateProvince.StateProvinceID = Address_1.StateProvinceID 
        
        INNER JOIN Person.CountryRegion 
        ON Person.StateProvince.CountryRegionCode = Person.CountryRegion.CountryRegionCode 
        ON Sales.SalesOrderHeader.BillToAddressID = Address_1.AddressID 
        AND Sales.SalesOrderHeader.ShipToAddressID = Address_1.AddressID 
        AND Sales.SalesOrderHeader.BillToAddressID = Address_1.AddressID 
        AND Sales.SalesOrderHeader.ShipToAddressID = Address_1.AddressID 
        AND Sales.SalesOrderHeader.BillToAddressID = Address_1.AddressID 
        AND Sales.SalesOrderHeader.ShipToAddressID = Address_1.AddressID

INSERT IMAGE HERE (7)

## **Etape 4:**  Creation du data flow pour Date

    SELECT DISTINCT 
        OrderDate AS FullDate, 
        DATENAME([month], OrderDate) AS MonthName, 
        DATENAME(Quarter, CAST(OrderDate AS DATETIME)) AS CalendarQuarter, 
        YEAR(OrderDate) AS CalendarYear
    FROM 
        Sales.SalesOrderHeader

INSERT IMAGE HERE (8)

## **Etape 5:** Creation du data flow pour Internet Sales

    SELECT 
        C.CustomerDwKey as CustomerID, 
        SD.ProductID,
        D.Datekey, 
        SD.OrderQty as OrderQuantity,
        SD.OrderQty*SD.UnitPrice AS SalesAmount ,
        SD.UnitPrice,
        convert(Float,SD.UnitPriceDiscount*convert(Float,SD.OrderQty)) AS DiscountAmount

    FROM 
        AdventureWorks2019.Sales.SalesOrderDetail AS SD,
        AdventureWorks2019.Sales.SalesOrderHeader AS SH,
        LIGHTADVENTUREWORKSDW.dbo.Customers AS C,
        LIGHTADVENTUREWORKSDW.dbo.Products AS P,
        LIGHTADVENTUREWORKSDW.dbo.Dates AS D

    WHERE 
        SD.SalesOrderID = SH.SalesOrderID
        AND C.CustomerKey = SH.CustomerID
        AND P.ProductKey = SD.ProductID
        AND D.Fulldate = SH.OrderDate;

INSERT IMAGE HERE (9)

## **Etape 6:** Finalisation du control flow

INSERT IMAGE HERE (10)

## **Etape 7:** Faire un test

INSERT IMAGE HERE (11)
