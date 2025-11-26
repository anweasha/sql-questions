SELECT customer_id FROM (
SELECT c.customer_id, COUNT(DISTINCT p.product_category) AS c
FROM customer_contracts AS c
JOIN products AS p ON c.product_id = p.product_id
GROUP BY c.customer_id
) AS X
WHERE c =
(SELECT COUNT(DISTINCT product_category) FROM products)
