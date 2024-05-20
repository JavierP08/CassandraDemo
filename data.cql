-- Crear un keyspace con estrategia de replicación recomendada para ambientes distribuidos
CREATE KEYSPACE IF NOT EXISTS store WITH REPLICATION = {
  'class' : 'NetworkTopologyStrategy', 
  'datacenter1' : 3  -- Ajusta 'datacenter1' al nombre de tu centro de datos y el factor de replicación deseado
};

-- Crear una tabla con más campos para hacer consultas más interesantes
CREATE TABLE IF NOT EXISTS store.shopping_cart (
  userid text PRIMARY KEY,
  item_count int,
  last_update_timestamp timestamp,
  cart_details map<text, int>  -- un mapa de producto a cantidad para demostrar el trabajo con tipos de datos complejos
);

-- Insertar algunos datos
INSERT INTO store.shopping_cart (userid, item_count, last_update_timestamp, cart_details)
VALUES ('9876', 2, toTimeStamp(now()), {'productA': 2});
INSERT INTO store.shopping_cart (userid, item_count, last_update_timestamp, cart_details)
VALUES ('1234', 5, toTimeStamp(now()), {'productB': 2, 'productC': 3});

-- Crear índices secundarios para consultas más flexibles
CREATE INDEX ON store.shopping_cart(item_count);
CREATE INDEX ON store.shopping_cart(keys(cart_details));
