FROM mcr.microsoft.com/mssql/server:2019-latest

# Docker Image Arguments
ARG SERVER=localhost
ARG MSSQL_SA_PASSWORD=myPassword30

# Container Environment Variables
ENV ACCEPT_EULA=Y
ENV PATH="/opt/mssql-tools/bin:${PATH}"
ENV SERVER=$SERVER
ENV MSSQL_SA_PASSWORD=$MSSQL_SA_PASSWORD

# Creating a Docker Volume
VOLUME /var/opt/mssql

# SQL Server default PORT
EXPOSE 1433

# Downloading our sample databases
RUN mkdir /var/opt/mssql/backup

WORKDIR /var/opt/mssql/backup/
RUN wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak
RUN wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2019.bak

# # SQL Server Integration Services (Not Necessary Anymore)
# USER root

# RUN apt update && apt install gnupg2 -y
# RUN apt install curl -y
# RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
# RUN apt install software-properties-common -y && add-apt-repository "$(curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2019.list)"
# RUN apt update
# RUN apt install -y mssql-server-is
# RUN echo "[TELEMETRY]\nenabled = F" > /var/opt/ssis/ssis.conf
# RUN SSIS_PID=Express ACCEPT_EULA=Y /opt/ssis/bin/ssis-conf -n setup
# ENV PATH="/opt/ssis/bin:${PATH}"

# Reverting Defaults
USER mssql
WORKDIR /

# Running the SQL Server Instance
CMD ["/opt/mssql/bin/sqlservr"]