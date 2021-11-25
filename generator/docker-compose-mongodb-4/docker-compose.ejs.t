---
to: docker-compose.yml
---

version: '3.6'

services:
  mongodb:
    image: mongo:4.4.10
    container_name: mongodb
    environment:
      MONGO_INITDB_ROOT_USERNAME: node
      MONGO_INITDB_ROOT_PASSWORD: node
    ports:
      - 27017:27017
    volumes:
      - mongodb_data_container:/data/db

volumes:
  mongodb_data_container: