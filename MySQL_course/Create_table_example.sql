-- 1. Creación de la tabla "products"
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  category VARCHAR(50),
  price DECIMAL(10, 2),
  stock INT
);

-- 2. Inserción de registros en la tabla "products"
INSERT INTO products (product_id, product_name, category, price, stock)
VALUES
(1, 'Laptop X',        'Electronics',  999.99,  10),
(2, 'Laptop Y',        'Electronics', 1199.99,   5),
(3, 'Smartphone A',    'Electronics',  599.99,  20),
(4, 'Smartphone B',    'Electronics',  749.99,  15),
(5, 'Headphones',      'Accessories',   49.99,  50),
(6, 'Keyboard',        'Accessories',   29.99,  40),
(7, 'Office Chair',    'Furniture',    199.99,   8),
(8, 'Desk Lamp',       'Furniture',     34.99,  25),
(9, 'Monitor 24"',     'Electronics',  199.99,  12),
(10, 'Monitor 27"',    'Electronics',  279.99,   7);