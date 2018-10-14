#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  CREATE ROLE keycloak WITH LOGIN PASSWORD 'keycloak' VALID UNTIL 'infinity';
  CREATE DATABASE keycloak WITH ENCODING='UTF8' OWNER=keycloak CONNECTION LIMIT=-1; 
EOSQL
