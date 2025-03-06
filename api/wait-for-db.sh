#!/bin/sh
# wait-for-db.sh

set -e

until PGPASSWORD=$POSTGRES_PASSWORD psql -h "db" -U "postgres" -d "todos" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec "$@"