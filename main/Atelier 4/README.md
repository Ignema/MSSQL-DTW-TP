# Ateliers N°4: Extraction de données à partir d’un fichier plat

## Voir [l'énoncé](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/Atelier4_LoadFromFlatFile.pdf)?

## Étape 1: Création d'un nouveau projet Integration Services

Nous avons déjà installé des outils de données SQL et ssis dans Visual Studio, nous allons donc créer un nouveau projet. 

![1](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/1.png?raw=true)

![2](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/2.png?raw=true)

## Étape 2: Ajout et configuration d'un gestionnaire de connexions de fichiers

![3](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/3.png?raw=true)

![4](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/4.png?raw=true)

![5](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/5.png?raw=true)

![6](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/6.png?raw=true)

![7](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/7.png?raw=true)

![8](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/8.png?raw=true)

## Étape 3: Ajout et configuration d'un gestionnaire de connexions OLE DB

Important: Make sure your datawarehouse sql server container is running on docker first!

![11](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/11.png?raw=true)

![9](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/9.png?raw=true)

![10](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/10.png?raw=true)

## Étape 4: Ajout d'une tâche de flux de données au package

![12](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/12.png?raw=true)

## Étape 5: Ajout et configuration du fichier source

![13](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/13.png?raw=true)

![14](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/14.png?raw=true)

## Étape 6: Ajout et configuration des transformations de recherche

![15](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/15.png?raw=true)

![16](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/16.png?raw=true)

    SELECT 
        * 
    FROM
        (SELECT * FROM [dbo].[DimCurrency]) AS refTable
    WHERE 
        [refTable].[CurrencyAlternateKey] = 'ARS' OR
        [refTable].[CurrencyAlternateKey] = 'AUD' OR
        [refTable].[CurrencyAlternateKey] = 'BRL' OR
        [refTable].[CurrencyAlternateKey] = 'CAD' OR
        [refTable].[CurrencyAlternateKey] = 'CNY' OR
        [refTable].[CurrencyAlternateKey] = 'DEM' OR
        [refTable].[CurrencyAlternateKey] = 'EUR' OR
        [refTable].[CurrencyAlternateKey] = 'FRF' OR
        [refTable].[CurrencyAlternateKey] = 'GBP' OR
        [refTable].[CurrencyAlternateKey] = 'JPY' OR
        [refTable].[CurrencyAlternateKey] = 'MXN' OR
        [refTable].[CurrencyAlternateKey] = 'SAR' OR
        [refTable].[CurrencyAlternateKey] = 'USD' OR
        [refTable].[CurrencyAlternateKey] = 'VEB'

![17](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/17.png?raw=true)

![18](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/18.png?raw=true)

![19](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/19.png?raw=true)

![20](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/20.png?raw=true)

![21](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/21.png?raw=true)

## Étape 7: Ajout et configuration la destination OLE DB

![22](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/22.png?raw=true)

![23](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/23.png?raw=true)

## Étape 8: Tester la transformation

![24](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/res/24.png?raw=true)