#!/bin/bash
# archivo: deploy.sh
docker run -it --rm --name db-postgres \
  -p 5432:5432 \
  -e POSTGRES_USER:postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=mydatabase \
  -v ./sql/users.sql:/docker-entrypoint-initdb.d/users.sql \
  postgres:17-alpine