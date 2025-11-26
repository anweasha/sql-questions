SELECT EXTRACT(YEAR FROM curr.transaction_date), curr.product_id, 
curr.spend AS curr_year_spend,
prev.spend AS prev_year_spend,
ROUND(100.0 * (curr.spend - prev.spend)/prev.spend, 2)
FROM user_transactions AS curr 
LEFT JOIN user_transactions AS prev ON curr.product_id = prev.product_id
AND EXTRACT(YEAR FROM curr.transaction_date) - EXTRACT(YEAR FROM prev.transaction_date) = 1
ORDER BY curr.product_id, curr.transaction_date
