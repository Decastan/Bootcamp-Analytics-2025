---------------------------
---Ejercicios practica 1---


-- Consulta 1
SELECT *
FROM bike_store.orders
LIMIT 100;

-- Consulta 2 
SELECT *
FROM bike_store.products
LIMIT 100;

-- Consulta 3
SELECT order_id, quantity, discount
FROM bike_store.order_items
LIMIT 100;


-- Consulta 4

SELECT COUNT(*)
FROM bike_store.products;


-- Consulta 5  AGREGACION por GROUP BY
SELECT model_year, count(*) AS conteo
FROM bike_store.products
GROUP BY model_year;