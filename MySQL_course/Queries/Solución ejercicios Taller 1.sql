----------------- SOLUCIÓN EJERCICIOS DE PRACTICA




-- 1. De la tabla “orders”, ¿Cuántos ordenes se realizaron en el store_id 3?
SELECT count(*) AS conteo
FROM bike_store.orders
WHERE store_id = 3 

--- R/ 174


-- 2. De la tabla “orders”. ¿Cuáles fueron las ordenes que realizaron después del 2017-12-15 (order_date)? Diga número de registros
SELECT *
FROM bike_store.orders
WHERE order_date > '2017-12-15'

--- R/ 315 registros


-- 3. De la tabla “orders”. ¿Cuál fue el vendedor (staff_id) que más ordenes atendió?
SELECT staff_id, count(*) AS conteo
FROM bike_store.orders
GROUP BY staff_id
ORDER BY conteo DESC


--- R/ El vendedor 6 con 553 ordenes atendidas

-- 4. De la tabla "order_items"- ¿Cuales fueron las 10 ordenes más caras?

SELECT order_id, SUM(list_price) AS total_lista_precios
FROM bike_store.order_items
GROUP BY order_id
ORDER BY total_lista_precios DESC
LIMIT 10;

