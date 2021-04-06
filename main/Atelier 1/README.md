# Ateliers N°1: Installation et Exploration des bases de données AdventureWorks2019 et AdventureWorksDW2019

## Voir [l'énoncé](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%201/Atelier1_Exploration.pdf)?


## Installation du jeu de données

Voir le [README](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/README.md) de cette repository pour les instructions.

## Explorer le schéma de la base AdventureWorks201*

N'oubliez pas d'utiliser cette commande avant de créer le diagramme 

    use [AdventureWorks2019] EXEC sp_changedbowner 'SA'

![AdventureWorks Diagram](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%201/res/AdventureWorksDiagram.png)

### Générer un rapport dans OLTP (Beaucoup de Jointures)

> Le rapport  devrait  inclure  le  montant  des  ventes  accomplis  à  partir  d'Internet  dans  différents  pays sur  plusieurs  années. 

    SELECT 
        PcountryRegion.Name AS Country,  
        YEAR(OrderDate) AS Years,
        sum(round(Sheader.TotalDue,3)) AS Montant 
    FROM 
        Sales.SalesOrderHeader Sheader, 
        Person.Address Paddress,
        Person.StateProvince PstatProvince, 
        Person.CountryRegion PcountryRegion
    WHERE 
        Sheader.ShipToAddressID = Paddress.AddressID 
        AND Paddress.StateProvinceID = PstatProvince.StateProvinceID 
        AND PstatProvince.CountryRegionCode = PcountryRegion.CountryRegionCode 
        AND Sheader.OnlineOrderFlag = 1
    GROUP BY PcountryRegion.Name, YEAR(OrderDate)
    ORDER BY PcountryRegion.Name, YEAR(OrderDate)

![AdventureWorks Query](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%201/res/AdventureWorksQuery.png?raw=true)

Comme mentionné dans le document, interagir avec une base de données de cette taille pour extraire des données pour nos analyses de données est une mauvaise idée. Il faudra de nombreuses jointures qui seront lentes et improductives.

## Explorer le schéma de la base AdventureWorksDW2019

N'oubliez pas d'utiliser cette commande avant de créer le diagramme 

    use [AdventureWorksDW2019] EXEC sp_changedbowner 'SA'

![AdventureWorksDW Diagram](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%201/res/AdventureWorksDWDiagram.png?raw=true)

L'entrepôt de données est cependant un peu plus facile à explorer car il utilise des modèles en étoile et en flocon qui sont plus faciles à consulter sans des milliers de jointures. 

## Exercice 1

![Exercice 1](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%201/res/Exercice1.png?raw=true)

## Analyser le diagramme

![Analyse](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%201/res/Analyse.png?raw=true)

## Exploration des dimensions d’AdventureWorksDW2019

![Explore Dimensions](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%201/res/ExploreDim.png?raw=true)

## Exploration des tables de faits d’AdventureWorksDW2019

![Explore Facts](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%201/res/ExploreFact.png?raw=true)

## Slowly Changing Dimensions

![Slowly Changing Dimensions](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%201/res/SCD.png?raw=true)