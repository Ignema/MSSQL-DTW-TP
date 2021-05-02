# Ateliers N°4: Extraction de données à partir d’un fichier plat

## Voir [l'énoncé](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%204/Atelier4_LoadFromFlatFile.pdf)?

## Étape 1: Création d'un nouveau projet Integration Services

Nous avons déjà installé des outils de données SQL et ssis dans Visual Studio, nous allons donc créer un nouveau projet. 

INSERT IMAGE HERE (1)

INSERT IMAGE HERE (2)

## Étape 2: Ajout et configuration d'un gestionnaire de connexions de fichiers

INSERT IMAGE HERE (3)

INSERT IMAGE HERE (4)

INSERT IMAGE HERE (5)

INSERT IMAGE HERE (6)

INSERT IMAGE HERE (7)

INSERT IMAGE HERE (8)

## Étape 3: Ajout et configuration d'un gestionnaire de connexions OLE DB

Important: Make sure your datawarehouse sql server container is running on docker first!

INSERT IMAGE HERE (11)

INSERT IMAGE HERE (9)

INSERT IMAGE HERE (10)

## Étape 4: Ajout d'une tâche de flux de données au package

INSERT IMAGE HERE (12)

## Étape 5: Ajout et configuration du fichier source

INSERT IMAGE HERE (13)

INSERT IMAGE HERE (14)

## Étape 6: Ajout et configuration des transformations de recherche

INSERT IMAGE HERE (15)

INSERT IMAGE HERE (16)

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

INSERT IMAGE HERE (17)

INSERT IMAGE HERE (18)

INSERT IMAGE HERE (19)

INSERT IMAGE HERE (20)

INSERT IMAGE HERE (21)

## Étape 7: Ajout et configuration la destination OLE DB

INSERT IMAGE HERE (22)

INSERT IMAGE HERE (23)

## Étape 8: Tester la transformation

INSERT IMAGE HERE (24)