CREATE TABLE customers (
  customer_id INT,
  customer_name VARCHAR(50),
  city VARCHAR(50),
  signup_date DATE
);

CREATE TABLE products (
  product_id INT,
  product_name VARCHAR(50),
  category VARCHAR(50),
  price INT
);

CREATE TABLE orders (
  order_id INT,
  customer_id INT,
  product_id INT,
  quantity INT,
  order_date DATE
);
