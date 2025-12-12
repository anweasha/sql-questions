SELECT p1.product_id AS product1_id, p2.product_id AS product2_id, i1.category AS product1_category, i2.category AS product2_category, COUNT(p1.user_id) AS customer_count
FROM ProductPurchases AS p1
JOIN ProductPurchases AS p2 ON p1.user_id = p2.user_id AND p1.product_id < p2.product_id
LEFT JOIN ProductInfo AS i1 ON p1.product_id = i1.product_id
LEFT JOIN ProductInfo AS i2 ON p2.product_id = i2.product_id
GROUP BY p1.product_id, p2.product_id 
HAVING customer_count >= 3
ORDER BY customer_count DESC, product1_id, product2_id 
