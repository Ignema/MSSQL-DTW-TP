# Ateliers N°5: Slowly Changing Dimensions

## Voir [l'énoncé](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%205/Atelier5_SCD.pdf)?

## Tâche 1: Création des tables dans la base de données

Make sure you execute this inside this directory (Atelier 5)

    docker exec -it --user root <Container-Name> rm -rf /sql

    docker cp ./sql/ <Container-Name>:/sql/

    docker exec -it <Container-Name> sqlcmd -U SA -P <Password> -i /sql/Script_BD.sql

## Tâche 2: Initialiser le projet SSIS

INSERT IMAGE HERE (1)

## Tâche 3: Définition de la source et de la cible de données

INSERT IMAGE HERE (2)

INSERT IMAGE HERE (3)

## Tâche 4: Créer un flux de contrôledans le package

INSERT IMAGE HERE (4)

## Tâche 5: Conception du flux de données «Insertion et Mise à jour des lignes de la dimension produit»

INSERT IMAGE HERE (5)

INSERT IMAGE HERE (6)

INSERT IMAGE HERE (7)

INSERT IMAGE HERE (8)

INSERT IMAGE HERE (9)

INSERT IMAGE HERE (10)

INSERT IMAGE HERE (11)

INSERT IMAGE HERE (12)

INSERT IMAGE HERE (13)

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

INSERT IMAGE HERE (16)

INSERT IMAGE HERE (14)

INSERT IMAGE HERE (15)

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

INSERT IMAGE HERE (17)

INSERT IMAGE HERE (18)

INSERT IMAGE HERE (19)

INSERT IMAGE HERE (20)

INSERT IMAGE HERE (21)

    UPDATE 
        dbo.produit 
    SET 
        isCurrent = 0, 
        date_update = Getdate() 
    WHERE 
        idproduit = ?

INSERT IMAGE HERE (22)

INSERT IMAGE HERE (23)

INSERT IMAGE HERE (24)