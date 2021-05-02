# Ateliers N°5: Slowly Changing Dimensions

## Voir [l'énoncé](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/Atelier5_SCD.pdf)?

## Tâche 1: Création des tables dans la base de données

Make sure you execute this inside this directory (Atelier 5)

    docker exec -it --user root <Container-Name> rm -rf /sql

    docker cp ./sql/ <Container-Name>:/sql/

    docker exec -it <Container-Name> sqlcmd -U SA -P <Password> -i /sql/Script_BD.sql

## Tâche 2: Initialiser le projet SSIS

![1](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/1.png?raw=true)

## Tâche 3: Définition de la source et de la cible de données

![2](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/2.png?raw=true)

![3](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/3.png?raw=true)

## Tâche 4: Créer un flux de contrôledans le package

![4](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/4.png?raw=true)

## Tâche 5: Conception du flux de données «Insertion et Mise à jour des lignes de la dimension produit»

![5](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/5.png?raw=true)

![6](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/6.png?raw=true)

![7](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/7.png?raw=true)

![8](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/8.png?raw=true)

![9](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/9.png?raw=true)

![10](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/10.png?raw=true)

![11](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/11.png?raw=true)

![12](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/12.png?raw=true)

![13](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/13.png?raw=true)

    UPDATE 
        [dbo].[PRODUIT] 
    SET 
        [idcategorie] = ?,
        [libelle_produit] = ?,
        [prix_unitaire] = ?,
        [Qte_stock] = ?,
        date_update = Getdate()
    WHERE 
        [idproduit] = ? AND date_update IS NULL

![16](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/16.png?raw=true)

![14](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/14.png?raw=true)

![15](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/15.png?raw=true)

## Tâche 6: Conception du flux de données «Historisation des lignes inactifs de la dimension produit»

    SELECT 
        idproduit, 
        idcategorie, 
        libelle_produit, 
        Qte_stock, 
        prix_unitaire
    FROM
        dbo.PRODUIT
    WHERE 
        isCurrent = 1

![17](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/17.png?raw=true)

![18](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/18.png?raw=true)

![19](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/19.png?raw=true)

![20](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/20.png?raw=true)

![21](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/21.png?raw=true)

    UPDATE 
        dbo.produit 
    SET 
        isCurrent = 0, 
        date_update = Getdate() 
    WHERE 
        idproduit = ?

![22](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/22.png?raw=true)

![23](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/23.png?raw=true)

![24](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/res/24.png?raw=true)