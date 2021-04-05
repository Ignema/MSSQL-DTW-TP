docker exec -it --user root %1 rm -rf /sql

docker cp ./sql/ %1:/sql/

docker exec -it %1 sqlcmd -U SA -P %2 -i /sql/database.sql

docker exec -it %1 sqlcmd -U SA -P %2 -i /sql/sequence.sql

docker exec -it %1 sqlcmd -U SA -P %2 -i /sql/dimensions/customer.sql

docker exec -it %1 sqlcmd -U SA -P %2 -i /sql/dimensions/product.sql

docker exec -it %1 sqlcmd -U SA -P %2 -i /sql/dimensions/date.sql

docker exec -it %1 sqlcmd -U SA -P %2 -i /sql/fact.sql

docker exec -it %1 sqlcmd -U SA -P %2 -i /sql/factFKs.sql  