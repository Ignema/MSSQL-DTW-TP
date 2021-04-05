# Ateliers N°2: Mise en place d’un Datawarehouse

## Voir [l'énoncé](https://github.com/Ignema/MSSQL-DTW-TP/blob/master/main/Atelier%202/Atelier2_CreateDW.pdf)?

## Résultat recherché

![Result](https://raw.githubusercontent.com/Ignema/MSSQL-DTW-TP/master/main/Atelier%202/res/Result.png)

## Easy way

### windows

    scripts/light.bat <CONTAINER-NAME> <YOUR-PASSWORD>

### linux

    source scripts/light.sh <CONTAINER-NAME> <YOUR-PASSWORD>

## Manual way

### Importer les scripts SQL dans le container

    docker cp ./sql/ <CONTAINER-NAME>:/sql/

### Création de LightAdventureWorksDW

    docker exec -it <CONTAINER-NAME> sqlcmd -U SA -P <YOUR-PASSWORD> -i /sql/database.sql

    docker exec -it <CONTAINER-NAME> sqlcmd -U SA -P <YOUR-PASSWORD> -i /sql/sequence.sql

### Création des dimensions

    docker exec -it <CONTAINER-NAME> sqlcmd -U SA -P <YOUR-PASSWORD> -i /sql/dimensions/customer.sql

    docker exec -it <CONTAINER-NAME> sqlcmd -U SA -P <YOUR-PASSWORD> -i /sql/dimensions/product.sql

    docker exec -it <CONTAINER-NAME> sqlcmd -U SA -P <YOUR-PASSWORD> -i /sql/dimensions/date.sql

### Création de la table de faits

    docker exec -it <CONTAINER-NAME> sqlcmd -U SA -P <YOUR-PASSWORD> -i /sql/fact.sql

### Modifier la table de faits pour ajouter des contraintes de clés étrangères 

    docker exec -it <CONTAINER-NAME> sqlcmd -U SA -P <YOUR-PASSWORD> -i /sql/factFKs.sql  



