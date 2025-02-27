----- EJERCIOS DE EXPLORACION DE DA TABLAS

-- primera consulta
SELECT *
FROM bike_store.orders
LIMIT 100;

-- Clausula WHERE con =

SELECT *
FROM bike_store.orders
WHERE order_date = '2016-02-21';


-- Clausula WHERE con >

SELECT *
FROM bike_store.orders
WHERE order_date > '2016-02-21';


-- Clausula WHERE con <=

SELECT *
FROM bike_store.orders
WHERE order_date <= '2016-08-02';


-- Clausula WHERE con <> diferente

SELECT *
FROM bike_store.orders
WHERE order_date <> '2016-08-02';


-- Clausula WHERE con BETWEEN

SELECT *
FROM bike_store.orders
WHERE order_date BETWEEN '2016-08-02' AND '2016-10-02'; -- 2 meses de registros



-- Operaciones logicas con el WHERE y AND

SELECT * 
FROM bike_store.order_items
WHERE product_id = 20 
AND quantity >= 2;

-- Ejemplo con OR 

SELECT * 
FROM bike_store.order_items
WHERE product_id = 20 
OR quantity >= 2;

-- Ejemplo con NOT

SELECT * 
FROM bike_store.orders
WHERE shipped_date IS NOT NULL;

-- Ejemplo con IN

SELECT * 
FROM bike_store.order_items
WHERE product_id IN (20, 8, 3);


--- Ejemplo conLIKE

SELECT *
FROM customers
WHERE first_name LIKE '%ventas%';


--- Ejemplo UPPER

SELECT *, UPPER(email) AS email_mayus
FROM customers;


--- Ejemplo LOWER

SELECT *, LOWER(first_name) AS first_name_min
FROM customers;


--- Ejemplo 2 UPPER 

SELECT 
customer_id,
first_name,
last_name,
phone,
UPPER(email) AS email_mayus,
street,
city,
state,
zip_code
FROM customers;



---- EJEMPLO ORDERBY DESC Y ASC

SELECT *
FROM bike_store.orders
ORDER BY order_date DESC;


---- EJEMPLO ORDERBY DESC Y ASC

SELECT *
FROM bike_store.order_items
ORDER BY list_price ASC
LIMIT 10;


--- EJEMPLOS GROUP BY

SELECT order_id, SUM(list_price) AS total_lista_precios
FROM bike_store.order_items
GROUP BY order_id;

SELECT count(*)
FROM bike_store.order_items;