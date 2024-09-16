#!/bin/bash

# Wait until PostgreSQL is ready
echo "Waiting for PostgreSQL to be ready..."

while ! nc -z db 5432; do
  sleep 1
  echo "Waiting for PostgreSQL to accept connections..."
done

echo "PostgreSQL is ready! Starting the web service."

# Once PostgreSQL is ready, run the passed command (Django app start)
exec "$@"
