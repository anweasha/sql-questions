SELECT i1.category AS category1, i2.category AS category2, COUNT(DISTINCT p1.user_id) AS customer_count
FROM ProductPurchases AS p1
JOIN ProductPurchases AS p2 ON p1.user_id = p2.user_id
LEFT JOIN ProductInfo AS i1 ON p1.product_id = i1.product_id
LEFT JOIN ProductInfo AS i2 ON p2.product_id = i2.product_id AND i1.category < i2.category
WHERE i2.category IS NOT NULL
GROUP BY i1.category, i2.category
HAVING customer_count >= 3
ORDER BY customer_count DESC, i1.category, i2.category
