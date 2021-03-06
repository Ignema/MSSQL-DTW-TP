USE master

IF DB_ID('LIGHTADVENTUREWORKSDW') IS NOT NULL 
    DROP DATABASE LIGHTADVENTUREWORKSDW
GO

CREATE DATABASE LIGHTADVENTUREWORKSDW
    ON PRIMARY
        (NAME = N'LIGHTADVENTUREWORKSDW', FILENAME = N'/var/opt/mssql/data/LIGHTADVENTUREWORKSDW.mdf',
        SIZE = 307200KB , FILEGROWTH = 10240KB )
    LOG ON
        (NAME = N'LIGHTADVENTUREWORKSDW_log', FILENAME = N'/var/opt/mssql/data/LIGHTADVENTUREWORKSDW_log.ldf',
        SIZE = 51200KB , FILEGROWTH = 10%);
GO

ALTER DATABASE LIGHTADVENTUREWORKSDW SET RECOVERY SIMPLE WITH NO_WAIT
GO