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

### 4. Run you SQL Server database container

    docker run --name <CONTAINER-NAME> -p 1433:1433 -d <IMAGE-NAME>

If you don't specify a value for your container name then docker will generate a random name for you.

### 5. Restore the backup files in your container

#### Windows

    scripts/mount.bat <CONTAINER-NAME> <YOUR-PASSWORD>

#### Linux

    source scripts/mount.sh <CONTAINER-NAME> <YOUR-PASSWORD>

### 6. Download [VScode](https://code.visualstudio.com/download)

### 7. Install these extenstions

- [SQL Server (myssql)](https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql)
- [ERD Editor](https://marketplace.visualstudio.com/items?itemName=dineug.vuerd-vscode)
- BONUS: [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)

## Have Fun!!