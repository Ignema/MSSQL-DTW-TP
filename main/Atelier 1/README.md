# Ateliers N°1: Installation et Exploration des bases de données AdventureWorks2012 et AdventureWorksDW2012

## Installation du jeu de données

Voir le README de cette repository pour les instructions.

## Explorer le schéma de la base AdventureWorks2012

N'oubliez pas d'utiliser cette commande avant de créer le diagramme 

    use [AdventureWorks2019] EXEC sp_changedbowner 'SA'

ADD IMAGE HERE

Comme mentionné dans le document, interagir avec une base de données de cette taille pour extraire des données pour nos analyses de données est une mauvaise idée. Il faudra de nombreuses jointures qui seront lentes et improductives. 

## Explorer le schéma de la base AdventureWorksDW2012

N'oubliez pas d'utiliser cette commande avant de créer le diagramme 

    use [AdventureWorksDW2019] EXEC sp_changedbowner 'SA'

ADD IMAGE HERE

L'entrepôt de données est cependant un peu plus facile à explorer car il utilise des modèles en étoile et en flocon qui sont plus faciles à consulter sans des milliers de jointures. 

## Exercice 1

ADD IMAGE HERE

## Analyser le diagramme

ADD IMAGE HERE

## Exploration des dimensions d’AdventureWorksDW2012

ADD IMAGE HERE

## Exploration des tables de faits d’AdventureWorksDW2012

ADD IMAGE HERE

## Slowly Changing Dimensions

ADD IMAGE HERE