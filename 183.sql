# Write your MySQL query statement below
SELECT c.name AS Customers
FROM customers c LEFT JOIN orders o
ON c.id=o.customerid
WHERE o.id IS NULL
