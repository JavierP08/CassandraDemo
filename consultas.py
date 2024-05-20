import pandas as pd
from cassandra.cluster import Cluster

# Conexión al cluster de Cassandra
cluster = Cluster(['172.18.0.2'])
session = cluster.connect()

# Configuración de visualización para pandas
pd.set_option('display.max_colwidth', 20)
pd.set_option('display.colheader_justify', 'center')
pd.set_option('display.precision', 3)

# Leer las consultas de un archivo y ejecutarlas
with open('consultas.cql', 'r') as file:
    queries = file.readlines()
    query_buffer = []
    executing_comment = None
    for line in queries:
        if line.strip():
            if line.strip().startswith('--'):  # Es un comentario
                executing_comment = line.strip()  # Guardar el comentario para mostrarlo más tarde
            elif line.strip().endswith(';'):
                query_buffer.append(line.strip('; \n'))  # Agregar la línea SQL sin el punto y coma ni saltos de línea
                full_query = " ".join(query_buffer)
                print("\n\nEjecutando consulta:", executing_comment)
                print(full_query)
                result = session.execute(full_query)
                data = [dict(row._asdict()) for row in result]
                df = pd.DataFrame(data)
                print(df)
                query_buffer = []  # Reiniciar el buffer para la próxima consulta
                executing_comment = None
            else:
                query_buffer.append(line.strip())

# Cerrar la conexión
cluster.shutdown()
