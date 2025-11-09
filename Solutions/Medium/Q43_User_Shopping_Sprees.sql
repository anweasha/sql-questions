WITH Temp AS (
  SELECT user_id,
  LAG(transaction_date) OVER (PARTITION BY user_id ORDER BY transaction_date) AS prev_day,
  transaction_date,
  LEAD(transaction_date) OVER (PARTITION BY user_id ORDER BY transaction_date) AS next_day
  FROM transactions
)
SELECT DISTINCT user_id
FROM Temp 
WHERE prev_day = transaction_date - INTERVAL '1 day' AND 
next_day = transaction_date + INTERVAL '1 day'
