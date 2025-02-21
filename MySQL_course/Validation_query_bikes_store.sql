---- VALIDATION QUERY
--- check 1.615 rows return

SELECT 
	c.first_name, 
	c.last_name, 
	c.city, 
	c.state,
	c.total_money_spent,
	c.total_money_spent + 100 * 10
FROM bike_store.customers c
LEFT JOIN bike_store.orders o
    o.*
FROM bike_store.customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id

