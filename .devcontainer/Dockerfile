# Usa una imagen base de Ubuntu
FROM ubuntu:20.04

# Instalar Java (necesario para Cassandra)
RUN apt-get update && apt-get install -y openjdk-11-jdk

# Instalar Cassandra
RUN echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list
RUN curl https://www.apache.org/dist/cassandra/KEYS | apt-key add -
RUN apt-get update && apt-get install -y cassandra

# Exponer el puerto de Cassandra
EXPOSE 9042

# Configurar el servicio de Cassandra para que se ejecute automáticamente
CMD ["cassandra", "-f"]
