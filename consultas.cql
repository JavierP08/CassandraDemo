--Consulta todos los datos
SELECT * FROM store.shopping_cart;
-- Consulta para obtener todos los datos de un usuario específico
SELECT * FROM store.shopping_cart WHERE userid = '1234';
-- Consulta para encontrar carritos de compras con una cantidad específica de ítems
SELECT * FROM store.shopping_cart WHERE item_count = 5;
-- Consulta para obtener usuarios que han comprado un producto específico
SELECT userid FROM store.shopping_cart WHERE cart_details CONTAINS KEY 'productB';
-- Actualizar la cantidad de un producto en el carrito de un usuario
UPDATE store.shopping_cart SET cart_details = cart_details + {'productD' : 1} WHERE userid = '9876';
-- Eliminar un producto del detalle del carrito
UPDATE store.shopping_cart SET cart_details = cart_details - {'productA'} WHERE userid = '9876';
-- Consulta para obtener todos los carritos que se han actualizado después de una cierta fecha
SELECT * FROM store.shopping_cart WHERE last_update_timestamp > '2023-05-01 00:00:00+0000' ALLOW FILTERING;

