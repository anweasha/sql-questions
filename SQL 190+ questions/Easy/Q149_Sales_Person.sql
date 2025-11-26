SELECT name
FROM SalesPerson 
WHERE sales_id NOT IN (
SELECT sales_id FROM Orders AS o
JOIN Company AS c ON o.com_id = c.com_id AND c.name = "RED"
)
