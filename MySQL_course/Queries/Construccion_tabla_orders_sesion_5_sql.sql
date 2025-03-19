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
WHERE first_name NOT LIKE '%dan%';


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

SELECT *
FROM bike_store.orders
ORDER BY order_date ASC;


---- EJEMPLO ORDERBY DESC Y ASC

SELECT *
FROM bike_store.order_items
ORDER BY list_price ASC
LIMIT 10;


--- EJEMPLOS GROUP BY

SELECT brand_id, count(*) AS conteo
FROM bike_store.products
GROUP BY brand_id
ORDER BY conteo DESC;


-- SUBQUERIES utilizando el FROM

SELECT order_id, SUM(valor_total) AS total_orden
FROM(

	SELECT *, (quantity * list_price) AS valor_total
	FROM bike_store.order_items
    
) AS subquery
GROUP BY order_id
ORDER BY total_orden DESC;



--- INTRUDUNCIENDO LEFT_JOIN para productos

SELECT oi.*,
	p.product_name,
    p.brand_id,
    p.category_id,
    p.model_year
FROM bike_store.order_items oi
LEFT JOIN bike_store.products p
ON oi.product_id = p.product_id;


-- AGREGANDO LA TABLA DE BRAND CON LEFT JOIN
SELECT oi.*,
	p.product_name,
    p.brand_id,
    p.category_id,
    p.model_year,
    b.brand_name
FROM bike_store.order_items oi
LEFT JOIN bike_store.products p
ON oi.product_id = p.product_id
LEFT JOIN bike_store.brands b
ON p.brand_id = b.brand_id;


-- Agregando información de la categoria del producto utilziando LEFT JOIN
SELECT oi.order_id,
	oi.item_id,
    oi.quantity,
    oi.list_price,
    oi.discount,
	p.product_name,
    p.model_year,
    b.brand_name,
    c.category_name
FROM bike_store.order_items oi
LEFT JOIN bike_store.products p
ON oi.product_id = p.product_id
LEFT JOIN bike_store.brands b
ON p.brand_id = b.brand_id
LEFT JOIN bike_store.categories c
ON p.category_id = c.category_id;



-- quantity *list_price AS valor_total,

-- CONECTANDO CON NUESTR GRAN TABLA (LA FACT TABLE ORDERS) 

SELECT o.order_id,
	o.customer_id,
    o.order_status,
    o.order_date,
    o.required_date,
    o.shipped_date,
	s.store_name,
    st.first_name AS nombre_vendedor,
    st.last_name AS apellido_vendedor,
	oi.item_id,
    oi.quantity,
    oi.list_price,
    oi.discount,
	p.product_name,
    p.model_year,
    b.brand_name,
    c.category_name
FROM bike_store.orders o
LEFT JOIN bike_store.order_items oi
ON o.order_id = oi.order_id
LEFT JOIN bike_store.products p
ON oi.product_id = p.product_id
LEFT JOIN bike_store.brands b
ON p.brand_id = b.brand_id
LEFT JOIN bike_store.categories c
ON p.category_id = c.category_id
LEFT JOIN bike_store.stores s
ON o.store_id = s.store_id
LEFT JOIN bike_store.staffs st
ON o.staff_id = st.staff_id;


-- COMMUN TABLE EXPRESIONS CTE 

WITH

full_orders AS (
SELECT o.order_id,
	o.customer_id,
    o.order_status,
    o.order_date,
    o.required_date,
    o.shipped_date,
	s.store_name,
    st.first_name AS nombre_vendedor,
    st.last_name AS apellido_vendedor,
	oi.item_id,
    oi.quantity,
    oi.list_price,
    oi.discount,
	p.product_name,
    p.model_year,
    b.brand_name,
    c.category_name
FROM bike_store.orders o
LEFT JOIN bike_store.order_items oi
ON o.order_id = oi.order_id
LEFT JOIN bike_store.products p
ON oi.product_id = p.product_id
LEFT JOIN bike_store.brands b
ON p.brand_id = b.brand_id
LEFT JOIN bike_store.categories c
ON p.category_id = c.category_id
LEFT JOIN bike_store.stores s
ON o.store_id = s.store_id
LEFT JOIN bike_store.staffs st
ON o.staff_id = st.staff_id
)

SELECT *, ((quantity * list_price)*(1-discount)) AS total_venta
FROM full_orders