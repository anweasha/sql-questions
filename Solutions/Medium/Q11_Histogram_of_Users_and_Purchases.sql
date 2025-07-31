SELECT transaction_date, user_id, COUNT(*) AS purchase_count
FROM (
SELECT transaction_date, user_id, 
DENSE_RANK() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS rn
FROM user_transactions
) AS X
WHERE rn = 1
GROUP BY transaction_date, user_id
ORDER BY transaction_date
