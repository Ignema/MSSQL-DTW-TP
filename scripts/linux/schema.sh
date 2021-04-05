echo "Make sure you're running this command from the root directory"
pip install mssql-scripter
python3 -m mssqlscripter -S $1 -d $2 -U $3 -P $4 -f "schemas/$2.sql"