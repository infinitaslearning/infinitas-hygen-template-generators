---
to: docker-compose.yml
---
version: '3.6'

services:
  postgresql:
  image: postgres:14-alpine3.14
  container_name: postgres
  ports:
    - 5432:5432
  environment:
    POSTGRES_PASSWORD: password
