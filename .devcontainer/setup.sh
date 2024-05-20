#!/bin/bash
# Esperar a que Cassandra esté lista para aceptar conexiones
while ! cqlsh -e "describe keyspaces"; do
  sleep 1
done

# Crear esquemas o cargar datos
cqlsh -f "/workspace/your-repo-path/schema.cql"
cqlsh -f "/workspace/your-repo-path/data.cql"
