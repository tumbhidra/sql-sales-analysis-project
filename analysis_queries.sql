-- Task 1: Order-level sales
SELECT 
  c.customer_name, 
  p.product_name, 
  o.quantity, 
  p.price, 
  (o.quantity * p.price) AS total_sales
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN products p ON p.product_id = o.product_id;

-- Task 2: Customer total spending
SELECT 
  c.customer_id,
  c.customer_name,
  SUM(p.price * o.quantity) AS total_spent
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN products p ON p.product_id = o.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-- Task 3: Product performance
SELECT 
  p.product_id,
  p.product_name,
  SUM(p.price * o.quantity) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC;

-- Task 4: Customer segmentation
SELECT 
  customer_id,
  customer_name,
  total_spent,
  CASE
    WHEN total_spent > 50000 THEN 'High Value'
    WHEN total_spent BETWEEN 20001 AND 50000 THEN 'Medium Value'
    ELSE 'Low Value'
  END AS customer_type
FROM (
  SELECT 
    c.customer_id,
    c.customer_name,
    SUM(p.price * o.quantity) AS total_spent
  FROM orders o
  JOIN customers c ON c.customer_id = o.customer_id
  JOIN products p ON p.product_id = o.product_id
  GROUP BY c.customer_id, c.customer_name
) t
ORDER BY total_spent DESC;
