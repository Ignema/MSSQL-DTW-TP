CREATE DATABASE VENTE_TRANSACTIONNELLE

Go

CREATE DATABASE VENTE_DATAWAREHOUSE

Go

USE VENTE_TRANSACTIONNELLE 

Go

CREATE TABLE PRODUIT(
idproduit int,
idcategorie int,
libelle_produit nvarchar(45),
Qte_stock int,
prix_unitaire int
)

Go

insert into dbo.PRODUIT values (200012,	400001,	'OrangeCare',22,200);
insert into dbo.PRODUIT values (200013,400001,'SmartSIM',45,372);
insert into dbo.PRODUIT values (200014,400021,'VplusD',34,60);
insert into dbo.PRODUIT values (100013,200034,'Install Phone',NULL,5000);
insert into dbo.PRODUIT values (100525,200054,'Porta IN',NULL,1500);
insert into dbo.PRODUIT values (100560,200054,'Porta OUT',NULL,8900);
insert into dbo.PRODUIT values (200018,400021,'Oficina Pus',73,285);
insert into dbo.PRODUIT values (200020,400021,'SVAs',56,285);


 
USE  VENTE_DATAWAREHOUSE
 
Go
 
CREATE TABLE PRODUIT(
Pk_produit int Identity (1,1),
idproduit int,
idcategorie int,
libelle_produit nvarchar(45),
Qte_stock int,
prix_unitaire int,
Type_produit nvarchar(45),
IsCurrent int,
date_insert datetime,
date_update datetime,
package_insert nvarchar(50))

Go



