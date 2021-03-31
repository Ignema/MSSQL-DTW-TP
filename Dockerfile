FROM mcr.microsoft.com/mssql/server:2019-latest

ARG SERVER=localhost
ARG MSSQL_SA_PASSWORD=myPassword30

ENV ACCEPT_EULA=Y
ENV PATH="/opt/mssql-tools/bin:${PATH}"
ENV SERVER=$SERVER
ENV MSSQL_SA_PASSWORD=$MSSQL_SA_PASSWORD

VOLUME /var/opt/mssql

EXPOSE 1433

RUN mkdir /var/opt/mssql/backup

WORKDIR /var/opt/mssql/backup/
RUN wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak
RUN wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2019.bak

CMD ["/opt/mssql/bin/sqlservr"]