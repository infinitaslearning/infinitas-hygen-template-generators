---
to: docker-compose.yml
---
version: '3.1'

services:
  db:
    ports:
      - 5432:5432
    image: coreregistryinfinitas.azurecr.io/infinitaslearning/infra-postgres:latest
    restart: always