# Microsoft SQL Server Datawarehouse TP

This repository is an attempt to solve the series of assignments presented during an ensias's course about datawarehouses. However, I will be using docker which means it will be slightly harder to implement, but I think it's worth it because containers are much more flexible and portable than establishing a local database.

## How to setup the environment

### 1. Make sure you have [Docker](https://www.docker.com/products/docker-desktop) downloaded

### 2. Clone this repository

    git clone https://github.com/Ignema/MSSQL-DTW-TP.git

### 3. Navigate inside the folder and then build the docker image by using the provided Dockerfile

    docker build . -t <IMAGE-NAME> --build-arg SERVER=<SERVER-NAME> --build-arg MSSQL_SA_PASSWORD=<YOUR-PASSWORD>

For your server name, the default if left unspecified is *localhost*.

If unspecified, the default password will be *myPassword30*.

### 4. Run your SQL Server database container

    docker run --name <CONTAINER-NAME> -p 1433:1433 -d <IMAGE-NAME>

If you don't specify a value for your container name then docker will generate a random name for you.

### 5. Restore the backup files in your container

#### Windows

    scripts/windows/mount.bat <CONTAINER-NAME> <YOUR-PASSWORD>

#### Linux

    source scripts/linux/mount.sh <CONTAINER-NAME> <YOUR-PASSWORD>

### 6. Download an IDE (Choose One) 
 - [SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
 - [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio)
 - [Visual Studio](https://visualstudio.microsoft.com)
 - [Visual Studio Code](https://code.visualstudio.com/download)

### 7. Install these extenstions (For VScode only)

- [SQL Server (myssql)](https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql)
- [ERD Editor](https://marketplace.visualstudio.com/items?itemName=dineug.vuerd-vscode)
- BONUS: [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)

## Tips

### Generate Database Schema with Python

#### Install Python first

#### Windows

    scripts/windows/schema.bat <SERVER-NAME> <DATABASE-NAME> <USER-NAME> <YOUR-PASSWORD>

#### Linux

    source scripts/linux/schma.sh <SERVER-NAME> <DATABASE-NAME> <USER-NAME> <YOUR-PASSWORD>