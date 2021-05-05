# Tache 2

Il s’agit d’alimenter le datawarehouse LightAdventureWorksDW depuis AdventureWorks2012.

**Remarque:** Il faut penser à Slowly Changing Dimensions car on alimente depuis une base de donnees transactionnelle

## **Etape 1:** Établir les connexions avec les bdd SQL Server AdventureWorks2019 et LightAdventureWorksDW

![1](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Projet/res/1.png?raw=true)

## **Etape 2:** Réaliser le flux de données de la table de products

### Création du data flow depuis Visual Studio et SSIS

![2](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Projet/res/2.png?raw=true)

### Mise en place de l'extraction des données

![3](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Projet/res/3.png?raw=true)

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

![4](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Projet/res/4.png?raw=true)

![5](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Projet/res/5.png?raw=true)

![6](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Projet/res/6.png?raw=true)

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

![7](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Projet/res/7.png?raw=true)

## **Etape 4:**  Creation du data flow pour Date

    SELECT DISTINCT 
        OrderDate AS FullDate, 
        DATENAME([month], OrderDate) AS MonthName, 
        DATENAME(Quarter, CAST(OrderDate AS DATETIME)) AS CalendarQuarter, 
        YEAR(OrderDate) AS CalendarYear
    FROM 
        Sales.SalesOrderHeader

![8](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Projet/res/8.png?raw=true)

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

![9](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Projet/res/9.png?raw=true)

## **Etape 6:** Finalisation du control flow

![10](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Projet/res/10.png?raw=true)

## **Etape 7:** Faire un test

![11](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Projet/res/11.png?raw=true)
