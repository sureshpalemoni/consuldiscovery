#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO $POSTGRES_USER;
    CREATE TABLE Greetings(Id int, Greeting text);
    INSERT INTO Greetings VALUES(1, 'Hello Relayr and rest of the world');
EOSQL