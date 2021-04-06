# Ateliers N°3: Loading Data and Using Data Compression and Indexes

## Voir [l'énoncé](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%203/Atelier3_LoadingLWDTWS.pdf)?

## Exercice 1: Loading data using Docker

### Nettoyer le dossier SQL du container

    docker exec -it --user root %1 rm -rf /sql

### Importer les scripts SQL dans le container

    docker cp ./sql/ <CONTAINER-NAME>:/sql/

### Charger les données de la dimension Customers

    docker exec -it <CONTAINER-NAME> sqlcmd -U SA -P <YOUR-PASSWORD> -i /sql/insertCustomers.sql

## Exercice 2: Loading data using Integration Services

### Etape 1: Création du package

Pour créer et modifier un package SSIS .dtsx, vous avez impérativement besoin de Visual Studio avec SQL Server Data Tools pour des raisons que je ne connais pas. Si vous souhaitez terminer Exercice 2 de l'Atelier 3, installez-le. Sinon, passez à l'Exercice 3.

#### Steps

- Installer Visual Studio
- Assurez-vous d'inclure SQL Server Data Tools dans l'installation 
- Accédez à vos extensions et recherchez Integrations Services et installez-le 

#### Créer un nouveau projet 

![New Project](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%203/res/newProj.png)

#### Renommez le projet par LoadLightDWBySSIS. Ceci est l'interface utilisateur que vous devriez voir.

![User Interface](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%203/res/UI.png)

### Étape 2: Ajout et configuration du gestionnaire de connexions OLE DB source

![newConn](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%203/res/newConn.png)

Créez une connexion à la base de données avec les paramètres que vous avez spécifiés pour votre container de SQL Server sur docker.

![Source DB](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%203/res/newConnDB1.png)

Assurez-vous de spécifier AdventureWorksDW2019 comme base de données que nous avons créé lors de la mise en place de l'environment.

### Étape 3: Ajout et configuration du gestionnaire de connexions OLE DB destination

![Dest DB](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%203/res/newConnDB2.png)

Assurez-vous de spécifier cette fois LightAdventureWorksDW comme base de données que nous avons créé dans l'Atelier 2.

#### Ajout d'une tâche SQLTASK loadCustomers

![loadCustomers](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%203/res/ExecSQLScript.png)

N'oubliez pas d'ajouter ceci dans la rubrique SQL Statement. 

    INSERT INTO LIGHTADVENTUREWORKSDW.dbo.Customers(
    CustomerDwKey,  
    CustomerKey,  
    FullName,  
    EmailAddress,  
    Birthdate, 
    MaritalStatus,   
    Gender, 
    Education, 
    Occupation, 
    City, 
    StateProvince, 
    CountryRegion
    )

    SELECT 
        NEXT VALUE FOR LIGHTADVENTUREWORKSDW.dbo.SeqCustomerDwKey AS CustomerDwKey,
        C.CustomerKey,  
        C.FirstName  +  '  '  +  C.LastName  AS  FullName,    
        C.EmailAddress,  
        C.BirthDate, 
        C.MaritalStatus, 
        C.Gender, 
        C.EnglishEducation, 
        C.EnglishOccupation, 
        G.City, 
        G.StateProvinceName, 
        G.EnglishCountryRegionName 
        
    FROM AdventureWorksDW2019.dbo.DimCustomer AS C
    INNER JOIN AdventureWorksDW2019.dbo.DimGeography AS G
    ON C.GeographyKey = G.GeographyKey

    GO

### Étape 4: Ajout d'une tâche de flux de données LoadProduct au package

![newDataFlow](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%203/res/newDataFlow.png)

### Étape 5: Ajout et configuration de la source OLE DB

![ODBCSource](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%203/res/ODBCSource.png)

Vous pouvez utiliser *Build Query* ou coller ce SQL dans la zone de texte. 

    SELECT 
        P.ProductKey, 
        P.EnglishProductName, 
        P.Color,P.Size, 
        S.EnglishProductSubcategoryName, 
        C.EnglishProductCategoryName
    FROM AdventureWorksDW2019.dbo.DimProduct AS P
    INNER JOIN AdventureWorksDW2019.dbo.DimProductSubcategory AS S
    ON P.ProductSubcategoryKey = S.ProductSubcategoryKey
    INNER JOIN AdventureWorksDW2019.dbo.DimProductCategory AS C
    ON S.ProductCategoryKey = C.ProductCategoryKey

### Étape 6: Faute de numerotation dans l'énoncé

### Étape 7: Ajout et configuration la destination OLE DB

![ODBCDest](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%203/res/ODBCDest.png)

#### Ajout d'une tâche de flux de données LoadDate au package

![LoadDate](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%203/res/LoadDate.png)

    SELECT 
        DateKey, 
        FullDateAlternateKey as FullDate,
        SUBSTRING(CONVERT(CHAR(8), 
        FullDateAlternateKey, 112), 5, 2)+ ' ' + EnglishMonthName as MonthNumberName,
        CalendarQuarter, 
        CalendarYear
    FROM AdventureWorksDW2019.dbo.DimDate

#### Ajout d'une tâche de flux de données LoadInternetSale au package

![LoadInternetSale](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%203/res/LoadInternetSale.png)

    SELECT 
        C.CustomerDwKey,
        FIS.ProductKey, 
        FIS.OrderDateKey,
        FIS.OrderQuantity, 
        FIS.SalesAmount,
        FIS.UnitPrice, 
        FIS.DiscountAmount
    FROM AdventureWorksDW2019.dbo.FactInternetSales AS FIS
    INNER JOIN LightAdventureWorksDW.dbo.Customers AS C
    ON FIS.CustomerKey = C.CustomerKey

#### Execution de l'ETL

![ETL](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%203/res/ETL.png)

## Exercice 3: Applying Data Compression

### Calcule de l'espace utilisé par la table InternetSales

    docker exec -it <CONTAINER-NAME> sqlcmd -U SA -P <YOUR-PASSWORD> -Q "USE LIGHTADVENTUREWORKSDW EXEC sp_spaceused N'dbo.InternetSales', @updateusage = N'TRUE'"

### Compression de la table

    docker exec -it <CONTAINER-NAME> sqlcmd -U SA -P <YOUR-PASSWORD> -Q "USE LIGHTADVENTUREWORKSDW ALTER TABLE dbo.InternetSales REBUILD WITH (DATA_COMPRESSION = PAGE)"

### Vérifier à nouveau l'espace de la table 

## Exercice 4: Using an Index

### Nettoyer le dossier SQL du container

    docker exec -it --user root <CONTAINER-NAME> rm -rf /sql

### Importer les scripts SQL dans le container

    cd "/main/Atelier 3"
    docker cp ./sql/ <CONTAINER-NAME>:/sql/

### Execution d'une requête qui agrège la colonne *SalesAmount* selon la colonne *ProductKey* de la table *FactInternetSales*

    docker exec -it <CONTAINER-NAME> sqlcmd -U SA -P <YOUR-PASSWORD> -i /sql/select.sql

### Création d'une vue de cette requête et son indexation

    docker exec -it <CONTAINER-NAME> sqlcmd -U SA -P <YOUR-PASSWORD> -i /sql/view.sql

### L'exécution de la même requête est désormais plus rapide. 

### Suppression de la vue

    docker exec -it <CONTAINER-NAME> sqlcmd -U SA -P <YOUR-PASSWORD> -Q "USE AdventureWorksDW2019 Drop view dbo.SalesByProduct"