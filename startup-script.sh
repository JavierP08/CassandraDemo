#!/bin/bash
docker network create cassandra
docker run --rm -d --name cassandra --hostname cassandra --network cassandra cassandra
sleep 20  # Espera a que Cassandra esté completamente levantada
docker run --rm --network cassandra -v "/workspace/data.cql:/scripts/data.cql" -e CQLSH_HOST=cassandra -e CQLSH_PORT=9042 -e CQL_VERSION=3.4.6 cassandra cqlsh -f /scripts/data.cql
