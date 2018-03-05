#!/bin/bash
set -e

# $POSTGRES_USER doesn't need password within container. it's in trust list
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER neon WITH PASSWORD 'neon';

    CREATE DATABASE neon;
    GRANT ALL PRIVILEGES ON DATABASE neon TO neon;

    GRANT ALL PRIVILEGES ON DATABASE neon_test TO neon;
    CREATE DATABASE neon_test;
EOSQL